//-----------------------------------------------------------------------------
// Описания глобальных переменных
unit  vPub;
interface
uses  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
      StdCtrls, Chart, DbChart;

const
      // максимальное количество переменных в массиве обмена
      DBBSZ = 1999;
      // количество символов в строке одной переменной обмена
      DBBLN = 9;
      // основной заголовок программы
      PCap  = 'АСУТП клиент  ';
      // количество переменных в запросе TCP
      PSZS  = 500;
      RACH  = 80;
      RSZ1  = PSZS - (RACH*2 + RACH*2) - 4;
      RSZ2  = PSZS - (RACH*4 + RACH*2) - 4;
      // количество ошибок сокета для переподключения клиента
      TCPERR= 5;
      // количество точек на графиках (по оси X)
      PPChart = 900;

type
      // Структура посылки запроса
      SNDPacket = packed record
        // комманда (1 байт)
        cmd  : byte;
        // количество запрашиваемых каналов (2 байта)
        hch  : word;
        // номера каналов на сервере (2 байта * 80 каналов= 160 байт)
        nch  : array [0..RACH-1] of word;
        // номера каналов на локальной машине (2 байта * 80 каналов= 160 байт)
        ach  : array [0..RACH-1] of word;
        // контрольная сумма посылаемого пакета (1 байт)
        crc  : byte;
        // резерв
        rez  : array [0..RSZ1-1] of byte;
      end;

      // Структура приема ответов
      RCVPacket = packed record
        cmd  : byte;
        hch  : word;
        nch  : array [0..RACH-1]       of  word;
        val  : array [0..RACH-1, 0..3] of  byte;
        crc  : byte;
        rez  : array [0..RSZ2-1] of byte;
      end;


var
      // имя файла БД на удаленной машине
      DataBase       : string;
      // имя файла помощи
      HelpFile       : string;
      // версия программы
      CVersion       : string;
      // каталог программы
      sDirName       : string;
      // временные объекты
      PubSender      : TObject;
      FrmSender      : TObject;
      // флаг начала выполнения программы
      FRSTR          : integer;
      // флаг выхода из программы
      FEXIT          : integer;
      // числовой массив значений переменных обмена
      DBB            : array[0..DBBSZ] of double;
      // значения с предыдущего цикла
      DBBP           : array[0..DBBSZ] of double;
      // имена переменных
      DBBN           : array[0..DBBSZ] of string;
      // описания переменных
      DBBR           : array[0..DBBSZ] of string;
      // флаги установки значений на каналах
      DBF            : array[0..DBBSZ] of integer;
      // знак выполняемого действия
      DBZ            : array[0..DBBSZ] of char;
      // массив значений выполняемых действий
      DBV            : array[0..DBBSZ] of double;
      // типы переменных (признак сохранения в архив)
      DBBT           : array[0..DBBSZ] of string;

      // имя текущей обрабатываемой таблицы при построении отчета
      CurTBNL        : string;
      CurTBND        : string;
      // число времени начала выборки записей в отчет
      TMSTARTI       : integer;
      // число времени окончания выборки записей в отчет
      TMENDI         : integer;
      // число даты начала выборки записей в отчет
      DTSTARTI       : integer;
      // число даты окончания выборки записей в отчет
      DTENDI         : integer;
      // число даты для формирования имени текущего отчета
      DTCURI         : integer;
      // Вводимые время и дата
      ETimeB, ETimeE : TDateTime;
      EDateB, EDateE : TDateTime;
      EDateT, ETimeT : TDateTime;
      // определение имени компьютера
      Size           : cardinal;
      PRes           : PChar;
      BRes           : boolean;
      name_comp      : string;
      // флаги работы контроллеров
      DBB_0000, DBB_0301, DBB_1161, DBB_1061, DBB_1211  : double;
      NL03, NL02, NL21, NL23, NL25                      : integer;


      // проверочная переменная (используется только для проверки(можно удалить))
      TestVar        : integer;
      // флаг вставки записей в таблицу отчета
      FLIns          : integer;
      // флаг прерывания выполнения цикла (формирование отчета)
      BrCyc          : integer;
      // флаг выполнения формирования отчета
      RunRep         : integer;
      // флаг вывода заголовка
      FLGTitle       : integer;
      // номер выводимого отчета
      RepNUM         : integer;
      // флаг открытия таблицы
      TBLOpenF       : integer;
      // флаг возвращения на форму формирования отчета
      RetRep         : integer;

      // IP адрес сервера
      TCPADR         : string;
      // Порт сервера
      TCPPORT        : string;
      // Флаг работы TCP
      TCPRUN,TCPFLG  : integer;
      // Пакет посылки запроса
      TWSSRQ         : SNDPacket;
      // Пакет ответа на запрос
      TWSRCV         : RCVPacket;
      // Количество каналов для запроса по TCP
      THOWC          : integer;
      // Текущий номер канала для формирования запроса
      TCURC          : integer;
      // Номер канала на удаленном сервере
      TCHN           : array [0..DBBSZ] of integer;
      // Номера запрашиваемых каналов текущего запроса
      TCHR           : array [0..DBBSZ] of integer;
      // Кол-во неответов сервера для переподключения клиента
      TCPCRTC        : integer;
      // период запроса данных по TCP в мс
      TCPPREQ        : integer;
      // кол-во неответов сервера для переподключения
      TCPCRTO        : integer;
      // кол-во ошибок сокета для переподключения клиента
      TCPERC         : integer;
      // переменная для отладки
      TCPTEMP        : integer;
      // счетчики посылок/приемов/ошибок
      TCPCNTS, TCPCNTR, TCPCNTE  : integer;

      // Кол-во записей SQL запроса графика
      CntRChart      : integer;
      // Номер текущей записи SQL запроса графика
      CurRChart      : integer;
      // Время последней записи SQL запроса графика
      TMLastRec      : integer;
      // Время первой записи в Chart
      FrsRTime       : TDateTime;
      // Время последней записи в Chart
      LstRTime       : TDateTime;
      // Флаг заполнения графика
      FLGFChart      : integer;
      // Индекс последнего Chart для SQL запроса
      LstLindex      : integer;
      // Кол-во записей в таблице
      HowRTable      : integer;
      // Кол-во записей пропускаемых для вывода последних записей таблицы
      SkpRTable      : integer;
      // Флаг перехода в графике (следующая-предыдущая страница)
      NextStep       : integer;
      // Временная переменная отображения Series
      TempSer        : double;
      // Массив времен графика
      TempTIM        : array[0..9,0..PPChart] of TDateTime;
      // Дата за которую строятся графики
      LCDate         : array[0..9] of string;
      // Номер текущего индекса
      CurChartIndex  : integer;
      // Номер последнего индекса
      LPICnt         : array[0..9] of integer;
      // Последний график
      LLChart        : TDBChart;
      // Параметры временного среза графиков
      LLSender   : TCustomChart;
      LLButton   : TMouseButton;
      LLShift    : TShiftState;
      LLX        : array[0..9] of integer;
      LLY        : array[0..9] of Integer;
      L1Y        : array[0..9] of Integer;
      L2Y        : array[0..9] of Integer;

      // заголовок окна
      PubCapt       : string;
      // контроль Checkets
      CChecked      : array [0..9] of integer;
      // статус принтера
      PrintEnabled  : integer;

implementation
end.
//-----------------------------------------------------------------------------

