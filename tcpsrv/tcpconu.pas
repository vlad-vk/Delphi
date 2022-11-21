//--------------------------------------------------------------------------
// ����� ����������� ����� � �������� -
// ��������� �������� ������� � ������� �������

unit TCPConU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, Mask, ToolEdit, Math,DateUtils,
  TCPSrvP, WinSock;

type
   CLIThread = class(TThread)
      procedure  TCPREQANS(c : integer);
   private
   protected
     procedure Execute; override;
   end;

var
   clTCP  : array [0..MAXCLI+1] of CLIThread;


implementation

uses TCPSrvU;


//--------------------------------------------------------------------------
//  ����� ������� �� TCP (����� ������)
procedure CLIThread.Execute;
var
  c,br,l  : integer;
begin
  c:=TCPRUNC;
  TCPSTA[c] :=0; Form1.StringGrid2.Cells[3,c]:=' ';
  while TCPRUNA>0 do
  begin
     // ������ ������ �� ������
     if(ARCONN[c]>0) then begin br:=Recv(Sockets[c], TCPBUFR[c], TCPBSZ, 0); end
     else                 begin br:=0; end;
     // �������� ������ ������ ('127.0.0.1'=9��������)
     l:= Length(STCONN[c]);
     //  ���� ������� ������� ������(������) ��� ������������ ������ ������- �����
     if (br<=0) or (l<7) then begin
         // ����� ���������, ���� ������� ����� � ������� ������ ������� �� �������
         Form1.AddLog(LOGFILE,1,'��������  ������ ���:'+IntToStr(HMSOCK+1)+
                                ' ���:'+IntToStr(c)+' IP:'+STCONN[c]);
         // ������� ���������� � �����
         Form1.mSockClose(c);
         break;
     end else begin
         // �������� ������ �� �������- ���� ��������
         if br>TCPBSZ-20 then begin
            CopyMemory(@TWSRCV[c], @TCPBUFR[c], TCPBSZ);
            ZeroMemory(@TCPBUFR[c],TCPBSZ);
            if(TCPSrvP.TWSRCV[c].cmd=byte('R')) then begin TCPREQANS(c); end;
            if(TCPSTA[c]<10000) then begin TCPSTA[c]:=TCPSTA[c]+1; end
            else                     begin TCPSTA[c]:=0;           end;
            Form1.StringGrid2.Cells[2,c]:='LSA:'+IntToStr(l)+
                                        '  ERT:'+IntToStr(TCPCHC[c])+
                                        '  TM:' +TMCONN[c];
            Form1.StringGrid2.Cells[3,c]:='ANS:'+IntToStr(TCPSTA[c]);
         end;
     end;
     if(TCPCHK[c]>10000) then TCPCHK[c]:=0; TCPCHK[c]:=TCPCHK[c]+1;
     Sleep(1);
  end;
  Form1.StringGrid2.Cells[3,c]:='';
  TCPSTA[c]:=0; TCPCHK[c]:=0;
  TCPCHO[c]:=0; TCPCHC[c]:=0;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
//  ������������ � ������� ������ �� ������
procedure  CLIThread.TCPREQANS(c : integer);
var
    a, b   : integer;
    r      : single;
begin
    a:=0; b:=0;
    // �������� ������ �� ������
    TWSSAN[c].cmd:=byte('A');
    // ���� ���-�� ������������� ������� ������, ��� ������ ������- �����
    if(TWSRCV[c].hch>RACH) then begin
       Form1.StaticText1.Caption:='������: ���������� ������������� �������';
       Form1.StaticText1.Update;
       Form1.AddLog(LOGFILE,1,'������ ���������� ������������� ������� ['+STCONN[c]+']');
       exit;
    end;
    // ������ ������� � �������� ������
    for a:=0 to TWSRCV[c].hch do begin
        if(TWSRCV[c].nch[a]<0) or (TWSRCV[c].nch[a]>=DBBSZ) or
          (TWSRCV[c].ach[a]<0) or (TWSRCV[c].ach[a]>=DBBSZ) then continue;
        r:=DBB[ TWSRCV[c].nch[a] ];
        TWSSAN[c].nch[b]:=TWSRCV[c].ach[a];
        CopyMemory(@TWSSAN[c].val[b],@r,4);
        if(b<TWSRCV[c].hch) then begin b:=b+1; end;
    end;
    // ���������� ������������� ������� (���� ���-�����)
    if(b<0) then begin exit; end; if(b>RACH) then begin b:=RACH; end;
    TWSSAN[c].hch:=b;
    // ���������� ��������� �������� � ����� ��������
    CopyMemory(@TCPBUFS[c], @TWSSAN[c], TCPBSZ);
    // �������� ��������� ��������
    ZeroMemory(@TWSRCV[c], TCPBSZ);
    ZeroMemory(@TWSSAN[c], TCPBSZ);
    // �������� ������ �������
    Send(Sockets[c], TCPBUFS[c], TCPBSZ, MSG_OOB);
end;
//--------------------------------------------------------------------------


end.
//--------------------------------------------------------------------------

