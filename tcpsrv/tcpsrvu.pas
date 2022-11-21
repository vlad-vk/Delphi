unit TCPSrvU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, TCPSrvC, TCPSrvP, Mask, Grids, ExtCtrls,
  TCPConU, WinSock;

type
  TForm1 = class(TForm)
    Label2: TLabel;
    StringGrid1: TStringGrid;
    Timer1: TTimer;
    Shape2: TShape;
    StringGrid2: TStringGrid;
    StaticText1: TStaticText;
    Label1: TLabel;
    Label3: TLabel;
    Timer2: TTimer;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    Button1: TButton;
    procedure ADDLog(FN: string; I: integer; MSG :string);
    procedure CreateGMemArea;
    procedure FormCreate(Sender: TObject);
    procedure mSockClose(ns : integer);
    procedure DataListBox;
    procedure StringGrid1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TCPThread = class(TThread)
  private
  public
    procedure Execute; override;
  end;


var
  Form1   : TForm1;
  mfTCP   : TCPThread;

implementation

{$R *.dfm}

//----------------------------------------------------------------------------
// запись LOG файла
procedure TForm1.ADDLog(FN: string; I: integer; MSG :string);
var
  LF    : TextFile;
begin
  AssignFile(LF,FN);
  if(FileExists(FN)) then Reset  (LF)
  else                    Rewrite(LF);
  Append(LF);
  if(I>0) then Writeln(LF,DateToStr(Date)+' '+TimeToStr(Time)+'  '+MSG)
  else         Writeln(LF,MSG);
  CloseFile(LF);
end;
//----------------------------------------------------------------------------


//----------------------------------------------------------------------------
// Создание-открытие глобальной области памяти
procedure TForm1.CreateGMemArea;
var
    nm   : PAnsiChar;
    km   : PAnsiChar;
begin
    MVOF :=nil;
    PM_pF:=nil;
    nm:=PChar(GLMEMNAME);
    km:=PChar(PM_GLMEMNAME);
    hFMap:= CreateFileMapping($ffffffff,NIL,PAGE_READWRITE,0,(DBBSZ+1)*(DBBLN+1),nm);
    if hFMap=0 then begin Exit; end;
    MVOF := MapViewOfFile(hFMap, FILE_MAP_ALL_ACCESS,0,0,0);
    if MVOF <> nil then begin
       Form1.Label3.Caption:='['+nm+']';
    end else begin
       Form1.Label3.Caption:='[Область памяти не определена]';
       AddLog(LOGFILE,1,'Не выделена глобальная область памяти: '+GLMEMNAME);
    end;
    PM_hF:= CreateFileMapping($ffffffff,NIL,PAGE_READWRITE,0,MAXCELLPROC*DBBLN,km);
    if PM_hF=0 then begin Exit; end;
    PM_pF:= MapViewOfFile(PM_hF, FILE_MAP_ALL_ACCESS,0,0,0);
    if PM_pF <> nil then begin
       AddLog(LOGFILE,1,'Определена  глобальная область памяти: '+PM_GLMEMNAME);
    end else begin
       AddLog(LOGFILE,1,'Не выделена глобальная область памяти: '+PM_GLMEMNAME);
    end;
end;
//----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Начало выполнения программы
procedure TForm1.FormCreate(Sender: TObject);
var
  a  : integer;
begin
  PROGEV:=OpenEvent(EVENT_ALL_ACCESS,False,'TCPSRVEVENT');
  if (PROGEV<>0) then begin
      ShowMessage('Program TCPSrv already RUN!'); Halt;
  end;
  PROGEV:=CreateEvent(nil, False, False, 'TCPSRVEVENT');

  // чтение файла конфигурации
  CFG.ReadConfigFile;
  AddLog(LOGFILE,0,'');
  AddLog(LOGFILE,1,'Запуск программы');
  // создание области памяти для обмена
  CreateGMemArea;
  // заполнение списка переменных
  DataListBox;
  // включение TCP сервера
  WSAStartup($101,Data);
  SetLength(Sockets,MaxCli+2);
  Sockets[0]:=Socket(AF_Inet,Sock_Stream,0);
  Addr.sin_family:=AF_Inet;
  Addr.sin_port:=HtoNS(StrToInt(TCPPORT));
  Addr.sin_addr.S_addr:=InAddr_Any;
  FillChar(Addr.Sin_Zero,SizeOf(Addr.Sin_Zero),0);
  if(Bind(Sockets[0],Addr,SizeOf(TSockAddr))<>0) then begin
     StaticText1.Caption:='ОШИБКА: Включение WinSock (функция Bind)';
     StaticText1.Update;
     AddLog(LOGFILE,1,'ОШИБКА: Включение WinSock (функция Bind)');
     Sleep(5000);
     Abort;
  end;
  if(Listen(Sockets[0],MaxCli*2)<>0) then begin
     StaticText1.Caption:='ОШИБКА: Включение WinSock (функция Listen)';
     StaticText1.Update;
     AddLog(LOGFILE,1,'ОШИБКА: Включение WinSock (функция Listen)');
     Sleep(5000);
     Abort;
  end;
  AddLog(LOGFILE,1,'Сервер включен. Ожидание подключений клиентов...');
  Form1.Caption:=Form1.Caption+'  [Версия: '+VERSION+']';
  // запуск фоновой задачи обмена по TCP
  TCPRUNA:=1;
  for a:=0 to MAXCLI+1 do begin ARCONN[a]:=0; end;
  mfTCP:=TCPThread.Create(False);
  mfTCP.FreeOnTerminate:=True;
end;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Закрытие сокета
procedure TForm1.mSockClose(ns : integer);
begin
    if(ARCONN[ns]>0) then begin CloseSocket(Sockets[ns]); end;
    if(HMSOCK>0) then begin HMSOCK:=HMSOCK-1; end;
    ARCONN[ns]:=0; STCONN[ns]:=' ';
    Form1.StringGrid2.Cells[0,ns]:='';
    Form1.StringGrid2.Cells[1,ns]:='';
    Form1.StringGrid2.Cells[2,ns]:='';
    Form1.StringGrid2.Cells[3,ns]:='';
    TCPSTA[ns]:=0; TCPCHK[ns]:=0;
    TCPCHO[ns]:=0; TCPCHC[ns]:=0;
    SetLength(TMCONN[ns],0);
    Sleep(10);
end;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Заполнения ListBox-а
procedure TForm1.DataListBox;
var
  a,b  : integer;
begin
  b:=0;
  Form1.StringGrid2.Cols[0].Add(' N');
  Form1.StringGrid2.Cols[1].Add(' Адрес');
  Form1.StringGrid2.Cols[2].Add(' Коментарий');
  Form1.StringGrid2.Cols[3].Add(' Статус');

  Form1.StringGrid1.Cols[0].Add(' N');
  Form1.StringGrid1.Cols[1].Add(' Имя');
  Form1.StringGrid1.Cols[2].Add(' Значение');
  Form1.StringGrid1.Cols[3].Add(' Коментарий');
  for a:=0 to DBBSZ do begin
      if(Length(DBBN[a])>0) then begin
         Form1.StringGrid1.RowCount:=Form1.StringGrid1.RowCount+1;
         Form1.StringGrid1.Cols[0].Add(IntToStr(b+1));
         Form1.StringGrid1.Cols[1].Add(DBBN[a]);
         Form1.StringGrid1.Cols[2].Add('0');
         Form1.StringGrid1.Cols[3].Add(DBBR[a]);
         b:=b+1;
      end;
  end;
end;
//-----------------------------------------------------------------------------



//-----------------------------------------------------------------------------
// Вызов процедуры таймера для пересчета значенй
procedure TForm1.Timer1Timer(Sender: TObject);
var
  a,b,i,z,l,x : integer;
  s           : string;
begin
  SetLength(s,DBBLN+1);
  // Передача переменных из глобальной области памяти в строковый массив DBC
  if(MVOF<>nil) then begin
     CopyMemory(@DBC, @MVOF^, (DBBSZ+1)*(DBBLN+1));
  end;i:=0;
  for a:=0 to DBBSZ do begin
      z:=0;
      for b:=0 to DBBLN do begin
          if(DBC[a][b] ='.') then begin DBC[a][b]:=','; z:=1; end;
          if(DBC[a][b]>=chr(48)) and (DBC[a][b]<=chr(57)) then begin z:=2; end;
          if(DBC[a][b]>=chr(32)) then begin
              s[b+1]:=DBC[a][b];
          end else begin
              s[b+1]:=chr(32);
          end;
      end;
      if(z>0) then begin DBB[a]:=StrToFloat(DBC[a]); end;
      // запись значений каналов в таблицу отображения
      if(Length(s)>0) and (Length(DBBN[a])>0) then begin
         Form1.StringGrid1.Cells[2,i+1]:=s;
         i:=i+1;
      end;
  end;
  // Передача переменных контроля работы программы в глобальную область памяти
  PM_i:=PM_i+1; if(PM_i>10000) then PM_i:=0;
  s:=IntToStr(PM_i);
  l:=Length(s); if(l>9) then begin SetLength(s,9); end; l:=Length(s);
  // заполняем переменную с конца
  if (l>0) then begin
      i:=9; PM_s[i]:=chr(0); x:=-1;
      while i>0 do begin
        i:=i-1; x:=x+1;
        if(i>=DBBLN-l) then begin
              PM_s[i]:=s[l-x];
        end else begin
              PM_s[i]:=chr(32);
        end;
      end;
  end else begin
      for i:=0 to DBBLN do begin PM_s[i]:=chr(32); end;
      PM_s[DBBLN]:=chr(0);
  end;
  CopyMemory(@PM_pF^, @PM_s, (DBBLN+1));
end;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Если нажали мышку на Grid-е
procedure TForm1.StringGrid1Click(Sender: TObject);
begin
   if((Sender as TStringGrid).Row<(Sender as TStringGrid).RowCount) then begin
      {...}
   end;
end;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Проверка соединения
procedure TForm1.Timer2Timer(Sender: TObject);
var
  a   : integer;
begin
  // если есть подключенные клиенты- вывести кружок зеленым цветом, иначе- серым
  if(HMSOCK>0) then Form1.Shape2.Brush.Color:=clLime
  else              Form1.Shape2.Brush.Color:=clSilver;
  // проверка 'зависших' клиентов
  for a:=0 to MAXCLI do begin
      // если для этого номера клиента было установлено соединение
      if(ARCONN[a]>0) then begin
         // если от клиента идут запросы- обновить счетчик
         if (TCPCHK[a]<>TCPCHO[a]) and (STCONN[a][1]='1') then begin
             TCPCHO[a]:=TCPCHK[a]; TCPCHC[a]:=0;
         end else begin
             // если от клиента нет запросов или у клиента неправильный адрес-
             // увеличить счетчик неответов (Адрес начинается с 192.168....)
             if(TCPCHC[a]<1000) then begin
                TCPCHC[a]:=TCPCHC[a]+1;
                if(TCPCHC[a]=700) then begin
                   Form1.AddLog(LOGFILE,1,'Зависший  клиент НПП:'+IntToStr(HMSOCK)+
                                          ' НЗП:'+IntToStr(a)+' IP:'+STCONN[a]);
                end;
             end else begin
             // если счетчик неответов полный- клиент 'завис'.
             // надо закрыть его сокет... и очистить запись в таблице
                Form1.AddLog(LOGFILE,1,'Закрытие клиента НПП:'+IntToStr(HMSOCK)+
                                       ' НЗП:'+IntToStr(a)+' IP:'+STCONN[a]);
                mSockClose(a);
             end;
         end;
      end;
  end;
end;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Ожидание подключения нового клиента
procedure TCPThread.Execute;
var
  a       : integer;
  HName   : array[0..255] of Char;
begin
  SetLength(Sockets,MAXCLI+2);
  Len:=SizeOf(TSockAddr);
  while TCPRUNA>0 do
  begin
      if(HMSOCK<=MAXCLI) then begin
         a:=0;
         while a<MAXCLI do begin
             a:=a+1;
             if(ARCONN[a] =0) and (HMSOCK<MAXCLI) then begin
                Sockets[a]:=Accept(Sockets[0],@Addr,@Len);
                TCPRUNC   :=a;
                ARCONN[a] :=1;
                HMSOCK    :=HMSOCK+1;
                STCONN[a] :=inet_ntoa(Addr.sin_addr);
                // проверить правильность подключаемого адреса
                // адрес должен начинаться с (192.168....)
                // если адрес неправильный-не открывать для него поток обмена-выйти
                if(STCONN[a][1]<>'1') then begin Form1.mSockClose(a); break; end;
                // если адрес правильный-обнулить счетчики и продолжить
                TCPCHK[a] :=0;
                TCPCHO[a] :=0;
                TCPCHC[a] :=0;
                TMCONN[a] :=TimeToStr(Time);
                Form1.StringGrid2.Cells[0,a]:=IntToStr(a);
                Form1.StringGrid2.Cells[1,a]:=STCONN[a];
                // Преобразовывать к имени не надо (в XP и Win2003 есть ошибка...)
                Form1.StringGrid2.Cells[2,a]:='';
                Form1.AddLog(LOGFILE,1,'Подключен клиент НПП:'+IntToStr(HMSOCK)+
                                       ' НЗП:'+IntToStr(a)+' IP:'+STCONN[a]);
                // Открыть поток обмена для подключенного клиента
                clTCP[a]:=CLIThread.Create(False);
                clTCP[a].FreeOnTerminate:=True;
                break;
             end;
         end;
      end;
      Sleep(10);
  end;
end;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
// Удаление отмеченных соединений
procedure TForm1.Button1Click(Sender: TObject);
begin
  if(CheckBox1.Checked=True) then begin
     Form1.AddLog(LOGFILE,1,'Вручную закрыт клиент НПП:'+IntToStr(HMSOCK)+
                            ' НЗП:1 IP:'+STCONN[1]);
     mSockClose(1);
  end;
  if(CheckBox2.Checked=True) then begin
     Form1.AddLog(LOGFILE,1,'Вручную закрыт клиент НПП:'+IntToStr(HMSOCK)+
                            ' НЗП:2 IP:'+STCONN[2]);
     mSockClose(2);
  end;
  if(CheckBox3.Checked=True) then begin
     Form1.AddLog(LOGFILE,1,'Вручную закрыт клиент НПП:'+IntToStr(HMSOCK)+
                            ' НЗП:3 IP:'+STCONN[3]);
     mSockClose(3);
  end;
  if(CheckBox4.Checked=True) then begin
     Form1.AddLog(LOGFILE,1,'Вручную закрыт клиент НПП:'+IntToStr(HMSOCK)+
                            ' НЗП:4 IP:'+STCONN[4]);
     mSockClose(4);
  end;
  if(CheckBox5.Checked=True) then begin
     Form1.AddLog(LOGFILE,1,'Вручную закрыт клиент НПП:'+IntToStr(HMSOCK)+
                            ' НЗП:5 IP:'+STCONN[5]);
     mSockClose(5);
  end;
  CheckBox1.Checked:=False;
  CheckBox2.Checked:=False;
  CheckBox3.Checked:=False;
  CheckBox4.Checked:=False;
  CheckBox5.Checked:=False;
end;
//-----------------------------------------------------------------------------


end.
//-----------------------------------------------------------------------------

