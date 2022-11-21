//-----------------------------------------------------------------------------
// �������� ���������� ����������
unit  vPub;
interface
uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      StdCtrls, Chart, DbChart;

const
      // ������������ ���������� ���������� � ������� ������
      DBBSZ = 1999;
      // ���������� �������� � ������ ����� ���������� ������
      DBBLN = 9;
      // �������� ��������� ���������
      PCap  = '����� ������  ';
      // ���������� ���������� � ������� TCP
      PSZS  = 500;
      RACH  = 80;
      RSZ1  = PSZS - (RACH*2 + RACH*2) - 4;
      RSZ2  = PSZS - (RACH*4 + RACH*2) - 4;
      // ���������� ������ ������ ��� ��������������� �������
      TCPERR= 5;
      // ���������� ����� �� �������� (�� ��� X)
      PPChart = 900;

type
      // ��������� ������� �������
      SNDPacket = packed record
        // �������� (1 ����)
        cmd  : byte;
        // ���������� ������������� ������� (2 �����)
        hch  : word;
        // ������ ������� �� ������� (2 ����� * 80 �������= 160 ����)
        nch  : array [0..RACH-1] of word;
        // ������ ������� �� ��������� ������ (2 ����� * 80 �������= 160 ����)
        ach  : array [0..RACH-1] of word;
        // ����������� ����� ����������� ������ (1 ����)
        crc  : byte;
        // ������
        rez  : array [0..RSZ1-1] of byte;
      end;

      // ��������� ������ �������
      RCVPacket = packed record
        cmd  : byte;
        hch  : word;
        nch  : array [0..RACH-1]       of  word;
        val  : array [0..RACH-1, 0..3] of  byte;
        crc  : byte;
        rez  : array [0..RSZ2-1] of byte;
      end;


var
      // ��� ����� �� �� ��������� ������
      DataBase       : string;
      // ��� ����� ������
      HelpFile       : string;
      // ������ ���������
      CVersion       : string;
      // ������� ���������
      sDirName       : string;
      // ��������� �������
      PubSender      : TObject;
      FrmSender      : TObject;
      // ���� ������ ���������� ���������
      FRSTR          : integer;
      // ���� ������ �� ���������
      FEXIT          : integer;
      // �������� ������ �������� ���������� ������
      DBB            : array[0..DBBSZ] of double;
      // �������� � ����������� �����
      DBBP           : array[0..DBBSZ] of double;
      // ����� ����������
      DBBN           : array[0..DBBSZ] of string;
      // �������� ����������
      DBBR           : array[0..DBBSZ] of string;
      // ����� ��������� �������� �� �������
      DBF            : array[0..DBBSZ] of integer;
      // ���� ������������ ��������
      DBZ            : array[0..DBBSZ] of char;
      // ������ �������� ����������� ��������
      DBV            : array[0..DBBSZ] of double;
      // ���� ���������� (������� ���������� � �����)
      DBBT           : array[0..DBBSZ] of string;

      // ��� ������� �������������� ������� ��� ���������� ������
      CurTBNL        : string;
      CurTBND        : string;
      // ����� ������� ������ ������� ������� � �����
      TMSTARTI       : integer;
      // ����� ������� ��������� ������� ������� � �����
      TMENDI         : integer;
      // ����� ���� ������ ������� ������� � �����
      DTSTARTI       : integer;
      // ����� ���� ��������� ������� ������� � �����
      DTENDI         : integer;
      // ����� ���� ��� ������������ ����� �������� ������
      DTCURI         : integer;
      // �������� ����� � ����
      ETimeB, ETimeE : TDateTime;
      EDateB, EDateE : TDateTime;
      EDateT, ETimeT : TDateTime;
      // ����������� ����� ����������
      Size           : cardinal;
      PRes           : PChar;
      BRes           : boolean;
      name_comp      : string;
      // ����� ������ ������������
      DBB_0000, DBB_0301, DBB_1161, DBB_1061, DBB_1211  : double;
      NL03, NL02, NL21, NL23, NL25                      : integer;


      // ����������� ���������� (������������ ������ ��� ��������(����� �������))
      TestVar        : integer;
      // ���� ������� ������� � ������� ������
      FLIns          : integer;
      // ���� ���������� ���������� ����� (������������ ������)
      BrCyc          : integer;
      // ���� ���������� ������������ ������
      RunRep         : integer;
      // ���� ������ ���������
      FLGTitle       : integer;
      // ����� ���������� ������
      RepNUM         : integer;
      // ���� �������� �������
      TBLOpenF       : integer;
      // ���� ����������� �� ����� ������������ ������
      RetRep         : integer;

      // IP ����� �������
      TCPADR         : string;
      // ���� �������
      TCPPORT        : string;
      // ���� ������ TCP
      TCPRUN,TCPFLG  : integer;
      // ����� ������� �������
      TWSSRQ         : SNDPacket;
      // ����� ������ �� ������
      TWSRCV         : RCVPacket;
      // ���������� ������� ��� ������� �� TCP
      THOWC          : integer;
      // ������� ����� ������ ��� ������������ �������
      TCURC          : integer;
      // ����� ������ �� ��������� �������
      TCHN           : array [0..DBBSZ] of integer;
      // ������ ������������� ������� �������� �������
      TCHR           : array [0..DBBSZ] of integer;
      // ���-�� ��������� ������� ��� ��������������� �������
      TCPCRTC        : integer;
      // ������ ������� ������ �� TCP � ��
      TCPPREQ        : integer;
      // ���-�� ��������� ������� ��� ���������������
      TCPCRTO        : integer;
      // ���-�� ������ ������ ��� ��������������� �������
      TCPERC         : integer;
      // ���������� ��� �������
      TCPTEMP        : integer;
      // �������� �������/�������/������
      TCPCNTS, TCPCNTR, TCPCNTE  : integer;

      // ���-�� ������� SQL ������� �������
      CntRChart      : integer;
      // ����� ������� ������ SQL ������� �������
      CurRChart      : integer;
      // ����� ��������� ������ SQL ������� �������
      TMLastRec      : integer;
      // ����� ������ ������ � Chart
      FrsRTime       : TDateTime;
      // ����� ��������� ������ � Chart
      LstRTime       : TDateTime;
      // ���� ���������� �������
      FLGFChart      : integer;
      // ������ ���������� Chart ��� SQL �������
      LstLindex      : integer;
      // ���-�� ������� � �������
      HowRTable      : integer;
      // ���-�� ������� ������������ ��� ������ ��������� ������� �������
      SkpRTable      : integer;
      // ���� �������� � ������� (���������-���������� ��������)
      NextStep       : integer;
      // ��������� ���������� ����������� Series
      TempSer        : double;
      // ������ ������ �������
      TempTIM        : array[0..9,0..PPChart] of TDateTime;
      // ���� �� ������� �������� �������
      LCDate         : array[0..9] of string;
      // ����� �������� �������
      CurChartIndex  : integer;
      // ����� ���������� �������
      LPICnt         : array[0..9] of integer;
      // ��������� ������
      LLChart        : TDBChart;
      // ��������� ���������� ����� ��������
      LLSender   : TCustomChart;
      LLButton   : TMouseButton;
      LLShift    : TShiftState;
      LLX        : array[0..9] of integer;
      LLY        : array[0..9] of Integer;
      L1Y        : array[0..9] of Integer;
      L2Y        : array[0..9] of Integer;

      // ��������� ����
      PubCapt       : string;
      // �������� Checkets
      CChecked      : array [0..9] of integer;
      // ������ ��������
      PrintEnabled  : integer;

implementation
end.
//-----------------------------------------------------------------------------

