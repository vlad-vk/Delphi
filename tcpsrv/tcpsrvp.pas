//-----------------------------------------------------------------------------
unit  TCPSrvP;
interface
uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      StdCtrls, WinSock;

const
      // максимальное количество переменных в массиве обмена
      DBBSZ = 1999;
      // макс колич переменных в массиве контроля работы программы
      MAXCELLPROC = 9;
      // количество символов в строке одной переменной обмена
      DBBLN = 9;
      // TCP размер буфера
      TCPBSZ = 500;
      // количество переменных в запросе TCP
      PSZS   = TCPBSZ;
      RACH   = 80;
      RSZ1   = PSZS - (RACH*2 + RACH*2) - 4;
      RSZ2   = PSZS - (RACH*4 + RACH*2) - 4;
      // максимальное кол-во подключаемых клиентов
      MAXCLI = 5;

type
      // Структура приема запроса
      RCVPacket = packed record
        // комманда (1 байт)
        cmd  : byte;
        // количество запрашиваемых каналов (2 байта)
        hch  : word;
        // номера каналов на этом сервере (2 байта * 80 каналов= 160 байт)
        nch  : array [0..RACH-1] of word;
        // номера каналов на машине приславшей запрос (2 байта * 80 каналов= 160 байт)
        ach  : array [0..RACH-1] of word;
        // контрольная сумма посылаемого пакета (1 байт)
        crc  : byte;
        // резерв
        rez  : array [0..RSZ1-1] of byte;
      end;
      // Структура посылки ответа
      SNDPacket = packed record
        cmd  : byte;
        hch  : word;
        nch  : array [0..RACH-1]       of  word;
        val  : array [0..RACH-1, 0..3] of  byte;
        crc  : byte;
        rez  : array [0..RSZ2-1] of byte;
      end;

var
      // версия программы
      VERSION        : string;
      // хендл программы
      PROGEV         : THandle;
      // указатель на глобальную область памяти для обмена
      MVOF           : pointer;
      PM_pF          : pointer;
      // системный номер файла области памяти
      hFMap          : THandle;
      PM_hF          : THandle;
      // строковый массив значений переменных обмена
      PM_s           : array[0..DBBLN] of char;
      // строковый массив значений переменных обмена
      DBC            : array[0..DBBSZ,0..DBBLN] of char;
      // числовой массив значений переменных обмена
      DBB            : array[0..DBBSZ] of double;
      // имена переменных
      DBBN           : array[0..DBBSZ] of string;
      // описания переменных
      DBBR           : array[0..DBBSZ] of string;
      // флаги установки значений на каналах
      DBF            : array[0..DBBSZ] of integer;
      // типы переменных (признак сохранения в архив)
      DBBT           : array[0..DBBSZ] of string;

      // Имя глобальной области памяти для передачи значения
      GLMEMNAME      : string;
      // Имя глобальной области для контроля работы программы
      PM_GLMEMNAME   : string;
      PM_i           : integer;
      PM_CPCNUM      : integer;
      // Имя лог-файла
      LOGFILE        : string;
      // Максимальный размер лог-файла
      LOGSIZE        : double;

      // CFG количество каналов для запроса на удаленном компьютере
      THOWC          : integer;
      // CFG номера каналов на локальном компьютере
      TCHN           : array [0..DBBSZ] of integer;
      // CFG номера каналов на удаленном компьютере
      TCHR           : array [0..DBBSZ] of integer;

      // флаг записи данных
      START          : integer;
      // отображение работы записи данных
      CURSHAP        : integer;

      // Текущее записываемое значение
      CURSVAL        : double;

      // Строки ввода
      ME1, ME2, ME3, ME4, ME5     : string;

      // TCP порт
      TCPPORT        : string;
      // TCP временная
      TCPTEMP        : integer;
      // TCP количество подключенных сокетов
      HMSOCK         : integer;
      // Номер в массиве сокетов
      ARCONN         : array [0..MAXCLI+1] of integer;
      // Адреса подключенных машин
      STCONN         : array [0..MAXCLI+1] of string;
      // TCP буфер приема
      TCPBUFR        : array [0..MAXCLI+1, 0..TCPBSZ] of char;
      // TCP буфер передачи
      TCPBUFS        : array [0..MAXCLI+1, 0..TCPBSZ] of char;
      // TCP Пакет посылки отвта на запрос
      TWSSAN         : array [0..MAXCLI+1] of SNDPacket;
      // TCP Пакет приема запроса от клиента
      TWSRCV         : array [0..MAXCLI+1] of RCVPacket;
      // TCP флаг работы
      TCPRUNA        : integer;
      TCPRUNC        : integer;
      // TCP парамметры Сокета
      Sockets        : array of TSocket;
      Addr           : TSockAddr;
      Data           : TWSAData;
      Len            : Integer;
      // TCP переменные статуса
      TCPSTA         : array [0..MAXCLI+1] of integer;
      // TCP проверка 'зависших' клиентов
      TCPCHK         : array [0..MAXCLI+1] of integer;  // текущий счетчик
      TCPCHO         : array [0..MAXCLI+1] of integer;  // сохраненный счетчик
      TCPCHC         : array [0..MAXCLI+1] of integer;  // дополнительный счетчик
      TMCONN         : array [0..MAXCLI+1] of string;   // время подключения клиента

implementation
end.
//-----------------------------------------------------------------------------
