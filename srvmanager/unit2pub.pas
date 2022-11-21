//-----------------------------------------------------------------------------
unit  Unit2Pub;
interface
uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      StdCtrls, TlHelp32;

const
      // ������ ���������
      VERSION = '2005040101';
      // ���������� �������������� ���������
      HowCP = 3;
      // ��� ���-�����
      LogFile = 'SrvManager.log';
      // ��� ini-����� ������������
      IniFile = 'SrvManager.ini';
      // ���� ���-�� ����� � ���� ������ ���-�����
      MaxLogStr = 50;
      // ���� ���-�� �������� ������ ��������
      MCYCLE = 10000;

      // ������������ ���������� ���������� � ������� ������
      DBBSZ = 9;
      // ���������� �������� � ������ ����� ���������� ������
      DBBLN = 9;

var
      // ��������� �� ���������� ������� ������ ��� ������
      PM_pF          : pointer;
      // ��������� ����� ����� ������� ������
      PM_hF          : THandle;
      // ��� ���������� ������� ������ �������
      PM_GLMEMNAME   : String;

      // ��������� �������� �� ���-�����
      TMPSTR         : String;
      // ��� ini �����
      IFNAME         : String;
      // ��� ���-�����
      LFNAME         : String;
      // ���������� ���-�����
      LF             : TextFile;
      // ������������ � ���-���� ������
      WS             : String;
      // ������� ������ ���������� � ���-����
      WLDEB          : integer;
      // ������ �������� ������ ��������� (���)
      CHKTM          : integer;      

      // ��� �������� ��������
      PCNAME         : String;
      // ���������� ������ ��������
      CCYCLE         : integer;
      // ������� ���������� ���������� ���������
      CWPROC         : integer;

      // ����� �������������� ���������
      PCN1           : String;
      PCN2           : String;
      // ����������� � ������ ���������
      PCR1           : String;
      PCR2           : String;
      // ���� ������� � ����������
      PCP1           : String;
      PCP2           : String;
      // ����� ������� ��������
      PCK1           : String;
      PCK2           : String;
      // ����� � �������� ������� ���������
      PCKTM1Z        : integer;
      PCKTM2Z        : integer;

      PCKTM1C        : integer;
      PCKTM2C        : integer;

      // ��������� ������ �������� ���������� ������
      DBC            : array[0..DBBSZ,0..DBBLN] of char;
      // �������� ������ �������� ���������� ������
      DBB            : array[0..DBBSZ] of double;

      // ����� ������ ���������
      FWProc         : array[0..HowCP] of integer;
      // ...
      pe             : TProcessEntry32;
      // ����������� �������� � ������
      ph, snap       : THandle;
      // ���������� ������
      mh             : hmodule;
      // ������ ��� �������� ������������ ���������
      procs          : array[0..$FFF] of dword;
      // ���������� ���������
      count, cm      : cardinal;
      // ��� ������
      ModName        : array[0..max_path] of char;

implementation
end.
//-----------------------------------------------------------------------------

