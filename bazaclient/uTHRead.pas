//--------------------------------------------------------------------------
// coding: cp1251
// Выполнение фоновых задач (формирование и вывод отчета)

// IBQuery1     [TIBQery]       - задание,обработка,результат SQL-запросов
// RepData      [TrxMemoryData] - массив данных, результаты обработки записей БД
// frDBDataSet1 [TfrDBDataSet]  - указатель на RepData для доступа из TfrReport
// fr_dozatp    [TfrReport]     - построение и вывод отчетов через TfrDBDataSet

unit uTHRead;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, Mask, ToolEdit, Math, DateUtils,
  DB, RxMemDS, IBCustomDataSet,IBQuery, fr_class ,inifiles, Gauges, FR_DSet,
  FR_DBSet, IBTable;

type
   TMThread = class(TThread)
   function StrTMToInt(STR: string) : integer;
   function StrMirror (s: string) : string;
   private
     { Private declarations }
   protected
     procedure DZ_View;
     procedure AK_View;
     procedure DZ_Report;
     procedure AK_Report;
     function  SBText(Text:string):integer;
     procedure Execute; override;
   end;

var
   TM   : TMThread;

implementation

uses UDM, ufmStForm, uPrint, uBD, vPub;


//--------------------------------------------------------------------------
// Преобразование строки времени в число
function TMTHread.StrTMToInt(STR: string) : integer;
var
  a,b,l: integer;
begin
  l:=Length(STR); b:=0;
  for a:=1 to l do
  begin
      if(STR[a+b]=':') then b:=b+1;
      STR[a]:=STR[a+b];
      if(a+b>l-1) then break;
  end;
  STR[a+1]:=chr(0);
  result:=StrToInt(STR);
end;
//--------------------------------------------------------------------------
function TMTHread.StrMirror(s: string) : string;
var 
    i  : integer;
    tmp: char;
begin
    for i:=1 to length(s) div 2 do
      begin
       tmp:=s[i];
       s[i]:=s[length(s)+1-i];
       s[length(s)+1-i]:=tmp;
       result:=s;
      end;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TMThread.Execute;
begin
    if(RepNUM=1) then begin
        // дозировка
        DZ_Report;
    end else begin
        // автоклавы
        // AK_Report;
    end;
end;
//--------------------------------------------------------------------------
function TMThread.SBText(Text:string):integer;
begin
    fmStForm.StatusBar1.Panels[0].Text:=Text;
    fmStForm.StatusBar1.Update;
    result:=0;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
//  формирование отчета дозировки
procedure TMThread.DZ_Report;
var
    NDZ,        // номер участка для которого строиться отчет
    SHLO,       // номер последнего открытого клапана дозатора сухого (ДС)(цемента)
    SHLV,       // ...  (вяжущего)
    SHFZ,       // флаг загрузки-выгрузки ДС
    SHFH,       // счетчик перехода за верхний минимальный  вес ДС (дозатор загружен)
    SHFL,       // счетчик перехода за нижний  максимальный вес ДС (дозатор выгружен)
    SHZR,       // флаг нулевых значений
    SHWS,       // время ожидания стабилизации веса ДС
    MKLO,       // номер последнего открытого клапана дозатора мокрого (ДМ)
    MKFH,       // счетчик перехода за верхний минимальный  вес ДМ (дозатор загружен)
    MKFL,       // счетчик перехода за нижний  максимальный вес ДМ (дозатор выгружен)
    MKFZ,       // флаг загрузки-выгрузки ДМ
    MKWS,       // время ожидания стабилизации веса ДМ
    MKZR,       // флаг нулевых значений
    FLVV,       // флаг загрузки воды
    PALO,       // номер последнего открытого клапана дозатора пасты

    TMPRV,      // время предыдущей записи
    TMCUR,      // время текущей записи

    NM_KCEM1,   // клап после шнека цемента 1
    NM_KCEM,    // клап после шнека цемента 2
    NM_KVYG,    // клап вяж после шнека
    NM_KVRS,    // клап выгрузки ДС
    NM_KVOD,    // клап набора воды (168, DOM19V)
    NM_KSLM,    // клап подачи шлама
    NM_KOTH,    // клап подачи отходов
    NM_KVRM,    // клап выгрузки ДМ
    NM_KALM,    // клап подачи ал сусп
    NM_KVRA,    // клап выгрузки ДА

    DateFL,
    mRecPRV,
    TFF,        // флаг присутствия таблицы в БД
    FirstRun,   // флаг выполнения цикла
    CycCNT,     // счетчик циклов для обработки таблицы
    FLCM,       // флаг загрузки цемента
    FLVG,       // флаг загрузки вяжущих
    FLNR:       // флаг новой записи
integer;

    mRecCNT,    // количество обрабатываемых записей
    mRecCUR,    // нолмер текущей записи
    mRecPRC,    // проценты формирования отчета

    SHVL,       // нижний вес после которого  ДС считается выгруженным
    SHVH,       // верхний вес после которого ДС считается загруженным
    SHVC,       // вес цемента  для отчета
    SHVV,       // вес вяжущего для отчета
    SHVC1,      // вес цемента  для передачи в отчет
    SHVV1,      // вес вяжущего для передачи в отчет
    SHVC2,      // вес цемента  при накоплении веса
    SHVV2,      // вес вяжущего при накоплении веса
    SHVU,       // вес утечки (когда закрыты все клапана)
    CEMUT,      //
    VAGUT,      //

    CEMUTP,     // процент цемента в весе утечки
    SHVZ,       // вес загрузки ДС
    MKVH,       // верхний вес после которого ДМ считается загруженным
    MKVL,       // нижний  вес после которого ДМ считается выгруженным
    MKVV,       // вес воды
    MKVS,       // вес шлама
    MKVO,       // вес об шлама
    MKVU,       // вес утечки (когда закрыты все клапана)
    MKVZ,       // вес загрузки дозатора мокрого
    PUVZ,       // вес дозатора пудры
    PAVZ:       // вес дозатора пасты
real;
    SQL_REQ,    // строка SQL запроса
    DATE_INSERT,// строка вывода времени
    TMBG,       // время начала дозировки
    TMEN,       // время окончания дозировки

    TMSHL,      // время последней запомненной записи для дозатора сухого
    TMSHZ,      // время задежки для запоминания веса дозатора сухого

    TMMKL,      // время последней запомненной записи для дозатора мокрого
    TMMKZ,      // время задежки для запоминания веса дозатора мокрого
    TestSTR,
    YearSTR, MonSTR, DaySTR,
    MirrSTR:
string;

    // переменные БД SQL-запроса
    VLDATINS    : string;
    VLTIM       : integer;
    VL_WDZM     : real;
    VL_WDZS     : real;
    VL_WDZA     : real;
    VL_WDZI     : real;
    VL_WREZ     : real;
    VL_KCEM1    : real;
    VL_KCEM     : real;
    VL_KVYG     : real;
    VL_KVRS     : real;
    VL_KVOD     : real;
    VL_KSLM     : real;
    VL_KSL2     : real;
    VL_KOTH     : real;
    VL_KOT2     : real;
    VL_KVRM     : real;
    VL_KRZ1     : real;
    VL_KRZ2     : real;
    VL_KPA1     : real;
    VL_KRZ3     : real;
    VL_KPA2     : real;
    VL_KPAC     : real;
    VL_KVRA     : real;
    VL_KRZ4     : real;
    VL_VOTH     : real;     // DBB012
    VL_KRZ5     : real;     // DBB013
    VL_KO22     : real;     // DBB014
    VL_PinV     : real;     // DBB107,M46C06___V
    VL_PinA     : real;     // DBB108,M46C07___V
    PL_SLAM     : real;     // DBB246,DBB457

begin
    if(RunRep>0) then begin exit; end;

    // Номер участка дозировки для которого строиться отчет
    NDZ:=fmPrint.VibDZ.Value; if(NDZ<1) then NDZ:=1; if(NDZ>2) then NDZ:=2;


    //--------------------------------------------------------------------------
    // Построение SQL-запроса для участка дозировки N1
    if(NDZ=1) then begin
    SQL_REQ:='select DATE_INSERT,TIM,AIW61,AIW62,AIW64,AIW65,DOM22,DOM23,DOL62V, '+
             'DIS83____V,DOM15V,DOM13,DOL61,DIS30,DOL64,DIS85____V,DIS86____V,   '+
             'DIS87____V,DIS88____V,DOM35,DBB012,DBB013,DBB014,DBB107,DBB108,PsV '+
             'from ';
    end else begin
    //--------------------------------------------------------------------------
    // Построение SQL-запроса для участка дозировки N2
    SQL_REQ:='select DATE_INSERT,TIM, AIW252___V, AIW218___V, AIW216___V,'+
             'DIS229D2_V, DIS229B2_V, DIS220F__V, DIS251G1_V, DIS251F1_V,'+
             'DIS251E1_V, DIS251F2_V, DIS251E2_V, DIS251G2_V, DIS216F__V,'+
             'DIS216G__V, OBJM56___V, M46C06___V, M46C07___V, M21C08___V,'+
             'DIS2294__V, AIW219___V  from ';
    end;
    //--------------------------------------------------------------------------


    //----------------------------------
    // Чтение переменных из ini файла
    SBText('Чтение переменных');
    SHVL  :=strtofloat(fmStForm.readini('pCodus.ini','Var_report','SHVL'   ));
    SHVH  :=strtoint  (fmStForm.readini('pCodus.ini','Var_report','SHVH'   ));
    TMSHZ :=           fmStForm.readini('pCodus.ini','Var_report','TMSHZ'  );
    MKVH  :=strtoint  (fmStForm.readini('pCodus.ini','Var_report','MKVH'   ));
    MKVL  :=strtoint  (fmStForm.readini('pCodus.ini','Var_report','MKVL'   ));
    TMMKZ :=           fmStForm.readini('pCodus.ini','Var_report','TMMKZ'  );
    MKWS  :=strtoint  (fmStForm.readini('pCodus.ini','Var_report','MKWS'   ));
    SHWS  :=strtoint  (fmStForm.readini('pCodus.ini','Var_report','SHWS'   ));
    CEMUTP:=strtofloat(fmStForm.readini('pCodus.ini','Var_report','CEMUTPR'));
    if(CEMUTP<  1) then begin CEMUTP:=1;   end;
    if(CEMUTP>100) then begin CEMUTP:=100; end;
    //----------------------------------


    //----------------------------------
    // Определение начальных значений переменных
    SHVC:=0; SHVV:=0; SHVC1:=0; SHVV1:=0; SHVC2:=0; SHVV2:=0;
    SHZR:=0; SHVU:=0; CEMUT:=0; VAGUT:=0;
    SHVZ:=0; MKVZ:=0; PUVZ:=0; PAVZ:=0;
    SHLO:=0; SHLV:=0; SHFZ:=0; SHFH:=0; SHFL:=0;
    MKVV:=0; MKVO:=0; MKVS:=0; MKZR:=0;
    MKLO:=0; MKFZ:=0; MKFH:=0; MKFL:=0;
    FLCM:=0; FLVG:=0; FLNR:=0;
    PALO:=0;
    TFF :=0;
    FLIns   :=0;
    FirstRun:=0;
    DTCURI  :=0;
    CycCNT  :=1;
    YearSTR :='2000'; MonSTR:='01'; DaySTR:='01';

    // заданное время начала выборки записей для отчета
    TMSTARTI:=StrTMToInt( timetostr(fmPrint.TimeB.time) );

    // заданное время окончания выборки записей для отчета
    TMENDI  :=StrTMToInt( timetostr(fmPrint.TimeE.time) );
    //----------------------------------


    //----------------------------------
    // Проверка доступа к таблице БД для введенной даты
    while True do
    begin
       TFF:=0;
       // Определить первую доступную таблицу из введенного диапазона дат
       if(fmPrint.GetCurTBNL=0) then begin break; end;
       // Проверить есть ли заданная таблица в БД FireBird
       if fmPrint.IsTableFound(CurTBNL)>0 then begin TFF:=1; break; end;
    end;
    // если начальная таблица не найдена - выйти из процедуры формирования отчета
    if (TFF=0) then begin
       SBText('За введенный период нет данных');
       Sleep(2000);
       DTCURI:=0;
       Exit;
    end;
    //----------------------------------


    //----------------------------------
    // Определение первой доступной таблицы, количества в ней записей
    // и выполнение SQL-запроса
    RunRep:=1;
    BrCyc:=0;
    fmStForm.StatusBar1.Panels[3].Text:='Отчет'; fmStForm.StatusBar1.Update;
    SBText('Открытие таблицы ' + CurTBNL);
    // если найдена начальная таблица- открыть ее и определить кол-во записей
    TBLOpenF:=1;
    fmPrint.IBQuery1.close;
    fmPrint.IBQuery1.SQL.Clear;
    fmPrint.IBQuery1.SQL.add(SQL_REQ+CurTBNL);
    SBText('Открытие таблицы ' + CurTBNL);
    fmPrint.IBQuery1.Open;
    fmPrint.IBQuery1.Active:=true;
//    SBText('Открытие таблицы ' + CurTBNL + ' [Last1]');
//    fmPrint.IBQuery1.Last;
//    SBText('Открытие таблицы ' + CurTBNL + ' [Count1]');
//    mRecCNT:=fmPrint.IBQuery1.RecordCount;
    mRecCNT:=86400;
    fmPrint.IBQuery1.First;
    TMCUR:= fmPrint.IBQuery1.FieldByName('TIM').Value;
    SBText('Обработка данных таблицы ['+CurTBNL+'] ');
    // открыть область данных отчета
    fmPrint.RepData.Open;
    TBLOpenF:=0;
    //----------------------------------



    //----------------------------------
    // Основной цикл обработки данных :
    with fmPrint.IBQuery1 do
    begin
      SBText('Открытие таблицы ' + CurTBNL);
      fmPrint.IBQuery1.First;
//    Sleep(2000);

      while BrCyc=0 do
      begin

//    Sleep(0);
      CycCNT:=CycCNT+1;

      //-34xx------------------------------------------
      // если таблица не открыта или если конец таблицы
      if(TFF=0) or (fmPrint.IBQuery1.Eof) then
      begin
         SBText('Закрытие таблицы ' + CurTBNL);
         Sleep (2000);
         fmPrint.IBQuery1.Close; TFF:=0;
         // определить имя текущей обрабатываемой таблицы
         // если оно вне введенного диапазона- выйти из цикла
         if(fmPrint.GetCurTBNL=0) then begin
            SBText('Открытие таблицы ' + CurTBNL);
            Sleep (2000);
            break;
         end;
         SBText('Открытие таблицы ' + CurTBNL);
         Sleep (2000);
         // проверить есть ли заданная таблица в БД FireBird
         if (fmPrint.IsTableFound(CurTBNL)>0) then begin
             TFF:=1;
         end else begin
             SBText('Открытие таблицы ' + CurTBNL);
             Sleep (2000);
             continue;
         end;
         SBText('Открытие таблицы ' + CurTBNL);
         TBLOpenF:=1;
         fmPrint.IBQuery1.Close;
         fmPrint.IBQuery1.SQL.Clear;
         fmPrint.IBQuery1.SQL.add(SQL_REQ+CurTBNL);
         SBText('Открытие таблицы ' + CurTBNL);
         fmPrint.IBQuery1.Open;
         fmPrint.IBQuery1.Active:=true;
//         SBText('Открытие таблицы ' + CurTBNL + ' [Last2]');
//         fmPrint.IBQuery1.Last;
//         SBText('Открытие таблицы ' + CurTBNL + ' [Count2]');
//         mRecCNT:=fmPrint.IBQuery1.RecordCount;
         mRecCNT:=86400;
         TBLOpenF:=0;
         CycCNT:=1;
         // если во время открытия таблицы была попытка закрыть форму
         Sleep(100);
         if(BrCyc>0) then begin break; end;
         // если в таблице нет записей- перейти к следующей таблице
         if(mRecCNT=0) then begin TFF:=0; continue; end;
         // перейти в начало текущей открытой таблицы
         SBText('Открытие таблицы ' + CurTBNL);
         fmPrint.IBQuery1.First;
         TMCUR:= fmPrint.IBQuery1.FieldByName('TIM').Value;
         // пауза 2сек, чтобы увидеть сообщение
         Sleep(2000);
      end;
      //-34xx------------------------------------------


      // При обращении к результатам запроса, при указании полей надо
      // обязательно обращать внимание на их присутствие в тексте SQL-запроса
      // TMCUR:=fmPrint.IBQuery1.FieldByName('TIM').Value
      //                                      ^^^
      // select DATE_INSERT, TIM, AIW61 ... .
      //                     ^^^


      //-----------------------------------------------
      // Оределить процент обработки таблицы
      if(mRecCNT=0) then begin mRecCNT:=1; end;
      mRecCUR:=fmPrint.IBQuery1.RecNo;
      mRecPRC:=mRecCUR *(100 / mRecCNT);
      mRecPRV:=Trunc(mRecPRC);
      fmStForm.StatusBar1.Panels[0].Text:=
      'Обработка данных таблицы ['+CurTBNL+']'+
//    ' ['+IntToStr(Trunc(mRecCUR))+':'+IntToStr(Trunc(mRecCNT))+']'+
      ' ['+IntToStr(mRecPRV)+'%]'+
//    ' ['+IntToStr(CycCNT)+']'+
//    ' ['+IntToStr(Trunc(VODA))+']'+
      ' ';
      if(Frac(CycCNT/5)=0) then begin
         fmStForm.StatusBar1.Update;
      end;
      //-----------------------------------------------


      // запомнить время предыдущей записи
      TMPRV:= TMCUR;

      // чтение значений из БД в переменные (результаты SQL-запроса)
      VLDATINS:= fmPrint.IBQuery1.FieldByName('DATE_INSERT').Value;
      VLTIM   := fmPrint.IBQuery1.FieldByName('TIM').Value;        // Время


      // Получение значений из результата SQL запроса :
      //------------------------------------------------------------------------
      // Участок ДОЗИРОВКИ 1
      if(NDZ=1) then begin
      VL_WDZM := fmPrint.IBQuery1.FieldByName('AIW61').Value;      // 1 вес ДМ
      VL_WDZS := fmPrint.IBQuery1.FieldByName('AIW62').Value;      // 2 вес ДС
      VL_WDZA := fmPrint.IBQuery1.FieldByName('AIW65').Value;      // 3 вес ДА
      VL_KCEM := fmPrint.IBQuery1.FieldByName('DOM22').Value;      // 4 клап цем
      VL_KVYG := fmPrint.IBQuery1.FieldByName('DOM23').Value;      // 5 клап вяж
      VL_KVRS := fmPrint.IBQuery1.FieldByName('DOL62V').Value;     // 6 клап выг ДС
      VL_KVOD := fmPrint.IBQuery1.FieldByName('DIS83____V').Value; // 7 клап вод
      VL_KSLM := fmPrint.IBQuery1.FieldByName('DOM15V').Value;     // 8 клап шлама
      VL_KSL2 := fmPrint.IBQuery1.FieldByName('DOM15V').Value;     // 9 клап шлама циркул
      VL_KOTH := fmPrint.IBQuery1.FieldByName('DOM13').Value;      // 0 клап отход
      VL_KOT2 := fmPrint.IBQuery1.FieldByName('DOM13').Value;      // 1 клап отход циркул
      VL_KVRM := fmPrint.IBQuery1.FieldByName('DOL61').Value;      // 2 клап выг ДМ
      VL_KPA1 := fmPrint.IBQuery1.FieldByName('DIS85____V').Value; // 3 клап пас м1
      VL_KPA2 := fmPrint.IBQuery1.FieldByName('DIS87____V').Value; // 4 клап пас м2
      VL_KVRA := fmPrint.IBQuery1.FieldByName('DIS88____V').Value; // 5 клап выг ДА
      VL_VOTH := fmPrint.IBQuery1.FieldByName('DBB012').Value;     // 6 вибор д отх
      VL_KO22 := fmPrint.IBQuery1.FieldByName('DBB014').Value;     // 7 клап2 отх м2
      VL_PinV := fmPrint.IBQuery1.FieldByName('DBB107').Value;     // % песок в вяжущ
      VL_PinA := fmPrint.IBQuery1.FieldByName('DBB108').Value;     // % паста в ал.сусп
      PL_SLAM := fmPrint.IBQuery1.FieldByName('PsV').Value;        // плотность шлама
      VL_KPAC := fmPrint.IBQuery1.FieldByName('DIS30').Value;      // клап пас циркул
      VL_KCEM1:= 0;

      NM_KCEM := 135;    // клап цем после шнека
      NM_KVYG := 138;    // клап вяж после шнека
      NM_KVRS := 172;    // клап выгрузки ДС
      NM_KVOD := 222;    // клап набора воды (168, DOM19V)
      NM_KSLM := 170;    // клап подачи шлама
      NM_KOTH := 130;    // клап подачи отходов
      NM_KVRM := 131;    // клап выгрузки ДМ
      NM_KALM := 150;    // клап подачи ал сусп
      NM_KVRA := 151;    // клап выгрузки ДА
      end else begin

      //-----------------------------------------------
      // Участок ДОЗИРОВКИ 2 (NDZ=2)
      VL_WDZM := fmPrint.IBQuery1.FieldByName('AIW252___V').Value; // 1 вес ДМ
      VL_WDZS := fmPrint.IBQuery1.FieldByName('AIW218___V').Value; // 2 вес ДС
      VL_WDZA := fmPrint.IBQuery1.FieldByName('AIW216___V').Value; // 3 вес ДА
      VL_KCEM := fmPrint.IBQuery1.FieldByName('DIS229D2_V').Value; // 4 клап цемента 2
      VL_KVYG := fmPrint.IBQuery1.FieldByName('DIS229B2_V').Value; // 5 клап вяж
      VL_KVRS := fmPrint.IBQuery1.FieldByName('DIS220F__V').Value; // 6 клап выг ДС
      VL_KVOD := fmPrint.IBQuery1.FieldByName('DIS251G1_V').Value; // 7 клап хол воды
      VL_KSLM := fmPrint.IBQuery1.FieldByName('DIS251F1_V').Value; // 8 клап шлама
      VL_KSL2 := fmPrint.IBQuery1.FieldByName('DIS251E1_V').Value; // 9 клап шлама циркул
      VL_KOTH := fmPrint.IBQuery1.FieldByName('DIS251F2_V').Value; // 0 клап отход
      VL_KOT2 := fmPrint.IBQuery1.FieldByName('DIS251E2_V').Value; // 1 клап отход циркул
      VL_KVRM := fmPrint.IBQuery1.FieldByName('DIS251G2_V').Value; // 2 клап выг ДМ
      VL_KPA1 := fmPrint.IBQuery1.FieldByName('DIS216F__V').Value; // 3 клап пас м1
      VL_KPA2 := fmPrint.IBQuery1.FieldByName('DIS216F__V').Value; // 4 клап пас м2
      VL_KVRA := fmPrint.IBQuery1.FieldByName('DIS216G__V').Value; // 5 клап выг ДА
      VL_VOTH := fmPrint.IBQuery1.FieldByName('OBJM56___V').Value; // 6 вибор д отх
      VL_KO22 := fmPrint.IBQuery1.FieldByName('DIS251F2_V').Value; // 7 клап2 отх м2
      VL_PinV := fmPrint.IBQuery1.FieldByName('M46C06___V').Value; // % песок в вяжущ
      VL_PinA := fmPrint.IBQuery1.FieldByName('M46C07___V').Value; // % паста в ал.сусп
      PL_SLAM := fmPrint.IBQuery1.FieldByName('M21C08___V').Value; // плотность шлама
      VL_KCEM1:= fmPrint.IBQuery1.FieldByName('DIS2294__V').Value; // клапан цемента1
      VL_WDZI := fmPrint.IBQuery1.FieldByName('AIW219___V').Value; // вес ДИ

//    NM_KCEM1:= 442;    // клап после шнека цемента1
      NM_KCEM := 517;    // клап после шнека цемента2
      NM_KVYG := 513;    // клап вяж после шнека
      NM_KVRS := 518;    // клап выгрузки ДС
      NM_KVOD := 524;    // клап набора воды
      NM_KSLM := 523;    // клап подачи шлама
      NM_KOTH := 527;    // клап подачи отходов
      NM_KVRM := 529;    // клап выгрузки ДМ
      NM_KALM := 532;    // клап подачи ал сусп
      NM_KVRA := 533;    // клап выгрузки ДА
      end;
      //------------------------------------------------------------------------


//      VL_WREZ := fmPrint.IBQuery1.FieldByName('AIW64').Value;      // резерв
//      VL_KRZ2 := fmPrint.IBQuery1.FieldByName('DOL64').Value;      // резерв
//      VL_KRZ3 := fmPrint.IBQuery1.FieldByName('DIS86____V').Value; // резерв
//      VL_KRZ4 := fmPrint.IBQuery1.FieldByName('DOM35').Value;      // резерв
//      VL_KRZ5 := fmPrint.IBQuery1.FieldByName('DBB013').Value;     // резерв

      // если дата текущей таблицы данных равна начальной введенной дате и
      // если время текущей записи меньше заданного начального- перейти к следующей записи
      // (если не дошли до заданного начального диапазона- пропускаем ненужные записи
      // без подсчетов) (ДО)
      if(DTCURI<=DTSTARTI) and (TMSTARTI>VLTIM) then begin
         fmPrint.IBQuery1.Next; continue;
      end;

      // между этими двумя условиями (ДО) и (ПОСЛЕ) выполняется "этот" основной цикл
      // ...

      // если дата текущей таблицы данных равна конечной введенной дате и
      // если время текущей записи больше заданного конечного- выйти из цикла
      // (если вышли за заданный диапазон- прерываем цикл) (ПОСЛЕ)
      if(DTCURI>=DTENDI) and (TMENDI<VLTIM) then begin
         SBText('Окончание диапазона выборки таблицы ' + CurTBNL); Sleep(1000);
         break;
      end;

      //
      DATE_INSERT:= VLDATINS;
      YearSTR[1]:=DATE_INSERT[7]; YearSTR[2]:=DATE_INSERT[8]; YearSTR[3]:=DATE_INSERT[9]; YearSTR[4]:=DATE_INSERT[10]; YearSTR[5]:=Chr(0);
      MonStr [1]:=DATE_INSERT[4]; MonStr [2]:=DATE_INSERT[5]; MonStr [3]:=Chr(0);
      DayStr [1]:=DATE_INSERT[1]; DayStr [2]:=DATE_INSERT[2]; DayStr [3]:=Chr(0);
      MirrSTR:=YearSTR+MonSTR+DaySTR;
      TestSTR:='1'; // NEW Formula
      if(MirrSTR<'20140220') then begin TestSTR:='0'; end; // OLD Formula

      FLNR:=0;
      if((VL_KCEM>0) and (SHLO=0)) or (TestSTR='0') then begin
         FLNR:=1;
      end;
      // смена алгоритма подсчета была после 20.02.2014 только на БСУ2
      if((VL_KCEM>0) or (VL_KCEM1>0) or (VL_KVYG> 0)) and (SHLO=0) and
        ((TestSTR='1') and (NDZ=2)) then begin
        FLNR:=2;
      end;


      // Формирование и передача записей для построения отчета
      //------------------------------------------------------------------------
      // если открыт клапан набора цемента и это нач.состояние -
      // начало дозировки цемента
      if(FLNR >0) then begin
        // если это не первый проход- записать данные в отчет
        if FirstRun=2 then begin
          SHVC:=SHVC1;                 // вес цемента  текущей дозировки
          SHVV:=SHVV1;                 // вес вяжущего текущей дозировки
//!!!
          // правильнее передавать значения через дополнительные переменные, типа
          // VODA, SLAM, SLOB, PAST, CMNT, VYAJ,  которые формируются на этапе
          // перехода на загрузку след компонента или при выгрузке из дозатора
          // MKVV:=VODA; MKVS:=SLAM; MKVO:=SHOB; ...

          // Кол-во песка в шламе DBB[246],DBB[457]-плотность шлама
          if (PL_SLAM=0) then begin PL_SLAM:=1; end;
          CEMUT:=MKVS*1.66*(PL_SLAM-1)/PL_SLAM;

          // Кол-во песка в вяжущих
          if(VL_PinV=0) then begin VL_PinV:=15; end;
          VAGUT:=SHVV*VL_PinV*0.01;
          // Кол-во извести из вяжущих
          MKVZ:=SHVV-VAGUT;
          // Общее кол-во песка
          SHVZ:=CEMUT+VAGUT;
          // Паста из суспензии
          if(VL_PinA=0) then begin VL_PinA:=12.5; end;
          PUVZ:=PAVZ*VL_PinA*0.01;

          // Данный список и порядок в нем должен соответствовать списку в
          // RepData: TRxMemoryData
          fmPrint.RepData.FieldDefs.DataSet.AppendRecord(
          // TMBG,TMEN  - время начала и конца дозировки    [+,+]
          // SHVC,SHVV  - сухое:вес цемента,вес вяжущих     [+,+]
          // CEMUT,VAGUT- утечка цемента и вяжущего         [-,-] Песок шлама[+],вяжущего[+]
          // SHVZ       - сухое:вес загрузки дозатора       [-]   Песок общий[+]
          // MKVV,MKVO,MKVS,MKVZ- мокрое:вес воды,отходов,шлама,загрузки [+,+,+,-] Изв в вяж[+]
          // PUVZ,PAVZ  - вес загрузки пудры,пасты(ал.сусп) [-,+] Пасты чист(Ал.сп/8)[+]
          // DATE_INSERT- время создания записи в БД        [+]
          [NDZ,TMBG,TMEN,SHVC,SHVV,CEMUT,VAGUT,SHVZ,MKVV,MKVO,MKVS,MKVZ,PUVZ,PAVZ,DATE_INSERT,TestSTR]);
          // Флаг добавления записи в RepData
          FLIns:=1;
//<<<break point
          // Запись данных в файл импорта
          // ...
          // Обнуление значений веса и флагов дозаторов
          SHVU:=0;                       // вес утечки текущей дозировки
          SHVZ:=0;                       // вес дозатора сухого
          SHFL:=0;                       // флаг выгрузки дозатора
          SHZR:=0;                       // флаг нулевых значений
          PAVZ:=0;                       // вес дозатора пасты
          PUVZ:=0;
          FLCM:=0;
          FLVG:=0;

          SHVC1:=0;
          SHVV1:=0;

          // время начала дозировки
          TMBG:=IntToStr(VLTIM);
          // запомнить время текщей записи
          TMSHL:=IntToStr(VLTIM);
          // обнуление веса ДМ
          if(MKFZ=0)and(MKFH=0)and(MKFL=0)then begin
             MKVV:=0; MKVS:=0; MKVO:=0; MKVZ:=0;
          end;
        end;
        SHVC2:=0;
        SHVV2:=0;
        // переустановить номер посл откр клап
        if (FLNR=2) then begin
            if(VL_WDZS<50) and (VL_WDZI<50) then begin SHLO:=10; SHLV:=10; end;
        end else begin
            SHLO:=NM_KCEM;
        end;
        FLNR:=0;
        FirstRun:=1;
      end;
      //------------------------------------------------------------------------



      // ДОЗАТОР СУХОГО ########################################################


      //------------------------------------------------------------------------
      // Если запрашиваются данные после 2014-02-20 с БСУ2
      if((TestSTR='1') and (NDZ=2)) then begin
          //-----------------------------------------
          // Esli zakrit klap nabora i otkrit klap vigruz - vigruzka
          // do etogo schitaem ves dozatora
          if (VL_KCEM=0) and (VL_KVRS>0) then begin FLCM:=2; end;
          if (VL_KVYG=0) and (VL_KVRS>0) then begin FLVG:=2; end;
          //-----------------------------------------
          // ЦЕМЕНТ загрузка
          // Otkrit klap nabora cem, ves>30kg, zakrit klap vigruz
          if (VL_WDZS>30) and (FLCM=0) then begin
              if(VL_WDZS>SHVC2) then begin SHVC2:=VL_WDZS; end;
              SHLO:=20;
//<<<break point
          end;
          //-----------------------------------------
          // ВЯЖУЩЕЕ загрузка
          if (VL_WDZI>30) and (FLVG=0) then begin
              if(VL_WDZI>SHVV2) then begin SHVV2:=VL_WDZI; end;
              SHLV:=20;
//<<<break point
          end;
          //-----------------------------------------
          if (VL_KCEM= 0) and (VL_KCEM1=0) and (VL_KVYG =0) and (SHLO=20) and (SHLV=20) and
             (VL_WDZS>30) and (VL_WDZI>30) then begin
              SHLO:=1; SHLV:=1;
//<<<break point
          end;
      end;
      //------------------------------------------------------------------------



      //------------------------------------------------------------------------
      // Если запрашиваются данные до 2014-02-20 или с БСУ1
      if((TestSTR='0') or (NDZ=1)) then begin

          //--------------------------
          // продолжение дозировки цемента
          // если открыт клапан набора цемента и он же и был открыт
          if (VL_KCEM>0) and (SHLO=NM_KCEM) and ((FLCM=0) or (FLCM=1)) then begin
              if(VL_WDZS>SHVZ) then begin
                  SHVC2:=VL_WDZS; SHVZ:=VL_WDZS;
              end;
              SHLO:=NM_KCEM; FLCM:=1;
          end;
          // окончание дозировки цемента
          // если клапан набора цемента закрыт и перед этим набирали цемент
          if (VL_KCEM=0) and (SHLO=NM_KCEM) and ((FLCM=1) or (FLCM=2)) then begin
              if(VL_WDZS>SHVZ) then begin
                  SHVC2:=VL_WDZS; SHVZ:=VL_WDZS;
              end;
              TMSHL:=IntToStr(VLTIM);
              SHLO:=NM_KCEM; FLCM:=2;
          end;

          //--------------------------
          // начало дозировки вяжущего
          // если открыт клапан набора вяжущего и перед этим набирали цемент
          if (VL_KVYG>0) and (SHLO=NM_KCEM) and (FLVG=0) then begin
              if(VL_WDZS>SHVZ) then begin
                  SHVC2:=VL_WDZS; SHVZ:=VL_WDZS;
              end;
              SHLO:=NM_KVYG;
          end;
          // продолжение дозировки вяжущего
          // если открыт клапан набора вяжущего и набирали вяжущее
          if (VL_KVYG>0) and ((SHLO=NM_KVYG) or (SHLO=NM_KCEM)) then begin
              if(VL_WDZS>SHVZ) then begin
                  SHVV2:=VL_WDZS-SHVC2;
                  SHVZ :=VL_WDZS;
              end;
              SHLO:=NM_KVYG; FLVG:=1;
          end;
          // окончание дозировки вяжущего
          // если закрыт клапан набора вяжущего и был открыт
          if (VL_KVYG=0) and (SHLO=NM_KVYG) and (FLVG=1) then begin
              if(VL_WDZS>SHVZ) then begin
                  SHVV2:=VL_WDZS-SHVC2;
                  SHVZ :=VL_WDZS;
              end;
              TMSHL:=IntToStr(VLTIM);
              SHLO:=NM_KVYG;
          end;
          // запомнить вес дозатора и вяжущего через TMSHZ секунд
          if (VL_KVYG=0) and (VL_WDZS>SHVL) and (SHLO=NM_KVYG) and (FLVG=1) and
             (VLTIM<StrToInt(TMSHL)+StrToInt(TMSHZ)) then begin
              if(VL_WDZS>SHVZ) then begin
                  SHVV2:=VL_WDZS-SHVC2;
                  SHVZ :=VL_WDZS;
              end;
              SHLO:=1;
          end;
      end;
      //------------------------------------------------------------------------



      //------------------------------------------------------------------------
      // peredacha znachen vesa do okonch vigruzki DS
      if((SHLO=1) and (SHFZ=1) and (VL_WDZS<200)) then begin
// При открытии клапана выгрузки дёргается вес.
// Поэтому вес ДС (вяжущего)надо запоминать до этого момента
//      if(VL_WDZS>SHVZ) then begin
//         SHVV2:=VL_WDZS - SHVC2;
//         SHVZ :=VL_WDZS;
//      end;
        SHLO :=NM_KVRS;
        SHVC1:=SHVC2;
        SHVV1:=SHVV2;
      end;
      //------------------------------------------------------------------------



      //------------------------------------------------------------------------
      // определение этапа дозировки

      // загрузка:
      if(VL_WDZS>SHVH) then begin
         // ждать устойчивый вес SHWS сек
         if(SHFH<= SHWS) then begin SHFH:=SHFH+1; end;
      end else begin
         if(SHFH> 0) then begin SHFH:=SHFH-1; end;
      end;

      // dozator suhogo zagrujen
      if(SHFH>SHWS) then begin
         SHFZ:=1;
         SHFL:=0;
         if(VL_WDZS>SHVZ) then begin
            // вес загрузки
            SHVZ:=VL_WDZS;
         end;
      end;


      // выгрузка:
      if(VL_WDZS<SHVL) then begin
        if(SHFZ>0) then begin
          // ждать устойчивый вес SHWS сек
          if(SHFL<=SHWS) then begin SHFL:=SHFL+1; end;
        end;
      end else begin
          if(SHFL>    0) then begin SHFL:=SHFL-1; end;
      end;

      // дозатор выгружен
      if(SHFL>SHWS)then begin
         SHFZ:=0;
         SHFH:=0;
         SHFL:=0;
      end;


      //-----------------------------------------------
      // если все клапана дозатора сухого закрыты и вес дозатора меньше нижнего-
      // сбросить все флаги (начальное состояние)
      if (VL_KCEM=0) and (VL_KCEM1=0  ) and (VL_KVYG=0) and
         (VL_KVRS=0) and (VL_WDZS<SHVL) then begin
         SHZR:=SHZR+1;
      end else begin
         SHZR:=0;
      end;

      if (SHZR>3) then
      begin
         // время окончания дозировки
         if(SHZR=4) then begin TMEN:=IntToStr(VLTIM); end;
         SHFZ:=0;
         SHFH:=0;
         SHFL:=0;
         SHLO:=0;
         TMSHL:=IntToStr(VLTIM);
      end;
      //-----------------------------------------------

      // #####################################################################




//    // ДОЗАТОР МОКРОГО #####################################################

      if(NDZ=1) then begin
      //----------------------------------------------------------------------
      // 1 если открыт клапан наб воды и это нач.состояние - начало набора воды
      if (VL_KVOD>0) and (MKLO=0) then
      begin
        // запомнить   время текщей записи
        TMMKL:=IntToStr(VLTIM);
        if(VL_WDZM<MKVL) then
        begin
           MKVZ:=0;
        end;
        MKLO:=NM_KVOD;
        FLVV:=1;
      end;
      // продолжение набора воды
      // если открыт клапан набора воды и он же и был открыт
      if((VL_KVOD>0) and (MKLO=NM_KVOD)) then
      begin
        if(VL_WDZM>MKVZ) then begin MKVZ:=VL_WDZM; end;
        MKLO:=NM_KVOD;
      end;
      // если закрыт клапан набора воды и он же и был открыт
      if((VL_KVOD=0) and (MKLO=NM_KVOD)) then
      begin
        if(VL_WDZM>MKVZ) then begin MKVZ:=VL_WDZM; end;
        MKLO:=NM_KVOD;
      end;

      //--------------------
      // начало набора шлама
      // если открыт клапан набора шлама или это начальное состояние
      if (VL_KSLM>0) and ((MKLO=NM_KVOD) or (MKLO=0)) then
      begin
          // запомнить вес воды MKVV
          MKVV:=MKVZ;
          // запомнить время текщей записи
          TMMKL:=IntToStr(VLTIM);
          // переустановить номер посл откр клап
          MKLO:=NM_KSLM;
      end;
      // продолжение набора шлама
      // если открыт клапан набора шлама и он же и был открыт
      if((VL_KSLM>0) and (MKLO=NM_KSLM)) then
      begin
          // запомнить вес шлама MKVS
          if(VL_WDZM>MKVZ) then begin
             MKVS:=VL_WDZM-MKVV;
             MKVZ:=VL_WDZM;
          end;
          MKLO:=NM_KSLM;
      end;
      // окончание набора шлама
      // если клапан набора шлама закрыт и перед этим набирали шлам
      if((VL_KSLM=0) and (MKLO=NM_KSLM)) then
      begin
          // запомнить вес шлама MKVS
          if(VL_WDZM>MKVZ) then begin
             MKVS:=VL_WDZM-MKVV;
             MKVZ:=VL_WDZM;
          end;
          TMMKL:=IntToStr(VLTIM);
          MKLO:=NM_KSLM;
      end;

      //--------------------
      // начало набора обратного шлама
      // если открыт клапан набора об шлама и перед этим был открыт клапан шлама
      if(((VL_KOTH>0) or (VL_KO22>0)) and (MKLO=NM_KSLM)) then
      begin
         // запомнить вес шлама MKVS
         if(VL_WDZM>MKVZ) then begin
            MKVS:=VL_WDZM-MKVV;
            MKVZ:=VL_WDZM;
         end;
         // запомнить время текщей записи
         TMMKL:=IntToStr(VLTIM);
         // переустановить номер посл откр клап
         MKLO:=NM_KOTH;
      end;
      // продолжение набора об шлама
      // если открыт клапан набора об шлама и он же и был открыт
      if(((VL_KOTH>0) or (VL_KO22>0)) and (MKLO=NM_KOTH)) then
      begin
         if(VL_WDZM>MKVZ) then begin
            MKVO:=VL_WDZM-MKVV-MKVS;
            MKVZ:=VL_WDZM;
         end;
         MKLO:=NM_KOTH;
      end;
      // окончание набора обратного шлама
      // если клапан набора об шлама закрыт и перед этим набирали об шлам
      if(((VL_KOTH=0) and (VL_KO22=0)) and (MKLO=NM_KOTH)) then
      begin
         if(VL_WDZM>MKVZ) then begin
            MKVO:=VL_WDZM-MKVV-MKVS;
            MKVZ:=VL_WDZM;
         end;
         TMMKL:=IntToStr(VLTIM);
         MKLO:=NM_KOTH;
      end;

      //----------------------------------------------------------------------
      // начало выгрузки из дозатора мокрого
      if (VL_KVRM>0) and ((MKLO=NM_KOTH) or (MKLO=NM_KSLM)) and (MKFZ=1) then
      begin
        // запомнить вес об шлама MKVO
        // выключили, потому что бывает при открытии клапана - вес уходит сразу (бывает до 100кг)
        // поэтому вес обратного шлама запоминаем ТОЛЬКО до открытия клапана выгрузки
        // MKVO:=VL_WDZM-MKVV-MKVS;
        // номер последнего открытого клапана
        MKLO:=NM_KVRM;
      end;



//    // #####################################################################
      //  NDZ= 2
      end else begin

      //--------------------
      // начало набора обратного шлама
      // если открыт клапан набора об шлама и это начало набора
      if(((VL_KOTH>0) or (VL_KO22>0)) and (MKLO=0)) then
      begin
         // запомнить вес шлама MKVS
         if(VL_WDZM>MKVZ) then begin
//<<<break point
            MKVZ:=VL_WDZM; MKVO:=VL_WDZM;
         end;
         // запомнить время текщей записи
         TMMKL:=IntToStr(VLTIM);
         // переустановить номер посл откр клап
         MKLO:=NM_KOTH;
      end;
      // продолжение набора об шлама
      // если открыт клапан набора об шлама и он же и был открыт
      if(((VL_KOTH>0) or (VL_KO22>0)) and (MKLO=NM_KOTH)) then
      begin
         if(VL_WDZM>MKVZ) then begin
            MKVO:=VL_WDZM; MKVZ:=VL_WDZM;
         end;
         MKLO:=NM_KOTH;
      end;
      // окончание набора обратного шлама
      // если клапан набора об шлама закрыт и перед этим набирали об шлам
      if(((VL_KOTH=0) and (VL_KO22=0)) and (MKLO=NM_KOTH)) then
      begin
         if(VL_WDZM>MKVZ) then begin MKVO:=VL_WDZM; MKVZ:=VL_WDZM; end;
         TMMKL:=IntToStr(VLTIM);
         MKLO:=NM_KOTH;
      end;

      //--------------------
      // начало набора шлама
      // если открыт клапан набора шлама и это начальное состояние
      if (VL_KSLM>0) and ((MKLO=NM_KOTH) or (MKLO=0)) then
      begin
          // запомнить вес обр шлама
          if(VL_WDZM>MKVZ) then begin MKVO:=VL_WDZM; MKVZ:=VL_WDZM; end;
//<<<break point
          // запомнить время текщей записи
          TMMKL:=IntToStr(VLTIM);
          // переустановить номер посл откр клап
          MKLO:=NM_KSLM;
      end;
      // продолжение набора шлама
      // если открыт клапан набора шлама и он же и был открыт
      if((VL_KSLM>0) and (MKLO=NM_KSLM)) then
      begin
          // запомнить вес шлама MKVS
          if(VL_WDZM>MKVZ) then begin
             MKVS:=VL_WDZM-MKVO; MKVZ:=VL_WDZM;
          end;
          MKLO:=NM_KSLM;
      end;
      // окончание набора шлама
      // если клапан набора шлама закрыт и перед этим набирали шлам
      if((VL_KSLM=0) and (MKLO=NM_KSLM)) then
      begin
          // запомнить вес шлама MKVS
          if(VL_WDZM>MKVZ) then begin
             MKVS:=VL_WDZM-MKVO; MKVZ:=VL_WDZM;
          end;
          TMMKL:=IntToStr(VLTIM);
          MKLO:=NM_KSLM;
      end;

      //----------------------
      // начало выгрузки из ДМ
      if (VL_KVRM>0) and ((MKLO=NM_KOTH) or (MKLO=NM_KSLM)) and (MKFZ=1) then
      begin
        // запомнить вес шлама MKVS
        MKVS:=VL_WDZM-MKVO;
        // номер последнего открытого клапана
        MKLO:=NM_KVRM;
      end;

      //----------------------------------------------------------------------
      // если открыт клапан наб воды и был открыт клапан выгрузки
      if (VL_KVOD>0) and (MKLO=NM_KVRM) then
      begin
        // запомнить   время текщей записи
        TMMKL:=IntToStr(VLTIM);
        MKVZ:=MKVO+MKVS+VL_WDZM;
        MKLO:=NM_KVOD;
        FLVV:=0;
      end;
      // продолжение набора воды
      // если открыт клапан набора воды и он же и был открыт
      if((VL_KVOD>0) and (MKLO=NM_KVOD)) then
      begin
        if(VL_WDZM>MKVZ) then begin MKVZ:=MKVO+MKVS+VL_WDZM; end;
        MKLO:=NM_KVOD;
      end;
      // если закрыт клапан набора воды и он же и был открыт
      if((VL_KVOD=0) and (MKLO=NM_KVOD)) then
      begin
        if(VL_WDZM>MKVZ) then begin MKVZ:=MKVO+MKVS+VL_WDZM; end;
        MKLO:=NM_KVOD;
        FLVV:=1;
      end;

      //----------------------
      // повторная выгрузка из ДМ
      if (VL_KVRM>0) and (MKLO=NM_KVOD) and (MKFZ=1) then
      begin
        MKLO:=NM_KVRM;
      end;

      end;
      //----------------------------------------------------------------------



      //----------------------------------------------------------------------
      // определение этапа дозировки

      // загрузка:
      if(VL_WDZM>MKVH) then
      begin
         // ждать устойчивый вес MKWS сек
         if MKFH<= MKWS then begin MKFH:=MKFH+1; end;
      end else begin
         if(MKFH> 0) then begin MKFH:=MKFH-1; end;
      end;
      // дозатор загружен
      if(MKFH>MKWS)then
      begin
         MKFZ:=1;
         MKFL:=0;
         if(VL_WDZM>MKVZ) then begin MKVZ:=VL_WDZM; end;
      end;

      // выгрузка:
      if(VL_WDZM<MKVL) then
      begin
        if(MKFZ>0) then
        begin
          // ждать устойчивый вес MKWS сек
          if(MKFL<=MKWS) then begin MKFL:=MKFL+1; end;
        end
      end else begin
          if(MKFL>    0) then begin MKFL:=MKFL-1; end;
      end;

      // дозатор выгружен
      if(MKFL>MKWS)then begin
         MKFZ:=0;
         MKFH:=0;
         MKFL:=0;
      end;

      // если все клапана дозатора мокрого закрыты и вес дозатора меньше нижнего
      // и установлен флаг набора воды- сбросить все флаги (начальное состояние)
      if (VL_KVOD=0)and(VL_KSLM=0)and(VL_KOTH=0)and(VL_KO22=0)and
         (VL_KVRM=0)and(VL_WDZM<MKVL)and(FLVV>0)then
      begin
         MKZR:=MKZR+1;
      end else begin
         MKZR:=0;
      end;

      if (MKZR>4) then
      begin
         MKFZ:=0;
         MKFH:=0;
         MKFL:=0;
         MKLO:=0;
         FLVV:=0;
      end;

//    // #####################################################################



      // ДОЗАТОР ПАСТЫ #######################################################

      //----------------------------------------------------------------------
      // если открыт клапан набора ал.пасты и это нач.состояние
      if(((VL_KPA2>0) or (VL_KPA1>0) or (VL_KPAC>0)) and (PALO=0)) then
      begin
        PALO:=NM_KALM;              // установить номер посл откр клап
      end;
      // продолжение набора пасты
      // если открыт клапан набора пасты и он же и был открыт
      if(((VL_KPA2>0) or (VL_KPA1>0) or (VL_KPAC>0)) and (PALO=NM_KALM)) then
      begin
          if(VL_WDZA>PAVZ) then begin PAVZ:=VL_WDZA; end;
          PALO:=NM_KALM;
      end;
      // окончание набора пасты
      // если клапан набора пасты закрыт и он же и был открыт
      if((VL_KPA2=0) and (VL_KPA1=0) and (VL_KPAC=0)) and (PALO=NM_KALM) then
      begin
          if(VL_WDZA>PAVZ) then begin PAVZ:=VL_WDZA; end;
          PALO:=NM_KALM;
      end;
      // выгрузка из дозатора ал.суспензии
      if((VL_KVRA>0) and (PALO=NM_KALM)) then
      begin
          if(VL_WDZA>PAVZ) then begin PAVZ:=VL_WDZA; end;
          PALO:=NM_KVRA;
      end;
      // если клапан выгрузки ал.суспензии закрыт, а был открыт
      if(VL_KVRA=0)and(PALO=NM_KVRA) then
      begin
          PALO:=152;
      end;
      // #####################################################################

      // выгрузка из мешлки ал.суспензии (дозатора пасты)
      // это самый последний шаг при выгрузке дозаторов
      // 152- это не номер клапана, а флаг окончания дозировки

      if (PALO=152) then
      begin
        FirstRun:=2;
        SHLO:=0;
        SHLV:=0;
        MKLO:=0;
        PALO:=0;
        TMEN:=IntToStr(VLTIM);
//<<<break point
      end;

      // #####################################################################

      if(BrCyc>0) then begin break; end;
      fmPrint.IBQuery1.Next;

      end; // while BrCyc=0
    end;

    SBText(' ');
    if(TFF  >0) then begin fmPrint.IBQuery1.Close; end;
    if(BrCyc=0) then begin Synchronize(DZ_View);   end;
    if(BrCyc=2) then begin fmPrint.Close;          end;
    DTCURI:=0;
    FLIns :=0;
    RunRep:=0;

end;
//--------------------------------------------------------------------------




//--------------------------------------------------------------------------
// Вывод отчета дозировки на экран
procedure TMTHread.DZ_View;
begin
    //------------------------------------------------------------------------
    frvariables['DateB']:=fmPrint.DateB.text;
    frvariables['DateE']:=fmPrint.DateE.text;
    frvariables['TimeB']:=timetostr(fmPrint.TimeB.time);
    frvariables['TimeE']:=timetostr(fmPrint.TimeE.time);
    if(FLIns>0) then begin
        fmPrint.RepData.Open;
        fmPrint.RepData.First;
        if(fmPrint.RadioButton1.Checked=True) then begin
           fmPrint.fr_dozatp.PrepareReport;
           fmPrint.fr_dozatp.ShowPreparedReport;
        end;
        if(fmPrint.RadioButton2.Checked=True) then begin
           fmPrint.fr_dozats.PrepareReport;
           fmPrint.fr_dozats.ShowPreparedReport;
        end;
        if(fmPrint.RadioButton3.Checked=True) then begin
           fmPrint.fr_dozati.PrepareReport;
           fmPrint.fr_dozati.ShowPreparedReport;
        end;
    end else begin
        fmStForm.StatusBar1.Panels[0].Text:='Нет данных за указанный период';
        fmStForm.StatusBar1.Update;
        Sleep(2000);
    end;
    fmPrint.RepData.Close;
    fmStForm.StatusBar1.Panels[0].Text:='';
    fmStForm.StatusBar1.Panels[3].Text:=''; fmStForm.StatusBar1.Update;
    //------------------------------------------------------------------------
end;
//--------------------------------------------------------------------------







//--------------------------------------------------------------------------
//  формирование отчета по автоклавам
procedure TMThread.AK_Report;
var
    PRV           : array [0..4] of integer;       // предыдущий ввод

    WRFlag,        // флаг записи в таблицу отчета текущих данных
    TMPRV,         // время предыдущей записи
    TMCUR,         // время текущей записи
    TMSAV,         // время последней передачи данных оператором автоклавов  
    mRecPRV,       // подсчет процентов обработки таблицы
    TFF,           // флаг присутствия таблицы в БД
    FirstRun:      // флаг выполнения цикла
integer;

    // Переменные отчета:
    NNAR,          // номер наряда
    NAUT,          // номер автоклава
    D6DE,          // марки блоков D600:
    D6VIII,        //
    D6VI,          //
    D6III,         //
    D6ZAK,         //
    D6NEK,         //
    D4DE,          // марки блоков D400:
    D4VIII,        //
    D4VI,          //
    D4III,         //
    D4ZAK,         //
    D4NEK,         //
    mRecCNT,       // количество обрабатываемых записей
    mRecCUR,       // нолмер текущей записи
    mRecPRC:       // проценты формирования отчета
real;

    SQLQuery,      // SQL запрос
    DATE_INSERT,   // строка вывода времени
    ZNAK,          // признак загрузки-выгрузки
    TMCR:          // время окончания дозировки
string;

begin
    if(RunRep>0) then exit;

    // заданное время начала выборки записей для отчета
    TMSTARTI:=StrTMToInt( timetostr(fmPrint.TimeB.time) );
    // заданное время окончания выборки записей для отчета
    TMENDI  :=StrTMToInt( timetostr(fmPrint.TimeE.time) );

    //------------------------------------
    // Чтение переменных из ini файла
    fmStForm.StatusBar1.Panels[0].Text:='Чтение переменных';
    fmStForm.StatusBar1.Update;
    //-------
    // SHVL :=strtofloat  (fmStForm.readini('Var_report',  'SHVL'  ));
    // SHVH :=strtoint    (fmStForm.readini('Var_report',  'SHVH'  ));
    // TMSHZ:=             fmStForm.readini('Var_report',  'TMSHZ' );
    //-------

    TFF   :=0;
    FLIns :=0;
    DTCURI:=0;
    NAUT  :=0;
    WrFlag:=0;
    FirstRun:=0;

    while True do
    begin
       TFF:=0;
       // Определить первую доступную таблицу из введенного диапазона дат
       if(fmPrint.GetCurTBNL=0) then break;
       // Проверить есть ли заданная таблица в БД FireBird
       if fmPrint.IsTableFound(CurTBNL)>0 then begin TFF:=1; break; end
    end;

    // если начальная таблица не найдена - выйти из процедуры формирования отчета
    if (TFF=0) then begin
       fmStForm.StatusBar1.Panels[0].Text:='За введенный период нет данных';
       fmStForm.StatusBar1.Update;
       Sleep(2000);
       DTCURI:=0;
       Exit;
    end;

    RunRep:=1;
    BrCyc:=0;
    fmStForm.StatusBar1.Panels[0].Text:='Открытие таблицы ' + CurTBNL;
    fmStForm.StatusBar1.Update;
    fmStForm.StatusBar1.Panels[3].Text:='Отчет'; fmStForm.StatusBar1.Update;

    TBLOpenF:=1;
    SQLQuery:='select DATE_INSERT,TIM, '+
              'B1_1, B1_2, B1_3, B1_4, B1_5, B1_6, B1_7, B1_8, B1_9, '+
              'B1_10,B1_11,B1_12,B1_13,B1_14,B1_15,B1_16,B1_17,B1_18,B1_19,'+
              'B2_1, B2_2, B2_3, B2_4, B2_5, B2_6, B2_7, B2_8, B2_9, '+
              'B2_10,B2_11,B2_12,B2_13,B2_14,B2_15,B2_16,B2_17,B2_18,B2_19,'+
              'B3_1, B3_2, B3_3, B3_4, B3_5, B3_6, B3_7, B3_8, B3_9, '+
              'B3_10,B3_11,B3_12,B3_13,B3_14,B3_15,B3_16,B3_17,B3_18,B3_19,'+
              'B4_1, B4_2, B4_3, B4_4, B4_5, B4_6, B4_7, B4_8, B4_9, '+
              'B4_10,B4_11,B4_12,B4_13,B4_14,B4_15,B4_16,B4_17,B4_18,B4_19 '+
              'from ' + CurTBNL;
    // если найдена начальная таблица- открыть ее и определить кол-во записей
    fmPrint.IBQuery1.close;
    fmPrint.IBQuery1.SQL.Clear;
    fmPrint.IBQuery1.SQL.add(SQLQuery);
    fmPrint.IBQuery1.Open;
    fmPrint.IBQuery1.Last;
    mRecCNT:=fmPrint.IBQuery1.RecordCount;
    fmPrint.IBQuery1.First;
    TMCUR:= fmPrint.IBQuery1.FieldByName('TIM').Value;
    TMSAV:= TMCUR;

    fmStForm.StatusBar1.Panels[0].Text:='Обработка данных таблицы ['+CurTBNL+']: ';
    fmStForm.StatusBar1.Update;

    // открыть область данных отчета
    fmPrint.AK_Data.Open;
    TBLOpenF:=0;
    Sleep(100);

    with fmPrint.IBQuery1 do
    begin
      fmPrint.IBQuery1.First;
      while BrCyc=0 do
      begin

      // если нажата кнопка прервать формирования отчета- выйти
      if(BrCyc>0) then break;
      Sleep(0);

      // если таблица не открыта или если конец таблицы
      if(TFF=0) or (fmPrint.IBQuery1.Eof) then
      begin
         fmPrint.IBQuery1.Close; TFF:=0;
         // определить имя текущей обрабатываемой таблицы
         // если оно вне введенного диапазона- выйти из цикла
         if(fmPrint.GetCurTBNL=0) then break;
         // проверить есть ли заданная таблица в БД FireBird
         if fmPrint.IsTableFound(CurTBNL)>0 then begin TFF:=1;   end
         else                                    begin continue; end;
         TBLOpenF:=1;
         fmPrint.IBQuery1.Close;
         fmPrint.IBQuery1.SQL.Clear;
         fmPrint.IBQuery1.SQL.add(SQLQuery);
         fmStForm.StatusBar1.Panels[0].Text:='Открытие таблицы ' + CurTBNL;
         fmStForm.StatusBar1.Update;
         fmPrint.IBQuery1.Open;
         // определить количество записей в таблице
         fmPrint.IBQuery1.Last;
         mRecCNT:=fmPrint.IBQuery1.RecordCount;
         TBLOpenF:=0;
         //
         Sleep(100);
         if(BrCyc>0) then break;
         // если в таблице нет записей- перейти к следующей таблице
         if(mRecCNT=0) then begin TFF:=0; continue; end;
         // перейти в начало текущей открытой таблицы
         fmPrint.IBQuery1.First;
         TMCUR:= fmPrint.IBQuery1.FieldByName('TIM').Value;
      end;

      // Оределить процент обработки таблицы
      if(mRecCNT>0) then
      begin
         mRecCUR:=fmPrint.IBQuery1.RecNo;
         mRecPRC:=mRecCUR * (100 / mRecCNT);
         if(mRecCur>0) then begin
            mRecPRV:=Trunc(mRecPRC);
            fmStForm.StatusBar1.Panels[0].Text:=
            'Обработка данных таблицы ['+CurTBNL+']: '+IntToStr(mRecPRV)+'%';
         end;
         if(Frac(mRecCur/5)=0) then begin
            fmStForm.StatusBar1.Update;
         end;
      end;

      // запомнить время предыдущей записи
      TMPRV:= TMCUR;
      // запомнить время текущей записи
      TMCUR:= fmPrint.IBQuery1.FieldByName('TIM').Value;

      // если между текущей и предыдущей записью большое расхождение по времени-
      // закончить  предыдущую и не считать текущую дозировку
      if ( TMCUR > TMPRV+2 ) then begin
         {...}
      end;

      // если дата текущей таблицы данных равна начальной введенной дате и
      // если время текущей записи меньше заданного начального- перейти к следующей записи
      if(DTCURI>=DTSTARTI) and (TMSTARTI<fmPrint.IBQuery1.FieldByName('TIM').Value) then begin
         fmPrint.IBQuery1.Next; continue;
      end;
      // если дата текущей таблицы данных равна конечной введенной дате и
      // если время текущей записи больше заданного конечного- выйти из цикла
      if(DTCURI>=DTENDI) and (TMENDI<fmPrint.IBQuery1.FieldByName('TIM').Value) then begin
         break;
      end;

      //----------------------------------------------------------------------
      // Обработка данных для построения отчета:

      // если номер наряда равен нулю- пропустить эту запись (перейти к следующей)
      if(fmPrint.IBQuery1.FieldByName('B1_1' ).Value>0) then begin
         fmPrint.IBQuery1.Next; continue;
      end;

      //--------------------
      // АВТОКЛАВ 1:
      // если пришло подтверждение от оператора о вводе новых данных
      if(fmPrint.IBQuery1.FieldByName('B1_16').Value=1) and (PRV[0]<>1) then begin
         if(fmPrint.IBQuery1.FieldByName('B1_16').Value=1) then  ZNAK:='Z'
         else                                                    ZNAK:='V';
         NAUT  :=1;       // номер автоклава
         PRV[0]:=1;       // признак загрузки
         WrFlag:=1;       // флаг записи данных в таблицу отчета
      end;
      // если установлен флаг выгрузки и предыдущим  был флаг загрузки
      if(fmPrint.IBQuery1.FieldByName('B1_16').Value=2) and (PRV[0]=1) then begin
         PRV[0]:=2; TMSAV:=TMCUR;
      end;
      //--------------------
      // АВТОКЛАВ 2:
      if(fmPrint.IBQuery1.FieldByName('B2_16').Value=1) and (PRV[1]<>1) then begin
         if(fmPrint.IBQuery1.FieldByName('B2_16').Value=1) then  ZNAK:='Z'
         else                                                    ZNAK:='V';
         NAUT:=2; PRV[1]:=1; WrFlag:=1;
      end;
      if(fmPrint.IBQuery1.FieldByName('B2_16').Value=2) and (PRV[1]=1) then begin
         PRV[1]:=2; TMSAV:=TMCUR;
      end;
      //--------------------
      // АВТОКЛАВ 3:
      if(fmPrint.IBQuery1.FieldByName('B3_16').Value=1) and (PRV[2]<>1) then begin
         if(fmPrint.IBQuery1.FieldByName('B3_16').Value=1) then  ZNAK:='Z'
         else                                                    ZNAK:='V';
         NAUT:=3; PRV[2]:=1; WrFlag:=1;
      end;
      if(fmPrint.IBQuery1.FieldByName('B3_16').Value=2) and (PRV[2]=1) then begin
         PRV[2]:=2; TMSAV:=TMCUR;
      end;
      //--------------------
      // АВТОКЛАВ 4:
      if(fmPrint.IBQuery1.FieldByName('B4_16').Value=1) and (PRV[3]<>1) then begin
         if(fmPrint.IBQuery1.FieldByName('B4_16').Value=1) then  ZNAK:='Z'
         else                                                    ZNAK:='V';
         NAUT:=4; PRV[3]:=1; WrFlag:=1;
      end;
      if(fmPrint.IBQuery1.FieldByName('B4_16').Value=2) and (PRV[3]=1) then begin
         PRV[3]:=2; TMSAV:=TMCUR;
      end;
      //--------------------


      // если установлен флаг записи и это не первый проход-
      // записать данные в новую запись таблицы отчета
      if(WrFlag>0) and (FirstRun>0) then begin
         DATE_INSERT:= fmPrint.IBQuery1.FieldByName('DATE_INSERT').Value;
         NNAR       := fmPrint.IBQuery1.FieldByName('B1_1' ).Value;
         D6DE       := fmPrint.IBQuery1.FieldByName('B1_14').Value;
         D6VIII     := fmPrint.IBQuery1.FieldByName('B1_12').Value;
         D6VI       := fmPrint.IBQuery1.FieldByName('B1_13').Value;
         D6III      := fmPrint.IBQuery1.FieldByName('B1_11').Value;
         D6ZAK      := fmPrint.IBQuery1.FieldByName('B1_17').Value;
         D6NEK      := fmPrint.IBQuery1.FieldByName('B1_15').Value;
         D4DE       := fmPrint.IBQuery1.FieldByName('B1_9' ).Value;
         D4VIII     := fmPrint.IBQuery1.FieldByName('B1_7' ).Value;
         D4VI       := fmPrint.IBQuery1.FieldByName('B1_8' ).Value;
         D4III      := fmPrint.IBQuery1.FieldByName('B1_6' ).Value;
         D4ZAK      := fmPrint.IBQuery1.FieldByName('B1_18').Value;
         D4NEK      := fmPrint.IBQuery1.FieldByName('B1_10').Value;
         fmPrint.AK_Data.FieldDefs.DataSet.AppendRecord(
         [DATE_INSERT, TMCUR, NNAR, NAUT,  ZNAK,
          D6DE, D6VIII, D6VI, D6III, D6ZAK, D6NEK,
          D4DE, D4VIII, D4VI, D4III, D4ZAK, D4NEK]);
          FLIns :=1;
      end else begin
          FirstRun:=1;
      end;
      WrFlag:=0;
      //----------------------------------------------------------------------

      if(BrCyc>0) then break;
      fmPrint.IBQuery1.Next;
      end;
    end;

    if(TFF>0) then fmPrint.IBQuery1.Close;
    if(BrCyc=0) then Synchronize(AK_View);
    DTCURI:=0;
    FLIns :=0;
    RunRep:=0;
    if(BrCyc=2) then fmPrint.Close;

end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Вывод отчета по автоклавам на экран
procedure TMTHread.AK_View;
begin
    FLIns:=1;
    //------------------------------------------------------------------------
    frvariables['DateB']:=fmPrint.DateB.text;
    frvariables['DateE']:=fmPrint.DateE.text;
    frvariables['TimeB']:=timetostr(fmPrint.TimeB.time);
    frvariables['TimeE']:=timetostr(fmPrint.TimeE.time);
    if(FLIns>0) then begin
        fmPrint.AK_Data.Open;
        fmPrint.AK_Data.First;
//      if(fmPrint.RadioButton1.Checked=True) then begin
           fmPrint.fr_autokl.PrepareReport;
           fmPrint.fr_autokl.ShowPreparedReport;
//      end;
    end else begin
        fmStForm.StatusBar1.Panels[0].Text:='Нет данных за указанный период';
        fmStForm.StatusBar1.Update;
        Sleep(2000);
    end;
    fmPrint.AK_Data.Close;
    fmStForm.StatusBar1.Panels[3].Text:=''; fmStForm.StatusBar1.Update;
    //------------------------------------------------------------------------
end;
//--------------------------------------------------------------------------


end.
//--------------------------------------------------------------------------

