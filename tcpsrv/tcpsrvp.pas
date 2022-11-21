//-----------------------------------------------------------------------------
unit  TCPSrvP;
interface
uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      StdCtrls, WinSock;

const
      // ������������ ���������� ���������� � ������� ������
      DBBSZ = 1999;
      // ���� ����� ���������� � ������� �������� ������ ���������
      MAXCELLPROC = 9;
      // ���������� �������� � ������ ����� ���������� ������
      DBBLN = 9;
      // TCP ������ ������
      TCPBSZ = 500;
      // ���������� ���������� � ������� TCP
      PSZS   = TCPBSZ;
      RACH   = 80;
      RSZ1   = PSZS - (RACH*2 + RACH*2) - 4;
      RSZ2   = PSZS - (RACH*4 + RACH*2) - 4;
      // ������������ ���-�� ������������ ��������
      MAXCLI = 5;

type
      // ��������� ������ �������
      RCVPacket = packed record
        // �������� (1 ����)
        cmd  : byte;
        // ���������� ������������� ������� (2 �����)
        hch  : word;
        // ������ ������� �� ���� ������� (2 ����� * 80 �������= 160 ����)
        nch  : array [0..RACH-1] of word;
        // ������ ������� �� ������ ���������� ������ (2 ����� * 80 �������= 160 ����)
        ach  : array [0..RACH-1] of word;
        // ����������� ����� ����������� ������ (1 ����)
        crc  : byte;
        // ������
        rez  : array [0..RSZ1-1] of byte;
      end;
      // ��������� ������� ������
      SNDPacket = packed record
        cmd  : byte;
        hch  : word;
        nch  : array [0..RACH-1]       of  word;
        val  : array [0..RACH-1, 0..3] of  byte;
        crc  : byte;
        rez  : array [0..RSZ2-1] of byte;
      end;

var
      // ������ ���������
      VERSION        : string;
      // ����� ���������
      PROGEV         : THandle;
      // ��������� �� ���������� ������� ������ ��� ������
      MVOF           : pointer;
      PM_pF          : pointer;
      // ��������� ����� ����� ������� ������
      hFMap          : THandle;
      PM_hF          : THandle;
      // ��������� ������ �������� ���������� ������
      PM_s           : array[0..DBBLN] of char;
      // ��������� ������ �������� ���������� ������
      DBC            : array[0..DBBSZ,0..DBBLN] of char;
      // �������� ������ �������� ���������� ������
      DBB            : array[0..DBBSZ] of double;
      // ����� ����������
      DBBN           : array[0..DBBSZ] of string;
      // �������� ����������
      DBBR           : array[0..DBBSZ] of string;
      // ����� ��������� �������� �� �������
      DBF            : array[0..DBBSZ] of integer;
      // ���� ���������� (������� ���������� � �����)
      DBBT           : array[0..DBBSZ] of string;

      // ��� ���������� ������� ������ ��� �������� ��������
      GLMEMNAME      : string;
      // ��� ���������� ������� ��� �������� ������ ���������
      PM_GLMEMNAME   : string;
      PM_i           : integer;
      PM_CPCNUM      : integer;
      // ��� ���-�����
      LOGFILE        : string;
      // ������������ ������ ���-�����
      LOGSIZE        : double;

      // CFG ���������� ������� ��� ������� �� ��������� ����������
      THOWC          : integer;
      // CFG ������ ������� �� ��������� ����������
      TCHN           : array [0..DBBSZ] of integer;
      // CFG ������ ������� �� ��������� ����������
      TCHR           : array [0..DBBSZ] of integer;

      // ���� ������ ������
      START          : integer;
      // ����������� ������ ������ ������
      CURSHAP        : integer;

      // ������� ������������ ��������
      CURSVAL        : double;

      // ������ �����
      ME1, ME2, ME3, ME4, ME5     : string;

      // TCP ����
      TCPPORT        : string;
      // TCP ���������
      TCPTEMP        : integer;
      // TCP ���������� ������������ �������
      HMSOCK         : integer;
      // ����� � ������� �������
      ARCONN         : array [0..MAXCLI+1] of integer;
      // ������ ������������ �����
      STCONN         : array [0..MAXCLI+1] of string;
      // TCP ����� ������
      TCPBUFR        : array [0..MAXCLI+1, 0..TCPBSZ] of char;
      // TCP ����� ��������
      TCPBUFS        : array [0..MAXCLI+1, 0..TCPBSZ] of char;
      // TCP ����� ������� ����� �� ������
      TWSSAN         : array [0..MAXCLI+1] of SNDPacket;
      // TCP ����� ������ ������� �� �������
      TWSRCV         : array [0..MAXCLI+1] of RCVPacket;
      // TCP ���� ������
      TCPRUNA        : integer;
      TCPRUNC        : integer;
      // TCP ���������� ������
      Sockets        : array of TSocket;
      Addr           : TSockAddr;
      Data           : TWSAData;
      Len            : Integer;
      // TCP ���������� �������
      TCPSTA         : array [0..MAXCLI+1] of integer;
      // TCP �������� '��������' ��������
      TCPCHK         : array [0..MAXCLI+1] of integer;  // ������� �������
      TCPCHO         : array [0..MAXCLI+1] of integer;  // ����������� �������
      TCPCHC         : array [0..MAXCLI+1] of integer;  // �������������� �������
      TMCONN         : array [0..MAXCLI+1] of string;   // ����� ����������� �������

implementation
end.
//-----------------------------------------------------------------------------
