unit disomat;

interface

// Подключаемые модули
uses
  Windows, Messages, SysUtils, Variants, Classes,
  Graphics, Controls, Forms, Dialogs, StdCtrls,
  ComCtrls, ExtCtrls, CPDrv;

// Переменные формы
type
  TForm01 = class(TForm)
    Button01: TButton;
    Button02: TButton;
    STAT: TStaticText;
    TEXT: TStaticText;
    CPDrv01: TCommPortDriver;
    SND: TStaticText;
    RCV: TStaticText;
    Timer02: TTimer;
    INIT: TStaticText;
    Timer01: TTimer;
    procedure Button02Click(Sender: TObject);
    procedure InitCOMPort;
    procedure InitCOMPortF(Sender: TObject);
    procedure Timer02Timer(Sender: TObject);
    // Процедура компоненты CPDrv, которая отрабатывает при
    // приеме данных в COM порт
    procedure CPDrv01ReceiveData(Sender: TObject; DataPtr: Pointer;
      DataSize: Cardinal);
    function  SENDChar(CC: Char): integer;
    procedure Timer01Timer(Sender: TObject);
  private
    procedure ViewControls;
  public
    constructor Create( AOwner: TComponent; ACPDrv: TCommPortDriver ); reintroduce; virtual;
  end;

  // Общие процедуры и переменные
    procedure   ClearRBuf;
    procedure   ClearSBuf;
    procedure   FillSBuf;
    procedure   FillRBuf;
    procedure   ClearVars;
    procedure   ValStrForm;
    function    rcBufStrSeek(CC: char) : integer;

var
    Form01: TForm01;
    iostp:  integer;                   // шаг последоват вып посылок
    iost1:  integer;                   // шаг последоват вып посылок
    iocnt:  integer;                   // счетчик для обмена
    csChr:  Char;                      // текущ символ для передачи
    cpBSN:  integer;                   // текущ позиц в буф передачи
    cpBRC:  integer;                   // текущ позиц в буф приема
     sBCC:  integer;                   // BCC буфера передачи
     rBCC:  integer;                   // BCC буфера приема
    snBuf:  array[0..100] of Char;     // буфер посылки
    rcBuf:  array[0..100] of Char;     // буфер приема
    rcStr:  string;                    // строка приема
    vsStr:  array[0..20 ] of Char;     // строка веса
     sVIS:  array[0..100] of Char;     // буфер отображения
     rVIS:  array[0..100] of Char;     // буфер отображения
    cpVIS:  integer;                   // текущий символ буферов отображ
    LenCM:  integer;                   // длинна строки
    DatSZ:  integer;                   // размер буфера принятых данных

    AReq:   integer;                   // общее количество запросов
    BAns:   integer;                   // кол плохих ответов
    OAns:   integer;                   // кол хороших ответов
    HR10s:  integer;                   // сколько запросов за 10 секунд
    HR10o:  integer;

implementation

uses vvod;

{$R *.dfm}

const
         SON = $01;
         STX = $02;
         ETX = $03;
         EOT = $04;
         ENQ = $05;
         ACK = $06;
         NAK = $15;
         POL = $70;

var      CM1: array [0..11] of char = #5+#2+'01#TG#'+#3+#9;

//-------------------------------------------------------------------------
// создание формы
constructor TForm01.Create( AOwner: TComponent; ACPDrv: TCommPortDriver );
begin
  inherited Create( AOwner );
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// очистка пользовательского буфера приема
procedure ClearRBuf;
var    a: integer;
begin
   for a:=0 to 100 do rcBuf[a]:=Chr(0); cpBRC:=0;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// очистка пользовательского буфера передачи
procedure ClearSBuf;
var    a: integer;
begin
   for a:=0 to 100 do snBuf[a]:=Chr(0); cpBSN:=0;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// заполнения буфера передачи и отображения
procedure FillSBuf;
begin
   snBuf[cpBSN]:=csChr; cpBSN:=cpBSN + 1;
    sVIS[cpVIS]:=csChr; rVIS[cpVIS]:=' '; cpVIS:=cpVIS+1;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// заполнение буфера приема и отображения
procedure FillRBuf;
var a: integer;
begin
   for a:=1 to DatSZ do begin
       rVIS [cpVIS]:=rcStr[a]; sVIS[cpVIS]:=' '; cpVIS:=cpVIS+1;
       rcBuf[cpBRC]:=rcStr[a]; cpBRC:=cpBRC+1;
   end;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// Обнуление глобальных переменных
procedure ClearVars;
var
   a: integer;
begin
   ClearRBuf;
   ClearSBuf;
   for a:=0 to 100 do sVIS[a]:=Chr(0);
   for a:=0 to 100 do rVIS[a]:=Chr(0);
   cpVIS:=0;
   iostp:=0;
   iost1:=0;
   LenCM:=strlen(CM1);
    sBCC:=0;
   for a:=0 to LenCM-2 do begin
       if (ord(CM1[a])=2) then begin sBCC:=0; continue; end;
       sBCC:=sBCC xor ord(CM1[a]);
   end;
   CM1[9]:=Chr(sBCC);
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// Формировние строки параметров инициализации COM порта
// (самая нижняя строка на форме)
// Параметры порта устанавливаются на компоненте в форме заполнения
procedure TForm01.ViewControls;
const _databits: array[TDataBits] of string = ('5','6','7','8');
      _parity: array[TParity] of string = ('N','E','O','M','S');
      _stopbits: array[TStopBits] of string = ('1','1.5','2');
      _hwflow: array[THwFlowControl] of string = ('None','None+DTR on','RTS/CTS');
      _swflow: array[TSwFlowControl] of string = ('None','XON/XOFF');
var s: string;
begin
    s := CPDrv01.PortName + ', ' +
       IntToStr( CPDrv01.BaudRateValue ) + ', ' +
       _databits[ CPDrv01.DataBits ] + ',' +
       _parity[ CPDrv01.Parity ] + ',' +
       _stopbits[ CPDrv01.StopBits ]+ ', ' +
      'Hw:' + _hwflow[ CPDrv01.HwFlow ] +
      ' - Sw:' + _swflow[ CPDrv01.SwFlow ] +'  |  AR:'+IntToStr(AReq)+
      '  BA:'+IntToStr(BAns)+'  OA:'+IntToStr(OAns)+'  H10:'+IntToStr(HR10s);  
  INIT.Caption := s;
end;
//-------------------------------------------------------------------------



//-------------------------------------------------------------------------
// Формирование строки веса из принятой строки
procedure ValStrForm;
var a: integer;    // Временная переменная
    b: integer;    // Символ подсчета контрольной суммы BCC
    c: integer;    // Счетчик полей в строке ответа (# -символ разделитель)
    d: integer;    // Текущий символ поля
    s: array[0..20] of Char;  // Строка формирования поля
    o: array[0..20] of Char;  // Предыдущая строка веса
begin
    b:=-1; d:=0; c:=0;
    for a:=0 to 20 do o[a]:=vsStr[a];
    for a:=0 to cpBRC do begin
        // Если встретился символ начала строки ответа-сбросить счетчик BCC
        if (ord(rcBuf[a])=STX) then begin b:=0; d:=0; c:=0; continue; end;
        // Считать контрольную сумму строки
        if (b>-1) then begin b:=b xor ord(rcBuf[a]); end;
        // Считать поля в строке ответа (конец строки поля)
        if (rcBuf[a]='#') then begin
            s[d]:=Chr(0); c:=c+1;
            if (c=3) then begin move(s,vsStr,d); end; d:=0; continue;
        end;
        // Если встретился символ конца строки - выйти из цикла или
        // если большая строка- тоже выйти
        if ((ord(rcBuf[a])=ETX) or (a>90)) then break;
        // заполнить строку поля
        s[d]:=rcBuf[a]; d:=d+1;
    end;
    // Установка флага правильности контрольной суммы принятой строки
    if (b = ord(rcBuf[a+1])) then begin
        rBCC:=b;                            // контр сумма совпала
    end else begin
        for a:=0 to 20 do vsStr[a]:=o[a];
        rBCC:=-1;                           // контр сумма не совпала
    end;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// Процедура отсоединения от COM порта (кнопка Выход)
procedure TForm01.Button02Click(Sender: TObject);
begin
  if CPDrv01.Connected then
     CPDrv01.Disconnect;
  halt;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// Процедура вызывается при нажатии на форме кнопки инициализации
// (нужна была только для теста - можно убрать)
procedure TForm01.InitCOMPortF(Sender: TObject);
begin
  ClearVars;
  InitCOMPort;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// Проверка открытия COM порта
procedure TForm01.InitCOMPort;
begin
   // Если порт не был открыт
   if not CPDrv01.Connected then begin
      if not CPDrv01.Connect then begin
          STAT.Caption:='Порт ЗАНЯТ!';
      end else begin
          STAT.Caption:='COM порт открыт.';
      end;
      // Обнулить переменные для начала посылок запросов
      ClearVars;
   end;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// Посылка символа в COM порт
function TForm01.SENDChar(CC: Char): integer;
begin
  Result:=-1;
  // если символ >0 -обработать его и послать в порт
  if ord(CC)>0 then begin
     FillSBuf;                     // заполнить строку отображения
     CPDrv01.SendChar(CC);         // послать символ в порт
     Result:=ord(CC);              // вернуть значение посланного символа
  end;
end;
//-------------------------------------------------------------------------
// Посылка данных COM порта (Период вызова таймера = 50)
procedure TForm01.Timer02Timer(Sender: TObject);
var a: integer;
begin
    // вывод строки парамметров инициализации COM порта
    ViewControls;

    TEXT.Caption:=vsStr;     // СТРОКА ВЕСА
    fmVvod.TEXT.Caption:=vsStr; // СТРОКА ВЕСА на форму ввода
    SND.Caption:= sVIS;      // строка передачи
    RCV.Caption:= rVIS;      // строка приема
//  RCV.Caption:= rcBuf;     // строка приема

    // пауза перед посылкой (после первого символа ENQ(5))
    if (iostp=1) then begin
       iocnt:= iocnt+1; if iocnt<5 then exit;
    end;

    // проверить было ли соединение
    if CPDrv01.Connected then begin
        // если номер текущего шага меньше длинны строки команды
        if (iostp<LenCM) then begin
           // символ посылки = ENQ (5)
           if iostp = 0 then begin
              csChr:=CM1[iostp]; iocnt:=0;
              SENDChar(csChr);   iostp:=iostp+1;  exit;
           end;
           //                   2    ...           3   ...
           //  символ посылки = STX+строка команды+ETX+BCC (поочередно)
           if (iostp >0) and (LenCM >iostp) then begin
              for a:=iostp to LenCM do begin
                 // обнулить строку статуса
                 csChr:=CM1[a]; STAT.Caption:=' '; SENDChar(csChr);
                 iostp:=iostp+1;
              end;
           end;
           if(iostp<50) then iostp:=50; iost1:=0; ClearRBuf;
           AReq:=AReq+1; HR10o:=HR10o+1;
           if (AReq>10000) then begin AReq:=0; BAns:=0; OAns:=0; end;
        end;

        // При посылке строки, DISOMAT выдает ответ- символ ACK (6).
        // Прием осуществляется процедурой CPDrv01ReceiveData, которая
        // вызывается из компоненты прицепленной к форме.
        // Здесь проверяется только таймаут.
        // Если таймаут- обнуление всех переменных.
        // Посылка комманд начинается сначала...
        if((iostp=50) and (iost1>3)) then begin iostp:=51; end;
        // Посылка ответного символа ACK и переход на следующий шаг-
        // прием ответа.
        if iostp=51 then begin
           csChr:=Chr(ACK);
           CPDrv01.FlushBuffers(False,True);
           SENDChar(csChr); iostp:=52; iost1:=0;
        end;
        // Если ответный символ ENQ не был принят
        if((iostp=52) and (iost1>5)) then begin iostp:=53; end;
        // Послать ACK для запроса строки ответа
        if iostp=53 then begin
           if (strlen(rcBuf)<4) then begin
               csChr:=Chr(ACK);
               CPDrv01.FlushBuffers(False,True);
               SENDChar(csChr);
           end; iostp:=54; iost1:=0;
        end;
        // Ожидание приема строки ответа
        if (iostp=54) then begin
            if(iost1>3) then iostp:=55;
        end;
        // Послать ACK - конец получения строки ответа
        if iostp=55 then begin
           csChr:=Chr(ACK);
           SENDChar(csChr); iostp:=56; iost1:=0; ValStrForm;
           if(rBCC < 0) then begin
              STAT.Caption:='Ошибка BCC'; BAns:=BAns+1;
           end else begin
              OAns:=OAns+1;
           end;
        end;
        // Небольшая пауза перед посылкой новой строки запроса
        if iostp=56 then begin
           if(iost1>3) then ClearVars;
        end;
        // Увеличение счетчика таймаутов
        iost1:=iost1+1;
    end else begin
        // Если нет соединения с портом - дополнительная проверка и,
        // если возможно открытие COM порта
        InitCOMPort;
    end;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// Поиск указанного символа в принятой строке
// Если указанный символ будет найден- возвращается номер позиции
// данного символа в принятой строке.  Иначе -1.
function rcBufStrSeek(CC: char) : integer;
var a: integer;
begin
   for a:=1 to cpBRC do begin
       if rcBuf[a]=CC then begin Result:=a; exit; end;
   end;
   Result:= -1;
end;
//-------------------------------------------------------------------------


//-------------------------------------------------------------------------
// Процедура приема данных из COM порта.
// Данная процедура вызывается компонентой прикрепленной к форме при
// приеме любой строки или символа
procedure TForm01.CPDrv01ReceiveData(Sender: TObject; DataPtr: Pointer;
  DataSize: Cardinal);
var
  TempI: integer;
begin
    // Передать размер принятой строки в глобальную переменную
    if (DataSize>0) then begin
        DatSZ:=DataSize;
    // Если ничего не было принято- выходим (это на всякий случай...)
    end else begin
        DatSZ:=0; exit;
    end;
    // Передать принятую строку в глобальную переменную
    rcStr:=StringOfChar( Chr(0), DataSize );
    move( DataPtr^, pchar(rcStr)^, DataSize );
    // Если приняли любую строку на этом шаге- переходим на следующий
    if iostp=50 then begin iostp:=51; iost1:=0; end;
    // Если приняли символ ACK (6)- переходим на прием строки ответа
    if iostp=52 then begin
        TempI:=rcBufStrSeek(Chr(ACK));
        if (TempI > 0) then iostp:=53;
    end;
    // Если на любом шаге, после посылки строки запроса, был получен
    // символ ENQ - переход на прием строки ответа
    if (iostp<54) and (iostp>=50) then begin
        TempI:=rcBufStrSeek(Chr(ENQ));
        if (TempI > 0) then iostp:=53;
    end;
    // Прием строки ответа от DISOMAT
    if iostp=54 then iost1:=0;
    // Заполнение строки отображения приема
    FillRBuf;
end;
//-------------------------------------------------------------------------

//-------------------------------------------------------------------------
// Вызываем раз в 10 секунд для подсчета запросов
procedure TForm01.Timer01Timer(Sender: TObject);
begin
   HR10s:=HR10o; HR10o:=0;
end;

end.
//-------------------------------------------------------------------------

