//--------------------------------------------------------------------------
// Отображение значений БД
unit uBD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DBCtrls, Grids, DBGrids, Buttons, ComCtrls, StdCtrls,
  Mask, ToolEdit,Math,db,DBClient, IBCustomDataSet, IBQuery;

type
  TfmBD = class(TForm)
    book_bd: TNotebook;
    DBGrid01: TDBGrid;
    Panel3: TPanel;
    DBGrid02: TDBGrid;
    Panel4: TPanel;
    DBGrid03: TDBGrid;
    Panel5: TPanel;
    DBGrid04: TDBGrid;
    DBGrid05: TDBGrid;
    DBGrid06: TDBGrid;
    DBGrid07: TDBGrid;
    DBGrid08: TDBGrid;
    TNQ: TIBQuery;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    date1: TDateEdit;
    tm: TDateTimePicker;
    DBGrid09: TDBGrid;
    DBGrid10: TDBGrid;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure DBGrid01DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton3Click(Sender: TObject);
    function  IsTableFound(TName: string) : integer;
    procedure SpeedButton4Click(Sender: TObject);
    procedure DBGrid02MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure date1Enter(Sender: TObject);
    procedure tmEnter(Sender: TObject);
    procedure SQLSelect(mode :integer);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmBD: TfmBD;

implementation

uses UDM, DateUtils, ufmStForm, uPrint, vPub;

{$R *.dfm}

//--------------------------------------------------------------------------
// Проверка присутствия таблицы в БД FireBird
function TfmBD.IsTableFound(TName: string) : integer;
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
// Закрытие формы
procedure TfmBD.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;
//--------------------------------------------------------------------------
// Освобождение памяти
procedure TfmBD.FormDestroy(Sender: TObject);
begin
  fmBD:=nil;
end;
//--------------------------------------------------------------------------
// Отображение формы
procedure TfmBD.FormShow(Sender: TObject);
begin
  tm.time:=ETimeE;
  date1.Text:=datetostr(EDateE);
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Определение SQL запроса
procedure TfmBD.SQLSelect(mode :integer);
begin
    case mode of
         // все данные (поля) из базы
         0: begin
              dm.IBQ_bd.close;
              dm.IBQ_bd.SQL.Clear;
              dm.IBQ_bd.SQL.Add('select * from '+ CurTBND);
              dm.IBQ_bd.open;
              dm.IBQ_bd.last;
            end;
         // дозатор сухого
         1: begin
              dm.IBQ_bd.close;
              dm.IBQ_bd.SQL.Clear;
              dm.IBQ_bd.SQL.Add('select  TIM,AIW62, DOL22,DIS22,DOM22,');
              dm.IBQ_bd.SQL.Add('DOL23,DIS23,DOM23, DOL62V  from '+ CurTBND);
              dm.IBQ_bd.open;
              dm.IBQ_bd.last;
            end;
         // дозатор мокрого
         2: begin
              dm.IBQ_bd.close;
              dm.IBQ_bd.SQL.Clear;
              dm.IBQ_bd.SQL.Add('select TIM,AIW61,DIS81____V,DIS82____V,DIS83____V,');
              dm.IBQ_bd.SQL.Add('DOL15V,DOM15V,DOL13,DOM13,DOL61 from '+ CurTBND);
              dm.IBQ_bd.open;
              dm.IBQ_bd.last;
            end;
         // дозатор ал суспензии
         3: begin
              dm.IBQ_bd.close;
              dm.IBQ_bd.SQL.Clear;
              dm.IBQ_bd.SQL.Add('select TIM,AIW65,DIS84____V,DIS85____V,');
              dm.IBQ_bd.SQL.Add('DIS86____V,DIS87____V,DIS88____V from '+ CurTBND);
              dm.IBQ_bd.open;
              dm.IBQ_bd.last;
            end;
         // АК1
         4: begin
              dm.IBQ_bd_a1.close;
              dm.IBQ_bd_a1.SQL.Clear;
              dm.IBQ_bd_a1.SQL.Add('select TIM, a1_f_par, a1_p_par,   a1_t, a1_t_top,   a1_t_bottom, a1_h_cond, ');
              dm.IBQ_bd_a1.SQL.Add('a1_klp_cond_out, a1_klp_par_in,   a1_klp_par_out, ');
              dm.IBQ_bd_a1.SQL.Add('a1_st_vacuum_in, a1_st_gp_in,     a1_st_perep_in,   a1_st_par_in,   ');
              dm.IBQ_bd_a1.SQL.Add('a1_st_par_out,   a1_st_perep_out, a1_st_atmp_out,   a1_st_cond_out, ');
              dm.IBQ_bd_a1.SQL.Add('a1_st_clamp1,    a1_st_lid1,      a1_s_sbp1_locked, a1_st_bayonet1, ');
              dm.IBQ_bd_a1.SQL.Add('a1_st_clamp2,    a1_st_lid2,      a1_s_sbp2_locked, a1_st_bayonet2  ');
              dm.IBQ_bd_a1.SQL.Add('from '+ CurTBND);
              dm.IBQ_bd_a1.open;
              dm.IBQ_bd_a1.last;
            end;
         // АК2
         5: begin
              dm.IBQ_bd_a2.close;
              dm.IBQ_bd_a2.SQL.Clear;
              dm.IBQ_bd_a2.SQL.Add('select TIM, a2_f_par, a2_p_par,   a2_t, a2_t_top,   a2_t_bottom, a2_h_cond, ');
              dm.IBQ_bd_a2.SQL.Add('a2_klp_cond_out, a2_klp_par_in,   a2_klp_par_out, ');
              dm.IBQ_bd_a2.SQL.Add('a2_st_vacuum_in, a2_st_gp_in,     a2_st_perep_in,   a2_st_par_in,   ');
              dm.IBQ_bd_a2.SQL.Add('a2_st_par_out,   a2_st_perep_out, a2_st_atmp_out,   a2_st_cond_out, ');
              dm.IBQ_bd_a2.SQL.Add('a2_st_clamp1,    a2_st_lid1,      a2_s_sbp1_locked, a2_st_bayonet1, ');
              dm.IBQ_bd_a2.SQL.Add('a2_st_clamp2,    a2_st_lid2,      a2_s_sbp2_locked, a2_st_bayonet2  ');
              dm.IBQ_bd_a2.SQL.Add('from '+ CurTBND);
              dm.IBQ_bd_a2.open;
              dm.IBQ_bd_a2.last;
            end;
         // АК3
         6: begin
              dm.IBQ_bd_a3.close;
              dm.IBQ_bd_a3.SQL.Clear;
              dm.IBQ_bd_a3.SQL.Add('select TIM, a3_f_par, a3_p_par,   a3_t, a3_t_top,   a3_t_bottom, a3_h_cond, ');
              dm.IBQ_bd_a3.SQL.Add('a3_klp_cond_out, a3_klp_par_in,   a3_klp_par_out, ');
              dm.IBQ_bd_a3.SQL.Add('a3_st_vacuum_in, a3_st_gp_in,     a3_st_perep_in,   a3_st_par_in,   ');
              dm.IBQ_bd_a3.SQL.Add('a3_st_par_out,   a3_st_perep_out, a3_st_atmp_out,   a3_st_cond_out, ');
              dm.IBQ_bd_a3.SQL.Add('a3_st_clamp1,    a3_st_lid1,      a3_s_sbp1_locked, a3_st_bayonet1  ');
              dm.IBQ_bd_a3.SQL.Add('from '+ CurTBND);
              dm.IBQ_bd_a3.open;
              dm.IBQ_bd_a3.last;
            end;
         // АК4
         7: begin
              dm.IBQ_bd_a4.close;
              dm.IBQ_bd_a4.SQL.Clear;
              dm.IBQ_bd_a4.SQL.Add('select TIM, a4_f_par, a4_p_par, a4_t, a4_t_top, a4_t_bottom, a4_h_cond, ');
              dm.IBQ_bd_a4.SQL.Add('a4_klp_cond_out, a4_klp_par_in, a4_klp_par_out, ');
              dm.IBQ_bd_a4.SQL.Add('a4_st_vacuum_in, a4_st_gp_in,   a4_st_perep_in, a4_st_par_in,   ');
              dm.IBQ_bd_a4.SQL.Add('a4_st_par_out, a4_st_perep_out, a4_st_atmp_out, a4_st_cond_out, ');
              dm.IBQ_bd_a4.SQL.Add('a4_st_clamp1,  a4_st_lid1,      a4_s_sbp1_locked, a4_st_bayonet1  ');
              dm.IBQ_bd_a4.SQL.Add('from '+ CurTBND);
              dm.IBQ_bd_a4.open;
              dm.IBQ_bd_a4.last;
            end;
         // АК5
         8: begin
              dm.IBQ_bd_a5.close;
              dm.IBQ_bd_a5.SQL.Clear;
              dm.IBQ_bd_a5.SQL.Add('select TIM, a5_f_par, a5_p_par, a5_t, a5_t_top, a5_t_bottom, a5_h_cond, ');
              dm.IBQ_bd_a5.SQL.Add('a5_klp_cond_out, a5_klp_par_in, a5_klp_par_out, ');
              dm.IBQ_bd_a5.SQL.Add('a5_st_vacuum_in, a5_st_gp_in,   a5_st_perep_in,   a5_st_par_in,   ');
              dm.IBQ_bd_a5.SQL.Add('a5_st_par_out, a5_st_perep_out, a5_st_atmp_out,   a5_st_cond_out, ');
              dm.IBQ_bd_a5.SQL.Add('a5_st_clamp1,  a5_st_lid1,      a5_s_sbp1_locked, a5_st_bayonet1  ');
              dm.IBQ_bd_a5.SQL.Add('from '+ CurTBND);
              dm.IBQ_bd_a5.open;
              dm.IBQ_bd_a5.last;
            end;
         // АК6
         9: begin
              dm.IBQ_bd_a6.close;
              dm.IBQ_bd_a6.SQL.Clear;
              dm.IBQ_bd_a6.SQL.Add('select TIM, a6_f_par, a6_p_par, a6_t, a6_t_top, a6_t_bottom, a6_h_cond, ');
              dm.IBQ_bd_a6.SQL.Add('a6_klp_cond_out, a6_klp_par_in, a6_klp_par_out, ');
              dm.IBQ_bd_a6.SQL.Add('a6_st_vacuum_in, a6_st_gp_in,   a6_st_perep_in,   a6_st_par_in,   ');
              dm.IBQ_bd_a6.SQL.Add('a6_st_par_out, a6_st_perep_out, a6_st_atmp_out,   a6_st_cond_out, ');
              dm.IBQ_bd_a6.SQL.Add('a6_st_clamp1,  a6_st_lid1,      a6_s_sbp1_locked, a6_st_bayonet1  ');
              dm.IBQ_bd_a6.SQL.Add('from '+ CurTBND);
              dm.IBQ_bd_a6.open;
              dm.IBQ_bd_a6.last;
            end;
    end;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Запрос данных за текущую дату [Кнопка "Текщая"]
procedure TfmBD.SpeedButton1Click(Sender: TObject);
begin
    // получение имени таблицы и проверка ее присутствия в БД
    fmPrint.GetCurTBND(Date1.date);
    if(IsTableFound(CurTBND)=0) then begin exit; end;
    case book_bd.PageIndex of
         // вся база
         0: begin SQLSelect(0); end;
         // сухого
         1: begin SQLSelect(1); end;
         // мокрого
         2: begin SQLSelect(2); end;
         // паста
         3: begin SQLSelect(3); end;
         // автоклав1
         4: begin SQLSelect(4); end;
         // автоклав2
         5: begin SQLSelect(5); end;
         // автоклав3
         6: begin SQLSelect(6); end;
         // автоклав4
         7: begin SQLSelect(7); end;
         // автоклав5
         8: begin SQLSelect(8); end;
         // автоклав6
         9: begin SQLSelect(9); end;
    end;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Запрос данных при переходе на предыдущую страницу просмотра [Кнопка ">"]
procedure TfmBD.SpeedButton2Click(Sender: TObject);
begin
    fmStForm.DBGridNOVisible;
    if not Assigned(fmBD) then begin fmBD:=TfmBD.Create(Application); end;
    dm.IBQ_bd.Close;
    fmBD.FormActivate(fmBD); fmBD.Show;
    // получение имени таблицы и проверка ее присутствия в БД
    fmPrint.GetCurTBND(Date1.date);
    if(IsTableFound(CurTBND)=0) then begin exit; end;
    fmStForm.StatusBar1.Panels[0].Text:='Выполнение SQL запроса. Пожалуйста подождите...';
    fmStForm.StatusBar1.Update;
    // SQL запрос для вывода данных в таблицу просмотра
    case book_bd.PageIndex of
         // все
         0: begin SQLSelect(0); end;
         // сухого
         1: begin SQLSelect(1); end;
         // мокрого
         2: begin SQLSelect(2); end;
         // паста
         3: begin SQLSelect(3); end;
         // автоклав1
         4: begin SQLSelect(4); end;
         // автоклав2
         5: begin SQLSelect(5); end;
         // автоклав3
         6: begin SQLSelect(6); end;
         // автоклав4
         7: begin SQLSelect(7); end;
         // автоклав5
         8: begin SQLSelect(8); end;
         // автоклав6
         9: begin SQLSelect(9); end;
    end;
    fmStForm.StatusBar1.Panels[0].Text:='';
    fmStForm.StatusBar1.Update;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Активация формы вывода таблиц
procedure TfmBD.FormActivate(Sender: TObject);
begin
    (Sender as TfmBD).DBGrid01.Visible:=True; (Sender as TfmBD).DBGrid01.Enabled:=True;
    (Sender as TfmBD).DBGrid02.Visible:=True; (Sender as TfmBD).DBGrid02.Enabled:=True;
    (Sender as TfmBD).DBGrid03.Visible:=True; (Sender as TfmBD).DBGrid03.Enabled:=True;
    (Sender as TfmBD).DBGrid04.Visible:=True; (Sender as TfmBD).DBGrid04.Enabled:=True;
    (Sender as TfmBD).DBGrid05.Visible:=True; (Sender as TfmBD).DBGrid05.Enabled:=True;
    (Sender as TfmBD).DBGrid06.Visible:=True; (Sender as TfmBD).DBGrid06.Enabled:=True;
    (Sender as TfmBD).DBGrid07.Visible:=True; (Sender as TfmBD).DBGrid07.Enabled:=True;
    (Sender as TfmBD).DBGrid08.Visible:=True; (Sender as TfmBD).DBGrid08.Enabled:=True;
    (Sender as TfmBD).DBGrid09.Visible:=True; (Sender as TfmBD).DBGrid09.Enabled:=True;
    (Sender as TfmBD).DBGrid10.Visible:=True; (Sender as TfmBD).DBGrid10.Enabled:=True;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Вывод ячеек таблицы БД на экран
procedure TfmBD.DBGrid01DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
type
     TG=TDBGrid;
var
     a,i,l,h : integer;
     c       : array [1..40] of char;
     s       : string;
begin
     PubSender:=Sender;
     if((Sender as TG).Visible=False) then (Sender as TG).Visible:=True;

     // названия заголовков (полей таблиц)
     if(FLGTitle <1) then begin
        fmStForm.StatusBar1.Panels[0].Text:='Загрузка таблицы БД. Пожалуйста подождите...';
        fmStForm.StatusBar1.Update;
        h:=(Sender as TG).FieldCount-1;

        for a:=0 to h do
        begin
          FLGTitle:=FLGTitle+1;
          i:=(Sender as TG).Fields [a].Index;
          if(h<1) or (i<0) or (i>h) then begin exit; end;

          s:=(Sender as TG).Fields [i].FieldName;
          l:=Length(s); if(l<=0) then begin continue; end;
          CopyMemory(@c, @(Sender as TG).Fields [i].Name, l);

          if(s='TIM'     ) then
            (Sender as TG).Columns[i].Title.Caption:='Время';
          if(s='AIW61'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Вес дозатора';
          if(s='AIW62'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Вес дозатора';
          if(s='AIW65'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Вес дз.пасты';
          if(s='DIH01'   ) then
            (Sender as TG).Columns[i].Title.Caption:='ВУ сб.об.шлама';
          if(s='DIS02'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Ст.меш.об.шлама';
          if(s='DIR02'   ) then
            (Sender as TG).Columns[i].Title.Caption:='РА сб.об.шлама';
          if(s='DIH03'   ) then
            (Sender as TG).Columns[i].Title.Caption:='ВУ пн.нас.об.шлама';
          if(s='DIR03'   ) then
            (Sender as TG).Columns[i].Title.Caption:='РА пн.нас.об.шлама';
          if(s='DIS05'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Ст.меш. ШБ2';
          if(s='DIH06'   ) then
            (Sender as TG).Columns[i].Title.Caption:='ВУ пн.нас. ШБ2';
          if(s='DIR06'   ) then
            (Sender as TG).Columns[i].Title.Caption:='РА пн.нас. ШБ2';
          if(s='DIS08'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Ст.меш. ШБ3';
          if(s='DIH09'   ) then
            (Sender as TG).Columns[i].Title.Caption:='ВУ пн.нас. ШБ3';
          if(s='DIR09'   ) then
            (Sender as TG).Columns[i].Title.Caption:='РА пн.нас. ШБ3';
          if(s='DIS11'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Ст.меш. ШБ4';
          if(s='DIH13'   ) then
            (Sender as TG).Columns[i].Title.Caption:='ВУ бунк.об.шлама';
          if(s='DIM13'   ) then
            (Sender as TG).Columns[i].Title.Caption:='СУ бунк.об.шлама';
          if(s='DIS14'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Ст.меш.об.шлама';
          if(s='DIR14'   ) then
            (Sender as TG).Columns[i].Title.Caption:='РА бунк.об.шлама';
          if(s='DIH15'   ) then
            (Sender as TG).Columns[i].Title.Caption:='ВУ бунк.шлама';
          if(s='DIM15'   ) then
            (Sender as TG).Columns[i].Title.Caption:='СУ бунк.шлама';
          if(s='DIS16'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Ст.меш.бунк.шлам';
          if(s='DIR16'   ) then
            (Sender as TG).Columns[i].Title.Caption:='РА бунк.шлама';
          if(s='DIH20'   ) then
            (Sender as TG).Columns[i].Title.Caption:='ВУ сбор.цемент';
          if(s='DIL20'   ) then
            (Sender as TG).Columns[i].Title.Caption:='НУ сбор.цемент';
          if(s='DIH21'   ) then
            (Sender as TG).Columns[i].Title.Caption:='ВУ сбор.вяжущ';
          if(s='DIL21'   ) then
            (Sender as TG).Columns[i].Title.Caption:='НУ сбор.вяжущ';
          if(s='DIS22'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Ст.шнек.цемент';
          if(s='DIR22'   ) then
            (Sender as TG).Columns[i].Title.Caption:='РА шнек.цемент';
          if(s='DIS23'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Ст.шнек.вяжущ';
          if(s='DIR23'   ) then
            (Sender as TG).Columns[i].Title.Caption:='РА шнек.вяжущ';
          if(s='DIS24'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Ст.вибр.цемент';
          if(s='DIS25'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Ст.вибр.вяжущ';
          if(s='DIS26'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Cт.вибр.выгруз';
          if(s='DIH35'   ) then
            (Sender as TG).Columns[i].Title.Caption:='ВУ меш.ал.сусп';
          if(s='DIL35'   ) then
            (Sender as TG).Columns[i].Title.Caption:='НУ меш.ал.сусп';
          if(s='DIS28_1' ) then
            (Sender as TG).Columns[i].Title.Caption:='Ст.кл.выг.ВГБМ';
          if(s='DOL13'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл1 загр.об.шлама ДМ';
          if(s='DOM13'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл2 загр.об.шлама ДМ';
          if(s='DOL61'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл.выгр. ДМ';
          if(s='DOL22'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл.цемент.на шнек';
          if(s='DOM22'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл.цемент.со шнек';
          if(s='DON22'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Шнек цемента ДС';
          if(s='DOL23'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл.вяжущ.на шнек';
          if(s='DOM23'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл.вяжущ.со шнек';
          if(s='DON23'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Шнек вяжущ. ДС';
          if(s='DOM32'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл.ПАВ в меш.сусп';
          if(s='DOL35'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл.води в меш.сусп';
          if(s='DOM35'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл.выгр.ал.суспенз';
          if(s='DIS87____V'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл.пасты ГРУБО';
          if(s='DIS86____V'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл.пасты ТОЧНО';
          if(s='DIS88____V'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл.выгр.доз.пасты';
          if(s='DIS83____V'   ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл.загр.воды ДМ';
          if(s='DOL15V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл1 загр.шлама ДМ';
          if(s='DOM15V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл2 загр.шлама ДМ';
          if(s='DOL62V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Кл.выгруз. ДС';
          if(s='AIT103A__V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Темп шлама';
          if(s='AIT104A__V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Темп обр шлама';
          if(s='AIT101A__V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Темп гор воды';
          if(s='AIT102A__V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Темп хол воды';
          if(s='AIT105A__V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Темп в бункере цем';
          if(s='AIT106A__V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Темп в бункере вяж';
          if(s='AIT107A__V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Темп в мешалке пасты1';
          if(s='AIT108A__V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Темп в мешалке пасты2';
          if(s='DIS81____V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Клапан гор воды';
          if(s='DIS82____V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Клапан хол воды';
          if(s='DIS83____V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Клапан подачи воды';
          if(s='DIS84____V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Клапан пасты меш1 ГРУБО';
          if(s='DIS85____V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Клапан пасты меш1 ТОЧНО';
          if(s='DIS86____V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Клапан пасты меш2 ГРУБО';
          if(s='DIS87____V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Клапан пасты меш2 ТОЧНО';
          if(s='DIS88____V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Клапан выгруз ал суспенз';
          if(s='DIS89____V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Сост меш1 пасты';
          if(s='DIS90____V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Сост меш2 пасты';
          if(s='DIR90____V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Режим М/Д меш пасты';
          if(s='DIV89____V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Готовность меш1';
          if(s='DIV90____V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Готовность меш2';
          if(s='DIV89____R'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Выбор мешалки 1';
          if(s='DIV90____R'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Выбор мешалки 2';
          if(s='AIT110A__V'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Темп в вибромеш';
          if(s='PsV'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Плотность шлама';
          if(s='PoV'  ) then
            (Sender as TG).Columns[i].Title.Caption:='Плотность обр шлама';

          if(c[3]='_') and (c[4]='F') then begin
             (Sender as TG).Columns[i].Title.Caption:='Расход пара';
          end;

          if(c[3]='_') and (c[4]='P') then begin
             (Sender as TG).Columns[i].Title.Caption:='Давление пара';
          end;

          if(c[3]='_') and (c[4]='T') then begin
             (Sender as TG).Columns[i].Title.Caption:='Т автоклава';
             if(c[6]='T') then
                (Sender as TG).Columns[i].Title.Caption:='Т верхняя';
             if(c[6]='B') then
                (Sender as TG).Columns[i].Title.Caption:='Т нижняя';
          end;

          if(c[3]='_') and (c[4]='H') then begin
             (Sender as TG).Columns[i].Title.Caption:='Уров.конденсат';
          end;

          if(c[3]='_') and (c[4]='K') then begin
             (Sender as TG).Columns[i].Title.Caption:='% откр.клапана';
          end;

        end;

        fmStForm.StatusBar1.Panels[0].Text:='Таблица БД загружена для просмотра.';
        fmStForm.StatusBar1.Update;
     end;

     // Цвет надписей заголовка
     (Sender as TG).TitleFont.Color:=clPurple;
     // Цвет фона ячеек - белый
     (Sender as TG).Canvas.Brush.Color:=clWhite;
     (Sender as TG).Canvas.Font.Color :=clBlack;
     // Время записей
     if(Column.FieldName='TIM') then (Sender as TG).Canvas.Font.Color:=clBlue;
     // Вес дозаторов
     if (Column.FieldName[1]='A' ) and (Column.FieldName[2]='I') then begin
        (Sender as TG).Canvas.Font.Color:=clMaroon;
     end;
     // Клапана дозировки
     if (Column.FieldName[1]='D' ) and
       ((Column.FieldName[2]='I' ) or  (Column.FieldName[2]='O')) then begin
         if(Column.Field.Value>0) then begin
           (Sender as TG).Canvas.Brush.Color:=clMoneyGreen;
           (Sender as TG).Canvas.Font.Color :=clRed;
         end else begin
           (Sender as TG).Canvas.Font.Color :=clSilver;
         end;
     end;
     // Расход пара на автоклавы
     if (Column.FieldName[3]='_')  and (Column.FieldName[4]='F') then begin
        (Sender as TG).Canvas.Font.Color:=clTeal;
     end;
     // Давление пара в автоклавах
     if (Column.FieldName[3]='_')  and (Column.FieldName[4]='P') then begin
        (Sender as TG).Canvas.Font.Color:=clFuchsia;
     end;
     // Температура в автоклавах
     if (Column.FieldName[3]='_')  and (Column.FieldName[4]='T') then begin
        (Sender as TG).Canvas.Font.Color:=clRed;
     end;
     // Уровень конденсата
     if (Column.FieldName[3]='_')  and (Column.FieldName[4]='H') then begin
        (Sender as TG).Canvas.Font.Color:=clGreen;
     end;
     // Процент открытия клапанов автоклавов
     if (Column.FieldName[3]='_')  and (Column.FieldName[4]='K') then begin
        (Sender as TG).Canvas.Font.Color:=clOlive;
     end;
     // Состояние клапанов автоклавов
     if (Column.FieldName[3]='_')  and (Column.FieldName[4]='S') then begin
        (Sender as TG).Canvas.Font.Color :=clSilver;
        if(Column.Field.Value=1) then (Sender as TG).Canvas.Brush.Color:=rgb(250,200,200);
        if(Column.Field.Value=0) then (Sender as TG).Canvas.Brush.Color:=rgb(200,250,200);
        if(Column.Field.Value=2) then (Sender as TG).Canvas.Brush.Color:=rgb(255,245,130);
     end;
     (Sender as TG).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Переход в БД на введенное время
procedure TfmBD.SpeedButton3Click(Sender: TObject);
var
  b    : boolean;
  i    : integer;
  p    : integer;
begin
  p:=  book_bd.PageIndex;
  case p of
  // все
  0: begin
     i:=fmPrint.StrTMToInt(timetostr(tm.time));
     b:=dm.IBQ_bd.Locate('tim',VarArrayOf([i]),[loPartialKey]);
  end;
  // сухого
  1: begin
     i:=fmPrint.StrTMToInt(timetostr(tm.time));
     b:=dm.IBQ_bd.Locate('tim',VarArrayOf([i]),[loPartialKey]);
  end;
  // мокрого
  2: begin
     i:=fmPrint.StrTMToInt(timetostr(tm.time));
     b:=dm.IBQ_bd.Locate('tim',VarArrayOf([i]),[loPartialKey]);
  end;
  // паста
  3: begin
     i:=fmPrint.StrTMToInt(timetostr(tm.time));
     dm.IBQ_bd.Locate('tim',VarArrayOf([i]),[loPartialKey]);
  end;
  // автоклав1
  4: begin
     i:=fmPrint.StrTMToInt(timetostr(tm.time));
     dm.IBQ_bd_a1.Locate('TIM',VarArrayOf([i]),[loPartialKey]);
  end;
  // автоклав2
  5: begin
     i:=fmPrint.StrTMToInt(timetostr(tm.time));
     dm.IBQ_bd_a2.Locate('tim',VarArrayOf([i]),[loPartialKey]);
  end;
  // автоклав3
  6: begin
     i:=fmPrint.StrTMToInt(timetostr(tm.time));
     dm.IBQ_bd_a3.Locate('tim',VarArrayOf([i]),[loPartialKey]);
  end;
  // автоклав4
  7: begin
     i:=fmPrint.StrTMToInt(timetostr(tm.time));
     dm.IBQ_bd_a4.Locate('tim',VarArrayOf([i]),[loPartialKey]);
  end;
  // автоклав5
  8: begin
     i:=fmPrint.StrTMToInt(timetostr(tm.time));
     dm.IBQ_bd_a5.Locate('tim',VarArrayOf([i]),[loPartialKey]);
  end;
  // автоклав6
  9: begin
     i:=fmPrint.StrTMToInt(timetostr(tm.time));
     dm.IBQ_bd_a6.Locate('tim',VarArrayOf([i]),[loPartialKey]);
  end;
  end;
  if(p<4) then begin
     if(b=False) and (dm.IBQ_bd.FieldValues['TIM']>i) then dm.IBQ_bd.First;
     if(b=False) and (dm.IBQ_bd.FieldValues['TIM']<i) then dm.IBQ_bd.Last;
  end;
  if(p=4) then begin
     if(b=False) and (dm.IBQ_bd_a1.FieldValues['TIM']>i) then dm.IBQ_bd_a1.First;
     if(b=False) and (dm.IBQ_bd_a1.FieldValues['TIM']<i) then dm.IBQ_bd_a1.Last;
  end;
  if(p=5) then begin
     if(b=False) and (dm.IBQ_bd_a2.FieldValues['TIM']>i) then dm.IBQ_bd_a2.First;
     if(b=False) and (dm.IBQ_bd_a2.FieldValues['TIM']<i) then dm.IBQ_bd_a2.Last;
  end;
  if(p=6) then begin
     if(b=False) and (dm.IBQ_bd_a3.FieldValues['TIM']>i) then dm.IBQ_bd_a3.First;
     if(b=False) and (dm.IBQ_bd_a3.FieldValues['TIM']<i) then dm.IBQ_bd_a3.Last;
  end;
  if(p=7) then begin
     if(b=False) and (dm.IBQ_bd_a4.FieldValues['TIM']>i) then dm.IBQ_bd_a4.First;
     if(b=False) and (dm.IBQ_bd_a4.FieldValues['TIM']<i) then dm.IBQ_bd_a4.Last;
  end;
  if(p=8) then begin
     if(b=False) and (dm.IBQ_bd_a5.FieldValues['TIM']>i) then dm.IBQ_bd_a5.First;
     if(b=False) and (dm.IBQ_bd_a5.FieldValues['TIM']<i) then dm.IBQ_bd_a5.Last;
  end;
  if(p=9) then begin
     if(b=False) and (dm.IBQ_bd_a6.FieldValues['TIM']>i) then dm.IBQ_bd_a6.First;
     if(b=False) and (dm.IBQ_bd_a6.FieldValues['TIM']<i) then dm.IBQ_bd_a6.Last;
  end;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Переход вначало или в конец БД
procedure TfmBD.SpeedButton4Click(Sender: TObject);
begin
    // Переход на первую запись просматриваемой таблицы БД
    if((Sender as TSpeedButton).Tag =4) then begin
        if(dm.IBQ_bd.Active   ) then dm.IBQ_bd.First;      // Дозировка
        if(dm.IBQ_bd_a1.Active) then dm.IBQ_bd_a1.First;   // АК1
        if(dm.IBQ_bd_a2.Active) then dm.IBQ_bd_a2.First;   // АК2
        if(dm.IBQ_bd_a3.Active) then dm.IBQ_bd_a3.First;   // АК3
        if(dm.IBQ_bd_a4.Active) then dm.IBQ_bd_a4.First;   // АК4
        if(dm.IBQ_bd_a5.Active) then dm.IBQ_bd_a5.First;   // АК5
        if(dm.IBQ_bd_a6.Active) then dm.IBQ_bd_a6.First;   // АК6
    end;
    // Переход на последнюю запись просматриваемой таблицы БД
    if((Sender as TSpeedButton).Tag =5) then begin
        if(dm.IBQ_bd.Active) then dm.IBQ_bd.Last;
        if(dm.IBQ_bd_a1.Active) then dm.IBQ_bd_a1.Last;
        if(dm.IBQ_bd_a2.Active) then dm.IBQ_bd_a2.Last;
        if(dm.IBQ_bd_a3.Active) then dm.IBQ_bd_a3.Last;
        if(dm.IBQ_bd_a4.Active) then dm.IBQ_bd_a4.Last;
        if(dm.IBQ_bd_a5.Active) then dm.IBQ_bd_a5.Last;
        if(dm.IBQ_bd_a6.Active) then dm.IBQ_bd_a6.Last;
    end;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Отображение имени поля в строке статуса при нажатии на колонке (поле) таблицы
procedure TfmBD.DBGrid02MouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
type
    TG=TDBGrid;
var
    i,s : integer;
begin
    if(((Sender as TG).Enabled) and
       ((dm.IBQ_bd.Active) or (dm.IBQ_bd_a1.Active) or (dm.IBQ_bd_a2.Active) or
        (dm.IBQ_bd_a3.Active) or (dm.IBQ_bd_a4.Active) ) ) then begin
        i:=(Sender as TG).SelectedIndex;
        s:=(Sender as TG).FieldCount;
        if(i>=0) and (s>0) and ((Sender as TG).Columns[0].FieldName='TIM') then begin
           fmStForm.StatusBar1.Panels[0].Text:=
           '['+(Sender as TG).Columns[i].FieldName+']   ['+
               (Sender as TG).Columns[i].Title.Caption+']   ['+
               IntToStr((Sender as TG).Columns[0].Field.Value)+']';
           fmStForm.StatusBar1.Update;
        end;
    end;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Обработка введенной даты и времени
procedure TfmBD.date1Enter(Sender: TObject);
begin
    EDateT:=StrToDate(date1.Text); fmPrint.CheckDate1; date1.Text:=DateToStr(EDateT);
end;
//--------------------------------------------------------------------------
procedure TfmBD.tmEnter(Sender: TObject);
begin
    ETimeT:=tm.Time; fmPrint.CheckTime1; tm.Time:=ETimeT;
end;
//--------------------------------------------------------------------------


end.
//--------------------------------------------------------------------------

