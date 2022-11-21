//----------------------------------------------------------------------------
//  Обработка и передача значений рабочих массивов
unit UDM;

interface

uses
  SysUtils, Classes, DB, IBDatabase, IBCustomDataSet, IBTable, ExtCtrls, DateUtils,
  IBQuery, IBDatabaseInfo, Dialogs,ComCtrls,StdCtrls,Windows, TimerLst,
  RxMemDS, IBSQL, DBClient, DBLocal, DBLocalI;

type
  TDM = class(TDataModule)
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    Timer1      : TTimer;
    IBQ_bd      : TIBQuery;
    ds_bd       : TDataSource;
    IBQuery1    : TIBQuery;
    IBQ_bd_a1   : TIBQuery;
    ds_bd_a1    : TDataSource;
    IBQ_bd_a2   : TIBQuery;
    ds_bd_a2    : TDataSource;
    IBQ_bd_a3   : TIBQuery;
    ds_bd_a3    : TDataSource;
    IBQ_bd_a4   : TIBQuery;
    ds_bd_a4    : TDataSource;
    IBQ_gr_tds: TIBQuery;
    IBQ_gr_dsdm: TIBQuery;
    IBQ_gr_pp: TIBQuery;
    IBQ_gr_a1: TIBQuery;
    IBQ_gr_a2: TIBQuery;
    IBQ_gr_a3: TIBQuery;
    IBQ_gr_a4: TIBQuery;
    IBQ_gr_tmp: TIBQuery;
    IBQ_bd_a5: TIBQuery;
    ds_bd_a5: TDataSource;
    IBQ_bd_a6: TIBQuery;
    ds_bd_a6: TDataSource;
    IBQ_gr_a5: TIBQuery;
    IBQ_gr_a6: TIBQuery;
    procedure Timer1Timer(Sender: TObject);
    procedure TGeneralAfterPost(DataSet: TDataSet);
    procedure First_in_Run();
    procedure Every_Time();
    procedure Timer_01Timer(Sender: TObject);
    Function Change(AWord: String; AFl: string; ASL: string): string;

  private

  public

end;

var
  DM: TDM;
  s:variant;

implementation


uses ufmStForm, ufmGrifik, vPub;

{$R *.dfm}

//----------------------------------------------------------------------------
// функция замены символа в строке
Function TDM.Change(AWord: String; AFl: string; ASL: string): string;
var
   i,L : integer;
begin
   L:= Length(AWord);
   result:='0';
   if L>0 then
   begin
      for i:=1 to L do begin
         if AWord[i]=AFl then begin
            if i<L then AWord:=Copy(AWord,1,i-1)+ASL+Copy(AWord,i+1,L) else
                        AWord:=Copy(AWord,1,i-1)+ASL;
         end;
      end;
      result:=AWord;
   end;
end;
//----------------------------------------------------------------------------


//----------------------------------------------------------------------------
// Создание-открытие глобальной области памяти
procedure TDM.First_in_Run();
begin
    { ... }
end;
//----------------------------------------------------------------------------


//----------------------------------------------------------------------------
// Функция вызывается каждую секунду
procedure TDM.Every_Time();
begin
    { ... }
end;
//----------------------------------------------------------------------------


//----------------------------------------------------------------------------
procedure TDM.Timer1Timer(Sender: TObject);
var
    r : integer;
    L0,L1,L2,L3,L4 : string;
begin
    if FRSTR=0 then begin First_in_Run(); end;
    Every_Time();
    FRSTR:=1;

    s:='T'+ IntToStr(YearOf(date))+IntToStr(MonthOf(date))+IntToStr(DayOf(date));

    // Значения в стус бар
    fmStForm.StatusBar1.Panels[1].Text:=timetoStr(time) ;
    fmStForm.StatusBar1.Panels[2].Text:=datetoStr(date) ;

    // вывод флагов работы контроллеров
    if (NL02<0) then NL02:=0;
    if (NL03<0) then NL03:=0;
    if (NL21<0) then NL21:=0;
    if (NL23<0) then NL23:=0;
    if (NL25<0) then NL25:=0;

    if (DBB_0301 <> DBB[301] ) then begin NL02:=NL02+1; end;
    if (DBB_0000 <> DBB[0]   ) then begin NL03:=NL03+1; end;
    if (DBB_1161 <> DBB[1161]) then begin NL21:=NL21+1; end;
    if (DBB_1061 <> DBB[1061]) then begin NL23:=NL23+1; end;
    if (DBB_1211 <> DBB[1211]) then begin NL25:=NL25+1; end;

    if (NL02>9) then NL02:=0;
    if (NL03>9) then NL03:=0;
    if (NL21>9) then NL21:=0;
    if (NL23>9) then NL23:=0;
    if (NL25>9) then NL25:=0;

    DBB_0000 := DBB[0];
    DBB_0301 := DBB[301];
    DBB_1161 := DBB[1161];
    DBB_1061 := DBB[1061];
    DBB_1211 := DBB[1211];

    if(NL02<10) then L0:=IntToStr(NL02) else L0:='#';
    if(NL03<10) then L1:=IntToStr(NL03) else L1:='#';
    if(NL21<10) then L2:=IntToStr(NL21) else L2:='#';
    if(NL23<10) then L3:=IntToStr(NL23) else L3:='#';
    if(NL25<10) then L4:=IntToStr(NL25) else L4:='#';
    fmStForm.PCCSFL.Caption:=L1+' '+L0+' '+L2+' '+L3+' '+L4;

end;
//----------------------------------------------------------------------------


//----------------------------------------------------------------------------
procedure TDM.TGeneralAfterPost(DataSet: TDataSet);
begin
    IBTransaction1.CommitRetaining;
end;
//----------------------------------------------------------------------------


//----------------------------------------------------------------------------
procedure TDM.Timer_01Timer(Sender: TObject);
begin
{ ... }
end;
//----------------------------------------------------------------------------


end.
//----------------------------------------------------------------------------

