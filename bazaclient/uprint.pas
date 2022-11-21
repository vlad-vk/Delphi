//--------------------------------------------------------------------------
// Подготовка формирования отчета

unit uPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, Mask, ToolEdit, Math,DateUtils,
  DB, RxMemDS, IBCustomDataSet,IBQuery, fr_class ,inifiles, Gauges, FR_DSet,
  FR_DBSet, IBTable, Spin;

type
  TfmPrint = class(TForm)
    book: TNotebook;
    Panel2: TPanel;
    RepData: TRxMemoryData;
    fr_dozatp: TfrReport;
    frDBDataSet1: TfrDBDataSet;
    TNQ: TIBQuery;
    IBQuery1: TIBQuery;
    Panel1: TPanel;
    Label5: TLabel;
    Label3: TLabel;
    DateE: TDateEdit;
    DateB: TDateEdit;
    TimeB: TDateTimePicker;
    TimeE: TDateTimePicker;
    Label2: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    Label6: TLabel;
    Label7: TLabel;
    SpeedButton3: TSpeedButton;
    fr_dozats: TfrReport;
    fr_dozati: TfrReport;
    SpeedButton1: TSpeedButton;
    fr_autokl: TfrReport;
    AK_Data: TRxMemoryData;
    frDBDataSetAK: TfrDBDataSet;
    VibDZ: TSpinEdit;
    Label1: TLabel;

    procedure SpeedButton3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    function  GetCurTBNL  : integer;
    function  IsTableFound(TName: string) : integer;
    function  GetCurTBND(parCD: TDateTime): integer;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    function  StrTMToInt(STR: string) : integer;
    procedure DateBEnter(Sender: TObject);
    procedure DateEEnter(Sender: TObject);
    procedure TimeBEnter(Sender: TObject);
    procedure TimeEEnter(Sender: TObject);
    procedure CheckDate1;
    procedure CheckTime1;
    procedure CheckDate2(mode :integer);
    procedure CheckTime2(mode :integer);
    procedure VibDZChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmPrint  : TfmPrint;
  FPrn     : TfmPrint;


implementation

uses UDM, ufmStForm, uTHRead, vPub;

{$R *.dfm}

//--------------------------------------------------------------------------
// Проверка вводимой даты
procedure TfmPrint.CheckDate1;
begin
   if(EDateT<EDateB) then EDateB:=EDateT;
   EDateE:=EDateT;
end;
//--------------------------------------------------------------------------
procedure TfmPrint.CheckDate2(mode :integer);
begin
   if(mode=1) then begin
      if(EDateT>=EDateE) then EDateT:=EDateE;
      EDateB:=EDateT;
   end;
   if(mode=2) then begin
      if(EDateT<=EDateB) then EDateT:=EDateB;
      EDateE:=EDateT;
   end;
end;
//--------------------------------------------------------------------------
// Проверка вводимого времени
procedure TfmPrint.CheckTime1;
begin
   if(StrTMToInt(TimeToStr(ETimeT))<=StrTMToInt(TimeToStr(ETimeB))) then ETimeB:=ETimeT;
   ETimeE:=ETimeT;
end;
//--------------------------------------------------------------------------
procedure TfmPrint.CheckTime2(mode :integer);
begin
   if(mode=1) then begin
         ETimeB:=ETimeT;
      if(StrTMToInt(TimeToStr(EDateB)) =StrTMToInt(TimeToStr(EDateE))) and
        (StrTMToInt(TimeToStr(ETimeT))>=StrTMToInt(TimeToStr(ETimeE))) and
        (EDateB =EDateE) then begin
         ETimeB:=ETimeE; ETimeT:=ETimeE;
      end;
   end;
   if(mode=2) then begin
         ETimeE:=ETimeT;
      if(StrTMToInt(TimeToStr(EDateB)) =StrTMToInt(TimeToStr(EDateE))) and
        (StrTMToInt(TimeToStr(ETimeT))<=StrTMToInt(TimeToStr(ETimeB))) and
        (EDateB =EDateE) then begin
         ETimeE:=ETimeB; ETimeT:=ETimeB;
      end;
   end;
end;
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Преобразование строки времени в число
function TfmPrint.StrTMToInt(STR: string) : integer;
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


//--------------------------------------------------------------------------
// Проверка присутствия таблицы в БД FireBird
function TfmPrint.IsTableFound(TName: string) : integer;
var
  r: integer;
begin
  r:=0;
  TNQ.Close;
  TNQ.SQL.Clear;
  TNQ.SQL.Add('SELECT RDB$RELATION_NAME FROM RDB$RELATIONS ');
  TNQ.SQL.Add('WHERE RDB$RELATION_NAME = '+Chr(39)+TName+Chr(39));
  TNQ.Open;
  TNQ.Last;
  if(TNQ.RecordCount>0) then r:=1;
  TNQ.Close;
  result:=r;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Получить имя текущей обрабатываемой таблицы в переменную CurTBN
function TfmPrint.GetCurTBNL : integer;
var
    r           : integer;
    b,d,m       : string;
begin
    r:=0;
    d:='';
    m:='';
    // обработка введенной даты начала формирования отчета
    if (DayOf(DateB.Date)>0)  and (DayOf(DateB.Date)<10)  then
        d:='0'+ IntToStr(DayOf(DateB.Date))
    else
        d:= IntToStr(DayOf(DateB.Date));
    if (MonthOf(DateB.Date)>0) and (MonthOf(DateB.Date)<10)  then
        m:='0'+ IntToStr(MonthOf(DateB.Date))
    else
        m:= IntToStr(MonthOf(DateB.Date));
    b:=IntToStr(YearOf(DateB.Date))+m+d; DTSTARTI:=StrToInt(b);

    // обработка введенной даты окончания формирования отчета
    if (DayOf(DateE.Date)>0)  and (DayOf(DateE.Date)<10)  then
        d:='0'+ IntToStr(DayOf(DateE.Date))
    else
        d:= IntToStr(DayOf(DateE.Date));
    if (MonthOf(DateE.Date)>0) and (MonthOf(DateE.Date)<10)  then
        m:='0'+ IntToStr(MonthOf(DateE.Date))
    else
        m:= IntToStr(MonthOf(DateE.Date));
    b:=IntToStr(YearOf(DateE.Date))+m+d; DTENDI:=StrToInt(b);

    // если это первое сравнение
    if (DTCURI=0) then begin
        DTCURI:=DTSTARTI;
    // если это не первое сравнение
    end else begin
        if ((DTCURI-(DTCURI div 10000)*10000) mod 100 > 31) then begin
            if ((DTCURI div 100) mod 100) = 12 then begin
                DTCURI:=DTCURI+8869;// переход на следующий год
            end else begin
                DTCURI:=DTCURI+69;  // переход на следующий месяц
            end;
        end else begin
            DTCURI:=DTCURI+1;       // следующий день этого месяца
        end;
    end;
    if(DTCURI>=DTSTARTI) and (DTCURI<=DTENDI) then
    begin
        CurTBNL:='T' + IntToStr(DTCURI); r:=1;
    end;
    result:=r;
end;
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
// Получение имени отчета из даты, передаваемой в параметре
function  TfmPrint.GetCurTBND(parCD: TDateTime): integer;
var
    d,m         : string;
begin
    d:='';
    m:='';
    if (DayOf(parCD)>0) and (DayOf(parCD)<10)  then
          d:= '0'+ IntToStr(DayOf(parCD))
    else
          d:= IntToStr(DayOf(parCD));
    if (MonthOf(parCD)>0) and (MonthOf(parCD)<10)  then
          m:= '0'+ IntToStr(MonthOf(parCD))
    else
          m:= IntToStr(MonthOf(parCD));
    CurTBND:= 'T'+ IntToStr(YearOf(parCD))+ m + d; result:=0;
end;
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
procedure TfmPrint.FormShow(Sender: TObject);
begin
  DateB.date:=EDateB;
  DateE.date:=EDateE;
  TimeB.time:=ETimeB;
  TimeE.time:=ETimeE;
end;
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
procedure TfmPrint.SpeedButton2Click(Sender: TObject);
begin
  close;
end;
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
procedure TfmPrint.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if TBLOpenF>0 then begin BrCyc:=2; exit; end;
   while RunRep=1  do begin BrCyc:=1; Sleep(1); end;
   Action:=cafree;
end;
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
procedure TfmPrint.VibDZChange(Sender: TObject);
begin
    if(VibDZ.Value<1) then VibDZ.Value:=1;
    if(VibDZ.Value>2) then VibDZ.Value:=2;
end;
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
procedure TfmPrint.FormDestroy(Sender: TObject);
begin
   fmPrint:=nil;
end;
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
procedure TfmPrint.SpeedButton1Click(Sender: TObject);
begin
   BrCyc:=1;
end;
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
procedure TfmPrint.SpeedButton3Click(Sender: TObject);
begin
   uTHRead.TM := TMThread.Create(False);
   uTHRead.TM.FreeOnTerminate := True;
end;
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
procedure TfmPrint.DateBEnter(Sender: TObject);
begin
    EDateT:=StrToDate(DateB.Text); CheckDate2(1); DateB.Text:=DateToStr(EDateT);
end;
//--------------------------------------------------------------------------
procedure TfmPrint.DateEEnter(Sender: TObject);
begin
    EDateT:=StrToDate(DateE.Text); CheckDate2(2); DateE.Text:=DateToStr(EDateT);
end;
//--------------------------------------------------------------------------
procedure TfmPrint.TimeBEnter(Sender: TObject);
begin
    ETimeT:=TimeB.Time; CheckTime2(1); TimeB.Time:=ETimeT;
end;
//--------------------------------------------------------------------------
procedure TfmPrint.TimeEEnter(Sender: TObject);
begin
    ETimeT:=TimeE.Time; CheckTime2(2); TimeE.Time:=ETimeT;
end;
//--------------------------------------------------------------------------

end.
//--------------------------------------------------------------------------


