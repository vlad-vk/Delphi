//--------------------------------------------------------------------------
// Вывод графиков
unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeEngine, Series, ExtCtrls, TeeProcs, Chart, DbChart, Buttons,DateUtils,
  ComCtrls, StdCtrls, Mask, ToolEdit,math, DB, IBCustomDataSet, IBQuery, Printers,
  WinSpool;

type
  TfmMnemo = class(TForm)
    book: TNotebook;
    Panel01: TPanel;
    Panel02: TPanel;
    DBChart1: TDBChart;
    Series1: TFastLineSeries;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    dat: TDateEdit;
    tim: TDateTimePicker;
    SpeedButton4: TSpeedButton;
    Series2: TFastLineSeries;
    Panel03: TPanel;
    dozat_arx: TDBChart;
    Series5: TFastLineSeries;
    Series6: TFastLineSeries;
    Panel04: TPanel;
    DBChart2: TDBChart;
    Series4: TFastLineSeries;
    SpeedButton5: TSpeedButton;
    Panel05: TPanel;
    autoklav1: TDBChart;
    FastLineSeries1: TFastLineSeries;
    FastLineSeries2: TFastLineSeries;
    Panel06: TPanel;
    Panel07: TPanel;
    Panel08: TPanel;
    Series7: TFastLineSeries;
    Series8: TFastLineSeries;
    Series9: TFastLineSeries;
    Series10: TFastLineSeries;
    autoklav2: TDBChart;
    FastLineSeries3: TFastLineSeries;
    FastLineSeries4: TFastLineSeries;
    FastLineSeries9: TFastLineSeries;
    FastLineSeries10: TFastLineSeries;
    FastLineSeries11: TFastLineSeries;
    FastLineSeries12: TFastLineSeries;
    autoklav3: TDBChart;
    FastLineSeries5: TFastLineSeries;
    FastLineSeries6: TFastLineSeries;
    FastLineSeries13: TFastLineSeries;
    FastLineSeries14: TFastLineSeries;
    FastLineSeries15: TFastLineSeries;
    FastLineSeries16: TFastLineSeries;
    autoklav4: TDBChart;
    FastLineSeries7: TFastLineSeries;
    FastLineSeries8: TFastLineSeries;
    FastLineSeries17: TFastLineSeries;
    FastLineSeries18: TFastLineSeries;
    FastLineSeries19: TFastLineSeries;
    FastLineSeries20: TFastLineSeries;
    SpeedButton6: TSpeedButton;
    TNQ: TIBQuery;
    STSM2: TStaticText;
    STSM3: TStaticText;
    STPP1: TStaticText;
    STPP3: TStaticText;
    STTD1: TStaticText;
    STTD4: TStaticText;
    STTD5: TStaticText;
    STSM1: TStaticText;
    STA10: TStaticText;
    STA11: TStaticText;
    STA12: TStaticText;
    STA13: TStaticText;
    STA14: TStaticText;
    STA15: TStaticText;
    STA16: TStaticText;
    STA20: TStaticText;
    STA21: TStaticText;
    STA22: TStaticText;
    STA23: TStaticText;
    STA24: TStaticText;
    STA25: TStaticText;
    STA26: TStaticText;
    STA30: TStaticText;
    STA31: TStaticText;
    STA32: TStaticText;
    STA33: TStaticText;
    STA34: TStaticText;
    STA35: TStaticText;
    STA36: TStaticText;
    STA40: TStaticText;
    STA41: TStaticText;
    STA42: TStaticText;
    STA43: TStaticText;
    STA44: TStaticText;
    STA45: TStaticText;
    STA46: TStaticText;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    STA1D: TStaticText;
    STA2D: TStaticText;
    STA3D: TStaticText;
    STA4D: TStaticText;
    STTDD: TStaticText;
    STPPD: TStaticText;
    STSMD: TStaticText;
    SpeedButton9: TSpeedButton;
    CBSM2: TCheckBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    StaticText4: TStaticText;
    StaticText5: TStaticText;
    StaticText6: TStaticText;
    StaticText7: TStaticText;
    StaticText8: TStaticText;
    StaticText9: TStaticText;
    StaticText10: TStaticText;
    StaticText11: TStaticText;
    StaticText12: TStaticText;
    StaticText13: TStaticText;
    StaticText14: TStaticText;
    StaticText15: TStaticText;
    StaticText16: TStaticText;
    StaticText17: TStaticText;
    StaticText18: TStaticText;
    StaticText19: TStaticText;
    StaticText20: TStaticText;
    StaticText21: TStaticText;
    StaticText22: TStaticText;
    StaticText23: TStaticText;
    StaticText24: TStaticText;
    StaticText28: TStaticText;
    StaticText29: TStaticText;
    StaticText26: TStaticText;
    StaticText27: TStaticText;
    StaticText30: TStaticText;
    CBSM3: TCheckBox;
    CBPP3: TCheckBox;
    CBTD4: TCheckBox;
    CBTD5: TCheckBox;
    CBA11: TCheckBox;
    CBA12: TCheckBox;
    CBA13: TCheckBox;
    CBA14: TCheckBox;
    CBA15: TCheckBox;
    CBA16: TCheckBox;
    CBA21: TCheckBox;
    CBA22: TCheckBox;
    CBA23: TCheckBox;
    CBA24: TCheckBox;
    CBA25: TCheckBox;
    CBA26: TCheckBox;
    CBA31: TCheckBox;
    CBA32: TCheckBox;
    CBA33: TCheckBox;
    CBA34: TCheckBox;
    CBA35: TCheckBox;
    CBA36: TCheckBox;
    CBA41: TCheckBox;
    CBA42: TCheckBox;
    CBA43: TCheckBox;
    CBA44: TCheckBox;
    CBA45: TCheckBox;
    CBA46: TCheckBox;
    Panel09: TPanel;
    autoklav5: TDBChart;
    STA5D: TStaticText;
    STA51: TStaticText;
    STA52: TStaticText;
    STA53: TStaticText;
    STA54: TStaticText;
    STA55: TStaticText;
    STA56: TStaticText;
    STA50: TStaticText;
    StaticText39: TStaticText;
    StaticText40: TStaticText;
    StaticText41: TStaticText;
    StaticText42: TStaticText;
    StaticText43: TStaticText;
    StaticText44: TStaticText;
    CBA51: TCheckBox;
    CBA52: TCheckBox;
    CBA53: TCheckBox;
    CBA54: TCheckBox;
    CBA55: TCheckBox;
    CBA56: TCheckBox;
    FastLineSeries21: TFastLineSeries;
    FastLineSeries22: TFastLineSeries;
    FastLineSeries23: TFastLineSeries;
    FastLineSeries24: TFastLineSeries;
    FastLineSeries25: TFastLineSeries;
    FastLineSeries26: TFastLineSeries;
    Panel10: TPanel;
    autoklav6: TDBChart;
    STA6D: TStaticText;
    STA61: TStaticText;
    STA62: TStaticText;
    STA63: TStaticText;
    STA64: TStaticText;
    STA65: TStaticText;
    STA66: TStaticText;
    STA60: TStaticText;
    StaticText53: TStaticText;
    StaticText54: TStaticText;
    StaticText55: TStaticText;
    StaticText56: TStaticText;
    StaticText57: TStaticText;
    StaticText58: TStaticText;
    CBA61: TCheckBox;
    CBA62: TCheckBox;
    CBA63: TCheckBox;
    CBA64: TCheckBox;
    CBA65: TCheckBox;
    CBA66: TCheckBox;
    FastLineSeries27: TFastLineSeries;
    FastLineSeries28: TFastLineSeries;
    FastLineSeries29: TFastLineSeries;
    FastLineSeries30: TFastLineSeries;
    FastLineSeries31: TFastLineSeries;
    FastLineSeries32: TFastLineSeries;
    Series11: TFastLineSeries;
    Series12: TFastLineSeries;
    STTD2: TStaticText;
    STTD3: TStaticText;
    StaticText33: TStaticText;
    StaticText34: TStaticText;
    CBTD2: TCheckBox;
    CBTD3: TCheckBox;
    STTD7: TStaticText;
    STTD6: TStaticText;
    StaticText36: TStaticText;
    StaticText35: TStaticText;
    CBTD7: TCheckBox;
    CBTD6: TCheckBox;
    CBTD8: TCheckBox;
    CBTD9: TCheckBox;
    STTD9: TStaticText;
    STTD8: TStaticText;
    StaticText38: TStaticText;
    StaticText37: TStaticText;
    StaticText32: TStaticText;
    STTD10: TStaticText;
    CBTD10: TCheckBox;
    Series13: TFastLineSeries;
    Series14: TFastLineSeries;
    Series15: TFastLineSeries;
    Series16: TFastLineSeries;
    Series17: TFastLineSeries;
    Panel11: TPanel;
    DBChart11: TDBChart;
    DZ2STT: TStaticText;
    DZ2STV3: TStaticText;
    DZ2STV4: TStaticText;
    DZ2STD: TStaticText;
    DZ2ST3: TStaticText;
    DZ2ST4: TStaticText;
    DZ2CB3: TCheckBox;
    DZ2CB4: TCheckBox;
    DZ2STV1: TStaticText;
    DZ2STV2: TStaticText;
    DZ2ST1: TStaticText;
    DZ2ST2: TStaticText;
    DZ2CB1: TCheckBox;
    DZ2CB2: TCheckBox;
    DZ2STV6: TStaticText;
    DZ2STV5: TStaticText;
    DZ2ST6: TStaticText;
    DZ2ST5: TStaticText;
    DZ2CB6: TCheckBox;
    DZ2CB5: TCheckBox;
    DZ2CB7: TCheckBox;
    DZ2CB8: TCheckBox;
    DZ2STV8: TStaticText;
    DZ2STV7: TStaticText;
    DZ2ST7: TStaticText;
    DZ2ST8: TStaticText;
    DZ2ST9: TStaticText;
    DZ2STV9: TStaticText;
    DZ2CB9: TCheckBox;
    FastLineSeries33: TFastLineSeries;
    FastLineSeries34: TFastLineSeries;
    FastLineSeries35: TFastLineSeries;
    FastLineSeries36: TFastLineSeries;
    FastLineSeries37: TFastLineSeries;
    FastLineSeries38: TFastLineSeries;
    FastLineSeries39: TFastLineSeries;
    FastLineSeries40: TFastLineSeries;
    FastLineSeries41: TFastLineSeries;
    Series3: TFastLineSeries;
    Series18: TFastLineSeries;
    STM32: TStaticText;
    STM22: TStaticText;
    StaticText50: TStaticText;
    StaticText47: TStaticText;
    CBSM32: TCheckBox;
    CBSM22: TCheckBox;
    STPP4: TStaticText;
    StaticText31: TStaticText;
    CBPP4: TCheckBox;
    Series19: TFastLineSeries;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
      function GetPageNum(ATime: TTime; ASerie: integer; var AChart: TDBChart): integer;
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    function  IsTableFound(TName: string) : integer;
    procedure datChange(Sender: TObject);
    procedure timChange(Sender: TObject);
    procedure SQLSelect(Lindex : integer);
    procedure DBChartProcessRecord(Sender: TCustomDBChart; DataSet: TDataSet);
    procedure timModify;
    procedure datModify;
    procedure CheckTableFault;
    procedure DBChartClickBackground(Sender: TCustomChart;
              Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure DBChartAfterDraw(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure ClickChecked(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmMnemo    : TfmMnemo;
  a          : array[1..1800] of double; // Используем массив
  p          : integer;

implementation

uses UDM, uSHK, uPrint, vPub, ufmStForm;

{$R *.dfm}


//--------------------------------------------------------------------------
// Начальная загрузка формы
procedure TfmMnemo.FormCreate(Sender: TObject);
begin
    dat.Date:=EDateE;
    tim.Time:=ETimeE;
end;
//--------------------------------------------------------------------------
// Выход из формы (закрытие)
procedure TfmMnemo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action:=cafree;
end;
//--------------------------------------------------------------------------
// Обнуление данных формы
procedure TfmMnemo.FormDestroy(Sender: TObject);
begin
   fmMnemo:=nil;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Проверка присутствия таблицы в БД FireBird
function TfmMnemo.IsTableFound(TName: string) : integer;
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
function TfmMnemo.GetPageNum(ATime: TTime; ASerie: integer; var AChart: TDBChart): integer;
begin
    result := 1;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Вывод сообщения от отсутствии таблицы в строку статуса
procedure TfmMnemo.CheckTableFault;
begin
       fmStForm.StatusBar1.Panels[0].Text:='За введенную дату нет данных';
       fmStForm.StatusBar1.Update;   Sleep(2000);
       fmStForm.StatusBar1.Panels[0].Text:=''; fmStForm.StatusBar1.Update;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmMnemo.SQLSelect(Lindex : integer);
var
    a                     : integer;    // временная
    MinEkr                : integer;    // сколько минут на экране
    met                   : string;     // строка кол-ва выбираемых записей
    tm                    : string;     // строка времени для выборки записей
    Hour, Min, Sec, MSec  : Word;       // переменные времени
begin
     for a:=0 to PPChart do begin
         TempTIM[Lindex][a]:=StrToTime('00:00:00');
     end;
     MinEkr:=PPChart div 60;
    //------------------------------------
    // Если была нажата кнопка перехода на следующую страницу графика
    if(NextStep=1) then begin
        DeCodeTime(FrsRTime, Hour,Min,Sec,MSec);
        if (Min>=MinEkr) then begin
            Min:=Min-MinEkr;
        end else begin
            if(Hour>0) then begin Min:=Min+60-MinEkr; Hour:=Hour-1; end
            else            begin Hour:=0; Min:=0; Sec:=0; end;
        end;
        tim.Time:= EnCodeTime(Hour,Min,Sec,Sec);
    end;
    //------------------------------------
    // Если была нажата кнопка перехода на предыдущую страницу графика
    if(NextStep=2) then begin
        DeCodeTime(FrsRTime, Hour,Min,Sec,MSec);
        if (Min <60-MinEkr) then begin
            Min:=Min+MinEkr;
        end else begin
            if(Hour<23) then begin Min:=Min+MinEkr-60; Hour:=Hour+1; end
        end;
        tim.Time:= EnCodeTime(Hour,Min,Sec,Sec);
    end;
    NextStep:=0; FLGFChart:=0;
    //------------------------------------
    timModify;
    CntRChart:=0; CurRChart:=0; LstLindex:=Lindex;
    met:='first '+IntToStr(PPChart);
    tm:=chr(39)+TimeToStr(ETimeT)+chr(39);
    fmStForm.StatusBar1.Panels[0].Text:='Выполнение SQL запроса. Пожалуйста подождите...';
    fmStForm.StatusBar1.Update;
    //------------------------------------
    // Определить кол-во записей в таблице, удовлетворяющих условию запроса
    dm.IBQ_gr_tmp.Close;
    dm.IBQ_gr_tmp.sql.Clear;
    dm.IBQ_gr_tmp.sql.add(' select count(time_insert) from '+ CurTBND);
    dm.IBQ_gr_tmp.sql.add(' where time_insert > '+tm);
    dm.IBQ_gr_tmp.Open;
    HowRTable:=dm.IBQ_gr_tmp.Fields[0].Value;
    dm.IBQ_gr_tmp.Close;
    // Если нет записей, удовлетворяющих условию - посчитать все записи в таблице
    if(HowRTable=0) then begin
       dm.IBQ_gr_tmp.Close;
       dm.IBQ_gr_tmp.sql.Clear;
       dm.IBQ_gr_tmp.sql.add(' select count(time_insert) from '+ CurTBND);
       dm.IBQ_gr_tmp.Open;
       HowRTable:=dm.IBQ_gr_tmp.Fields[0].Value;
       dm.IBQ_gr_tmp.Close;
       // Определить на сколько надо "перепрыгнуть" в таблице для вывода
       // последних PPChart записей
       SkpRTable:=HowRTable-PPChart; if(SkpRTable<0) then SkpRTable:=0;
       met:='skip '+IntToStr(SkpRTable); tm:=chr(39)+'00:00:00'+chr(39);
    end;
    case Lindex of
         // график температур
         0,9: begin
              dm.IBQ_gr_tds.Close;
              dm.IBQ_gr_tds.sql.Clear;
              dm.IBQ_gr_tds.sql.add(' select '+met+' TIME_INSERT,');
              dm.IBQ_gr_tds.sql.add(' AIT101A__V,AIT102A__V,');
              dm.IBQ_gr_tds.sql.add(' AIT103A__V,AIT104A__V,AIT107A__V,AIT108A__V, ');
              dm.IBQ_gr_tds.sql.add(' AIT105A__V,AIT106A__V,AIT110A__V,');
              dm.IBQ_gr_tds.sql.add(' AIT092___V,AIT091___V,');
              dm.IBQ_gr_tds.sql.add(' AIT064___V,AIT056___V,AIT068___V,AIT069___V, ');
              dm.IBQ_gr_tds.sql.add(' AIT233___V,AIT231___V,AIT202___V ');
              dm.IBQ_gr_tds.sql.add(' from '+ CurTBND +' where time_insert > '+tm);
              dm.IBQ_gr_tds.Open;
            end;
         // дозатор сухого и мокрого
         1: begin
              dm.IBQ_gr_dsdm.close;
              dm.IBQ_gr_dsdm.sql.Clear;
              dm.IBQ_gr_dsdm.sql.add(' select '+met+' time_insert,');
              dm.IBQ_gr_dsdm.sql.add(' AIW61, AIW62, AIW218___V, AIW252___V ');
              dm.IBQ_gr_dsdm.sql.add(' from '+ CurTBND);
              dm.IBQ_gr_dsdm.sql.add(' where time_insert > '+tm);
              dm.IBQ_gr_dsdm.Open;
            end;
         // дозатор пасты
         2: begin
              dm.IBQ_gr_pp.close;
              dm.IBQ_gr_pp.sql.Clear;
              dm.IBQ_gr_pp.sql.add(' select '+met+' time_insert, ');
              dm.IBQ_gr_pp.sql.add(' AIW65, AIW216___V ');
              dm.IBQ_gr_pp.sql.add(' from '+ CurTBND);
              dm.IBQ_gr_pp.sql.add(' where time_insert > '+tm);
              dm.IBQ_gr_pp.Open;
            end;
         // график AK1
         3: begin
              dm.IBQ_gr_a1.close;
              dm.IBQ_gr_a1.sql.Clear;
              dm.IBQ_gr_a1.sql.add(' select '+met+' time_insert,A1_T, A1_F_PAR,a1_p_par,a1_t_top, a1_t_bottom, a1_h_cond');
              dm.IBQ_gr_a1.sql.add(' from '+ CurTBND);
              dm.IBQ_gr_a1.sql.add(' where time_insert > '+tm);
              dm.IBQ_gr_a1.Open;
              dm.IBQ_gr_a1.Last;
            end;
         // график AK2
         4: begin
              dm.IBQ_gr_a2.close;
              dm.IBQ_gr_a2.sql.Clear;
              dm.IBQ_gr_a2.sql.add(' select '+met+' time_insert,A2_T, A2_F_PAR,a2_p_par,a2_t_top, a2_t_bottom, a2_h_cond');
              dm.IBQ_gr_a2.sql.add(' from '+ CurTBND);
              dm.IBQ_gr_a2.sql.add(' where time_insert > '+tm);
              dm.IBQ_gr_a2.Open;
            end;
         // график AK3
         5: begin
              dm.IBQ_gr_a3.close;
              dm.IBQ_gr_a3.sql.Clear;
              dm.IBQ_gr_a3.sql.add(' select '+met+' time_insert,A3_T, A3_F_PAR,a3_p_par,a3_t_top, a3_t_bottom, a3_h_cond');
              dm.IBQ_gr_a3.sql.add(' from '+ CurTBND);
              dm.IBQ_gr_a3.sql.add(' where time_insert > '+tm);
              dm.IBQ_gr_a3.Open;
            end;
         // график AK4
         6: begin
              dm.IBQ_gr_a4.Close;
              dm.IBQ_gr_a4.sql.Clear;
              dm.IBQ_gr_a4.sql.add(' select '+met+' time_insert,A4_T, A4_F_PAR,a4_p_par,a4_t_top, a4_t_bottom, a4_h_cond');
              dm.IBQ_gr_a4.sql.add(' from '+ CurTBND);
              dm.IBQ_gr_a4.sql.add(' where time_insert > '+tm);
              dm.IBQ_gr_a4.Open;
            end;
         // график AK5
         7: begin
// ShowMessage('SQL запрос: select '+met+' fields... from '+CurTBND+' where time>'+tm);
              dm.IBQ_gr_a5.Close;
              dm.IBQ_gr_a5.sql.Clear;
              dm.IBQ_gr_a5.sql.add(' select '+met+' time_insert,A5_T, A5_F_PAR,a5_p_par,a5_t_top, a5_t_bottom, a5_h_cond');
              dm.IBQ_gr_a5.sql.add(' from '+ CurTBND);
              dm.IBQ_gr_a5.sql.add(' where time_insert > '+tm);
              dm.IBQ_gr_a5.Open;
            end;
         // график AK6
         8: begin
              dm.IBQ_gr_a6.Close;
              dm.IBQ_gr_a6.sql.Clear;
              dm.IBQ_gr_a6.sql.add(' select '+met+' time_insert,A6_T, A6_F_PAR,a6_p_par,a6_t_top, a6_t_bottom, a6_h_cond');
              dm.IBQ_gr_a6.sql.add(' from '+ CurTBND);
              dm.IBQ_gr_a6.sql.add(' where time_insert > '+tm);
              dm.IBQ_gr_a6.Open;
            end;
    end;
    fmStForm.StatusBar1.Panels[0].Text:='';
    fmStForm.StatusBar1.Update;
end;
//--------------------------------------------------------------------------
// Эта процедура выполняется при передаче данных из области данных SQL запроса
// в Chart поочередно для каждого значения каждого Series отдельно
procedure TfmMnemo.DBChartProcessRecord(Sender: TCustomDBChart; DataSet: TDataSet);
begin
  // Если это обработка первого значения в первом вызове
  if(CntRChart=0) then begin
     DataSet.Last;
     CntRChart:=DataSet.RecordCount;
     DataSet.First;
     FrsRTime :=DataSet.FieldValues['TIME_INSERT'];
     FLGFChart:=2;
     LPICnt[fmMnemo.book.PageIndex]:=CntRChart;
     LCDate[fmMnemo.book.PageIndex]:=fmMnemo.dat.Text;
  end;
  // Количество обработанных значений (не записей)
  if(CurRChart<PPChart) then begin
     TempTIM[fmMnemo.book.PageIndex][CurRChart]:=DataSet.FieldValues['TIME_INSERT'];
  end;
  CurRChart:=CurRChart+1;
  // Если это обработка последнего значения в последнем вызове
  if(CntRChart*Sender.SeriesCount=CurRChart) then begin
     LstRTime :=DataSet.FieldValues['TIME_INSERT'];
  end;
end;
//--------------------------------------------------------------------------
procedure TfmMnemo.DBChartClickBackground(Sender: TCustomChart;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
    a,c,CLen   : integer;
    xb,xe,r    : double;
    yb,ye      : double;
begin
    // если график не загружался - считать нечего
    if(LPICnt[fmMnemo.book.PageIndex]<1) then exit;
    //
    c:=Sender.SeriesCount;
    if(c<1) or (FLGFChart=0) then exit;
    if(CntRChart<PPChart) then begin
       CLen:=CntRChart
    end else begin
       CLen:=PPChart;
    end;
    xe:=Sender.Series[0].CalcXPos(0);
    xb:=Sender.Series[0].CalcXPos(CLen-1);
    yb:=Sender.ChartRect.Top;
    ye:=Sender.ChartRect.Bottom;
    r:=(xe-xb)/CLen;

    // Если кликнули мышкой на рабочем поле графика
    if(X>xb) and (X<xe) and (Y>yb) and (Y<ye) then begin
       CurChartIndex:=Trunc((xe-X)/ r);
       LLSender:=Sender;
       LLButton:=Button;
       LLShift :=Shift;
       LLX[fmMnemo.book.PageIndex]:=X;
       LLY[fmMnemo.book.PageIndex]:=Y;
       L1Y[fmMnemo.book.PageIndex]:=Trunc(yb);
       L2Y[fmMnemo.book.PageIndex]:=Trunc(ye);
       FLGFChart:=3;
    end;

    // Отображение значений временного среза в ячейках
    // Температура
    if Sender.Name='DBChart1' then begin
       // Дата таблицы графика
       fmMnemo.STTDD.Caption:=LCDate[fmMnemo.book.PageIndex];
       // Время по временному срезу графика
       fmMnemo.STTD1.Caption:=TimeToStr (TempTim[fmMnemo.book.PageIndex][CurChartIndex]);
       // Значения технологических парамметров по временному срезу графика
       fmMnemo.STTD2.Caption:=Copy(FloatToStr(Sender.Series[0].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STTD3.Caption:=Copy(FloatToStr(Sender.Series[1].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STTD4.Caption:=Copy(FloatToStr(Sender.Series[2].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STTD5.Caption:=Copy(FloatToStr(Sender.Series[3].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STTD6.Caption:=Copy(FloatToStr(Sender.Series[4].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STTD7.Caption:=Copy(FloatToStr(Sender.Series[5].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STTD8.Caption:=Copy(FloatToStr(Sender.Series[6].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STTD9.Caption:=Copy(FloatToStr(Sender.Series[7].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STTD10.Caption:=Copy(FloatToStr(Sender.Series[8].GetOriginValue(CurChartIndex)),1,5);
       // Если выключено отображение линий графика -
       // выводить пустые ячейки значений по временному срезу
       if(fmMnemo.CBTD2.Checked=False) then fmMnemo.STTD2.Caption:=' ';
       if(fmMnemo.CBTD3.Checked=False) then fmMnemo.STTD3.Caption:=' ';
       if(fmMnemo.CBTD4.Checked=False) then fmMnemo.STTD4.Caption:=' ';
       if(fmMnemo.CBTD5.Checked=False) then fmMnemo.STTD5.Caption:=' ';
       if(fmMnemo.CBTD6.Checked=False) then fmMnemo.STTD6.Caption:=' ';
       if(fmMnemo.CBTD7.Checked=False) then fmMnemo.STTD7.Caption:=' ';
       if(fmMnemo.CBTD8.Checked=False) then fmMnemo.STTD8.Caption:=' ';
       if(fmMnemo.CBTD9.Checked=False) then fmMnemo.STTD9.Caption:=' ';
       if(fmMnemo.CBTD10.Checked=False) then fmMnemo.STTD10.Caption:=' ';
    end;

    if Sender.Name='DBChart11' then begin
       // Дата таблицы графика
       fmMnemo.DZ2STD.Caption:=LCDate[fmMnemo.book.PageIndex];
       // Время по временному срезу графика
       fmMnemo.DZ2STT.Caption:=TimeToStr (TempTim[fmMnemo.book.PageIndex][CurChartIndex]);
       // Значения технологических парамметров по временному срезу графика
       fmMnemo.DZ2ST1.Caption:=Copy(FloatToStr(Sender.Series[0].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.DZ2ST2.Caption:=Copy(FloatToStr(Sender.Series[1].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.DZ2ST3.Caption:=Copy(FloatToStr(Sender.Series[2].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.DZ2ST4.Caption:=Copy(FloatToStr(Sender.Series[3].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.DZ2ST5.Caption:=Copy(FloatToStr(Sender.Series[4].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.DZ2ST6.Caption:=Copy(FloatToStr(Sender.Series[5].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.DZ2ST7.Caption:=Copy(FloatToStr(Sender.Series[6].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.DZ2ST8.Caption:=Copy(FloatToStr(Sender.Series[7].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.DZ2ST9.Caption:=Copy(FloatToStr(Sender.Series[8].GetOriginValue(CurChartIndex)),1,5);
       // Если выключено отображение линий графика -
       // выводить пустые ячейки значений по временному срезу
       if(fmMnemo.DZ2CB1.Checked=False) then fmMnemo.DZ2ST1.Caption:=' ';
       if(fmMnemo.DZ2CB2.Checked=False) then fmMnemo.DZ2ST2.Caption:=' ';
       if(fmMnemo.DZ2CB3.Checked=False) then fmMnemo.DZ2ST3.Caption:=' ';
       if(fmMnemo.DZ2CB4.Checked=False) then fmMnemo.DZ2ST4.Caption:=' ';
       if(fmMnemo.DZ2CB5.Checked=False) then fmMnemo.DZ2ST5.Caption:=' ';
       if(fmMnemo.DZ2CB6.Checked=False) then fmMnemo.DZ2ST6.Caption:=' ';
       if(fmMnemo.DZ2CB7.Checked=False) then fmMnemo.DZ2ST7.Caption:=' ';
       if(fmMnemo.DZ2CB8.Checked=False) then fmMnemo.DZ2ST8.Caption:=' ';
       if(fmMnemo.DZ2CB9.Checked=False) then fmMnemo.DZ2ST9.Caption:=' ';
    end;

    // дозаторы сухого-мокрого
    if Sender.Name='dozat_arx' then begin
       fmMnemo.STSMD.Caption:=LCDate[fmMnemo.book.PageIndex];
       fmMnemo.STSM1.Caption:=TimeToStr(TempTim[fmMnemo.book.PageIndex][CurChartIndex]);
       fmMnemo.STSM2.Caption:=Copy(FloatToStr(Sender.Series[0].GetOriginValue(CurChartIndex)),1,6);
       fmMnemo.STSM3.Caption:=Copy(FloatToStr(Sender.Series[1].GetOriginValue(CurChartIndex)),1,6);
       fmMnemo.STM22.Caption:=Copy(FloatToStr(Sender.Series[2].GetOriginValue(CurChartIndex)),1,6);
       fmMnemo.STM32.Caption:=Copy(FloatToStr(Sender.Series[3].GetOriginValue(CurChartIndex)),1,6);
       if(fmMnemo.CBSM2.Checked=False ) then fmMnemo.STSM2.Caption:=' ';
       if(fmMnemo.CBSM3.Checked=False ) then fmMnemo.STSM3.Caption:=' ';
       if(fmMnemo.CBSM22.Checked=False) then fmMnemo.STM22.Caption:=' ';
       if(fmMnemo.CBSM32.Checked=False) then fmMnemo.STM32.Caption:=' ';
    end;
    // дозатор пасты
    if Sender.Name='DBChart2' then begin
       fmMnemo.STPPD.Caption:=LCDate[fmMnemo.book.PageIndex];
       fmMnemo.STPP1.Caption:=TimeToStr (TempTim[fmMnemo.book.PageIndex][CurChartIndex]);
       fmMnemo.STPP3.Caption:=Copy(FloatToStr(Sender.Series[0].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STPP4.Caption:=Copy(FloatToStr(Sender.Series[1].GetOriginValue(CurChartIndex)),1,5);
       if(fmMnemo.CBPP3.Checked=False) then fmMnemo.STPP3.Caption:=' ';
       if(fmMnemo.CBPP4.Checked=False) then fmMnemo.STPP4.Caption:=' ';
    end;
    // АК1
    if Sender.Name='autoklav1' then begin
       fmMnemo.STA1D.Caption:=LCDate[fmMnemo.book.PageIndex];
       fmMnemo.STA10.Caption:=TimeToStr (TempTim[fmMnemo.book.PageIndex][CurChartIndex]);
       fmMnemo.STA11.Caption:=Copy(FloatToStr(Sender.Series[0].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA12.Caption:=Copy(FloatToStr(Sender.Series[1].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA13.Caption:=Copy(FloatToStr(Sender.Series[2].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA14.Caption:=Copy(FloatToStr(Sender.Series[3].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA15.Caption:=Copy(FloatToStr(Sender.Series[4].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA16.Caption:=Copy(FloatToStr(Sender.Series[5].GetOriginValue(CurChartIndex)),1,5);
       if(fmMnemo.CBA11.Checked=False) then fmMnemo.STA11.Caption:=' ';
       if(fmMnemo.CBA12.Checked=False) then fmMnemo.STA12.Caption:=' ';
       if(fmMnemo.CBA13.Checked=False) then fmMnemo.STA13.Caption:=' ';
       if(fmMnemo.CBA14.Checked=False) then fmMnemo.STA14.Caption:=' ';
       if(fmMnemo.CBA15.Checked=False) then fmMnemo.STA15.Caption:=' ';
       if(fmMnemo.CBA16.Checked=False) then fmMnemo.STA16.Caption:=' ';
    end;
    if Sender.Name='autoklav2' then begin
       fmMnemo.STA2D.Caption:=LCDate[fmMnemo.book.PageIndex];
       fmMnemo.STA20.Caption:=TimeToStr (TempTim[fmMnemo.book.PageIndex][CurChartIndex]);
       fmMnemo.STA21.Caption:=Copy(FloatToStr(Sender.Series[0].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA22.Caption:=Copy(FloatToStr(Sender.Series[1].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA23.Caption:=Copy(FloatToStr(Sender.Series[2].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA24.Caption:=Copy(FloatToStr(Sender.Series[3].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA25.Caption:=Copy(FloatToStr(Sender.Series[4].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA26.Caption:=Copy(FloatToStr(Sender.Series[5].GetOriginValue(CurChartIndex)),1,5);
       if(fmMnemo.CBA21.Checked=False) then fmMnemo.STA21.Caption:=' ';
       if(fmMnemo.CBA22.Checked=False) then fmMnemo.STA22.Caption:=' ';
       if(fmMnemo.CBA23.Checked=False) then fmMnemo.STA23.Caption:=' ';
       if(fmMnemo.CBA24.Checked=False) then fmMnemo.STA24.Caption:=' ';
       if(fmMnemo.CBA25.Checked=False) then fmMnemo.STA25.Caption:=' ';
       if(fmMnemo.CBA26.Checked=False) then fmMnemo.STA26.Caption:=' ';
    end;
    if Sender.Name='autoklav3' then begin
       fmMnemo.STA3D.Caption:=LCDate[fmMnemo.book.PageIndex];
       fmMnemo.STA30.Caption:=TimeToStr (TempTim[fmMnemo.book.PageIndex][CurChartIndex]);
       fmMnemo.STA31.Caption:=Copy(FloatToStr(Sender.Series[0].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA32.Caption:=Copy(FloatToStr(Sender.Series[1].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA33.Caption:=Copy(FloatToStr(Sender.Series[2].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA34.Caption:=Copy(FloatToStr(Sender.Series[3].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA35.Caption:=Copy(FloatToStr(Sender.Series[4].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA36.Caption:=Copy(FloatToStr(Sender.Series[5].GetOriginValue(CurChartIndex)),1,5);
       if(fmMnemo.CBA31.Checked=False) then fmMnemo.STA31.Caption:=' ';
       if(fmMnemo.CBA32.Checked=False) then fmMnemo.STA32.Caption:=' ';
       if(fmMnemo.CBA33.Checked=False) then fmMnemo.STA33.Caption:=' ';
       if(fmMnemo.CBA34.Checked=False) then fmMnemo.STA34.Caption:=' ';
       if(fmMnemo.CBA35.Checked=False) then fmMnemo.STA35.Caption:=' ';
       if(fmMnemo.CBA36.Checked=False) then fmMnemo.STA36.Caption:=' ';
    end;
    if Sender.Name='autoklav4' then begin
       fmMnemo.STA4D.Caption:=LCDate[fmMnemo.book.PageIndex];
       fmMnemo.STA40.Caption:=TimeToStr (TempTim[fmMnemo.book.PageIndex][CurChartIndex]);
       fmMnemo.STA41.Caption:=Copy(FloatToStr(Sender.Series[0].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA42.Caption:=Copy(FloatToStr(Sender.Series[1].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA43.Caption:=Copy(FloatToStr(Sender.Series[2].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA44.Caption:=Copy(FloatToStr(Sender.Series[3].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA45.Caption:=Copy(FloatToStr(Sender.Series[4].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA46.Caption:=Copy(FloatToStr(Sender.Series[5].GetOriginValue(CurChartIndex)),1,5);
       if(fmMnemo.CBA41.Checked=False) then fmMnemo.STA41.Caption:=' ';
       if(fmMnemo.CBA42.Checked=False) then fmMnemo.STA42.Caption:=' ';
       if(fmMnemo.CBA43.Checked=False) then fmMnemo.STA43.Caption:=' ';
       if(fmMnemo.CBA44.Checked=False) then fmMnemo.STA44.Caption:=' ';
       if(fmMnemo.CBA45.Checked=False) then fmMnemo.STA45.Caption:=' ';
       if(fmMnemo.CBA46.Checked=False) then fmMnemo.STA46.Caption:=' ';
    end;
    if Sender.Name='autoklav5' then begin
       fmMnemo.STA5D.Caption:=LCDate[fmMnemo.book.PageIndex];
       fmMnemo.STA50.Caption:=TimeToStr (TempTim[fmMnemo.book.PageIndex][CurChartIndex]);
       fmMnemo.STA51.Caption:=Copy(FloatToStr(Sender.Series[0].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA52.Caption:=Copy(FloatToStr(Sender.Series[1].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA53.Caption:=Copy(FloatToStr(Sender.Series[2].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA54.Caption:=Copy(FloatToStr(Sender.Series[3].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA55.Caption:=Copy(FloatToStr(Sender.Series[4].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA56.Caption:=Copy(FloatToStr(Sender.Series[5].GetOriginValue(CurChartIndex)),1,5);
       if(fmMnemo.CBA51.Checked=False) then fmMnemo.STA51.Caption:=' ';
       if(fmMnemo.CBA52.Checked=False) then fmMnemo.STA52.Caption:=' ';
       if(fmMnemo.CBA53.Checked=False) then fmMnemo.STA53.Caption:=' ';
       if(fmMnemo.CBA54.Checked=False) then fmMnemo.STA54.Caption:=' ';
       if(fmMnemo.CBA55.Checked=False) then fmMnemo.STA55.Caption:=' ';
       if(fmMnemo.CBA56.Checked=False) then fmMnemo.STA56.Caption:=' ';
    end;
    if Sender.Name='autoklav6' then begin
       fmMnemo.STA6D.Caption:=LCDate[fmMnemo.book.PageIndex];
       fmMnemo.STA60.Caption:=TimeToStr (TempTim[fmMnemo.book.PageIndex][CurChartIndex]);
       fmMnemo.STA61.Caption:=Copy(FloatToStr(Sender.Series[0].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA62.Caption:=Copy(FloatToStr(Sender.Series[1].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA63.Caption:=Copy(FloatToStr(Sender.Series[2].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA64.Caption:=Copy(FloatToStr(Sender.Series[3].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA65.Caption:=Copy(FloatToStr(Sender.Series[4].GetOriginValue(CurChartIndex)),1,5);
       fmMnemo.STA66.Caption:=Copy(FloatToStr(Sender.Series[5].GetOriginValue(CurChartIndex)),1,5);
       if(fmMnemo.CBA61.Checked=False) then fmMnemo.STA61.Caption:=' ';
       if(fmMnemo.CBA62.Checked=False) then fmMnemo.STA62.Caption:=' ';
       if(fmMnemo.CBA63.Checked=False) then fmMnemo.STA63.Caption:=' ';
       if(fmMnemo.CBA64.Checked=False) then fmMnemo.STA64.Caption:=' ';
       if(fmMnemo.CBA65.Checked=False) then fmMnemo.STA65.Caption:=' ';
       if(fmMnemo.CBA66.Checked=False) then fmMnemo.STA66.Caption:=' ';
    end;
    Sender.Foot.Text.Text:=' ';
end;
//--------------------------------------------------------------------------
// Прорисовки на поле графика после его вывода
procedure TfmMnemo.DBChartAfterDraw(Sender: TObject);
var
    X,Y  : integer;
    M    : TMouseButton;
    S    : TShiftState;
    ST1,ST2,ST3,ST4,ST5,ST6  : TStaticText;
begin
    // Вывод единиц измерения...
    // Температуры бункеров
    (Sender as TDBChart).Canvas.Font.Color:=clBlack;
//   if(fmMnemo.book.PageIndex=0) then begin
//      X:=fmMnemo.STTD2.Left+fmMnemo.STTD2.Width+5; Y:=fmMnemo.STTD2.Top+2;
//     (Sender as TDBChart).Canvas.TextOut(X,Y,'C');
//      X:=fmMnemo.STTD3.Left+fmMnemo.STTD3.Width+5; Y:=fmMnemo.STTD3.Top+2;
//     (Sender as TDBChart).Canvas.TextOut(X,Y,'C');
//   end;
    // Дозаторы сухого-мокрого
    if(fmMnemo.book.PageIndex=1) then begin
       X:=fmMnemo.STSM2.Left+fmMnemo.STSM2.Width+5; Y:=fmMnemo.STSM2.Top+2;
      (Sender as TDBChart).Canvas.TextOut(X,Y,'Кг');
       X:=fmMnemo.STSM3.Left+fmMnemo.STSM3.Width+5; Y:=fmMnemo.STSM3.Top+2;
      (Sender as TDBChart).Canvas.TextOut(X,Y,'Кг');
    end;
    // Дозаторы пудры-пасты
    if(fmMnemo.book.PageIndex=2) then begin
       X:=fmMnemo.STPP3.Left+fmMnemo.STPP3.Width+5; Y:=fmMnemo.STPP3.Top+2;
      (Sender as TDBChart).Canvas.TextOut(X,Y,'Кг');
    end;
    // Автоклавы
    if(fmMnemo.book.PageIndex>2) and (fmMnemo.book.PageIndex<9) then begin
       if(fmMnemo.book.PageIndex=3) then begin
          ST1:=fmMnemo.STA11; ST2:=fmMnemo.STA12; ST3:=fmMnemo.STA13;
          ST4:=fmMnemo.STA14; ST5:=fmMnemo.STA15; ST6:=fmMnemo.STA16;
       end;
       if(fmMnemo.book.PageIndex=4) then begin
          ST1:=fmMnemo.STA21; ST2:=fmMnemo.STA22; ST3:=fmMnemo.STA23;
          ST4:=fmMnemo.STA24; ST5:=fmMnemo.STA25; ST6:=fmMnemo.STA26;
       end;
       if(fmMnemo.book.PageIndex=5) then begin
          ST1:=fmMnemo.STA31; ST2:=fmMnemo.STA32; ST3:=fmMnemo.STA33;
          ST4:=fmMnemo.STA34; ST5:=fmMnemo.STA35; ST6:=fmMnemo.STA36;
       end;
       if(fmMnemo.book.PageIndex=6) then begin
          ST1:=fmMnemo.STA41; ST2:=fmMnemo.STA42; ST3:=fmMnemo.STA43;
          ST4:=fmMnemo.STA44; ST5:=fmMnemo.STA45; ST6:=fmMnemo.STA46;
       end;
       if(fmMnemo.book.PageIndex=7) then begin
          ST1:=fmMnemo.STA51; ST2:=fmMnemo.STA52; ST3:=fmMnemo.STA53;
          ST4:=fmMnemo.STA54; ST5:=fmMnemo.STA55; ST6:=fmMnemo.STA56;
       end;
       if(fmMnemo.book.PageIndex=8) then begin
          ST1:=fmMnemo.STA61; ST2:=fmMnemo.STA62; ST3:=fmMnemo.STA63;
          ST4:=fmMnemo.STA64; ST5:=fmMnemo.STA65; ST6:=fmMnemo.STA66;
       end;
       X:=ST1.Left+ST1.Width+5; Y:=ST1.Top+2;
      (Sender as TDBChart).Canvas.TextOut(X,Y,'C');
       X:=ST2.Left+ST2.Width+5; Y:=ST2.Top+2;
      (Sender as TDBChart).Canvas.TextOut(X,Y,'C');
       X:=ST3.Left+ST3.Width+5; Y:=ST3.Top+2;
      (Sender as TDBChart).Canvas.TextOut(X,Y,'C');
       X:=ST4.Left+ST4.Width+5; Y:=ST4.Top+2;
      (Sender as TDBChart).Canvas.TextOut(X,Y,'кг/см2');
       X:=ST5.Left+ST5.Width+5; Y:=ST5.Top+2;
      (Sender as TDBChart).Canvas.TextOut(X,Y,'м3/ч');
       X:=ST6.Left+ST6.Width+5; Y:=ST6.Top+2;
      (Sender as TDBChart).Canvas.TextOut(X,Y,'м');
    end;
    // если график не загружался срез для него не выводить
    if(LPICnt[fmMnemo.book.PageIndex]<1) then exit;
    // временной срез справа графика при первой прорисовке после загрузки
    if(FLGFChart=2) then begin
       if(LLX[fmMnemo.book.PageIndex]=0) then begin
          X:=(Sender as TCustomChart).Series[0].CalcXPos(0)-1;
          Y:=(Sender as TCustomChart).ChartRect.Top+1;
       end else begin
          // если график уже загружали- оставляем срез на месте
          X:=LLX[fmMnemo.book.PageIndex];
          Y:=LLY[fmMnemo.book.PageIndex];
       end;
       DBChartClickBackground((Sender as TCustomChart), M, S, X, Y);
    end;
    // временной срез в месте, где щелкнули мышкой
    if(FLGFChart=3) then begin
      (Sender as TDBChart).Canvas.Brush.Color:=clRed;
      (Sender as TDBChart).Canvas.Rectangle(
                           LLX[fmMnemo.book.PageIndex],
                           L1Y[fmMnemo.book.PageIndex],
                           LLX[fmMnemo.book.PageIndex]+3,
                           L2Y[fmMnemo.book.PageIndex]);
    end;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Загрузка графика за заданное время
procedure TfmMnemo.SpeedButton6Click(Sender: TObject);
begin
    if(IsTableFound(CurTBND)=0) then begin CheckTableFault; exit; end;
    case book.PageIndex of
         0: begin SQLSelect(0); end;
         1: begin SQLSelect(1); end;
         2: begin SQLSelect(2); end;
         3: begin SQLSelect(3); end;
         4: begin SQLSelect(4); end;
         5: begin SQLSelect(5); end;
         6: begin SQLSelect(6); end;
         7: begin SQLSelect(7); end;
         8: begin SQLSelect(8); end;
         9: begin SQLSelect(9); end;
    end;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Вывод графика по нажатию кнопки "ЗАГРУЗИТЬ"
procedure TfmMnemo.SpeedButton4Click(Sender: TObject);
begin
    // имя таблицы исходя из дня поиска
    fmPrint.GetCurTBND(StrToDate(dat.Text));
    if(IsTableFound(CurTBND)=0) then begin CheckTableFault; exit; end;
    SpeedButton6Click(Sender);
end;
//--------------------------------------------------------------------------
// Вывод для просмотра графика за текущую дату [Кнопка "Текщая"]
procedure TfmMnemo.SpeedButton1Click(Sender: TObject);
begin
    dat.Text:=DateToStr(Date);  fmPrint.GetCurTBND(Date);
    if(IsTableFound(CurTBND)=0) then begin exit; end;
    SpeedButton6Click(Sender);
end;
//--------------------------------------------------------------------------
// Переход на предыдущую страницу просмотра графика [Кнопка ">"]
procedure TfmMnemo.SpeedButton2Click(Sender: TObject);
begin
    if(IsTableFound(CurTBND)=0) then begin CheckTableFault; exit; end;
    NextStep:=2;
    SpeedButton6Click(Sender);
end;
//--------------------------------------------------------------------------
// Переход на следующую страницу просмотра графика [Кнопка "<"]
procedure TfmMnemo.SpeedButton3Click(Sender: TObject);
begin
    if(IsTableFound(CurTBND)=0) then begin CheckTableFault; exit; end;
    NextStep:=1;
    SpeedButton6Click(Sender);
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Задание шкалы графика
procedure TfmMnemo.SpeedButton5Click(Sender: TObject);
begin
   if not Assigned(fmShk) then begin
          fmShk:=TfmShk.Create(Application);
   end;
   fmShk.Show;
   case book.PageIndex of
        0: p:=0;
        1: p:=1;
        2: p:=2;
        3: p:=3;
        4: p:=4;
        5: p:=5;
        6: p:=6;
        7: p:=7;
        8: p:=8;
        9: p:=9;
    end;
end;
//--------------------------------------------------------------------------
// Увеличение шкалы Y графика
procedure TfmMnemo.SpeedButton7Click(Sender: TObject);
begin
    // Температуры дозаторов СМ
    if(fmMnemo.book.PageIndex=0) then begin
       if(fmMnemo.DBChart1.LeftAxis.Maximum<200) then
          fmMnemo.DBChart1.LeftAxis.Maximum:=fmMnemo.DBChart1.LeftAxis.Maximum+10;
    end;
    if(fmMnemo.book.PageIndex=9) then begin
       if(fmMnemo.DBChart11.LeftAxis.Maximum<200) then
          fmMnemo.DBChart11.LeftAxis.Maximum:=fmMnemo.DBChart11.LeftAxis.Maximum+10;
    end;
    // Вес дозатора СМ
    if(fmMnemo.book.PageIndex=1) then begin
       if(fmMnemo.dozat_arx.LeftAxis.Maximum<5000) then
          fmMnemo.dozat_arx.LeftAxis.Maximum:=fmMnemo.dozat_arx.LeftAxis.Maximum+100;
    end;
    // Вес дозатора ПП
    if(fmMnemo.book.PageIndex=2) then begin
       if(fmMnemo.DBChart2.LeftAxis.Maximum<200) then
          fmMnemo.DBChart2.LeftAxis.Maximum:=fmMnemo.DBChart2.LeftAxis.Maximum+10;
    end;
    // Автоклав 1
    if(fmMnemo.book.PageIndex=3) then begin
       if(fmMnemo.autoklav1.LeftAxis.Maximum<300) then
          fmMnemo.autoklav1.LeftAxis.Maximum:=fmMnemo.autoklav1.LeftAxis.Maximum+10;
    end;
    // Автоклав 2
    if(fmMnemo.book.PageIndex=4) then begin
       if(fmMnemo.autoklav2.LeftAxis.Maximum<300) then
          fmMnemo.autoklav2.LeftAxis.Maximum:=fmMnemo.autoklav2.LeftAxis.Maximum+10;
    end;
    // Автоклав 3
    if(fmMnemo.book.PageIndex=5) then begin
       if(fmMnemo.autoklav3.LeftAxis.Maximum<300) then
          fmMnemo.autoklav3.LeftAxis.Maximum:=fmMnemo.autoklav3.LeftAxis.Maximum+10;
    end;
    // Автоклав 4
    if(fmMnemo.book.PageIndex=6) then begin
       if(fmMnemo.autoklav4.LeftAxis.Maximum<300) then
          fmMnemo.autoklav4.LeftAxis.Maximum:=fmMnemo.autoklav4.LeftAxis.Maximum+10;
    end;
    // Автоклав 5
    if(fmMnemo.book.PageIndex=7) then begin
       if(fmMnemo.autoklav5.LeftAxis.Maximum<300) then
          fmMnemo.autoklav5.LeftAxis.Maximum:=fmMnemo.autoklav5.LeftAxis.Maximum+10;
    end;
    // Автоклав 6
    if(fmMnemo.book.PageIndex=8) then begin
       if(fmMnemo.autoklav6.LeftAxis.Maximum<300) then
          fmMnemo.autoklav6.LeftAxis.Maximum:=fmMnemo.autoklav6.LeftAxis.Maximum+10;
    end;
end;
//--------------------------------------------------------------------------
// Уменьшение шкалы Y графика
procedure TfmMnemo.SpeedButton8Click(Sender: TObject);
begin
    if(fmMnemo.book.PageIndex=0) then begin
       if(fmMnemo.DBChart1.LeftAxis.Maximum>20) then
          fmMnemo.DBChart1.LeftAxis.Maximum:=fmMnemo.DBChart1.LeftAxis.Maximum-10;
    end;
    if(fmMnemo.book.PageIndex=9) then begin
       if(fmMnemo.DBChart11.LeftAxis.Maximum>20) then
          fmMnemo.DBChart11.LeftAxis.Maximum:=fmMnemo.DBChart11.LeftAxis.Maximum-10;
    end;

    if(fmMnemo.book.PageIndex=1) then begin
       if(fmMnemo.dozat_arx.LeftAxis.Maximum>200) then
          fmMnemo.dozat_arx.LeftAxis.Maximum:=fmMnemo.dozat_arx.LeftAxis.Maximum-100;
    end;
    // Вес дозатора ПП
    if(fmMnemo.book.PageIndex=2) then begin
       if(fmMnemo.DBChart2.LeftAxis.Maximum>20) then
          fmMnemo.DBChart2.LeftAxis.Maximum:=fmMnemo.DBChart2.LeftAxis.Maximum-10;
    end;
    // Автоклав 1
    if(fmMnemo.book.PageIndex=3) then begin
       if(fmMnemo.autoklav1.LeftAxis.Maximum>20) then
          fmMnemo.autoklav1.LeftAxis.Maximum:=fmMnemo.autoklav1.LeftAxis.Maximum-10;
    end;
    // Автоклав 2
    if(fmMnemo.book.PageIndex=4) then begin
       if(fmMnemo.autoklav2.LeftAxis.Maximum>20) then
          fmMnemo.autoklav2.LeftAxis.Maximum:=fmMnemo.autoklav2.LeftAxis.Maximum-10;
    end;
    // Автоклав 3
    if(fmMnemo.book.PageIndex=5) then begin
       if(fmMnemo.autoklav3.LeftAxis.Maximum>20) then
          fmMnemo.autoklav3.LeftAxis.Maximum:=fmMnemo.autoklav3.LeftAxis.Maximum-10;
    end;
    // Автоклав 4
    if(fmMnemo.book.PageIndex=6) then begin
       if(fmMnemo.autoklav4.LeftAxis.Maximum>20) then
          fmMnemo.autoklav4.LeftAxis.Maximum:=fmMnemo.autoklav4.LeftAxis.Maximum-10;
    end;
    // Автоклав 5
    if(fmMnemo.book.PageIndex=7) then begin
       if(fmMnemo.autoklav5.LeftAxis.Maximum>20) then
          fmMnemo.autoklav5.LeftAxis.Maximum:=fmMnemo.autoklav5.LeftAxis.Maximum-10;
    end;
    // Автоклав 6
    if(fmMnemo.book.PageIndex=8) then begin
       if(fmMnemo.autoklav6.LeftAxis.Maximum>20) then
          fmMnemo.autoklav6.LeftAxis.Maximum:=fmMnemo.autoklav6.LeftAxis.Maximum-10;
    end;
end;
//--------------------------------------------------------------------------


// Установка даты и времени графика
//--------------------------------------------------------------------------
procedure TfmMnemo.datChange(Sender: TObject);
begin
  datModify;
end;
//--------------------------------------------------------------------------
procedure TfmMnemo.datModify;
begin
  EDateT:=StrToDate(dat.Text); fmPrint.CheckDate1; dat.Text:=DateToStr(EDateT);
end;
//--------------------------------------------------------------------------
procedure TfmMnemo.timChange(Sender: TObject);
begin
  timModify;
end;
//--------------------------------------------------------------------------
procedure TfmMnemo.timModify;
begin
  ETimeT:=tim.Time; fmPrint.CheckTime1; tim.Time:=ETimeT;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Печать графика (любого участка формы)
procedure TfmMnemo.SpeedButton9Click(Sender: TObject);
var
    PCTemp     : string;    // временный заголовок окна
    mCanvas    : TCanvas;
    mBitmap    : TBitmap;
    pW         : integer;   // ширина рабочей области
    pH         : integer;   // высота ...
    OffsL      : integer;   // отступ слева
    OffsR      : integer;   // отступ справа
    OffsT      : integer;   // отступ сверху
    OffsB      : integer;   // отступ снизу
    PXdpi      : integer;   // разрешение принтера в dpi (dot per inch)
    PYdpi      : integer;
    PHd        : integer;   // размер листа в пикселах по горизонтали и вертикали
    PVd        : integer;
    oX1,oY1    : integer;   // пересчитанные координаты печати
    kp         : real;      // коффициент пересчета соотношения сторон

    ADevice    : array [0..100] of Char; // установки принтера в системе
    ADriver    : array [0..100] of Char;
    APort      : array [0..100] of Char;
    AMode      : Cardinal;

    CPOrnt     : TPrinterOrientation;
    SPOrnt     : integer;

begin
    //---------------------------
    // Чтение парамметров из файла конфигурации
    OffsL:=10; OffsT:=10; OffsR:=0; OffsB:=0; SPOrnt:=0;
    PCTemp:=fmStForm.readini('pCodus.ini','Printer','OffsL');
    if(Length(PCTemp)>0) then OffsL:=StrToInt(PCTemp);
    PCTemp:=fmStForm.readini('pCodus.ini','Printer','OffsT');
    if(Length(PCTemp)>0) then OffsT:=StrToInt(PCTemp);
    PCTemp:=fmStForm.readini('pCodus.ini','Printer','OffsR');
    if(Length(PCTemp)>0) then OffsR:=StrToInt(PCTemp);
    PCTemp:=fmStForm.readini('pCodus.ini','Printer','OffsB');
    if(Length(PCTemp)>0) then OffsB:=StrToInt(PCTemp);
    PCTemp:=fmStForm.readini('pCodus.ini','Printer','Orientation');
    if(Length(PCTemp)>0) then if(PCTemp[1]<>'0') then SPOrnt:=1;
    // сохранить предыдущее название окна
    PCTemp:=PubCapt;
    //---------------------------
    // Определение парамметров принтера
    CPOrnt:=Printer.Orientation;
    Printer.GetPrinter(ADevice,ADriver,APort,AMode);
    if(Length(ADevice)=0) then begin
       SFrm.PrintCSF(PCap+'[Печать графика]','В системе не определен принтер...');
       Sleep(5000);
       SFrm.PrintCSF(PCTemp,' ');
       exit;
    end;
    Printer.SetPrinter(ADevice,ADriver,APort,AMode);
    //---------------------------
    // Определение холста
    mBitmap:=TBitmap.Create;
    mCanvas:=fmMnemo.Canvas.Create;
    mBitmap.Width :=1024;
    mBitmap.Height:=600;
    mBitmap.Canvas.CopyRect(Rect(0,0,1020,600), mCanvas, Rect(0,0,1020,600));
    //---------------------------
    // Задание расположения вывода на печать
    if(SPOrnt=0) then Printer.Orientation := poPortrait
    else              Printer.Orientation := poLandscape;
    //---------------------------
    // разрешение принтера по оси X в dpi
    PXdpi:=GetDeviceCaps(Printer.Handle,LogPixelsX);
    // разрешение принтера по оси Y в dpi
    PYdpi:=GetDeviceCaps(Printer.Handle,LogPixelsY);
    // размер листа по горизонтали (крайняя правая точка на холсте принтера)
    PHd  :=GetDeviceCaps(Printer.Handle,HorzRes);
    // размер листа по вертикали (крайняя нижняя точка на холсте принтера)
    PVd  :=GetDeviceCaps(Printer.Handle,VertRes);
    //---------------------------
    // Пересчет пропорций отображения рисунка на листе
    oX1:=round(PXdpi/25.4*OffsL);     // кол-во точек отступа слева
    oY1:=round(PYdpi/25.4*OffsT);     // кол-во точек отступа сверху
    // Если определен отступ справа- используем эту уставку:
    // определяем крайнюю правую точку рисунка на холсте принтера
    if (OffsR>0) then begin
         pW :=round(PHd-(PXdpi/25.4*OffsR));
    end else begin
         pW :=round(PHd);
    end;
    // Если определен отступ снизу- используем эту уставку:
    // определяем крайнюю нижню точку рисунка на холсте принтера
    if (OffsB>0) then begin
        pH :=round(PVd-(PYdpi/25.4*OffsB));
    end else begin
    // Если отступ снизу не определен устанавливаем
    // высоту пропорциональную длинне (1.035-коэфф соотнош экран-лист)
        kp :=pW / 1020;
        pH :=round(600*1.035*kp)+oY1;
    end;
    //---------------------------
    // Вывод на печать
    SFrm.PrintCSF(PCap+'[Печать графика]','['+ADevice+']['+ADriver+']['+APort+']');
    with Printer do begin
         Title:='pCodus_Print';
         Canvas.Font. Color:=clBlack;
         BeginDoc;
         Canvas.TextOut(1,1,DateToStr(Date)+'  '+TimeToStr(Time));
         Canvas.BrushCopy(Rect(oX1,oY1,pW,pH), mBitmap, Rect(0,0,1020,600),254);
         EndDoc;
    end;
    //---------------------------
    SFrm.PrintCSF(PCTemp,' ');
    mBitMap.Free;
    Printer.Orientation:=CPOrnt;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Проверка активных графиков (включение-выключение линий значений графиков(series))
procedure TfmMnemo.ClickChecked(Sender: TObject);
var
    p  : integer;
begin
    p:=fmMnemo.book.PageIndex;
    // Если график не загружался - переключать нечего
    if(LPICnt[p]<1) then exit;
    // Температура дозаторов
    if(p=0) then begin
       if(fmMnemo.CBTD2.Checked=False) and (fmMnemo.CBTD3.Checked=False) then
         (Sender as TCheckBox).Checked:=True;
       fmMnemo.DBChart1.Series[0].Active:=fmMnemo.CBTD2.Checked;
       fmMnemo.DBChart1.Series[1].Active:=fmMnemo.CBTD3.Checked;
       fmMnemo.DBChart1.Series[2].Active:=fmMnemo.CBTD4.Checked;
       fmMnemo.DBChart1.Series[3].Active:=fmMnemo.CBTD5.Checked;
       fmMnemo.DBChart1.Series[4].Active:=fmMnemo.CBTD6.Checked;
       fmMnemo.DBChart1.Series[5].Active:=fmMnemo.CBTD7.Checked;
       fmMnemo.DBChart1.Series[6].Active:=fmMnemo.CBTD8.Checked;
       fmMnemo.DBChart1.Series[7].Active:=fmMnemo.CBTD9.Checked;
       fmMnemo.DBChart1.Series[8].Active:=fmMnemo.CBTD10.Checked;
       DBChartClickBackground(fmMnemo.DBChart1,LLButton,LLShift,LLX[p],LLY[p]);
    end;
    if(p=9) then begin
       if(fmMnemo.CBTD2.Checked=False) and (fmMnemo.CBTD3.Checked=False) then
         (Sender as TCheckBox).Checked:=True;
       fmMnemo.DBChart11.Series[0].Active:=fmMnemo.DZ2CB1.Checked;
       fmMnemo.DBChart11.Series[1].Active:=fmMnemo.DZ2CB2.Checked;
       fmMnemo.DBChart11.Series[2].Active:=fmMnemo.DZ2CB3.Checked;
       fmMnemo.DBChart11.Series[3].Active:=fmMnemo.DZ2CB4.Checked;
       fmMnemo.DBChart11.Series[4].Active:=fmMnemo.DZ2CB5.Checked;
       fmMnemo.DBChart11.Series[5].Active:=fmMnemo.DZ2CB6.Checked;
       fmMnemo.DBChart11.Series[6].Active:=fmMnemo.DZ2CB7.Checked;
       fmMnemo.DBChart11.Series[7].Active:=fmMnemo.DZ2CB8.Checked;
       fmMnemo.DBChart11.Series[8].Active:=fmMnemo.DZ2CB9.Checked;
       DBChartClickBackground(fmMnemo.DBChart11,LLButton,LLShift,LLX[p],LLY[p]);
    end;

    // Дозатор Сухого и Мокрого
    if(p=1) then begin
       if(fmMnemo.CBSM2.Checked=False) and (fmMnemo.CBSM3.Checked=False) then
         (Sender as TCheckBox).Checked:=True;
       fmMnemo.dozat_arx.Series[0].Active:=fmMnemo.CBSM2.Checked;
       fmMnemo.dozat_arx.Series[1].Active:=fmMnemo.CBSM3.Checked;
       fmMnemo.dozat_arx.Series[2].Active:=fmMnemo.CBSM22.Checked;
       fmMnemo.dozat_arx.Series[3].Active:=fmMnemo.CBSM32.Checked;
       DBChartClickBackground(fmMnemo.dozat_arx,LLButton,LLShift,LLX[p],LLY[p]);
    end;
    // Дозатор пасты
    if(p=2) then begin
       if(fmMnemo.CBPP3.Checked=False) then
         (Sender as TCheckBox).Checked:=True;
       fmMnemo.DBChart2.Series[1].Active:=fmMnemo.CBPP3.Checked;
       fmMnemo.DBChart2.Series[2].Active:=fmMnemo.CBPP4.Checked;
       DBChartClickBackground(fmMnemo.DBChart2,LLButton,LLShift,LLX[p],LLY[p]);
    end;
    // Автоклав N1
    if(p=3) then begin
       if(fmMnemo.CBA11.Checked=False) and (fmMnemo.CBA12.Checked=False) and
         (fmMnemo.CBA13.Checked=False) and (fmMnemo.CBA14.Checked=False) and
         (fmMnemo.CBA15.Checked=False) and (fmMnemo.CBA16.Checked=False) then
         (Sender as TCheckBox).Checked:=True;
       fmMnemo.autoklav1.Series[0].Active:=fmMnemo.CBA11.Checked;
       fmMnemo.autoklav1.Series[1].Active:=fmMnemo.CBA12.Checked;
       fmMnemo.autoklav1.Series[2].Active:=fmMnemo.CBA13.Checked;
       fmMnemo.autoklav1.Series[3].Active:=fmMnemo.CBA14.Checked;
       fmMnemo.autoklav1.Series[4].Active:=fmMnemo.CBA15.Checked;
       fmMnemo.autoklav1.Series[5].Active:=fmMnemo.CBA16.Checked;
       DBChartClickBackground(fmMnemo.autoklav1,LLButton,LLShift,LLX[p],LLY[p]);
    end;
    // Автоклав N2
    if(p=4) then begin
       if(fmMnemo.CBA21.Checked=False) and (fmMnemo.CBA22.Checked=False) and
         (fmMnemo.CBA23.Checked=False) and (fmMnemo.CBA24.Checked=False) and
         (fmMnemo.CBA25.Checked=False) and (fmMnemo.CBA26.Checked=False) then
         (Sender as TCheckBox).Checked:=True;
       fmMnemo.autoklav2.Series[0].Active:=fmMnemo.CBA21.Checked;
       fmMnemo.autoklav2.Series[1].Active:=fmMnemo.CBA22.Checked;
       fmMnemo.autoklav2.Series[2].Active:=fmMnemo.CBA23.Checked;
       fmMnemo.autoklav2.Series[3].Active:=fmMnemo.CBA24.Checked;
       fmMnemo.autoklav2.Series[4].Active:=fmMnemo.CBA25.Checked;
       fmMnemo.autoklav2.Series[5].Active:=fmMnemo.CBA26.Checked;
       DBChartClickBackground(fmMnemo.autoklav2,LLButton,LLShift,LLX[p],LLY[p]);
    end;
    // Автоклав N3
    if(p=5) then begin
       if(fmMnemo.CBA31.Checked=False) and (fmMnemo.CBA32.Checked=False) and
         (fmMnemo.CBA33.Checked=False) and (fmMnemo.CBA34.Checked=False) and
         (fmMnemo.CBA35.Checked=False) and (fmMnemo.CBA36.Checked=False) then
         (Sender as TCheckBox).Checked:=True;
       fmMnemo.autoklav3.Series[0].Active:=fmMnemo.CBA31.Checked;
       fmMnemo.autoklav3.Series[1].Active:=fmMnemo.CBA32.Checked;
       fmMnemo.autoklav3.Series[2].Active:=fmMnemo.CBA33.Checked;
       fmMnemo.autoklav3.Series[3].Active:=fmMnemo.CBA34.Checked;
       fmMnemo.autoklav3.Series[4].Active:=fmMnemo.CBA35.Checked;
       fmMnemo.autoklav3.Series[5].Active:=fmMnemo.CBA36.Checked;
       DBChartClickBackground(fmMnemo.autoklav3,LLButton,LLShift,LLX[p],LLY[p]);
    end;
    // Автоклав N4
    if(p=6) then begin
       if(fmMnemo.CBA41.Checked=False) and (fmMnemo.CBA42.Checked=False) and
         (fmMnemo.CBA43.Checked=False) and (fmMnemo.CBA44.Checked=False) and
         (fmMnemo.CBA45.Checked=False) and (fmMnemo.CBA46.Checked=False) then
         (Sender as TCheckBox).Checked:=True;
       fmMnemo.autoklav4.Series[0].Active:=fmMnemo.CBA41.Checked;
       fmMnemo.autoklav4.Series[1].Active:=fmMnemo.CBA42.Checked;
       fmMnemo.autoklav4.Series[2].Active:=fmMnemo.CBA43.Checked;
       fmMnemo.autoklav4.Series[3].Active:=fmMnemo.CBA44.Checked;
       fmMnemo.autoklav4.Series[4].Active:=fmMnemo.CBA45.Checked;
       fmMnemo.autoklav4.Series[5].Active:=fmMnemo.CBA46.Checked;
       DBChartClickBackground(fmMnemo.autoklav4,LLButton,LLShift,LLX[p],LLY[p]);
    end;
    // Автоклав N5
    if(p=7) then begin
       if(fmMnemo.CBA51.Checked=False) and (fmMnemo.CBA52.Checked=False) and
         (fmMnemo.CBA53.Checked=False) and (fmMnemo.CBA54.Checked=False) and
         (fmMnemo.CBA55.Checked=False) and (fmMnemo.CBA56.Checked=False) then
         (Sender as TCheckBox).Checked:=True;
       fmMnemo.autoklav5.Series[0].Active:=fmMnemo.CBA51.Checked;
       fmMnemo.autoklav5.Series[1].Active:=fmMnemo.CBA52.Checked;
       fmMnemo.autoklav5.Series[2].Active:=fmMnemo.CBA53.Checked;
       fmMnemo.autoklav5.Series[3].Active:=fmMnemo.CBA54.Checked;
       fmMnemo.autoklav5.Series[4].Active:=fmMnemo.CBA55.Checked;
       fmMnemo.autoklav5.Series[5].Active:=fmMnemo.CBA56.Checked;
       DBChartClickBackground(fmMnemo.autoklav5,LLButton,LLShift,LLX[p],LLY[p]);
    end;
    // Автоклав N6
    if(p=8) then begin
       if(fmMnemo.CBA61.Checked=False) and (fmMnemo.CBA62.Checked=False) and
         (fmMnemo.CBA63.Checked=False) and (fmMnemo.CBA64.Checked=False) and
         (fmMnemo.CBA65.Checked=False) and (fmMnemo.CBA66.Checked=False) then
         (Sender as TCheckBox).Checked:=True;
       fmMnemo.autoklav6.Series[0].Active:=fmMnemo.CBA61.Checked;
       fmMnemo.autoklav6.Series[1].Active:=fmMnemo.CBA62.Checked;
       fmMnemo.autoklav6.Series[2].Active:=fmMnemo.CBA63.Checked;
       fmMnemo.autoklav6.Series[3].Active:=fmMnemo.CBA64.Checked;
       fmMnemo.autoklav6.Series[4].Active:=fmMnemo.CBA65.Checked;
       fmMnemo.autoklav6.Series[5].Active:=fmMnemo.CBA66.Checked;
       DBChartClickBackground(fmMnemo.autoklav6,LLButton,LLShift,LLX[p],LLY[p]);
    end;
end;
//--------------------------------------------------------------------------

end.
//--------------------------------------------------------------------------

