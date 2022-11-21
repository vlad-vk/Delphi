//-----------------------------------------------------------------------------
unit  Unit2Pub;
interface
uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      StdCtrls, TlHelp32;

const
      // версия программы
      VERSION = '2005040101';
      // количество контролируемых процессов
      HowCP = 3;
      // имя лог-файла
      LogFile = 'SrvManager.log';
      // имя ini-файла конфигурации
      IniFile = 'SrvManager.ini';
      // макс кол-во строк в окне вывода лог-файла
      MaxLogStr = 50;
      // макс кол-во счетчика циклов проверок
      MCYCLE = 10000;

      // максимальное количество переменных в массиве обмена
      DBBSZ = 9;
      // количество символов в строке одной переменной обмена
      DBBLN = 9;

var
      // указатель на глобальную область памяти для обмена
      PM_pF          : pointer;
      // системный номер файла области памяти
      PM_hF          : THandle;
      // имя глобальной области обмена данными
      PM_GLMEMNAME   : String;

      // временное значение из лог-файла
      TMPSTR         : String;
      // имя ini файла
      IFNAME         : String;
      // имя лог-файла
      LFNAME         : String;
      // дескриптор лог-файла
      LF             : TextFile;
      // записываемая в лог-файл строка
      WS             : String;
      // уровень записи информации в лог-файл
      WLDEB          : integer;
      // период проверки работы процессов (сек)
      CHKTM          : integer;      

      // имя текущего процесса
      PCNAME         : String;
      // количество циклов проверок
      CCYCLE         : integer;
      // текущее количество работающих процессов
      CWPROC         : integer;

      // имена контролируемых процессов
      PCN1           : String;
      PCN2           : String;
      // комментарии к именам процессов
      PCR1           : String;
      PCR2           : String;
      // пути доступа к программам
      PCP1           : String;
      PCP2           : String;
      // ключи запуска программ
      PCK1           : String;
      PCK2           : String;
      // время и счетчики запуска процессов
      PCKTM1Z        : integer;
      PCKTM2Z        : integer;

      PCKTM1C        : integer;
      PCKTM2C        : integer;

      // строковый массив значений переменных обмена
      DBC            : array[0..DBBSZ,0..DBBLN] of char;
      // числовой массив значений переменных обмена
      DBB            : array[0..DBBSZ] of double;

      // флаги работы процессов
      FWProc         : array[0..HowCP] of integer;
      // ...
      pe             : TProcessEntry32;
      // дескрипторы процесса и снимка
      ph, snap       : THandle;
      // дескриптор модуля
      mh             : hmodule;
      // массив для хранения дескрипторов процессов
      procs          : array[0..$FFF] of dword;
      // количество процессов
      count, cm      : cardinal;
      // имя модуля
      ModName        : array[0..max_path] of char;

implementation
end.
//-----------------------------------------------------------------------------

