//--------------------------------------------------------------------------
// Чтение файла конфигурации NTLD

unit uCFG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, ExtCtrls, ComCtrls, StdCtrls, Mask, ToolEdit, Math,DateUtils,
  DB, RxMemDS, IBCustomDataSet,IBQuery, fr_class ,inifiles, Gauges, FR_DSet,
  FR_DBSet, IBTable;

type
  TCFile = class(TForm)
    function  GetChNum(m : integer) : integer;
    procedure ReadConfigFile;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NTLD     : TCFile;
  CURFLD   : string;                           // буфер текущего поля
  CURCMD   : string;                           // буфер текущей комманды

implementation

uses  ufmStForm, uPrint, vPub;


//--------------------------------------------------------------------------
//  Определение номера канала по имени
//  Возращает:  0-канал не найден, 1-канал найден
function  TCFile.GetChNum(m : integer) : integer;
var
    l,i,r  : integer;
begin
    l:=0; i:=0; r:=0;
    // длинна строки имени канала
    l:=Length(CURFLD);
    // сдвинуть строку на 1 влево (убрать знак '$')
    for i:=0 to l do begin CURFLD[i]:=CURFLD[i+1]; end;
    SetLength(CURFLD,l-1);
    // искать имя в списке имен каналов
    for i:=0 to DBBSZ do begin
        // если нашли канал с таким именем- записать его в
        // строку текущего поля и выйти из цикла
        if(CURFLD=DBBN[i]) then begin
           case (m) of
             // комманда SET 1-ое поле
             1:  begin CURFLD:=IntToStr(i); end;
             // комманда SET 3-е  поле
             3:  begin CURFLD:='#'+IntToStr(i); end;
           end;
           r:=1; break;
        end;
    end;
    result:=r;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TCFile.ReadConfigFile;
const
//----------------------------------------------------------------------------
//   1     2     3     4     5     6      7
// CMD  NDBB  NSRV  NCHR  TYPE  NAME      REMARK
// DBB     0     3    17   DBL  NetLive   Флаг состояния работы сети
   REMFLD     = 7;              // номер поля коментария (последнее)
   READFILESZ = 200000;         // размер буфера чтения файла
   READFILESI = 100000;         // размер буфера чтения файла
   LENSTR     = 200;            // макс длинна считанной строки
   LENFLD     = 100;            // макс длинна поля

var
    a, c, b, f, r, i, t, bs, hi, sl, el, x, y, z, fh, hb  : integer;
    cs       : char;                             // текущий обрабатываемый символ
    READBUF  : array [0..READFILESZ] of char;    // буфер чтения файла
    READBUI  : array [0..READFILESI] of char;    // буфер чтения файла включения
    TMPFLD   : string;                           // буфер текущего поля
    EXSTRCHNAME  : string;           // исключаемая строка из имен каналов
    SETCH    : integer;              // тестовая установка значений на канале
    CURDBB   : integer;              // текущий элемент массива DBB

begin

    a:=-1; c:=0; b:=1; f:=0; r:=0; i:=0; t:=0; bs:=0; hi:=0; sl:=0; el:=0;
    x:= 0; y:=0; z:=0; THOWC:=0; CURDBB:=0; SETCH:=0;

   //-------------------------------------------------------------------------
   //  чтение файла конфигурации
   fh:=FileOpen('pCodus.cfc', 0);
   if(fh<0) then begin exit; end;
   hb:=FileRead(fh, READBUF, READFILESZ);
   FileClose(fh);

   //-------------------------------------------------------------------------
   // обработка считанного буфера
   while True do begin
       a:=a+1;   if(a>=hb) then begin break; end;
       cs:= READBUF[a];
       // начальные пробелы не учитывать
       if (cs<=chr(32)) and (bs=0) then begin
           continue;
       end else begin
           bs:=1;
       end;
       // если текущий символ разделитель поля
       if((cs=chr(32)) or (cs=chr(10)) or (cs=chr(0)) or (cs=chr(61))) and ((c=0) and (r=0)) then
       begin
          CURFLD[b]:=chr(0); c:=1;
          //------------------------------------------------------------------
          // если это поле комманды - запомнить его
          if(f=0) then begin CURCMD:=Copy(CURFLD,0,LENFLD-1); end;
          //------------------------------------------------------------------
          // если это поле 1-го парамметра
          if(f=1) then begin
             // TCP адрес сервера (куда делается запрос)
             if(CURCMD='TCPADDR'   ) then begin
                TCPADR:=Copy(CURFLD,0,Length(CURFLD));
             end;
             // TCP порт через который делается запрос на удаленные машины
             if(CURCMD='TCPPORTC'  ) then begin
                TCPPORT:=Copy(CURFLD,0,Length(CURFLD));
             end;
             // Период запроса данных по TCP в мс
             if(CURCMD='TCPPREQ'   ) then begin
                i:= StrToInt(CURFLD);
                if(i<10)or(i>200000) then begin i:=500; end; TCPPREQ:=i;
             end;
             // Кол-во неответов сервера для переподключения клиента
             if(CURCMD='TCPCRTO'   ) then begin
                i:=StrToInt(CURFLD);
                if(i<20) or (i>5000) then begin i:=100; end; TCPCRTO:=i;
             end;

             // исключаемая строка из имен каналов
             if(CURCMD='EXSTRCHNAME') then begin
                if(Length(CURFLD)>0 ) then begin
                   EXSTRCHNAME:=Copy(CURFLD,0,Length(CURFLD));
                end;
             end;

             // установка значений на каналах
             if(CURCMD='SET'        ) then begin
                i:=1;
                // если канал определен по имени- найти его номер
                if(CURFLD[1]='$') then begin i:=GetChNum(1); end;
                if(i>0) then begin
                   i:= StrToInt(CURFLD);
                   if(i< 0    ) then begin i:=0; end;
                   if(i>=DBBSZ) then begin i:=DBBSZ-1; end; SETCH:=i;
                // если номер не найден- дальше комманду игнорируем
                end else begin
                   CURCMD[1]:=chr(0);
                end;
             end;

             // признак конца файла описания
             if(CURCMD='END'    ) then begin break; end;

             // добавление к буферу дополнительного файла описания
             if(CURCMD='INCLUDE') then begin
                if(FileExists(CURFLD)=True) then begin
                   // открыть указанный во втором поле файл
                   fh:=FileOpen(CURFLD, 0);
                   if (fh>=0) then begin
                       hi:=FileRead(fh, READBUI, READFILESI);
                       FileClose(fh);
                       if(hb+hi<READFILESZ) and (hi>0) then begin
                          READBUI[hi]:=chr(0);
                          for i:=0 to hi do begin READBUF[hb+i]:=READBUI[i]; end;
                          hb:=hb+i;
                       end;
                   end;
                end;
             end;
          end;

          //------------------------------------------------------------------
          // если это поле 2-го парамметра
          if(f=2) then begin
             // определение знака установки значений на канале
             if(CURCMD='SET') then begin
                if(CURFLD[1]='#') or (CURFLD[1]='-') or (CURFLD[1]='+') or
                  (CURFLD[1]='*') or (CURFLD[1]='/') or (CURFLD[1]='!') or
                  (CURFLD[1]='m') then begin
                   DBZ[SETCH]:=CURFLD[1];
                // если неизвестный знак- никаких действий дальше не выполняем
                end else begin
                   CURCMD[1]:=chr(0); SetLength(CURCMD,0);
                end;
             end;
          end;
          //------------------------------------------------------------------
          // если это поле 3-го парамметра
          if(f=3) then begin
             // установка значений на канале 3-е поле - это второй операнд
             if(CURCMD='SET') then begin
                i:=1;
                // если значение определено именем канала
                if(CURFLD[1]='$') then begin i:=GetChNum(3); end;
                if(i>0) then begin
                   // если это значение определено по номеру канала
                   if(CURFLD[1] ='#') then begin
                      CURFLD[1]:=' ';
                      DBV[SETCH]:= StrToFloat(CURFLD);
                      DBF[SETCH]:= 2;
                   end else begin
                      DBV[SETCH]:= StrToFloat(CURFLD);
                      DBF[SETCH]:= 1;
                   end;
                end;
             end;
          end;
          //------------------------------------------------------------------
          // если это комманда заполнения массива DBB
          if(CURCMD='DBB') and (f>0) then begin
             // номер текущего элемента массива DBB
             if(f=1) then begin
                CURDBB:=StrToInt(CURFLD);
                if(CURDBB<0) or (CURDBB>DBBSZ) then begin CURDBB:=0; end;
             end;
             // номер компьютера на который делается запрос
             if(f=2) then begin
                i:=StrToInt(CURFLD); t:=i;
             end;
             // номер канала на удаленном компьютере
             if(f=3) then begin
                i:= StrToInt(CURFLD);
                // номер какнала на локальном компьютере
                TCHN[THOWC]:=CURDBB;
                // номер какнала на удаленном компьютере
                TCHR[THOWC]:=i;
                if(THOWC<DBBSZ) then begin THOWC:=THOWC+1; end;
             end;
             // тип канала
             if(f=REMFLD-3) then begin DBBT[CURDBB]:=CURFLD; end;
             // имя канала
             if(f=REMFLD-2) then begin
                sl:=Length(CURFLD);
                el:=Length(EXSTRCHNAME);
                // проверка на присутствие исключаемой строки
                if(el>0) and (Pos(EXSTRCHNAME,CURFLD)>0) then begin
                   x:=1; y:=-1;
                   for i:=0 to sl do begin
                       y:=y+1;  if(y>=sl) then break;
                       for z:=1 to el do begin
                           if(CURFLD[y+z]<>EXSTRCHNAME[z]) then begin break; end;
                       end;
                       // если нашли в имени канала исключаемую строку-
                       // переходим на конец этой строки
                       if(z=el) then begin y:=y+el-1; continue; end;
                       // записываем имя канала в TMPFLD
                       if(x>Length(TMPFLD)) then begin SetLength(TMPFLD,Length(TMPFLD)+1); end;
                       TMPFLD[x]:=CURFLD[y]; SetLength(TMPFLD,x);
                       if(x<sl) then begin x:=x+1; end;
                   end;
                   DBBN[CURDBB]:=Copy(TMPFLD,0,Length(TMPFLD));
                end else  begin
                   DBBN[CURDBB]:=Copy(CURFLD,0,Length(CURFLD));
                end;
             end;
          end;
          //------------------------------------------------------------------
          // переход к следующему полю
          f:=f+1;
          //------------------------------------------------------------------
       end;
       // если это конец строки
       if(cs=chr(10)) or (cs=chr(0)) then begin
          // если это последнее поле (комментарий) в комманде DBB
          if(f>REMFLD-1) then begin DBBR[CURDBB]:=Copy(CURFLD,0,Length(CURFLD)); end;
          // обнулить флаги
          bs:=0; b:=1; f:=0; r:=0; continue;
       end;
       // если это строка комментария
       if (cs=';') then begin r:=1; end;
       // служебные символы - пропустить
       if (cs<chr(32)) or (r=1) then begin continue; end;
       // кроме поля примечания - пробелы не учитывать
       if((cs=chr(32)) or (cs='=')) and (f<REMFLD) then begin b:=1; continue; end;
       // заполнение буфера текщего поля
       if (b<LENFLD-1) then begin
           if(b>Length(CURFLD)) then begin SetLength(CURFLD,Length(CURFLD)+1); end;
           CURFLD[b]:=cs; SetLength(CURFLD,b); b:=b+1;
       end;
       c:=0;
   end;
end;
//--------------------------------------------------------------------------


end.
//--------------------------------------------------------------------------
