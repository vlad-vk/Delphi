//--------------------------------------------------------------------------
// ���������� ������� ������ ��������� TCP ����������

unit uTHTCP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, Mask, ToolEdit, Math,DateUtils,
  DB, RxMemDS, IBCustomDataSet,IBQuery, fr_class ,inifiles, Gauges, FR_DSet,
  FR_DBSet, IBTable;

type
   TCPThread = class(TThread)
     procedure TCPSendREQ;
     procedure TCPGetANS;
     function  ifSetVal(ch : integer; vl: double) : double;
   private
     { Private declarations }
   protected
     procedure TCPWAF;
     procedure Execute; override;
   end;

var
   mTCP : TCPThread;

implementation

uses UDM, ufmStForm, uPrint, uBD, vPub;

//--------------------------------------------------------------------------
//  ����� ������� �� TCP (����� ������)
procedure TCPThread.Execute;
begin
  fmStForm.TcpClient1.RemoteHost:=TCPADR;
  fmStForm.TcpClient1.RemotePort:=TCPPORT;
  fmStForm.TcpClient1.Connect;
  while TCPRUN>0 do
  begin
     if(fmStForm.TcpClient1.Connect=True) then begin
        fmStForm.TcpClient1.ReceiveBuf(TWSRCV,PSZS,0);
     end;
     if(TCPERC>= TCPERR) then begin break; end;
     Synchronize(TCPWAF);
     Sleep(1);
  end;
  Synchronize(TCPWAF);
  fmStForm.TcpClient1.Disconnect;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TCPThread.TCPWAF;
begin
     if(TCPFLG>0) then begin
        fmStForm.Shape1.Brush.Color:=clLime;
     end else begin
        fmStForm.Shape1.Brush.Color:=clActiveBorder;
     end;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
//  ������������ � ������� �������
procedure  TCPThread.TCPSendREQ;
var
    a, b   : integer;
begin
    a:=0; b:=0;
    // ���� ������ ��� ������� �� TCP �� ����������- �����
    if(THOWC<1) then exit;
    // ��� �������� �������
    TWSSRQ.cmd:=byte('R');
    // ������� ������ ������� � ��������� �������, ���� ��������� ����������
    // ������� ������������ � ��������� (RACH) ��� ���� �� ��������� �����
    // ���������� ������������ ��� ������� ������� ��� TCP (THOWC)
    for a:=TCURC to THOWC do begin
        if(b>=RACH) then break;
        TWSSRQ.nch[b]:=TCHN[a];
        TWSSRQ.ach[b]:=TCHR[a];
        b:=b+1;
    end;
    // ���������� ������������� ������� (���� ���-�����)
    if(b<0) then begin exit; end; TWSSRQ.hch:=b;
    // ���������� ��������� ����� ������ ��� ������������ ���������� �������
    if(a>=THOWC) then begin a:=0; end; TCURC:=a;
    // �������� ������� �������
    fmStForm.TcpClient1.SendBuf(TWSSRQ,PSZS,0);
    // ����� �������� ������- �������� �����
    ZeroMemory(@TWSSRQ, PSZS);
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
//  ��������� ������ �� ������
procedure  TCPThread.TCPGetANS;
var
    a      : integer;
    w      : single;
begin
    TCPCRTC:=0;
    // �������� ��������� ���������� �������
    if(TWSRCV.hch<=0) or (TWSRCV.hch>RACH) then begin
       exit;
    end;
    // ���� ���������� ������� ������ 0
    a:=-1;
    while True  do begin
        a:=a+1; if(a>=TWSRCV.hch) then break;
        // ���� ����� ������ � ���������� ���������- �������� �������� � ������
        if(TWSRCV.nch[a]>=0) and (TWSRCV.nch[a]<DBBSZ) then begin
           CopyMemory(@w,@TWSRCV.val[a],4);
           DBB[ TWSRCV.nch[a] ]:=w;
           DBB[ TWSRCV.nch[a] ]:=ifSetVal(TWSRCV.nch[a], DBB[ TWSRCV.nch[a] ]);
           if(TWSRCV.nch[a] >200) then begin
              TCPTEMP:=a;
           end;
           if(TWSRCV.nch[a] >1000) then begin
              TCPTEMP:=a;
           end;
        end;
    end;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
//  ������������� �������� �� ������ ���� ������� �������� SET � ����� .cfg
function TCPThread.ifSetVal(ch : integer; vl: double) : double;
var
    t   : integer;
    d   : double;
begin
    result:=vl;
    //-----------------------------------------------------------------------
    // ���� ���������� �������� �� ������:
    if(DBF[ch]>0) then begin
       // ���� 2�� ��������� ��� ��������� ����� ������- ����� �� ���� ��������
       t:=Trunc(DBV[ch]);
       if(DBF[ch]=2) then begin
          if(t>0) and (t<DBBSZ) then begin d:=DBB[t]; end;
       end;
       // ���������� ��������:
       // �������� �� ������ ����� ���������
       if(DBZ[ch]='#') then begin result:=DBV[ch]; end;
       // �������� �� ������ ����� ������� ����� ��������
       if(DBZ[ch]='-') then begin result:=vl-d; end;
       // �������� �� ������ ����� ������� ���� ��������
       if(DBZ[ch]='+') then begin result:=vl+d; end;
       // �������� �� ������ ����� ������� ���������� �� ��������
       if(DBZ[ch]='*') then begin result:=vl*d; end;
       // �������� �� ������ ����� ������� �������� �� ��������
       if(DBZ[ch]='/') then begin
          if(d<>0) then begin result:=vl/d; end;
       end;
       // ���������� �������� �������� �� ��������
       if(DBZ[ch]='!') then begin
          if(vl>0) then result:=0
          else          result:=1;
       end;
       if(vl<-999999999) then result:=-999999999;
       if(vl> 999999999) then result:= 999999999;
   end;
   //-----------------------------------------------------------------------
end;
//--------------------------------------------------------------------------


end.
//--------------------------------------------------------------------------

