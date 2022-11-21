//-----------------------------------------------------------------------------
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Unit2Pub, ExtCtrls, PsAPI, IniFiles, Grids, ShellAPI;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    SG1: TStringGrid;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    ListBox1: TListBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    SG2: TStringGrid;
    function  Readini(iniFileName, ASection, AString : String) : String;
    procedure CreateGMemArea;
    procedure ADDLog(FN: string; I: integer; MSG :string);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

//--------------------------------------------------------------------------
// ������ ���������� �� ����� ������������
function TForm1.Readini(iniFileName, ASection, AString : String) : String;
const
   S = ' ';
var
   sIniFile : TIniFile;
begin
   sIniFile := TIniFile.Create(iniFileName);
   Result := sIniFile.ReadString(ASection, AString, S);
   sIniFile.Free;
end;
//--------------------------------------------------------------------------


//----------------------------------------------------------------------------
// ������ LOG �����
procedure TForm1.ADDLog(FN: string; I: integer; MSG :string);
begin
  AssignFile(LF,FN);
  if(FileExists(FN)) then Reset  (LF)
  else                    Rewrite(LF);
  Append(LF);
  if(I>0) then WS:=DateToStr(Date)+' '+TimeToStr(Time)+'  '+MSG
  else         WS:=MSG;
  Writeln(LF,WS);
  CloseFile(LF);
  if(ListBox1.Count>=MaxLogStr) then begin
     ListBox1.Items.Delete(0);
  end;
  ListBox1.AddItem(WS,ListBox1);
  ListBox1.Perform(WM_VScroll, SB_BOTTOM,0);
  ListBox1.Update;
end;
//----------------------------------------------------------------------------


//----------------------------------------------------------------------------
// ��������-�������� ���������� ������� ������
procedure TForm1.CreateGMemArea;
var
    rs   : integer;
    nm   : PAnsiChar;
begin
    PM_pF:=nil;
    rs:=0;
    nm:=PChar(PM_GLMEMNAME);
    PM_hF:=CreateFileMapping($ffffffff,NIL,PAGE_READWRITE,0,(DBBSZ+1)*(DBBLN+1),nm);
    if PM_hF=0 then begin
       ADDLog(LFNAME,1,'������: ��������� ����������� ������� ������ ['+PM_GLMEMNAME+']'); rs:=1;
    end;
    PM_pF:=MapViewOfFile(PM_hF,FILE_MAP_ALL_ACCESS,0,0,0);
    if PM_pF=nil then begin
       ADDLog(LFNAME,1,'������: ��������� ��������� ������� ������ ['+PM_GLMEMNAME+']'); rs:=1;
    end;
    if rs=0 then begin
       ADDLog(LFNAME,1,'������� (�������) ����� ������� ������ ['+PM_GLMEMNAME+']');
    end;
end;
//----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// ��������� ������������� ����������
procedure TForm1.FormCreate(Sender: TObject);
var
  i    : integer;
begin
  //
  IFNAME:=ExtractFileDir(Application.ExeName)+'\'+IniFile;

  // ���������� �� ����� ������������
  PM_GLMEMNAME:=Readini(IFNAME,'General','PM_GLMEMNAME');
  if(Length(PM_GLMEMNAME)<1) then PM_GLMEMNAME:='PM_GLMEMNAME';
  //
  LFNAME:=Readini(IFNAME,'General','LOGFILENAME');
  if(Length(LFNAME)<1) then LFNAME:=LogFile;
  //
  TMPSTR:=Readini(IFNAME,'General','DEBUG');
  if(Length(TMPSTR)<1) then WLDEB:=0
  else                      WLDEB:=StrToInt(Copy(TMPSTR,1,2));
  //
  TMPSTR:=Readini(IFNAME,'General','CHECKTIME');
  if(Length(TMPSTR)<1) then CHKTM:=10
  else                      CHKTM:=StrToInt(Copy(TMPSTR,1,2));
  Timer1.Interval:=CHKTM*1000;

  // ����� �������������� ���������
  PCN1:=Readini(IFNAME,'General','NAMEPROC1');
  if(Length(PCN1)<1) then PCN1:='NTLDSRV';
  PCN2:=Readini(IFNAME,'General','NAMEPROC2');
  if(Length(PCN2)<1) then PCN2:='TCPSRV';

  // ����������� � ���������
  PCR1:=Readini(IFNAME,'General','REMPROC1');
  if(Length(PCR1)<1) then PCR1:=IniFile+' -> [General] -> REMPROC1=';
  PCR2:=Readini(IFNAME,'General','REMPROC2');
  if(Length(PCR2)<1) then PCR2:=IniFile+' -> [General] -> REMPROC2=';

  // ���� ������� ������
  PCP1:=Readini(IFNAME,'General','PATHPROC1');
  if(Length(PCP1)<1) then PCP1:=ExtractFileDir(Application.ExeName)+'\'+PCN1;
  PCP2:=Readini(IFNAME,'General','PATHPROC2');
  if(Length(PCP2)<1) then PCP2:=ExtractFileDir(Application.ExeName)+'\'+PCN2;

  // ����� ������� ������
  PCK1:=Readini(IFNAME,'General','KRUNPROC1');
  if(Length(PCK1)<1) then PCK1:=ExtractFileDir(Application.ExeName)+'\'+PCK1;
  PCK2:=Readini(IFNAME,'General','KRUNPROC2');
  if(Length(PCK2)<1) then PCK2:=ExtractFileDir(Application.ExeName)+'\'+PCK2;

  // ������ ������� � �������� �������� ���������
  TMPSTR:=Readini(IFNAME,'General','CHECKTMNORUN1');
  if(Length(TMPSTR)<1) then PCKTM1Z:=30
  else                      PCKTM1Z:=StrToInt(Copy(TMPSTR,1,4));
  TMPSTR:=Readini(IFNAME,'General','CHECKTMNORUN2');
  if(Length(TMPSTR)<1) then PCKTM2Z:=30
  else                      PCKTM2Z:=StrToInt(Copy(TMPSTR,1,4));

  PCKTM1C:=0; PCKTM2C:=0;
  //
  ADDLog(LFNAME,0,' ');
  ADDLog(LFNAME,1,'-------------------------------');
  ADDLog(LFNAME,1,'������ ���������...');
  // �������� (��������) ���������� ������� ������
  CreateGMemArea;
  // ��������� �������
  SG1.Cells[0,0]:='#';
  SG1.Cells[1,0]:='��� ��������';
  SG1.Cells[2,0]:='������';
  SG1.Cells[3,0]:='��������';
  // #
  SG1.Cells[0,1]:='1';
  SG1.Cells[0,2]:='2';
  // ��� ��������������� ��������
  SG1.Cells[1,1]:=PCN1;
  SG1.Cells[1,2]:=PCN2;
  // ������
  SG1.Cells[2,1]:='...';
  SG1.Cells[2,2]:='...';
  // ��������
  SG1.Cells[3,1]:=PCR1;
  SG1.Cells[3,2]:=PCR2;
  // ����� ������ ���������
  FWProc[0]:=0;
  FWProc[1]:=0;
  //
  CCYCLE:=0; CWPROC:=0;
  //
  SG2.RowCount:=51;
  SG2.Cells[0,0]:='#';
  SG2.Cells[1,0]:='�������';
  for i:=1 to 50 do begin SG2.Cells[0,i]:=' '+IntToStr(i); end;
end;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// ������� ���������� �� �������
procedure TForm1.Timer1Timer(Sender: TObject);
var
  i,d     : integer;
  TFN     : array [0..100] of Char;
  s       : string;
begin
  // ��������� ������ �� �������������� �������� �� ����������� ������� ������
  CopyMemory(@DBC, @PM_pF^, (DBBSZ+1)*(DBBLN+1));
  if(DBC[0,0]<chr(32)) or (DBC[0,0]>chr(57)) then begin
      SG1.Cells[2,1]:='NA'+' [W:'+IntToStr(PCKTM1Z)+':'+IntToStr(PCKTM1C)+']';
  end else begin
      SG1.Cells[2,1]:='[R:'+Trim(DBC[0])+']';
  end;
  if(DBC[1,0]<chr(32)) or (DBC[1,0]>chr(57)) then begin
      SG1.Cells[2,2]:='NA'+' [W:'+IntToStr(PCKTM2Z)+':'+IntToStr(PCKTM2C)+']';
  end else begin
      SG1.Cells[2,2]:='[R:'+Trim(DBC[1])+']';
  end;

  // ������ ��������
  Label10.Caption:=IntToStr(CHKTM);
  // ���������� ���������� ���������
  Label6.Caption:=IntToStr(CWPROC);

  //---------------------------------------------------------------------------
  // ��������� ������ ��������� ���������������� ����� ����...
  if(FWProc[0]=0) then begin
      SG1.Cells[2,1]:='NA'+' [W:'+IntToStr(PCKTM1Z)+':'+IntToStr(PCKTM1C)+']';
      if(PCKTM1C=0) then begin
         ADDLog(LFNAME,1,'��� ������ �� 1-�� �������� ['+PCP1+PCN1+']');
      end;
      Shape1.Brush.Color:=clBtnFace;
      PCKTM1C:=PCKTM1C+1;
  end else begin
      if(PCKTM1C>0) then begin
         ADDLog(LFNAME,1,'���� ����� �� 1-�� �������� ['+PCP1+PCN1+']');
      end;
      Shape1.Brush.Color:=clLime;
      PCKTM1C:=0;
  end;
  //-----------------------------
  //
  if(FWProc[1]=0) then begin
      SG1.Cells[2,2]:='NA'+' [W:'+IntToStr(PCKTM2Z)+':'+IntToStr(PCKTM2C)+']';
      if(PCKTM1C=0) and (PCKTM2C=0) then begin
         ADDLog(LFNAME,1,'��� ������ �� 2-�� �������� ['+PCP2+PCN2+']');
      end;
      Shape2.Brush.Color:=clBtnFace;
      if(PCKTM1C=0) then begin PCKTM2C:=PCKTM2C+1; end;
  end else begin
      if(PCKTM2C>0) then begin
         ADDLog(LFNAME,1,'���� ����� �� 2-�� �������� ['+PCP2+PCN2+']');
      end;
      Shape2.Brush.Color:=clLime;
      PCKTM2C:=0;
  end;

  //---------------------------------------------------------------------------
  // ��������� ������ ���������
  FWProc[0]:=0; FWProc[1]:=0; FWProc[2]:=0; CWPROC:=0;

  //-----------------------------
  // ������ ������������ ���������
  if(PCKTM1C>PCKTM1Z) then begin
     StrPCopy(TFN,PCP1+PCN1);
     if(FileExists(TFN)) then begin
         if(PCKTM1C=PCKTM1Z+2) then begin
            ShellExecute(Handle,'open',TFN,nil,nil,SW_MINIMIZE);
            ADDLog(LFNAME,1,'������ 1-�� �������� ['+PCP1+PCN1+']');
            PCKTM2C:=0;
         end;
     end else begin
         if(PCKTM1C=PCKTM1Z+2) then begin
            ADDLog(LFNAME,1,'�� ������ ���� 1-�� �������� ['+PCP1+PCN1+']');
         end;
     end;
     if(PCKTM1C>PCKTM1Z+10) then begin PCKTM1C:=PCKTM1Z+10; end;
  end;
  //-----------------------------
  //
  if(PCKTM2C>PCKTM2Z) then begin
     StrPCopy(TFN,PCP2+PCN2);
     if(FileExists(TFN)) then begin
         if(PCKTM2C=PCKTM2Z+2) then begin
            ShellExecute(Handle,'open',TFN,nil,nil,SW_MINIMIZE);
            ADDLog(LFNAME,1,'������ 2-�� �������� ['+PCP2+PCN2+']');
         end;
     end else begin
         if(PCKTM2C=PCKTM2Z+2) then begin
            ADDLog(LFNAME,1,'�� ������ ���� 2-�� �������� ['+PCP2+PCN2+']');
         end;
     end;
     if(PCKTM2C>PCKTM2Z+10) then begin PCKTM2C:=PCKTM2Z+10; end;
  end;

  //---------------------------------------------------------------------------
  // �������� ������ ����������������� ������� ��������� � �������
  if not EnumProcesses(@procs, sizeof(procs), count) then
  begin  exit; end;
  d:=0;

  // ��� ������� ��������
  for i := 0 to count div 4 - 1 do
  begin
    // �������� ��������� �� �������
    ph:=OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,false,procs[i]);
    if ph > 0 then
    begin
      // �������� ����� ����������� ��������� � �������
      EnumProcessModules(ph, @mh, 4, cm);
      GetModuleFileNameEx(ph, mh, ModName, sizeof(ModName));
      // �������� ��� �������� � ���-����, ���� ���������� ������� �������
      PCNAME:=AnsiUpperCase(string(ModName));
      SG2.Cells[1,d+1]:=PCNAME; d:=d+1;
      if(Pos(PCN1,PCNAME)<>0) then FWProc[0]:=1;
      if(Pos(PCN2,PCNAME)<>0) then FWProc[1]:=1;
      CloseHandle(ph);
      CWPROC:=CWPROC+1;
    end;
  end;
  // ������� ������ ��������� ���������
  for i:=d+1 to 50 do begin SG2.Cells[1,i]:=' '; end;
  //
  CCYCLE:=CCYCLE+1; if(CCYCLE>=MCYCLE) then CCYCLE:=0;
  Label1.Caption:=IntToStr(CCYCLE);
  Label6.Caption:=IntToStr(CWPROC);

//
//ListBox2.Perform(WM_VScroll, SB_BOTTOM,0);
//
// ��������� �� ���������: WM_VSCROLL
// SB_BOTTOM ��������� � ����� ���.
// SB_LINEDOWN ��������� �� ����� ����.
// SB_LINEUP ��������� �� ����� �����.
// SB_PAGEDOWN ��������� �� �������� ����.
// SB_PAGEUP ��������� �� �������� �����
// SB_TOP ��������� � ����� �����.
// SB_THUMBPOSITION Scrolls to the absolute position.
//               The current position is specified by the nPos parameter.
// SB_THUMBTRACK Drags scroll box to the specified position.
//               The current position is specified by the nPos parameter.
//
// ��������� �� �����������: WM_HSCROLL
// SB_BOTTOM ��������� � ������ �����.
// SB_LINELEFT ��������� �� ������� �����
// SB_LINERIGHT ��������� �� ������� ������
// SB_PAGELEFT ��������� �� �������� �����
// SB_PAGERIGHT ��������� �� �������� ������
// SB_TOP ��������� � ����� �����.
//
// SB_ENDSCROLL Ends scroll.
end;
//-----------------------------------------------------------------------------

end.
//-----------------------------------------------------------------------------

