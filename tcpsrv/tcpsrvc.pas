//--------------------------------------------------------------------------
// ������ ����� ������������ NTLD

unit TCPSrvC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, Mask, ToolEdit, Math,DateUtils,
  DB, RxMemDS, IBCustomDataSet,IBQuery, fr_class ,inifiles, Gauges, FR_DSet,
  FR_DBSet, IBTable;

const
  ConfigFileName='TCPSrv.cfs';

type
  TCFile = class(TForm)
    function  GetChNum(m : integer) : integer;
    procedure ReadConfigFile;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CFG      : TCFile;
  CURFLD   : string;                           // ����� �������� ����
  CURCMD   : string;                           // ����� ������� ��������

implementation

uses  TCPSrvU, TCPSrvP;


//--------------------------------------------------------------------------
//  ����������� ������ ������ �� �����
//  ���������:  0-����� �� ������, 1-����� ������
function  TCFile.GetChNum(m : integer) : integer;
var
    l,i,r  : integer;
begin
    l:=0; i:=0; r:=0;
    // ������ ������ ����� ������
    l:=Length(CURFLD);
    // �������� ������ �� 1 ����� (������ ���� '$')
    for i:=0 to l do begin CURFLD[i]:=CURFLD[i+1]; end;
    SetLength(CURFLD,l-1);
    // ������ ��� � ������ ���� �������
    for i:=0 to DBBSZ do begin
        // ���� ����� ����� � ����� ������- �������� ��� �
        // ������ �������� ���� � ����� �� �����
        if(CURFLD=DBBN[i]) then begin
           case (m) of
             // �������� SET 1-�� ����
             1:  begin CURFLD:=IntToStr(i); end;
             // �������� SET 3-�  ����
             3:  begin CURFLD:='#'+IntToStr(i); end;
           end;
           r:=1; break;
        end;
    end;
    result:=r;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TCFile.ReadConfigFile;
const
//----------------------------------------------------------------------------
//   1     2     3     4     5     6      7
// CMD  NDBB  NSRV  NCHR  TYPE  NAME      REMARK
// DBB     0     3    17   DBL  NetLive   ���� ��������� ������ ����
   REMFLD     = 7;              // ����� ���� ���������� (���������)
   READFILESZ = 200000;         // ������ ������ ������ �����
   READFILESI = 100000;         // ������ ������ ������ �����
   LENSTR     = 200;            // ���� ������ ��������� ������
   LENFLD     = 100;            // ���� ������ ����

var
    a, c, b, f, r, i, t, bs, hi, sl, el, x, y, z, w, fh, hb  : integer;
    cs       : char;                             // ������� �������������� ������
    READBUF  : array [0..READFILESZ] of char;    // ����� ������ �����
    READBUI  : array [0..READFILESI] of char;    // ����� ������ ����� ���������
    TMPFLD   : string;                           // ����� �������� ����
    EXSTRCHNAME  : string;           // ����������� ������ �� ���� �������
    CURDBB   : integer;              // ������� ������� ������� DBB

begin

    a:=-1; c:=0; b:=1; f:=0; r:=0; i:=0; t:=0; bs:=0; hi:=0; sl:=0; el:=0;
    x:= 0; y:=0; z:=0; w:=0; THOWC:=0; CURDBB:=0;
    GLMEMNAME:='GLMEMNAME';
    PM_GLMEMNAME:='PM_GLMEMNAME';
    PM_CPCNUM:=MAXCELLPROC;
    TCPPORT:='2503';
    LOGFILE:='TCPSrv.log';
    LOGSIZE:=1000000;
    VERSION:='0000000000';

   //-------------------------------------------------------------------------
   //  ������ ����� ������������
   fh:=FileOpen(ConfigFileName, 0);
   if(fh<0) then begin exit; end;
   hb:=FileRead(fh, READBUF, READFILESZ);
   FileClose(fh);

   //-------------------------------------------------------------------------
   // ��������� ���������� ������
   while True do begin
       a:=a+1;   if(a>=hb) then begin break; end;
       cs:= READBUF[a];
       // ��������� ������� �� ���������
       if (cs<=chr(32)) and (bs=0) then begin
           continue;
       end else begin
           bs:=1;
       end;
       // ���� ������� ������ ����������� ����
       if((cs=chr(32)) or (cs=chr(10)) or (cs=chr(0)) or (cs=chr(61))) and ((c=0) and (r=0)) then
       begin
          CURFLD[b]:=chr(0); c:=1;
          //------------------------------------------------------------------
          // ���� ��� ���� �������� - ��������� ���
          if(f=0) then begin CURCMD:=Copy(CURFLD,0,LENFLD-1); end;
          //------------------------------------------------------------------
          // ���� ��� ���� 1-�� ����������
          if(f=1) then begin
             // TCP ����
             if(CURCMD='TCPPORTS') then begin
                if(Length(CURFLD)>0 ) then begin
                   TCPPORT:=Copy(CURFLD,0,Length(CURFLD));
                end;
             end;
             // ��� ���-�����
             if(CURCMD='LOGFILE') then begin
                if(Length(CURFLD)>0 ) then begin
                   LOGFILE:=Copy(CURFLD,0,Length(CURFLD));
                end;
             end;
             // ������������ ������ ���-�����
             if(CURCMD='LOGSIZE') then begin
                if(Length(CURFLD)>0 ) then begin
                   LOGSIZE:=StrToFloat(Copy(CURFLD,0,Length(CURFLD))+',0');
                end;
             end;
             // ������ ���������
             if(CURCMD='VERSION') then begin
                if(Length(CURFLD)>0 ) then begin
                   VERSION:=Copy(CURFLD,0,Length(CURFLD));
                end;
             end;

             // ����������� ������ �� ���� �������
             if(CURCMD='EXSTRCHNAME') then begin
                if(Length(CURFLD)>0 ) then begin
                   EXSTRCHNAME:=Copy(CURFLD,0,Length(CURFLD));
                end;
             end;
             // ��� ���������� ������� ������ ��� �������� ��������
             if(CURCMD ='GLMEMNAME') then begin
                if(Length(CURFLD)>0) then begin
                   GLMEMNAME:=Copy(CURFLD,0,Length(CURFLD));
                end;
             end;
             // ��� ���������� ������� ������ ��� �������� ������ ���������
             if(CURCMD ='CPROCGMEM') then begin
                if(Length(CURFLD)>0) then begin
                   PM_GLMEMNAME:=Copy(CURFLD,0,Length(CURFLD));
                end;
             end;
             // ����� ������ � ������� �������� ������ ���������
             if(CURCMD ='CPCNUMBER') then begin
                if(Length(CURFLD)>0) then begin
                   PM_CPCNUM:=StrToINt(Copy(CURFLD,0,Length(CURFLD)));
                end;
             end;

             // ������� ����� ����� ��������
             if(CURCMD='END'    ) then begin break; end;

             // ���������� � ������ ��������������� ����� ��������
             if(CURCMD='INCLUDE') then begin
                if(FileExists(CURFLD)=True) then begin
                   // ������� ��������� �� ������ ���� ����
                   fh:=FileOpen(CURFLD, 0);
                   if (fh>=0) then begin
                       hi:=FileRead(fh, READBUI, READFILESI);
                       FileClose(fh);
                       if(hb+hi<READFILESZ) and (hi>0) then begin
                          READBUI[hi]:=chr(0);
                          for i:=0 to hi do begin READBUF[hb+i]:=READBUI[i]; end;
                          hb:=hb+i;
                       end;
                   end;
                end;
             end;
          end;

          //------------------------------------------------------------------
          // ���� ��� ���� 2-�� ����������
          if(f=2) then begin

          end;
          //------------------------------------------------------------------
          // ���� ��� ���� 3-�� ����������
          if(f=3) then begin

          end;
          //------------------------------------------------------------------
          // ���� ��� �������� ���������� ������� DBB
          if(CURCMD='DBB') and (f>0) then begin
             // ����� �������� �������� ������� DBB
             if(f=1) then begin
                CURDBB:=StrToInt(CURFLD);
                if(CURDBB<0) or (CURDBB>DBBSZ) then begin CURDBB:=0; end;
             end;
             // ����� ���������� �� ������� �������� ������
             if(f=2) then begin
                i:=StrToInt(CURFLD); t:=i;
             end;
             // ����� ������ �� ��������� ����������
             if(f=3) then begin
                i:= StrToInt(CURFLD);
                // ����� ������� �� ��������� ����������
                TCHN[THOWC]:=CURDBB;
                // ����� ������� �� ��������� ����������
                TCHR[THOWC]:=i;
                if(THOWC<DBBSZ) then begin THOWC:=THOWC+1; end;
             end;
             // ��� ������
             if(f=REMFLD-3) then begin DBBT[CURDBB]:=CURFLD; end;
             // ��� ������
             if(f=REMFLD-2) then begin
                sl:=Length(CURFLD);
                el:=Length(EXSTRCHNAME);
                // �������� �� ����������� ����������� ������
                if(el>0) and (Pos(EXSTRCHNAME,CURFLD)>0) then begin
                   x:=1; y:=-1;
                   for i:=0 to sl do begin
                       w:=0;  y:=y+1;  if(y>=sl) then break;
                       for z:=1 to el do begin
                           if(CURFLD[y+z]<>EXSTRCHNAME[z]) then begin break; end;
                           w:=w+1;
                       end;
                       // ���� ����� � ����� ������ ����������� ������-
                       // ��������� �� ����� ���� ������
                       if(w=el) then begin y:=y+el-1; continue; end;
                       // ���������� ��� ������ � TMPFLD
                       if(x>Length(TMPFLD)) then begin SetLength(TMPFLD,Length(TMPFLD)+1); end;
                       TMPFLD[x]:=CURFLD[y+1]; SetLength(TMPFLD,x);
                       if(x<sl) then begin x:=x+1; end;
                   end;
                   DBBN[CURDBB]:=Copy(TMPFLD,0,Length(TMPFLD));
                end else  begin
                   DBBN[CURDBB]:=Copy(CURFLD,0,Length(CURFLD));
                end;
             end;
          end;
          //------------------------------------------------------------------
          // ������� � ���������� ����
          f:=f+1;
          //------------------------------------------------------------------
       end;
       // ���� ��� ����� ������
       if(cs=chr(10)) or (cs=chr(0)) then begin
          // ���� ��� ��������� ���� (�����������) � �������� DBB
          if(f>REMFLD-1) then begin DBBR[CURDBB]:=Copy(CURFLD,0,Length(CURFLD)); end;
          // �������� �����
          bs:=0; b:=1; f:=0; r:=0; continue;
       end;
       // ���� ��� ������ �����������
       if (cs=';') then begin r:=1; end;
       // ��������� ������� - ����������
       if (cs<chr(32)) or (r=1) then begin continue; end;
       // ����� ���� ���������� - ������� �� ���������
       if((cs=chr(32)) or (cs='=')) and (f<REMFLD) then begin b:=1; continue; end;
       // ���������� ������ ������� ����
       if (b<LENFLD-1) then begin
           if(b>Length(CURFLD)) then begin SetLength(CURFLD,Length(CURFLD)+1); end;
           CURFLD[b]:=cs; SetLength(CURFLD,b); b:=b+1;
       end;
       c:=0;
   end;
end;
//--------------------------------------------------------------------------


end.
//--------------------------------------------------------------------------
