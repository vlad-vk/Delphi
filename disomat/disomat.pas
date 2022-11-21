unit disomat;

interface

// ������������ ������
uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  ComCtrls, ExtCtrls, CPDrv;

// ���������� �����
type
  TForm01 = class(TForm)
    Button01: TButton;
    Button02: TButton;
    STAT: TStaticText;
    TEXT: TStaticText;
    CPDrv01: TCommPortDriver;
    SND: TStaticText;
    RCV: TStaticText;
    Timer02: TTimer;
    INIT: TStaticText;
    Timer01: TTimer;
    procedure Button02Click(Sender: TObject);
    procedure InitCOMPort;
    procedure InitCOMPortF(Sender: TObject);
    procedure Timer02Timer(Sender: TObject);
    // ��������� ���������� CPDrv, ������� ������������ ���
    // ������ ������ � COM ����
    procedure CPDrv01ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    function  SENDChar(CC: Char): integer;
    procedure Timer01Timer(Sender: TObject);
  private
    procedure ViewControls;
  public
    constructor Create( AOwner: TComponent; ACPDrv: TCommPortDriver ); reintroduce; virtual;
  end;

  // ����� ��������� � ����������
    procedure   ClearRBuf;
    procedure   ClearSBuf;
    procedure   FillSBuf;
    procedure   FillRBuf;
    procedure   ClearVars;
    procedure   ValStrForm;
    function    rcBufStrSeek(CC: char) : integer;

var
    Form01: TForm01;
    iostp:  integer;                   // ��� ���������� ��� �������
    iost1:  integer;                   // ��� ���������� ��� �������
    iocnt:  integer;                   // ������� ��� ������
    csChr:  Char;                      // ����� ������ ��� ��������
    cpBSN:  integer;                   // ����� ����� � ��� ��������
    cpBRC:  integer;                   // ����� ����� � ��� ������
     sBCC:  integer;                   // BCC ������ ��������
     rBCC:  integer;                   // BCC ������ ������
    snBuf:  array[0..100] of Char;     // ����� �������
    rcBuf:  array[0..100] of Char;     // ����� ������
    rcStr:  string;                    // ������ ������
    vsStr:  array[0..20 ] of Char;     // ������ ����
     sVIS:  array[0..100] of Char;     // ����� �����������
     rVIS:  array[0..100] of Char;     // ����� �����������
    cpVIS:  integer;                   // ������� ������ ������� �������
    LenCM:  integer;                   // ������ ������
    DatSZ:  integer;                   // ������ ������ �������� ������

    AReq:   integer;                   // ����� ���������� ��������
    BAns:   integer;                   // ��� ������ �������
    OAns:   integer;                   // ��� ������� �������
    HR10s:  integer;                   // ������� �������� �� 10 ������
    HR10o:  integer;

implementation

uses vvod;

{$R *.dfm}

const
         SON = $01;
         STX = $02;
         ETX = $03;
         EOT = $04;
         ENQ = $05;
         ACK = $06;
         NAK = $15;
         POL = $70;

var      CM1: array [0..11] of char = #5+#2+'01#TG#'+#3+#9;

//-------------------------------------------------------------------------
// �������� �����
constructor TForm01.Create( AOwner: TComponent; ACPDrv: TCommPortDriver );
begin
  inherited Create( AOwner );
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// ������� ����������������� ������ ������
procedure ClearRBuf;
var    a: integer;
begin
   for a:=0 to 100 do rcBuf[a]:=Chr(0); cpBRC:=0;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// ������� ����������������� ������ ��������
procedure ClearSBuf;
var    a: integer;
begin
   for a:=0 to 100 do snBuf[a]:=Chr(0); cpBSN:=0;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// ���������� ������ �������� � �����������
procedure FillSBuf;
begin
   snBuf[cpBSN]:=csChr; cpBSN:=cpBSN + 1;
    sVIS[cpVIS]:=csChr; rVIS[cpVIS]:=' '; cpVIS:=cpVIS+1;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// ���������� ������ ������ � �����������
procedure FillRBuf;
var a: integer;
begin
   for a:=1 to DatSZ do begin
       rVIS [cpVIS]:=rcStr[a]; sVIS[cpVIS]:=' '; cpVIS:=cpVIS+1;
       rcBuf[cpBRC]:=rcStr[a]; cpBRC:=cpBRC+1;
   end;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// ��������� ���������� ����������
procedure ClearVars;
var
   a: integer;
begin
   ClearRBuf;
   ClearSBuf;
   for a:=0 to 100 do sVIS[a]:=Chr(0);
   for a:=0 to 100 do rVIS[a]:=Chr(0);
   cpVIS:=0;
   iostp:=0;
   iost1:=0;
   LenCM:=strlen(CM1);
    sBCC:=0;
   for a:=0 to LenCM-2 do begin
       if (ord(CM1[a])=2) then begin sBCC:=0; continue; end;
       sBCC:=sBCC xor ord(CM1[a]);
   end;
   CM1[9]:=Chr(sBCC);
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// ����������� ������ ���������� ������������� COM �����
// (����� ������ ������ �� �����)
// ��������� ����� ��������������� �� ���������� � ����� ����������
procedure TForm01.ViewControls;
const _databits: array[TDataBits] of string = ('5','6','7','8');
      _parity: array[TParity] of string = ('N','E','O','M','S');
      _stopbits: array[TStopBits] of string = ('1','1.5','2');
      _hwflow: array[THwFlowControl] of string = ('None','None+DTR on','RTS/CTS');
      _swflow: array[TSwFlowControl] of string = ('None','XON/XOFF');
var s: string;
begin
    s := CPDrv01.PortName + ', ' +
       IntToStr( CPDrv01.BaudRateValue ) + ', ' +
       _databits[ CPDrv01.DataBits ] + ',' +
       _parity[ CPDrv01.Parity ] + ',' +
       _stopbits[ CPDrv01.StopBits ]+ ', ' +
      'Hw:' + _hwflow[ CPDrv01.HwFlow ] +
      ' - Sw:' + _swflow[ CPDrv01.SwFlow ] +'  |  AR:'+IntToStr(AReq)+
      '  BA:'+IntToStr(BAns)+'  OA:'+IntToStr(OAns)+'  H10:'+IntToStr(HR10s);  
  INIT.Caption := s;
end;
//-------------------------------------------------------------------------



//-------------------------------------------------------------------------
// ������������ ������ ���� �� �������� ������
procedure ValStrForm;
var a: integer;    // ��������� ����������
    b: integer;    // ������ �������� ����������� ����� BCC
    c: integer;    // ������� ����� � ������ ������ (# -������ �����������)
    d: integer;    // ������� ������ ����
    s: array[0..20] of Char;  // ������ ������������ ����
    o: array[0..20] of Char;  // ���������� ������ ����
begin
    b:=-1; d:=0; c:=0;
    for a:=0 to 20 do o[a]:=vsStr[a];
    for a:=0 to cpBRC do begin
        // ���� ���������� ������ ������ ������ ������-�������� ������� BCC
        if (ord(rcBuf[a])=STX) then begin b:=0; d:=0; c:=0; continue; end;
        // ������� ����������� ����� ������
        if (b>-1) then begin b:=b xor ord(rcBuf[a]); end;
        // ������� ���� � ������ ������ (����� ������ ����)
        if (rcBuf[a]='#') then begin
            s[d]:=Chr(0); c:=c+1;
            if (c=3) then begin move(s,vsStr,d); end; d:=0; continue;
        end;
        // ���� ���������� ������ ����� ������ - ����� �� ����� ���
        // ���� ������� ������- ���� �����
        if ((ord(rcBuf[a])=ETX) or (a>90)) then break;
        // ��������� ������ ����
        s[d]:=rcBuf[a]; d:=d+1;
    end;
    // ��������� ����� ������������ ����������� ����� �������� ������
    if (b = ord(rcBuf[a+1])) then begin
        rBCC:=b;                            // ����� ����� �������
    end else begin
        for a:=0 to 20 do vsStr[a]:=o[a];
        rBCC:=-1;                           // ����� ����� �� �������
    end;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// ��������� ������������ �� COM ����� (������ �����)
procedure TForm01.Button02Click(Sender: TObject);
begin
  if CPDrv01.Connected then
     CPDrv01.Disconnect;
  halt;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// ��������� ���������� ��� ������� �� ����� ������ �������������
// (����� ���� ������ ��� ����� - ����� ������)
procedure TForm01.InitCOMPortF(Sender: TObject);
begin
  ClearVars;
  InitCOMPort;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// �������� �������� COM �����
procedure TForm01.InitCOMPort;
begin
   // ���� ���� �� ��� ������
   if not CPDrv01.Connected then begin
      if not CPDrv01.Connect then begin
          STAT.Caption:='���� �����!';
      end else begin
          STAT.Caption:='COM ���� ������.';
      end;
      // �������� ���������� ��� ������ ������� ��������
      ClearVars;
   end;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// ������� ������� � COM ����
function TForm01.SENDChar(CC: Char): integer;
begin
  Result:=-1;
  // ���� ������ >0 -���������� ��� � ������� � ����
  if ord(CC)>0 then begin
     FillSBuf;                     // ��������� ������ �����������
     CPDrv01.SendChar(CC);         // ������� ������ � ����
     Result:=ord(CC);              // ������� �������� ���������� �������
  end;
end;
//-------------------------------------------------------------------------
// ������� ������ COM ����� (������ ������ ������� = 50)
procedure TForm01.Timer02Timer(Sender: TObject);
var a: integer;
begin
    // ����� ������ ����������� ������������� COM �����
    ViewControls;

    TEXT.Caption:=vsStr;     // ������ ����
    fmVvod.TEXT.Caption:=vsStr; // ������ ���� �� ����� �����
    SND.Caption:= sVIS;      // ������ ��������
    RCV.Caption:= rVIS;      // ������ ������
//  RCV.Caption:= rcBuf;     // ������ ������

    // ����� ����� �������� (����� ������� ������� ENQ(5))
    if (iostp=1) then begin
       iocnt:= iocnt+1; if iocnt<5 then exit;
    end;

    // ��������� ���� �� ����������
    if CPDrv01.Connected then begin
        // ���� ����� �������� ���� ������ ������ ������ �������
        if (iostp<LenCM) then begin
           // ������ ������� = ENQ (5)
           if iostp = 0 then begin
              csChr:=CM1[iostp]; iocnt:=0;
              SENDChar(csChr);   iostp:=iostp+1;  exit;
           end;
           //                   2    ...           3   ...
           //  ������ ������� = STX+������ �������+ETX+BCC (����������)
           if (iostp >0) and (LenCM >iostp) then begin
              for a:=iostp to LenCM do begin
                 // �������� ������ �������
                 csChr:=CM1[a]; STAT.Caption:=' '; SENDChar(csChr);
                 iostp:=iostp+1;
              end;
           end;
           if(iostp<50) then iostp:=50; iost1:=0; ClearRBuf;
           AReq:=AReq+1; HR10o:=HR10o+1;
           if (AReq>10000) then begin AReq:=0; BAns:=0; OAns:=0; end;
        end;

        // ��� ������� ������, DISOMAT ������ �����- ������ ACK (6).
        // ����� �������������� ���������� CPDrv01ReceiveData, �������
        // ���������� �� ���������� ������������ � �����.
        // ����� ����������� ������ �������.
        // ���� �������- ��������� ���� ����������.
        // ������� ������� ���������� �������...
        if((iostp=50) and (iost1>3)) then begin iostp:=51; end;
        // ������� ��������� ������� ACK � ������� �� ��������� ���-
        // ����� ������.
        if iostp=51 then begin
           csChr:=Chr(ACK);
           CPDrv01.FlushBuffers(False,True);
           SENDChar(csChr); iostp:=52; iost1:=0;
        end;
        // ���� �������� ������ ENQ �� ��� ������
        if((iostp=52) and (iost1>5)) then begin iostp:=53; end;
        // ������� ACK ��� ������� ������ ������
        if iostp=53 then begin
           if (strlen(rcBuf)<4) then begin
               csChr:=Chr(ACK);
               CPDrv01.FlushBuffers(False,True);
               SENDChar(csChr);
           end; iostp:=54; iost1:=0;
        end;
        // �������� ������ ������ ������
        if (iostp=54) then begin
            if(iost1>3) then iostp:=55;
        end;
        // ������� ACK - ����� ��������� ������ ������
        if iostp=55 then begin
           csChr:=Chr(ACK);
           SENDChar(csChr); iostp:=56; iost1:=0; ValStrForm;
           if(rBCC < 0) then begin
              STAT.Caption:='������ BCC'; BAns:=BAns+1;
           end else begin
              OAns:=OAns+1;
           end;
        end;
        // ��������� ����� ����� �������� ����� ������ �������
        if iostp=56 then begin
           if(iost1>3) then ClearVars;
        end;
        // ���������� �������� ���������
        iost1:=iost1+1;
    end else begin
        // ���� ��� ���������� � ������ - �������������� �������� �,
        // ���� �������� �������� COM �����
        InitCOMPort;
    end;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// ����� ���������� ������� � �������� ������
// ���� ��������� ������ ����� ������- ������������ ����� �������
// ������� ������� � �������� ������.  ����� -1.
function rcBufStrSeek(CC: char) : integer;
var a: integer;
begin
   for a:=1 to cpBRC do begin
       if rcBuf[a]=CC then begin Result:=a; exit; end;
   end;
   Result:= -1;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// ��������� ������ ������ �� COM �����.
// ������ ��������� ���������� ����������� ������������� � ����� ���
// ������ ����� ������ ��� �������
procedure TForm01.CPDrv01ReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
  TempI: integer;
begin
    // �������� ������ �������� ������ � ���������� ����������
    if (DataSize>0) then begin
        DatSZ:=DataSize;
    // ���� ������ �� ���� �������- ������� (��� �� ������ ������...)
    end else begin
        DatSZ:=0; exit;
    end;
    // �������� �������� ������ � ���������� ����������
    rcStr:=StringOfChar( Chr(0), DataSize );
    move( DataPtr^, pchar(rcStr)^, DataSize );
    // ���� ������� ����� ������ �� ���� ����- ��������� �� ���������
    if iostp=50 then begin iostp:=51; iost1:=0; end;
    // ���� ������� ������ ACK (6)- ��������� �� ����� ������ ������
    if iostp=52 then begin
        TempI:=rcBufStrSeek(Chr(ACK));
        if (TempI > 0) then iostp:=53;
    end;
    // ���� �� ����� ����, ����� ������� ������ �������, ��� �������
    // ������ ENQ - ������� �� ����� ������ ������
    if (iostp<54) and (iostp>=50) then begin
        TempI:=rcBufStrSeek(Chr(ENQ));
        if (TempI > 0) then iostp:=53;
    end;
    // ����� ������ ������ �� DISOMAT
    if iostp=54 then iost1:=0;
    // ���������� ������ ����������� ������
    FillRBuf;
end;
//-------------------------------------------------------------------------

//-------------------------------------------------------------------------
// �������� ��� � 10 ������ ��� �������� ��������
procedure TForm01.Timer01Timer(Sender: TObject);
begin
   HR10s:=HR10o; HR10o:=0;
end;

end.
//-------------------------------------------------------------------------

