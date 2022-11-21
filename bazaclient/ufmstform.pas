//--------------------------------------------------------------------------
// Первая форма (начальный экран) программы

unit ufmStForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ExtCtrls, Sockets, Menus, ComCtrls, Buttons, ToolWin,
  Dialogs,  db, StdCtrls, Grids, DBGrids, TimerLst,IniFiles, ShellAPI,
  FR_Class, FR_Desgn;

type
  TfmStForm = class(TForm)
    StatusBar1: TStatusBar;
    ToolBar1: TToolBar;
    M1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    F101: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N7: TMenuItem;
    SpeedButton16: TSpeedButton;
    N11: TMenuItem;
    N21: TMenuItem;
    N31: TMenuItem;
    N41: TMenuItem;
    N51: TMenuItem;
    ToolButton1: TToolButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    N8: TMenuItem;
    N42: TMenuItem;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    N10: TMenuItem;
    SpeedButton9: TSpeedButton;
    ToolButton3: TToolButton;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    SpeedButton10: TSpeedButton;
    N16: TMenuItem;
    N22: TMenuItem;
    N32: TMenuItem;
    N43: TMenuItem;
    TcpClient1: TTcpClient;
    Shape1: TShape;
    ToolButton4: TToolButton;
    TcpServer1: TTcpServer;
    Timer1: TTimer;
    Timer2: TTimer;
    Panel1: TPanel;
    ToolButton6: TToolButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    N52: TMenuItem;
    N61: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    ToolButton5: TToolButton;
    PCCSFL: TLabel;
    N9: TMenuItem;
    frReport1: TfrReport;
    OpenDialog1: TOpenDialog;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    N23: TMenuItem;
    SpeedButton1: TSpeedButton;
    N24: TMenuItem;
    procedure SetAutoklavDef;
    procedure PrintCSF(locCapt, locStat :String);
    procedure DBGridNOVisible;
    procedure F101Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N111Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure SpeedButton9Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure SpeedButton10Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
    procedure N2AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
      ARect: TRect; State: TOwnerDrawState);
    procedure TcpClient1Receive(Sender: TObject; Buf: PAnsiChar;
      var DataLen: Integer);
    procedure TcpClient1Error(Sender: TObject; SocketError: Integer);
    procedure TcpClient1Connect(Sender: TObject);
    procedure TcpClient1Disconnect(Sender: TObject);
    procedure TcpClient1Send(Sender: TObject; Buf: PAnsiChar;
      var DataLen: Integer);
    procedure TcpClient1CreateHandle(Sender: TObject);
    procedure TcpClient1DestroyHandle(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure TCPConnect(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton11Click(Sender: TObject);
    procedure N9Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    function ReadIni(iniFileName, ASection, AString : String) : String;
  end;

var
  fmStForm  :TfmStForm;
  SFrm      :TfmStForm;
//--------------------------------------------------------------------------


implementation

uses
   ufmGrifik, Math, uBD, UDM, DateUtils, Unit1, uPrint, uSHK, uTHTCP, uCFG,
   vPub, TypInfo;

{$R *.dfm}


//--------------------------------------------------------------------------
// Вывод строки статуса и название окна
procedure TfmStForm.PrintCSF(locCapt, locStat :String);
begin
    fmStForm.StatusBar1.Panels[0].Text:=locStat;
    fmStForm.StatusBar1.Update;
    if(Length(locCapt)>0) then begin
       fmStForm.Caption :=locCapt; PubCapt:=locCapt;
    end;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
function TfmStForm.ReadIni(iniFileName, ASection, AString : String) : String;
var
   sIniFile: TIniFile;
const
   S = ' ';
begin
   sDirName := ExtractFileDir(Application.ExeName);
   sIniFile := TIniFile.Create(sDirName+'\'+iniFileName);
   Result := sIniFile.ReadString(ASection, AString, S);
   sIniFile.Free;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Выход из программы
procedure TfmStForm.F101Click(Sender: TObject);
begin
    if(TCPRUN>0) then TcpClient1Disconnect(Sender);
    if fmPrint<> nil  then  fmPrint.Free;
    if fmBD   <> nil  then  fmBD.Free;
    if fmMnemo<> nil  then  fmMnemo.Free;
    if fmGrafik<>nil  then  fmGrafik.Free;
    if Assigned(fmStForm) then fmStForm.Close;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Вызов файла помощи
procedure TfmStForm.N2Click(Sender: TObject);
var
    HFN   : array [0..100] of Char;
begin
    StrPCopy(HFN,sDirName+'\'+HelpFile);
    if (FileExists(HFN)) then begin
        ShellExecute(Handle,'open',HFN,nil,nil,SW_RESTORE);
    end else begin
        PrintCSF('','Не найден файл помощи [hlp\pCodus.chm]');
    end;
end ;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Закрытие вывода на экран текущей таблицы БД
procedure TfmStForm.DBGridNOVisible;
begin
    if(PubSender<>nil) then begin
      (PubSender as TDBGrid).Visible:=False;
      (PubSender as TDBGrid).Enabled:=False;
    end;
    PubSender:=nil;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.SetAutoklavDef;
var
    a       : integer;
begin
    // установка первоночального уникального значения для инициализхации
    // перерисовки экрана
    for a:=0 to DBBSZ do
    begin
        dbbp[a]:=0.101101;
    end;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.SpeedButton10Click(Sender: TObject);
var
    STemp    : string;
begin
    // Чтение переменных из файлов конфигурации
    NTLD.ReadConfigFile;
    DataBase:=fmStForm.readini('pCodus.ini','General','DataBase');
    HelpFile:=fmStForm.readini('pCodus.ini','General','HelpFile');
    CVersion:=fmStForm.readini('pCodus.ver','General','Version' );
    Timer1.Interval:=TCPPREQ;
    //
    SFrm.PrintCSF(PCap, 'Подключение к БАЗЕ ДАННЫХ...');
    dm.IBDatabase1.Close;
    dm.IBDatabase1.DatabaseName:= TCPADR+':'+DataBase;
    dm.IBDatabase1.Connected:=true;
    dm.IBTransaction1.Active:=true;
    fmStForm.SpeedButton2.Enabled:=true;
    fmStForm.SpeedButton3.Enabled:=true;
    fmStForm.SpeedButton9.Enabled:=true;
    // определение имени компа
    Size := MAX_COMPUTERNAME_LENGTH + 1;
    PRes := StrAlloc(Size);
    BRes := GetComputerName(PRes, Size);
    name_comp:=StrPas(PRes);
    // начальные координаты временного среза
    LLX[0]:=0; LLX[1]:=0; LLX[2]:=0; LLX[3]:=0;
    LLX[4]:=0; LLX[5]:=0; LLX[6]:=0; LLX[7]:=0;
    LLX[8]:=0; LLX[9]:=0;
    LLY[0]:=0; LLY[1]:=0; LLY[2]:=0; LLY[3]:=0;
    LLY[4]:=0; LLY[5]:=0; LLY[6]:=0; LLY[7]:=0;
    LLY[8]:=0; LLY[9]:=0;
    // начальное состояние исполнителей автоклавов
    SetAutoklavDef;
    // определение разрешения печати
    PrintEnabled:=0;
    STemp:=fmStForm.readini('pCodus.ini','Printer','Enabled');
    if(Length(STemp)>0) then if(STemp[1]='1') then PrintEnabled:=1;
    // начальные установки других переменных
    TBLOpenF:=0;
    FEXIT:=0;
    RetRep:=0;
    // вывод в названии окна версии программы
    SFrm.PrintCSF(PCap+' [Версия: '+CVersion+'] ', ' ');
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Вызов подключения к БД и вывод строки статуса
procedure TfmStForm.FormCreate(Sender: TObject);
begin
  SpeedButton10.Click;
  StatusBar1.Panels[4].Text:='База данных: '+ TCPADR+':'+DataBase;
  //
  TCPConnect(Sender);
end;
//--------------------------------------------------------------------------
// Запуск фоновой задачи обмена по TCP
procedure TfmStForm.TCPConnect(Sender: TObject);
begin
  TCPERC:=0; TCPCRTC:=0; TCPRUN:=1;
  uTHTCP.mTCP:= TCPThread.Create(False);
  uTHTCP.mTCP.FreeOnTerminate:=True;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N4Click(Sender: TObject);
begin
  if not FileExists(sDirName+'\pic\Autoclave.bmp') then begin
     SFrm.PrintCSF(PCap+'[Мнемосхема:  АВТОКЛАВЫ]','Не найден файл рисунка [pic\Autoclave.bmp]');
     Sleep(1000);  SFrm.PrintCSF(PCap+' [Версия: '+CVersion+'] ', ' '); exit;
  end;
  DBGridNoVisible;
  if not Assigned(fmGrafik) then begin
     fmGrafik:=TfmGrafik.Create(Application);
  end;
  fmGrafik.auto.Picture.LoadFromFile(sDirName+'\pic\Autoclave.bmp');
  fmGrafik.Show; fmGrafik.book.PageIndex:=0;
  fmGrafik.Caption:='';
  SFrm.PrintCSF(PCap+'[Мнемосхема:  АВТОКЛАВЫ]',' ');
  fmGrafik.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N3Click(Sender: TObject);
begin
  if not FileExists(sDirName+'\pic\Dozirovka.bmp') then begin
     SFrm.PrintCSF(PCap+'[Мнемосхема:  ДОЗИРОВКА 1]','Не найден файл рисунка [pic\Dozirovka.bmp]');
     Sleep(1000);  SFrm.PrintCSF(PCap+' [Версия: '+CVersion+'] ', ' '); exit;
  end;
  DBGridNoVisible;
  if not Assigned(fmGrafik) then begin
     fmGrafik:=TfmGrafik.Create(Application);
  end;
  fmGrafik.Image2.Picture.LoadFromFile(sDirName+'\pic\Dozirovka.bmp');
  fmGrafik.Show; fmGrafik.book.PageIndex:=1;
  fmGrafik.Caption:='';
  SFrm.PrintCSF(PCap+'[Мнемосхема:  ДОЗИРОВКА 1]',' ');
  fmGrafik.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------

//--------------------------------------------------------------------------
procedure TfmStForm.N33Click(Sender: TObject);
begin
  if not FileExists(sDirName+'\pic\Dozirovka2.bmp') then begin
     SFrm.PrintCSF(PCap+'[Мнемосхема:  ДОЗИРОВКА 2]','Не найден файл рисунка [pic\Dozirovka2.bmp]');
     Sleep(1000);  SFrm.PrintCSF(PCap+' [Версия: '+CVersion+'] ', ' '); exit;
  end;
  DBGridNoVisible;
  if not Assigned(fmGrafik) then begin
     fmGrafik:=TfmGrafik.Create(Application);
  end;
  fmGrafik.Image2.Picture.LoadFromFile(sDirName+'\pic\Dozirovka2.bmp');
  fmGrafik.Show; fmGrafik.book.PageIndex:=2;
  fmGrafik.Caption:='';
  SFrm.PrintCSF(PCap+'[Мнемосхема:  ДОЗИРОВКА 2]',' ');
  fmGrafik.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N11Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    DBGridNoVisible;
    if not Assigned(fmMnemo) then begin
        fmMnemo:=TfmMnemo.Create(Application);
    end;
    fmMnemo.Show; fmMnemo.book.PageIndex:=0;
    fmMnemo.Caption:='';
    SFrm.PrintCSF(PCap+'[График:  ТЕМПЕРАТУРА ДОЗИРОВКИ 1]', ' ');
    fmMnemo.DBChartClickBackground(fmMnemo.DBChart1,LLButton,LLShift,LLX[0],LLY[0]);
    if(PrintEnabled=0) then fmMnemo.SpeedButton9.Visible:=False;
    fmMNemo.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------
procedure TfmStForm.N111Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    DBGridNoVisible;
    if not Assigned(fmMnemo) then begin
        fmMnemo:=TfmMnemo.Create(Application);
    end;
    fmMnemo.Show; fmMnemo.book.PageIndex:=9;
    fmMnemo.Caption:='';
    SFrm.PrintCSF(PCap+'[График:  ТЕМПЕРАТУРА ДОЗИРОВКИ 2]', ' ');
    fmMnemo.DBChartClickBackground(fmMnemo.DBChart11,LLButton,LLShift,LLX[0],LLY[0]);
    if(PrintEnabled=0) then fmMnemo.SpeedButton9.Visible:=False;
    fmMNemo.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N21Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    DBGridNoVisible;
    if not Assigned(fmMnemo) then begin
        fmMnemo:=TfmMnemo.Create(Application);
    end;
    fmMnemo.Show; fmMnemo.book.PageIndex:=1;
    fmMnemo.Caption:='';
    SFrm.PrintCSF(PCap+'[График:  ДОЗИРОВКА СУХОГО и МОКРОГО]', ' ');
    fmMnemo.DBChartClickBackground(fmMnemo.dozat_arx,LLButton,LLShift,LLX[1],LLY[1]);
    if(PrintEnabled=0) then fmMnemo.SpeedButton9.Visible:=False;
    fmMNemo.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.SpeedButton9Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    DBGridNoVisible;
    if not Assigned(fmMnemo) then begin
        fmMnemo:=TfmMnemo.Create(Application);
    end;
    fmMnemo.Show; fmMnemo.book.PageIndex:=2;
    fmMnemo.Caption:='';
    SFrm.PrintCSF(PCap+'[График:  ДОЗИРОВКА ПУДРЫ и ПАСТЫ]', ' ');
    fmMnemo.DBChartClickBackground(fmMnemo.DBChart2,LLButton,LLShift,LLX[2],LLY[2]);
    if(PrintEnabled=0) then fmMnemo.SpeedButton9.Visible:=False;
    fmMNemo.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N31Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    DBGridNoVisible;
    if not Assigned(fmMnemo) then begin
        fmMnemo:=TfmMnemo.Create(Application);
    end;
    fmMnemo.Show; fmMnemo.book.PageIndex:=3;
    fmMnemo.Caption:='';
    SFrm.PrintCSF(PCap+'[График:  АВТОКЛАВ N1]', ' ');
    fmMnemo.DBChartClickBackground(fmMnemo.autoklav1,LLButton,LLShift,LLX[3],LLY[3]);
    if(PrintEnabled=0) then fmMnemo.SpeedButton9.Visible:=False;
    fmMNemo.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N41Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    DBGridNoVisible;
    if not Assigned(fmMnemo) then begin
        fmMnemo:=TfmMnemo.Create(Application);
    end;
    fmMnemo.Show; fmMnemo.book.PageIndex:=4;
    fmMnemo.Caption:='';
    SFrm.PrintCSF(PCap+'[График:  АВТОКЛАВ N2]', ' ');
    fmMnemo.DBChartClickBackground(fmMnemo.autoklav2,LLButton,LLShift,LLX[4],LLY[4]);
    if(PrintEnabled=0) then fmMnemo.SpeedButton9.Visible:=False;
    fmMNemo.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N51Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    DBGridNoVisible;
    if not Assigned(fmMnemo) then begin
        fmMnemo:=TfmMnemo.Create(Application);
    end;
    fmMnemo.Show; fmMnemo.book.PageIndex:=5;
    fmMnemo.Caption:='';
    SFrm.PrintCSF(PCap+'[График:  АВТОКЛАВ N3]', ' ');
    fmMnemo.DBChartClickBackground(fmMnemo.autoklav3,LLButton,LLShift,LLX[5],LLY[5]);
    if(PrintEnabled=0) then fmMnemo.SpeedButton9.Visible:=False;
    fmMNemo.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N45Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    DBGridNoVisible;
    if not Assigned(fmMnemo) then begin
        fmMnemo:=TfMMnemo.Create(Application);
    end;
    fmMnemo.Show; fmMnemo.book.PageIndex:=6;
    fmMnemo.Caption:='';
    SFrm.PrintCSF(PCap+'[График:  АВТОКЛАВ N4]', ' ');
    fmMnemo.DBChartClickBackground(fmMnemo.autoklav4,LLButton,LLShift,LLX[6],LLY[6]);
    if(PrintEnabled=0) then fmMnemo.SpeedButton9.Visible:=False;
    fmMNemo.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N46Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    DBGridNoVisible;
    if not Assigned(fmMnemo) then begin
        fmMnemo:=TfMMnemo.Create(Application);
    end;
    fmMnemo.Show; fmMnemo.book.PageIndex:=7;
    fmMnemo.Caption:='';
    SFrm.PrintCSF(PCap+'[График:  АВТОКЛАВ N5]', ' ');
    fmMnemo.DBChartClickBackground(fmMnemo.autoklav5,LLButton,LLShift,LLX[7],LLY[7]);
    if(PrintEnabled=0) then fmMnemo.SpeedButton9.Visible:=False;
    fmMNemo.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N47Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    DBGridNoVisible;
    if not Assigned(fmMnemo) then begin
        fmMnemo:=TfMMnemo.Create(Application);
    end;
    fmMnemo.Show; fmMnemo.book.PageIndex:=8;
    fmMnemo.Caption:='';
    SFrm.PrintCSF(PCap+'[График:  АВТОКЛАВ N6]', ' ');
    fmMnemo.DBChartClickBackground(fmMnemo.autoklav6,LLButton,LLShift,LLX[8],LLY[8]);
    if(PrintEnabled=0) then fmMnemo.SpeedButton9.Visible:=False;
    fmMNemo.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N9Click(Sender: TObject);
var
  ii  : integer;
begin
  openDialog1.Options := [ofAllowMultiSelect];
  if openDialog1.Execute then
  begin
    for ii := 0 to openDialog1.Files.Count-1 do
    begin
      fmStForm.frReport1.LoadPreparedReport(openDialog1.Files[ii]);
    end;
  end;
  fmStForm.frReport1.ShowPreparedReport;
end;
//--------------------------------------------------------------------------
procedure TfmStForm.N8Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    DBGridNoVisible;
    if not Assigned(fmPrint) then begin
        fmPrint:=TfmPrint.Create(Application);
    end;
    fmPrint.Show;
    fmPrint.book.PageIndex:=1;
    fmPrint.Caption:='';
    SFrm.PrintCSF(PCap+'[Отчет:  РАСХОД КОМПОНЕНТОВ ДОЗИРОВКИ]', ' ');
    RepNUM:=1;
    fmPrint.RadioButton1.Visible:=True;
    fmPrint.RadioButton2.Visible:=True;
    fmPrint.RadioButton3.Visible:=True;
    fmPrint.Label2.Visible:=True;
    fmPrint.Label6.Visible:=True;
    fmPrint.Label7.Visible:=True;
    fmPrint.VibDZ.Value:=1;
    fmPrint.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------
procedure TfmStForm.N72Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    DBGridNoVisible;
    if not Assigned(fmPrint) then begin
        fmPrint:=TfmPrint.Create(Application);
    end;
    fmPrint.Show;
    fmPrint.book.PageIndex:=0;
    fmPrint.Caption:='';
    SFrm.PrintCSF(PCap+'[Отчет:  ЗАГРУЗКА АВТОКЛАВОВ]', ' ');
    RepNUM:=2;
    fmPrint.RadioButton1.Visible:=False;
    fmPrint.RadioButton2.Visible:=False;
    fmPrint.RadioButton3.Visible:=False;
    fmPrint.Label2.Visible:=False;
    fmPrint.Label6.Visible:=False;
    fmPrint.Label7.Visible:=False;
    fmPrint.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Прервать формирование отчета
procedure TfmStForm.SpeedButton8Click(Sender: TObject);
begin
  BrCyc:=1;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Переход на форму формирования отчетов
procedure TfmStForm.SpeedButton11Click(Sender: TObject);
begin
  if(fmPrint<>nil) then begin
     if(RepNUM=1) then begin N8Click (Sender); exit; end;        // DZ
     if(RepNUM=2) then begin N72Click(Sender); exit; end;        // AK
  end;
end;
//--------------------------------------------------------------------------



//--------------------------------------------------------------------------
procedure TfmStForm.N12Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    FLGTitle:=0;
    DBGridNoVisible;
    if not Assigned(fmBD) then begin
        fmBD:=TfmBD.Create(Application);
    end;
    dm.IBQ_bd.Close;
    fmBD.FormActivate(fmBD); fmBD.Show; fmBD.book_bd.PageIndex:=0;
    fmBD.Caption:='';
    SFrm.PrintCSF(PCap+'[Просмотр БД:  ВСЕ ДАННЫЕ]', ' ');
    fmBD.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N13Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    FLGTitle:=0;
    DBGridNoVisible;
    if not Assigned(fmBD) then begin
        fmBD:=TfmBD.Create(Application);
    end;
    dm.IBQ_bd.Close;
    fmBD.FormActivate(fmBD); fmBD.Show; fmBD.book_bd.PageIndex:=1;
    fmBD.Caption:='';
    SFrm.PrintCSF(PCap+'[Просмотр БД:  ДОЗИРОВКА СУХОГО]', ' ');
    fmBD.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N14Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    FLGTitle:=0;
    DBGridNoVisible;
    if not Assigned(fmBD) then begin
        fmBD:=TfmBD.Create(Application);
    end;
    dm.IBQ_bd.Close;
    fmBD.FormActivate(fmBD); fmBD.Show; fmBD.book_bd.PageIndex:=2;
    fmBD.Caption:='';
    SFrm.PrintCSF(PCap+'[Просмотр БД:  ДОЗИРОВКА МОКРОГО]', ' ');
    fmBD.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N15Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    FLGTitle:=0;
    DBGridNoVisible;
    if not Assigned(fmBD) then begin
        fmBD:=TfmBD.Create(Application);
    end;
    dm.IBQ_bd.Close;
    fmBD.FormActivate(fmBD); fmBD.Show; fmBD.book_bd.PageIndex:=3;
    fmBD.Caption:='';
    SFrm.PrintCSF(PCap+'[Просмотр БД:  ДОЗИРОВКА ПУДРЫ и ПАСТЫ]', ' ');
    fmBD.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N16Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    FLGTitle:=0;
    DBGridNoVisible;
    if not Assigned(fmBD) then begin
        fmBD:=TfmBD.Create(Application);
    end;
    dm.IBQ_bd.Close;
    fmBD.FormActivate(fmBD); fmBD.Show; fmBD.book_bd.PageIndex:=4;
    fmBD.Caption:='';
    SFrm.PrintCSF(PCap+'[Просмотр БД:  АВТОКЛАВ N1]', ' ');
    fmBD.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N22Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    FLGTitle:=0;
    DBGridNoVisible;
    if not Assigned(fmBD) then begin
        fmBD:=TfmBD.Create(Application);
    end;
    dm.IBQ_bd.Close;
    fmBD.FormActivate(fmBD); fmBD.Show; fmBD.book_bd.PageIndex:=5;
    fmBD.Caption:='';
    SFrm.PrintCSF(PCap+'[Просмотр БД:  АВТОКЛАВ N2]', ' ');
    fmBD.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N32Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    FLGTitle:=0;
    DBGridNoVisible;
    if not Assigned(fmBD) then begin
        fmBD:=TfmBD.Create(Application);
    end;
    dm.IBQ_bd.Close;
    fmBD.FormActivate(fmBD); fmBD.Show; fmBD.book_bd.PageIndex:=6;
    fmBD.Caption:='';
    SFrm.PrintCSF(PCap+'[Просмотр БД:  АВТОКЛАВ N3]', ' ');
    fmBD.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N43Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    FLGTitle:=0;
    DBGridNoVisible;
    if not Assigned(fmBD) then begin
        fmBD:=TfmBD.Create(Application);
    end;
    dm.IBQ_bd.Close;
    fmBD.FormActivate(fmBD); fmBD.Show; fmBD.book_bd.PageIndex:=7;
    fmBD.Caption:='';
    SFrm.PrintCSF(PCap+'[Просмотр БД:  АВТОКЛАВ N4]', ' ');
    fmBD.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N55Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    FLGTitle:=0;
    DBGridNoVisible;
    if not Assigned(fmBD) then begin
        fmBD:=TfmBD.Create(Application);
    end;
    dm.IBQ_bd.Close;
    fmBD.FormActivate(fmBD); fmBD.Show; fmBD.book_bd.PageIndex:=8;
    fmBD.Caption:='';
    SFrm.PrintCSF(PCap+'[Просмотр БД:  АВТОКЛАВ N5]', ' ');
    fmBD.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmStForm.N56Click(Sender: TObject);
begin
    if(RunRep>0) then begin exit; end;
    FLGTitle:=0;
    DBGridNoVisible;
    if not Assigned(fmBD) then begin
        fmBD:=TfmBD.Create(Application);
    end;
    dm.IBQ_bd.Close;
    fmBD.FormActivate(fmBD); fmBD.Show; fmBD.book_bd.PageIndex:=9;
    fmBD.Caption:='';
    SFrm.PrintCSF(PCap+'[Просмотр БД:  АВТОКЛАВ N6]', ' ');
    fmBD.WindowState:=wsMaximized;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
//  Вывод строки статуса и названия окна при пустой форме
procedure TfmStForm.FormShow(Sender: TObject);
const
    uiAction = 48;                               // праметры рабочего поля
                                                 // без панели задач и т.п.
var
    rct       : TRect;                           // структура координат
begin
    ETimeB:=time; ETimeE:=time;
    EDateB:=date; EDateE:=date;
    SystemParametersInfo(uiAction, 0, @rct, 0);
    fmStForm.Left:=0;
    fmStForm.Top :=0;
    fmStForm.Width := rct.right;                 // ширина рабочего поля
    fmStForm.Height:= rct.bottom;                // высота...
    // проверка разрешения монитора
    if(fmStForm.Monitor.Width<1020) or (fmStForm.Monitor.Height<760) then
       ShowMessage('Для работы программы нужно разрешение экрана 1024x768');
    // размер панели перед ввыводом картинки в правом верхнем углу
    ToolButton5.Width:=fmStForm.Width-(SpeedButton8.Left+SpeedButton8.Width+
    Shape1.Width+PCCSFL.Width+10);
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Вывод подсказок по полям в строку статуса
procedure TfmStForm.FormMouseMove(Sender: TObject; Shift: TShiftState; X,Y: Integer);
var
    s,z  :String;
begin
    if(Sender.ClassName='TfmStForm') then begin
       s:='TfmStForm  N['+ (Sender as TfmStForm).Name+']'+
                    ' C['+ (Sender as TfmStForm).Caption+']'+
                    ' H['+ (Sender as TfmStForm).Hint+']';
    end;
    if(Sender.ClassName='TSpeedButton') then begin
       s:='TSpeedButton  N['+ (Sender as TSpeedButton).Name+']'+
                       ' C['+ (Sender as TSpeedButton).Caption+']'+
                       ' H['+ (Sender as TSpeedButton).Hint+']';
//    (Sender as TSpeedButton).Hint:=(Sender as TSpeedButton).Caption;
    end;
    if(Sender.ClassName<>'TfmStForm') then begin
       z:=' CN';
    end;
    // uses TypeInfo
    if(GetPropInfo(Sender.ClassInfo,'Caption')<>nil) then begin
       z:=' CI';
    end;
//  SFrm.PrintCSF('TEST',' X='+IntToStr(X)+'  Y='+IntToStr(Y)+'  '+s+z);
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Перерисовка меню... (В Evnts-ах пунктов меню - OnAdvancedDrawItem)
procedure TfmStForm.N2AdvancedDrawItem(Sender: TObject; ACanvas: TCanvas;
  ARect: TRect; State: TOwnerDrawState);
const
  Alig  : array[TPopupAlignment] of Word = (DT_LEFT, DT_RIGHT, DT_CENTER);
type
  TMI=TMenuItem;
var
  f     : integer;
  Algmt : TPopupAlignment;
  mRect : TRect;
begin
    if(odSelected in State=true) or (odHotLight in State=true) then begin
       ACanvas.Font.Color :=clBlack;
       ACanvas.Brush.Color:=rgb(198,211,239);
       ACanvas.FillRect(ARect);
    end else begin
       ACanvas.Font.Color :=clNavy;
       ACanvas.Brush.Color:=clBtnFace;
       ACanvas.FillRect(ARect);
    end;
    mRect:=ARect; mRect.Top:=ARect.Top+2;
    if (Sender as TMI).GetParentComponent is TMenuItem then begin
        Algmt := paLeft; mRect.Left:=ARect.Left+5;
    end else begin
        Algmt := paCenter;
    end;
    f:=DT_EXPANDTABS {or DT_SINGLELINE or DT_CALCRECT }or DT_NOCLIP or Alig[Algmt];
    DrawText(ACanvas.Handle,pchar((Sender as TMI).Caption),
            length((Sender as TMI).Caption),mRect,f);
    if(odSelected in State=true) or (odHotLight in State=true) then begin
       ACanvas.Brush.Color:=clBlue; ACanvas.FrameRect(ARect);
    end;
end;
//--------------------------------------------------------------------------



//--------------------------------------------------------------------------
// Данная функция вызывается, когда произошло реальное соединение
procedure TfmStForm.TcpClient1Connect(Sender: TObject);
begin
     TCPFLG :=1;  TCPRUN:=1;
end;
//--------------------------------------------------------------------------
// Данная функция вызывается при попытке установить соединение (xxx.Connect)
procedure TfmStForm.TcpClient1CreateHandle(Sender: TObject);
begin
     TCPTEMP:=1;
end;
//--------------------------------------------------------------------------
// Данная функция вызывается после передачи данных
procedure TfmStForm.TcpClient1Send(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
begin
     if(TCPCNTS<1000) then TCPCNTS:=TCPCNTS+1;
end;
//--------------------------------------------------------------------------
// Данная функция вызывается после приема данных
procedure TfmStForm.TcpClient1Receive(Sender: TObject; Buf: PAnsiChar;
  var DataLen: Integer);
var
     a    : integer;
begin
     if(DataLen>PSZS) then DataLen:=PSZS; a:=DataLen;
     CopyMemory(@TWSRCV, Buf, DataLen);
     if(TWSRCV.cmd=byte('A')) then begin uTHTCP.mTCP.TCPGetANS; end;
     ZeroMemory(@TWSRCV, PSZS);
     TCPFLG :=1; TCPCRTC:=0; TCPERC:=0;
     if(TCPCNTR<1000) then TCPCNTR:=TCPCNTR+1;
end;
//--------------------------------------------------------------------------
// Данная функция вызывается после реального разъединения
procedure TfmStForm.TcpClient1Disconnect(Sender: TObject);
begin
     TCPFLG :=0; TCPRUN :=0; TCPERC:=0;
     Sleep(10);
end;
//--------------------------------------------------------------------------
// Данная функция вызывается после попытки разорвать соединение (xxx.Disconnect)
procedure TfmStForm.TcpClient1DestroyHandle(Sender: TObject);
begin
     TCPTEMP:=2;
end;
//--------------------------------------------------------------------------
// Данная функция вызывается при возникновении ошибки в сокете
// (попытка передачи данных, если сервер не подконекчен...)
procedure TfmStForm.TcpClient1Error(Sender: TObject; SocketError: Integer);
begin
     if(TCPERC <TCPERR) then begin TCPERC :=TCPERC +1; end;
     if(TCPCNTE<1000  ) then begin TCPCNTE:=TCPCNTE+1; end;
end;
//--------------------------------------------------------------------------
//  каждые 2-е секунды вывод на экран счетчиков для анализа обмена по сети
procedure TfmStForm.Timer2Timer(Sender: TObject);
begin
    fmStForm.StatusBar1.Panels[3].Text:=
        'S:' +IntToStr(TCPCNTS)+' R:'+IntToStr(TCPCNTR)+
        ' E:'+IntToStr(TCPCNTE)+' C:'+IntToStr(TCPCRTC);
    TCPCNTS:=0; TCPCNTR:=0; TCPCNTE:=0;
    fmStForm.StatusBar1.Update;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
//  Посылка запроса на сервер (по таймеру (файл *.cft, переменная TCPCRTO))
procedure TfmStForm.Timer1Timer(Sender: TObject);
begin
    uTHTCP.mTCP.TCPSendREQ;
    if (TCPCRTC<TCPCRTO) then begin
        TCPCRTC:=TCPCRTC+1;
    end else begin
        TCPCRTC :=0; TCPFLG:=0;
        if(TCPRUN>0) then begin TcpClient1Disconnect(Sender); end;
        if(TCPRUN=0) then begin TCPConnect(Sender); end;
    end;
end;
//--------------------------------------------------------------------------


end.
//--------------------------------------------------------------------------

