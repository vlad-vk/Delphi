//-----------------------------------------------------------------------------
//  Отображение значений и представлений на мнемосхемах
unit ufmGrifik;
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons, ComCtrls, TimerLst,IniFiles, AppEvnts;

type
  TfmGrafik = class(TForm)
    book: TNotebook;
    auto: TImage;
    Image2: TImage;
    aiw61: TEdit;
    aiw62: TEdit;
    AIW65: TEdit;
    DIS11: TShape;
    DIS08: TShape;
    DIS05: TShape;
    DIS38: TShape;
    DIS37: TShape;
    DIS36: TShape;
    DIS41: TShape;
    DIS40: TShape;
    DIS39: TShape;
    DIS42: TShape;
    DIS02: TShape;
    DIS26: TShape;
    DIS24: TShape;
    DIS25: TShape;
    DIS22: TShape;
    DIS23: TShape;
    DIS18: TShape;
    DIS54: TShape;
    DIS16: TShape;
    DIS14: TShape;
    DIS90____V: TShape;
    DIM17: TShape;
    DIL17: TShape;
    DIH20: TShape;
    DIL20: TShape;
    DIH21: TShape;
    DIL21: TShape;
    DIH15: TShape;
    DIM15: TShape;
    DIH13: TShape;
    DIM13: TShape;
    DIH01: TShape;
    DIH19: TShape;
    DIM19: TShape;
    DIL19: TShape;
    DIH06: TShape;
    DIH09: TShape;
    DIS28: TShape;
    DIS28_2: TShape;
    i: TRxTimerList;
    Timer_01: TRxTimerEvent;
    DIH03: TShape;
    A_DIR09: TLabel;
    A_DIR06: TLabel;
    A_DIR38: TLabel;
    A_DIR37: TLabel;
    D_DIR54: TLabel;
    A_DIR22: TLabel;
    A_DIR18: TLabel;
    D_DIR02: TLabel;
    A_DIR03: TLabel;
    A_DIR23: TLabel;
    A_DIR51: TLabel;
    DIS27: TShape;
    DIS28_1: TShape;
    A_DIR19: TLabel;
    D_DIR55: TLabel;
    A_DIR36: TLabel;
    A_DIR41: TLabel;
    A_DIR40: TLabel;
    D_DIR56: TLabel;
    A_DIR39: TLabel;
    A_DIR66: TLabel;
    A_DIR16: TLabel;
    A_DIR14: TLabel;
    A_DIR50: TLabel;
    A_DIR53: TLabel;
    a4_f_par: TEdit;
    a3_f_par: TEdit;
    a4_h_cond: TEdit;
    a3_h_cond: TEdit;
    a4_p_par: TEdit;
    a3_p_par: TEdit;
    a1_f_par: TEdit;
    a2_f_par: TEdit;
    a1_h_cond: TEdit;
    a2_h_cond: TEdit;
    a1_p_par: TEdit;
    a2_p_par: TEdit;
    a4_klp_par_in: TEdit;
    a4_t: TEdit;
    a4_t_top: TEdit;
    a4_t_bottom: TEdit;
    a4_klp_par_out: TEdit;
    a3_klp_par_in: TEdit;
    a3_t: TEdit;
    a3_t_top: TEdit;
    a3_t_bottom: TEdit;
    a3_klp_par_out: TEdit;
    a2_t: TEdit;
    a2_t_top: TEdit;
    a2_t_bottom: TEdit;
    a2_klp_par_out: TEdit;
    a1_klp_par_in: TEdit;
    a1_t: TEdit;
    a1_t_top: TEdit;
    a1_t_bottom: TEdit;
    a1_klp_par_out: TEdit;
    ST1032: TShape;
    Image3: TImage;
    ST1033: TShape;
    ST1036: TShape;
    ST1072: TShape;
    ST1073: TShape;
    ST1076: TShape;
    ST1077: TShape;
    ST1132: TShape;
    ST1133: TShape;
    ST1136: TShape;
    ST1137: TShape;
    ST1172: TShape;
    ST1173: TShape;
    ST1176: TShape;
    ST1177: TShape;
    ST1034: TShape;
    ST1035: TShape;
    ST1071: TShape;
    ST1075: TShape;
    ST1074: TShape;
    ST1078: TShape;
    ST1134: TShape;
    ST1131: TShape;
    ST1135: TShape;
    ST1138: TShape;
    ST1171: TShape;
    ST1174: TShape;
    ST1175: TShape;
    ST1178: TShape;
    Image_bayonet4: TImage;
    DIC59: TShape;
    DOL12: TShape;
    A_DIR12: TLabel;
    A_DIRX1: TLabel;
    DIH15N4V1: TShape;
    DIH15N3V1: TShape;
    DIH15N2V1: TShape;
    DIH15N1V1: TShape;
    DISX1: TShape;
    DIC58: TShape;
    DOL09: TShape;
    DIC57: TShape;
    DOL06: TShape;
    DIOX1: TShape;
    DOLX1V: TShape;
    DOM06: TShape;
    DOM09: TShape;
    O_DIR16RRV: TLabel;
    DOC55V: TShape;
    DOM54V: TShape;
    DOL54V: TShape;
    O_DIR20RRV: TLabel;
    DIH54: TShape;
    DOL22: TShape;
    DOM22: TShape;
    DOM23: TShape;
    AIW62RRV: TLabel;
    O_DIR14RRV: TLabel;
    DOL03: TShape;
    DOM03: TShape;
    DOL62V: TShape;
    DOL23: TShape;
    DON54V: TShape;
    DIH60: TShape;
    DOL60V: TShape;
    O_DIR21RRV: TLabel;
    DOM60V: TShape;
    DOC56V: TShape;
    AIT66_RV: TLabel;
    DIC66: TShape;
    DOC19: TShape;
    DIS82____V: TShape;
    O_DIR19RRV: TLabel;
    DOL61: TShape;
    AIW61RRV: TLabel;
    DOM15V: TShape;
    DOL15V: TShape;
    DOL13: TShape;
    DOM13: TShape;
    DOM61: TShape;
    _DIS60: TShape;
    _DIS60_: TShape;
    DIR31: TLabel;
    DIS87____V: TShape;
    DIS86____V: TShape;
    AIW65RRV: TLabel;
    DIS88____V: TShape;
    DOVZM: TShape;
    DOSMM: TShape;
    DOPDM: TShape;
    zv: TImage;
    ST1037: TShape;
    a12_p_gp: TEdit;
    ST1031: TShape;
    Image_homut: TImage;
    Image_SBP: TImage;
    Image_homut3: TImage;
    Image_krish3: TImage;
    Image_SBP3: TImage;
    Image_bayonet3: TImage;
    Image_homut2: TImage;
    Image_krish2: TImage;
    Image_bayonet2: TImage;
    Image_SBP2: TImage;
    Image_homut1: TImage;
    Image_krish1: TImage;
    Image_bayonet1: TImage;
    Image_SBP1: TImage;
    Image_krish4: TImage;
    Image_homut2l: TImage;
    Image_homut1l: TImage;
    Image_krish2l: TImage;
    Image_krish1l: TImage;
    Image_bayonet2l: TImage;
    Image_bayonet1l: TImage;
    Image_SBP2l: TImage;
    Image_SBP1l: TImage;
    a2_klp_par_in: TEdit;
    a1_klp_cond_out: TEdit;
    a2_klp_cond_out: TEdit;
    a3_klp_cond_out: TEdit;
    a4_klp_cond_out: TEdit;
    a1_t_tbr: TEdit;
    a2_t_tbr: TEdit;
    a3_t_tbr: TEdit;
    a4_t_tbr: TEdit;
    a1stepw: TLabel;
    a2stepw: TLabel;
    a3stepw: TLabel;
    a4stepw: TLabel;
    a5stepw: TLabel;
    a6stepw: TLabel;
    Image_bayonet5l: TImage;
    Image_bayonet5: TImage;
    Image_bayonet6l: TImage;
    Image_bayonet6: TImage;
    Image_krish5l: TImage;
    Image_krish5: TImage;
    Image_homut5l: TImage;
    Image_homut5: TImage;
    Image_SBP5l: TImage;
    Image_SBP5: TImage;
    Image_krish6l: TImage;
    Image_krish6: TImage;
    Image_homut6l: TImage;
    Image_homut6: TImage;
    Image_SBP6l: TImage;
    Image_SBP6: TImage;
    Image1: TImage;
    Image4: TImage;
    ST1222: TShape;
    ST1223: TShape;
    ST1224: TShape;
    ST1225: TShape;
    ST1226: TShape;
    ST1227: TShape;
    ST1221: TShape;
    ST1228: TShape;
    ST1261: TShape;
    ST1262: TShape;
    ST1264: TShape;
    ST1265: TShape;
    ST1268: TShape;
    ST1263: TShape;
    ST1266: TShape;
    ST1267: TShape;
    a5_klp_par_in: TEdit;
    a5_t: TEdit;
    a5_klp_par_out: TEdit;
    a5_p_par: TEdit;
    a5_t_top: TEdit;
    a5_t_bottom: TEdit;
    a5_t_tbr: TEdit;
    a5_klp_cond_out: TEdit;
    a5_h_cond: TEdit;
    a5_f_par: TEdit;
    a6_f_par: TEdit;
    a6_klp_par_in: TEdit;
    a6_p_par: TEdit;
    a6_t: TEdit;
    a6_t_top: TEdit;
    a6_klp_par_out: TEdit;
    a6_t_bottom: TEdit;
    a6_t_tbr: TEdit;
    a6_klp_cond_out: TEdit;
    a6_h_cond: TEdit;
    a_p_vacuum: TEdit;
    a_p_pg: TEdit;
    a_t_pg: TEdit;
    ST1038: TShape;
    AIT103A__V: TEdit;
    AIT104A__V: TEdit;
    AIT105A__V: TEdit;
    AIT106A__V: TEdit;
    AIT101A__V: TEdit;
    AIT102A__V: TEdit;
    AIT107A__V: TEdit;
    AIT108A__V: TEdit;
    DIS81____V: TShape;
    DIS83____V: TShape;
    DIS89____V: TShape;
    DIS84____V: TShape;
    DIS85____V: TShape;
    DIV89____V: TShape;
    DIV90____V: TShape;
    DIV89____R: TShape;
    DIV90____R: TShape;
    AIT110A__V: TEdit;
    PsV: TEdit;
    PoV: TEdit;
    Image5: TImage;
    DIS213B__V: TShape;
    DIS213C__V: TShape;
    DIS213A__V: TShape;
    DIS211KB_V: TShape;
    DIS211KC_V: TShape;
    DIS211KA_V: TShape;
    DIS2032__V: TShape;
    DIS2031__V: TShape;
    DIS2012__V: TShape;
    DIS2011__V: TShape;
    DIS212N__V: TShape;
    DIS064P__V: TShape;
    DIS065P__V: TShape;
    DIS056P__V: TShape;
    DIS057P__V: TShape;
    DIS206N__V: TShape;
    DIS203N__V: TShape;
    DIS068P__V: TShape;
    DIS069P__V: TShape;
    DIS043A__V: TShape;
    DIS044A__V: TShape;
    DIS045A__V: TShape;
    DIS046A__V: TShape;
    DIS046B__V: TShape;
    DIS045B__V: TShape;
    DIS044B__V: TShape;
    DIS043B__V: TShape;
    DIS064B__V: TShape;
    DIS064A__V: TShape;
    DIS064E__V: TShape;
    DIS065A__V: TShape;
    DIS065B__V: TShape;
    DIS065E__V: TShape;
    DIS056A__V: TShape;
    DIS056E__V: TShape;
    DIS057A__V: TShape;
    DIS057E__V: TShape;
    DIS251C1_V: TShape;
    DIS251E1_V: TShape;
    DIS064C__V: TShape;
    DIS251B1_V: TShape;
    DIS065C__V: TShape;
    DIS251F1_V: TShape;
    DIS251C2_V: TShape;
    DIS251E2_V: TShape;
    DIS251B2_V: TShape;
    DIS056C__V: TShape;
    DIS251F2_V: TShape;
    DIS057C__V: TShape;
    DIS251H2_V: TShape;
    DIS251G2_V: TShape;
    DIS280S__V: TShape;
    DISVGBMG_V: TShape;
    DIS220F__V: TShape;
    DISVGBMR_V: TShape;
    DIS221D__V: TShape;
    DIS228B__V: TShape;
    DIS228D__V: TShape;
    DIS221B__V: TShape;
    DIS229B1_V: TShape;
    DIS229D1_V: TShape;
    DIS229B2_V: TShape;
    DIS229D2_V: TShape;
    DIS221F__V: TShape;
    DIS2131__V: TShape;
    DIS204B__V: TShape;
    DIS204A__V: TShape;
    DIS2071__V: TShape;
    DIS2072__V: TShape;
    DIS091A__V: TShape;
    DIS092A__V: TShape;
    DIS092K__V: TShape;
    DIS251H1_V: TShape;
    DIS251G1_V: TShape;
    DIS216G__V: TShape;
    DIS210P__V: TShape;
    DIS210R__V: TShape;
    DIS210W__V: TShape;
    DIS210O__V: TShape;
    DIS210S__V: TShape;
    DIS210T__V: TShape;
    DIS216F__V: TShape;
    DIS068D__V: TShape;
    DIS068B__V: TShape;
    DIS069B__V: TShape;
    DIS068C__V: TShape;
    DIS069C__V: TShape;
    DIS068E__V: TShape;
    DIS069E__V: TShape;
    AIT064___V: TEdit;
    AIT065___V: TEdit;
    AIT056___V: TEdit;
    AIT057___V: TEdit;
    AIT231___V: TEdit;
    AIT233___V: TEdit;
    AIT091___V: TEdit;
    AIT092___V: TEdit;
    AIT068___V: TEdit;
    AIT069___V: TEdit;
    AIT202___V: TEdit;
    AIL064A__V: TEdit;
    AIL065A__V: TEdit;
    AIL056A__V: TEdit;
    AIL057A__V: TEdit;
    AIL006A__V: TEdit;
    AIL003A__V: TEdit;
    AIW252___V: TEdit;
    AIW218___V: TEdit;
    AIW216___V: TEdit;
    DIR211___V: TLabel;
    DIR213___V: TLabel;
    DIS090S__V: TLabel;
    DIS080___V: TLabel;
    DIS049A__V: TLabel;
    DIS049B__V: TLabel;
    DIR207___V: TLabel;
    DIR219___V: TLabel;
    DIR216___V: TLabel;
    DIR251___V: TLabel;
    REG01R___V: TLabel;
    REG02R___V: TLabel;
    REG03R___V: TLabel;
    REG04R___V: TLabel;
    REG05R___V: TLabel;
    REG06R___V: TLabel;
    REG07R___V: TLabel;
    REG09R___V: TLabel;
    OBJSB1___V: TShape;
    OBJSB2___V: TShape;
    OBJSB3___V: TShape;
    OBJSB4___V: TShape;
    OBJS64___V: TShape;
    OBJS65___V: TShape;
    OBJS56___V: TShape;
    OBJS57___V: TShape;
    OBJM64___V: TShape;
    OBJM65___V: TShape;
    OBJM56___V: TShape;
    OBJM57___V: TShape;
    OBJAS1___V: TShape;
    OBJAS2___V: TShape;
    DIS213V__V: TShape;
    DIS211NV_V: TShape;
    DIS213N__V: TShape;
    DIS204D__V: TShape;
    DIS207N__V: TShape;
    DIS092N__V: TShape;
    DIS266E__V: TShape;
    DIS258E__V: TShape;
    DIS069D__V: TShape;
    DIS210N__V: TShape;
    DIR210___V: TLabel;
    DISGG1___V: TShape;
    DISGG2___V: TShape;
    DIH212___V: TShape;
    DIM212___V: TShape;
    DIL212___V: TShape;
    DIS092H__V: TShape;
    DIS092M__V: TShape;
    DIS092L__V: TShape;
    DIS091H__V: TShape;
    DIS091M__V: TShape;
    DIS091L__V: TShape;
    DIS210V__V: TShape;
    DIS210U__V: TShape;
    DIS031L__V: TShape;
    DIS031M__V: TShape;
    DIS031H__V: TShape;
    DIS033L__V: TShape;
    DIS033M__V: TShape;
    DIS033H__V: TShape;
    DIS068L__V: TShape;
    DIS068M__V: TShape;
    DIS068H__V: TShape;
    DIS069L__V: TShape;
    DIS069M__V: TShape;
    DIS069H__V: TShape;
    M12C06___V: TEdit;
    M12C07___V: TEdit;
    AIL057A__B: TProgressBar;
    AIL056A__B: TProgressBar;
    AIL064A__B: TProgressBar;
    AIL065A__B: TProgressBar;
    AIL003A__B: TProgressBar;
    AIL006A__B: TProgressBar;
    M12C06A__B: TProgressBar;
    M12C07A__B: TProgressBar;
    DIS75M2: TShape;
    DIS75P1: TShape;
    DIS75P2: TShape;
    DIS75PV1: TShape;
    DIS75PV2: TShape;
    DIH75M2: TShape;
    DIM75M2: TShape;
    AIT75M2: TEdit;
    DIS75DV1: TShape;
    DIS75DV2: TShape;
    DIS75D1: TShape;
    DIS75D2: TShape;
    DIS891: TShape;
    DIS892: TShape;
    DIS901: TShape;
    DIS902: TShape;
    DIS98: TShape;
    DIS890: TShape;
    AIL89: TEdit;
    AIL90: TEdit;
    AIL89_A__B: TProgressBar;
    AIL90_A__B: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure timer_masivTimer(Sender: TObject);
    procedure Timer_01Run(Sender: TObject);
    procedure First_in_Run();
      
  private

  public

  end;

var
  fmGrafik     : TfmGrafik;

implementation

uses ufmStForm, Math, vPub;

{$R *.dfm}


//----------------------------------------------------------------------------
procedure TfmGrafik.First_in_Run();
begin
{ ... }
end;
//----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
procedure TfmGrafik.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Action:=cafree;
end;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
procedure TfmGrafik.FormDestroy(Sender: TObject);
begin
fmGrafik:=nil;
end;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
procedure TfmGrafik.Button1Click(Sender: TObject);
begin
  { ... }
end;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
procedure TfmGrafik.timer_masivTimer(Sender: TObject);
begin
//button1.Click;
end;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
function PADL(Src: string; Lg: Integer): string;
begin
  Result := Src;
  while Length(Result) < Lg do
    Result := ' ' + Result;
end;
//-----------------------------------------------------------------------------


//-----------------------------------------------------------------------------
procedure TfmGrafik.Timer_01Run(Sender: TObject);
var
    a,b,i,j,m         : integer;
    F,s,z,s3,s4,s5,s6 : string;
begin
    if (DBB[212]=0) and (DBB[214]=0) then
    begin
        Exit;
    end;
    // Ввод номера канала и вывод его значения (для теста, закомментировать)
    // Для теста надо создать два Edit-а: Edit1 и Edit2
    // if(StrLen(PChar(Edit1.Text))<1) then Edit1.Text:='0';
    // i:=StrToInt(Trim(PChar(Edit1.Text)));
    // if(i>0) and (i<DBBSZ) then Edit2.Text:=Copy(FloatToStr(dbb[i]),1,5)
    // else Edit2.Text:='???';
    // Обработка всех переменных по компонентам:
    //-----------------------------------------------------------------------
    for j := 0 to self.ComponentCount - 1 do
    begin
        i:=self.Components[j].Tag;
        //-------------------------------------------------------------------
        //  прорисовка ProgressBar-ов идет параллельно с TEdit, поэтому
        //  "continue" и переприсвоение dbbp не делаем
        if (self.Components[j] is TProgressBar) then
        begin
            // в поле tag д.б. записан номер в массиве DBB[]
            if (i>0) and (i<DBBSZ) then begin
               s4:=Trim(copy(TProgressBar(self.Components[j]).Name,7,4));
               if (s4='A__B') then
               begin
                   if(dbb[i]<0) then dbb[i]:=0; if(dbb[i]>100) then dbb[i]:=100;
                   TProgressBar(self.Components[j]).Position:=Round(dbb[i]);
               end;
               //  вывод в подсказке номера канала
               TProgressBar(self.Components[j]).Hint:='Номер канала [EDT]: '+
               IntToStr(TProgressBar(self.Components[j]).Tag)+' : '+
               TProgressBar(self.Components[j]).Name;
            end;
        end;
        //-------------------------------------------------------------------
        // присваивание значений эдитам
        if (self.Components[j] is TEdit) then
        begin
            if(i>0) and (i<DBBSZ) and (dbb[i]<>dbbp[i]) then begin
               s:=Trim(copy(TEdit(self.Components[j]).Name,1,10));
               if(TEdit(self.Components[j]).Font.Size>11) then a:=6 else a:=6;
               // Дозировка 1
               if(i<300) then begin
                  z:=IntToStr(Round(DBB[i]));
                  if((i=1)or(i=2)) then begin
                      z:=Copy(FloatToStr(DBB[i]),1,3); a:=3;
                  end;
                  if((i=246)or(i=247)) then begin
                      z:=Copy(FloatToStr(DBB[i]),1,4);
                  end;
                  b:=4-StrLen(PChar(z)); // a+b: выравнивание пробелами
                  TEdit(self.Components[j]).Text:=PADL(z,a+b);
               end;
               // Дозировка 2
               if(i>300) and (i<600) then begin
                  if(s='M12C06___V') or (s='M12C07___V') then a:=4;
                  if(i=538) then begin
                     z:=Copy(FloatToStr(DBB[i]),1,4);
                     if(StrLen(PChar(z))< 3) then z:=z+' ';
                  end else begin
                     z:=IntToStr(Round(DBB[i])); z:=z+' ';
                  end;
                  b:=4-StrLen(PChar(z)); // a+b: выравнивание пробелами
                  TEdit(self.Components[j]).Text:=PADL(z,a+b);
               end;
               // Автоклавы
               if(i>1000) then begin
                  if((i=1001)or(i=1002)) then begin
                      z:=Copy(FloatToStr(DBB[i]),1,4);
                  end else begin
                      z:=IntToStr(Round(DBB[i]));
                  end;
                  b:=4-StrLen(PChar(z)); // a+b: выравнивание пробелами
                  TEdit(self.Components[j]).Text:=PADL(z,a+b);
               end;
               //  вывод в подсказке номера канала
               TEdit(self.Components[j]).Hint:='Номер канала [EDT]: '+
               IntToStr(TEdit(self.Components[j]).Tag);
            end;
            dbbp[i]:=dbb[i];
            continue;
        end;
        //-------------------------------------------------------------------
        //  присваивание цветов шейпам
        if (self.Components[j] is TShape) then
        begin
            // в поле tag записан номер в массиве DBB[]
            if (i>0) and (i<DBBSZ) and (dbb[i]<>dbbp[i]) then begin
            dbbp[i]:=dbb[i];
            s3:=copy((TShape(self.Components[j]).Name),1,3);
            s4:=copy((TShape(self.Components[j]).Name),1,4);
            s6:=copy((TShape(self.Components[j]).Name),7,4);
            s:=Trim(copy(TShape(self.Components[j]).Name,1,10));
            //  вывод в подсказке номера канала
            TShape(self.Components[j]).Hint:='Номер канала [EDT]: '+
            IntToStr(TShape(self.Components[j]).Tag);

            // ДОЗИРОВКА N2
            if(i>300) and (i<600) then begin
            //  насосы
            if (s='DIS213N__V') or (s='DIS204D__V') or (s='DIS211NV_V') or
               (s='DIS213V__V') or (s='DIS266E__V') or (s='DIS258E__V') or
               (s='DIS092N__V') or (s='DIS207N__V') or (s='DIS069D__V') or
               (s='DIS210N__V') then
            begin
               if dbb[i]=0 then  TShape(self.Components[j]).Brush.Color:=clMedGray;
               if dbb[i]=1 then  TShape(self.Components[j]).Brush.Color:=clGreen;
               continue;
            end;
            //  уровни
            if (s3='DIL' ) or (s3='DIM' ) or (s3='DIH' ) or
               (s='DIS210U__V') or (s='DIS210V__V') or
               (s6='L__V') or (s6='M__V') or (s6='H__V') then
            begin
               if dbb[i]=0 then  TShape(self.Components[j]).Brush.Color:=clGray;
               if dbb[i]=1 then  TShape(self.Components[j]).Brush.Color:=clNavy;
               continue;
            end;
            end;

            //  выбор мешалок
            if (s3='OBJ') or (s4='DISG') then begin
               if dbb[i]=0 then  TShape(self.Components[j]).Brush.Color:=clWhite;
               if dbb[i]=1 then  TShape(self.Components[j]).Brush.Color:=clGreen;
               continue;
            end;
            //  выбор мешалок обр шлама
            if (i=12) or  (i=22) then begin
               if (s='DIS75PV1') then begin
                      DIS75PV1.Brush.Color:=clSilver;DIS75PV2.Brush.Color:=clGreen;
                   if (dbb[i]=0) then begin
                      DIS75PV1.Brush.Color:=clGreen; DIS75PV2.Brush.Color:=clSilver;
               end;end;
               if (s='DIS75DV1') then begin
                      DIS75DV1.Brush.Color:=clSilver;DIS75DV2.Brush.Color:=clGreen;
                   if (dbb[i]=0) then begin
                      DIS75DV1.Brush.Color:=clGreen; DIS75DV2.Brush.Color:=clSilver;
               end;end;
               continue;
            end;

            //  клапана ДОЗИРОВКИ 1,2
            if (s3='DIS') or (s3='DOL') or (s3='DIC') or (s3='DIO') or
               (s3='DOK') or (s3='DOM') or (s3='DON') or (s3='DOC') then
            begin
               if dbb[i]=0 then  TShape(self.Components[j]).Brush.Color:=$005400A8;
               if dbb[i]=1 then  TShape(self.Components[j]).Brush.Color:=$0000AA00;
               continue;
            end;
            //  выбор мешалок
            if (s3='DIV') then begin
               if dbb[i]=0 then  TShape(self.Components[j]).Brush.Color:=clGray;
               if dbb[i]=1 then  TShape(self.Components[j]).Brush.Color:=clGreen;
               continue;
            end;
            //  уровни ДОРЗИРОВКИ
            if (s3='DIH') or (s3='DIM') or (s3='DIL') then
            begin
               if dbb[i]=0 then  TShape(self.Components[j]).Brush.Color:=$00A00000;
               if dbb[i]=1 then  TShape(self.Components[j]).Brush.Color:=$00C080FF;
               continue;
            end;
            // положение задвижек АВТОКЛАВОВ
            if (s3='red')   then
            begin
                if dbb[i]=0 then  TShape(self.Components[j]).Visible:=true;
                if dbb[i]=1 then  TShape(self.Components[j]).Visible:=false;
                continue;
            end;
            if (s4='gren')  then
            begin
                if dbb[i]=1 then  TShape(self.Components[j]).Visible:=true;
                if dbb[i]=0 then  TShape(self.Components[j]).Visible:=false;
                continue;
            end;
            if (s3='ST1') then
            begin
                TShape(self.Components[j]).Visible:=true;
                TShape(self.Components[j]).Brush.Color:=clWhite;
                TShape(self.Components[j]).Pen.Color  :=clWhite;
                if DBB[i]=0 then begin
                   TShape(self.Components[j]).Brush.Color:=clRed;
                   TShape(self.Components[j]).Pen.Color  :=clRed;
                   continue;
                end;
                if DBB[i]=1 then begin
                   TShape(self.Components[j]).Brush.Color:=clYellow;
                   TShape(self.Components[j]).Pen.Color  :=clYellow;
                   continue;
                end;
                if DBB[i]=2 then begin
                   TShape(self.Components[j]).Brush.Color:=clLime;
                   TShape(self.Components[j]).Pen.Color  :=clLime;
                   continue;
                end;
            end;
            end;
            continue;
        end;
        //-------------------------------------------------------------------
        // присваивания значений лейблам
        if (self.Components[j] is Tlabel) then
        begin
            if (i>0) and (i<DBBSZ) and (dbb[i]<>dbbp[i]) then begin
               s3:=copy((Tlabel(self.Components[j]).Name),1,3);
               s5:=copy((Tlabel(self.Components[j]).Name),1,5);
               s6:=copy((Tlabel(self.Components[j]).Name),1,6);
               // Дозировка 1
               if (i<300) then begin
               dbbp[i]:=dbb[i];
               if (s5='D_DIR') then
               begin
                   if dbb[i]=0 then  Tlabel(self.Components[j]).Caption:='М';
                   if dbb[i]=1 then  Tlabel(self.Components[j]).Caption:='Д';
                   continue;
               end;
               if (s5='A_DIR') then
               begin
                   if dbb[i]=0 then  Tlabel(self.Components[j]).Caption:='Р';
                   if dbb[i]=1 then  Tlabel(self.Components[j]).Caption:='А';
                   continue;
               end;
               if (s5='O_DIR') or (s3='AIW') or (s3='AIT') then
               begin
                   if dbb[i]=0 then  Tlabel(self.Components[j]).Caption:='О';
                   if dbb[i]=1 then  Tlabel(self.Components[j]).Caption:='K';
                   continue;
               end;
               end;

               // Дозировка 2
               if (i>300) and (i<600) then begin
                 dbbp[i]:=dbb[i];
                 if (s3='DIR') or(s6='DIS090') or(s6='DIS080') or(s6='DIS049')
                 then begin
                    if dbb[i]=0 then  Tlabel(self.Components[j]).Caption:='П';
                    if dbb[i]=1 then  Tlabel(self.Components[j]).Caption:='Н';
                    continue;
                 end;
                 if (s3='REG') then begin
                    if dbb[i]=0 then  Tlabel(self.Components[j]).Caption:='O';
                    if dbb[i]=1 then  Tlabel(self.Components[j]).Caption:='K';
                    continue;
                 end;
               end;

               // Автоклавы
               if (i>1000) then begin
               if (copy(Tlabel(self.Components[j]).Name,3,5)='stepw') then
               begin
                   s:=Copy(FloatToStr(DBB[i]),1,1); m:=StrToInt(s);
                   s:=Copy(FloatToStr(DBB[i]),1,3);
                   Tlabel(self.Components[j]).Caption:='???';
                   if m=0 then Tlabel(self.Components[j]).Caption:='000: ОЖИДАНИЕ';
                   if m=1 then Tlabel(self.Components[j]).Caption:= s+': ОТКРЫТИЕ';
                   if m=2 then Tlabel(self.Components[j]).Caption:= s+': ЗАКРЫТИЕ';
                   if m=3 then Tlabel(self.Components[j]).Caption:= s+': ВАКУУМИРОВАН';
                   if m=4 then Tlabel(self.Components[j]).Caption:= s+': НАБОР ДАВЛЕН';
                   if m=5 then Tlabel(self.Components[j]).Caption:= s+': ВЫДЕРЖКА';
                   if m=6 then Tlabel(self.Components[j]).Caption:= s+': СБРОС ДАВЛЕН';
                   if m=7 then Tlabel(self.Components[j]).Caption:= s+': ПЕРЕБРОС';
                   if m=8 then Tlabel(self.Components[j]).Caption:= s+': ОЖИДАНИЕ СБУ';
                   if m=9 then Tlabel(self.Components[j]).Caption:= s+': ОЖИДАНИЕ СБУ';
                   continue;
               end;
               end;
            end;
            continue;
        end;
    end;
    //-----------------------------------------------------------------------
    // Дозировка 1 (отдельные каналы)
    if i<300 then begin
       //гомогенизатор
       if dbb[195]=0 then begin
           _DIS60.Brush.Color:=clGreen;
           _DIS60_.Brush.Color:=clGray;
       end;
       if dbb[195]=1 then begin
           _DIS60.Brush.Color:=clGray;
           _DIS60_.Brush.Color:=clGreen;
       end;
       //160,161,162
       if dbb[160]=0 then DOVZM.Brush.Color:=clGray;
       if dbb[160]=1 then DOVZM.Brush.Color:=clGreen;
       if dbb[161]=0 then DOSMM.Brush.Color:=clGray;
       if dbb[161]=1 then DOSMM.Brush.Color:=clGreen;
       if dbb[162]=0 then DOPDM.Brush.Color:=clGray;
       if dbb[162]=1 then DOPDM.Brush.Color:=clGreen;
       // звонок
       if dbb[180]=0 then zv.Visible:=false;
       if dbb[180]=1 then zv.Visible:=true;
    end;
    //-----------------------------------------------------------------------



    //-----------------------------------------------------------------------
    if fmGrafik.book.PageIndex=0 then begin


    // автоклав 6 -----------------------------------------------------------
       //хомут
       if(dbb[1269]<>dbbp[1269]) then begin
          F:='pic/homut_ler.bmp';
          if dbb[1269]=0   then F:='pic/homut_ldn.bmp';
          if dbb[1269]=1   then F:='pic/homut_lmd.bmp';
          if dbb[1269]=2   then F:='pic/homut_lup.bmp';
          if FileExists(F) then Image_homut6l.Picture.Bitmap.LoadFromFile(F);
       end;
       // крышка
       if(dbb[1270]<>dbbp[1270]) then begin
          F:='pic/lid_l_e.bmp';
          if dbb[1270]=0   then F:='pic/lid_l_c.bmp';
          if dbb[1270]=1   then F:='pic/lid_l_i.bmp';
          if dbb[1270]=2   then F:='pic/lid_l_o.bmp';
          if FileExists(F) then Image_krish6l.Picture.Bitmap.LoadFromFile(F);
       end;
       //СБУ
       if(dbb[1271]<>dbbp[1271]) then begin
          F:='pic/sbp_off.bmp';
          if dbb[1271]>0   then F:='pic/sbp_on.bmp';
          if FileExists(F) then Image_SBP6l.Picture.Bitmap.LoadFromFile(F);
       end;
       // байонет
       if(dbb[1272]<>dbbp[1272]) then begin
          F:='pic/bayonet_e.bmp';
          if dbb[1272]=0   then F:='pic/bayonet_r.bmp';
          if dbb[1272]=1   then F:='pic/bayonet_y.bmp';
          if dbb[1272]=2   then F:='pic/bayonet_g.bmp';
          if FileExists(F) then Image_bayonet6l.Picture.Bitmap.LoadFromFile(F);
       end;
       dbbp[1269]:=dbb[1269]; dbbp[1270]:=dbb[1270];
       dbbp[1271]:=dbb[1271]; dbbp[1272]:=dbb[1272];

    // автоклав 6 (правая)
       //хомут
       if(dbb[1273]<>dbbp[1273]) then begin
          F:='pic/homut_er.bmp';
          if dbb[1273]=0   then F:='pic/homut_dn.bmp';
          if dbb[1273]=1   then F:='pic/homut_md.bmp';
          if dbb[1273]=2   then F:='pic/homut_up.bmp';
          if FileExists(F) then Image_homut6.Picture.Bitmap.LoadFromFile(F);
       end;
       // крышка
       if(dbb[1274]<>dbbp[1274]) then begin
          F:='pic/lid_r_e.bmp';
          if dbb[1274]=0   then F:='pic/lid_r_c.bmp';
          if dbb[1274]=1   then F:='pic/lid_r_i.bmp';
          if dbb[1274]=2   then F:='pic/lid_r_o.bmp';
          if FileExists(F) then Image_krish6.Picture.Bitmap.LoadFromFile(F);
       end;
       //СБУ
       if(dbb[1275]<>dbbp[1275]) then begin
          F:='pic/sbp_off.bmp';
          if dbb[1275]>0   then F:='pic/sbp_on.bmp';
          if FileExists(F) then Image_SBP6.Picture.Bitmap.LoadFromFile(F);
       end;
       // байонет
       if(dbb[1276]<>dbbp[1276]) then begin
          F:='pic/bayonet_e.bmp';
          if dbb[1276]=0   then F:='pic/bayonet_r.bmp';
          if dbb[1276]=1   then F:='pic/bayonet_y.bmp';
          if dbb[1276]=2   then F:='pic/bayonet_g.bmp';
          if FileExists(F) then Image_bayonet6.Picture.Bitmap.LoadFromFile(F);
       end;
       dbbp[1273]:=dbb[1273]; dbbp[1274]:=dbb[1274];
       dbbp[1275]:=dbb[1275]; dbbp[1276]:=dbb[1276];
    //------------


    // автоклав 5 -----------------------------------------------------------
       //хомут
       if(dbb[1229]<>dbbp[1229]) then begin
          F:='pic/homut_ler.bmp';
          if dbb[1229]=0   then F:='pic/homut_ldn.bmp';
          if dbb[1229]=1   then F:='pic/homut_lmd.bmp';
          if dbb[1229]=2   then F:='pic/homut_lup.bmp';
          if FileExists(F) then Image_homut5l.Picture.Bitmap.LoadFromFile(F);
       end;
       // крышка
       if(dbb[1230]<>dbbp[1230]) then begin
          F:='pic/lid_l_e.bmp';
          if dbb[1230]=0   then F:='pic/lid_l_c.bmp';
          if dbb[1230]=1   then F:='pic/lid_l_i.bmp';
          if dbb[1230]=2   then F:='pic/lid_l_o.bmp';
          if FileExists(F) then Image_krish5l.Picture.Bitmap.LoadFromFile(F);
       end;
       //СБУ
       if(dbb[1231]<>dbbp[1231]) then begin
          F:='pic/sbp_off.bmp';
          if dbb[1231]>0   then F:='pic/sbp_on.bmp';
          if FileExists(F) then Image_SBP5l.Picture.Bitmap.LoadFromFile(F);
       end;
       // байонет
       if(dbb[1232]<>dbbp[1232]) then begin
          F:='pic/bayonet_e.bmp';
          if dbb[1232]=0   then F:='pic/bayonet_r.bmp';
          if dbb[1232]=1   then F:='pic/bayonet_y.bmp';
          if dbb[1232]=2   then F:='pic/bayonet_g.bmp';
          if FileExists(F) then Image_bayonet5l.Picture.Bitmap.LoadFromFile(F);
       end;
       dbbp[1229]:=dbb[1229]; dbbp[1230]:=dbb[1230];
       dbbp[1231]:=dbb[1231]; dbbp[1232]:=dbb[1232];

    // автоклав 5 (правая)
       //хомут
       if(dbb[1233]<>dbbp[1233]) then begin
          F:='pic/homut_er.bmp';
          if dbb[1233]=0   then F:='pic/homut_dn.bmp';
          if dbb[1233]=1   then F:='pic/homut_md.bmp';
          if dbb[1233]=2   then F:='pic/homut_up.bmp';
          if FileExists(F) then Image_homut5.Picture.Bitmap.LoadFromFile(F);
       end;
       // крышка
       if(dbb[1234]<>dbbp[1234]) then begin
          F:='pic/lid_r_e.bmp';
          if dbb[1234]=0   then F:='pic/lid_r_c.bmp';
          if dbb[1234]=1   then F:='pic/lid_r_i.bmp';
          if dbb[1234]=2   then F:='pic/lid_r_o.bmp';
          if FileExists(F) then Image_krish5.Picture.Bitmap.LoadFromFile(F);
       end;
       //СБУ
       if(dbb[1235]<>dbbp[1235]) then begin
          F:='pic/sbp_off.bmp';
          if dbb[1235]>0   then F:='pic/sbp_on.bmp';
          if FileExists(F) then Image_SBP5.Picture.Bitmap.LoadFromFile(F);
       end;
       // байонет
       if(dbb[1236]<>dbbp[1236]) then begin
          F:='pic/bayonet_e.bmp';
          if dbb[1236]=0   then F:='pic/bayonet_r.bmp';
          if dbb[1236]=1   then F:='pic/bayonet_y.bmp';
          if dbb[1236]=2   then F:='pic/bayonet_g.bmp';
          if FileExists(F) then Image_bayonet5.Picture.Bitmap.LoadFromFile(F);
       end;
       dbbp[1233]:=dbb[1233]; dbbp[1234]:=dbb[1234];
       dbbp[1235]:=dbb[1235]; dbbp[1236]:=dbb[1236];
    //------------


    // автоклав 4 -----------------------------------------------------------
       //хомут
       if(dbb[1039]<>dbbp[1039]) then begin
          F:='pic/homut_ler.bmp';
          if dbb[1039]=0   then F:='pic/homut_ldn.bmp';
          if dbb[1039]=1   then F:='pic/homut_lmd.bmp';
          if dbb[1039]=2   then F:='pic/homut_lup.bmp';
          if FileExists(F) then Image_homut.Picture.Bitmap.LoadFromFile(F);
       end;
       // крышка
       if(dbb[1040]<>dbbp[1040]) then begin
          F:='pic/lid_l_e.bmp';
          if dbb[1040]=0   then F:='pic/lid_l_c.bmp';
          if dbb[1040]=1   then F:='pic/lid_l_i.bmp';
          if dbb[1040]=2   then F:='pic/lid_l_o.bmp';
          if FileExists(F) then Image_krish4.Picture.Bitmap.LoadFromFile(F);
       end;
       //СБУ
       if(dbb[1041]<>dbbp[1041]) then begin
          F:='pic/sbp_off.bmp';
          if dbb[1041]>0   then F:='pic/sbp_on.bmp';
          if FileExists(F) then Image_SBP.Picture.Bitmap.LoadFromFile(F);
       end;
       // байонет
       if(dbb[1042]<>dbbp[1042]) then begin
          F:='pic/bayonet_e.bmp';
          if dbb[1042]=0   then F:='pic/bayonet_r.bmp';
          if dbb[1042]=1   then F:='pic/bayonet_y.bmp';
          if dbb[1042]=2   then F:='pic/bayonet_g.bmp';
          if FileExists(F) then Image_bayonet4.Picture.Bitmap.LoadFromFile(F);
       end;
       dbbp[1039]:=dbb[1039]; dbbp[1040]:=dbb[1040];
       dbbp[1041]:=dbb[1041]; dbbp[1042]:=dbb[1042];

    // автоклав 3 -----------------------------------------------------------
       //хомут
       if(dbb[1079]<>dbbp[1079]) then begin
          F:='pic/homut_ler.bmp';
          if dbb[1079]=0   then F:='pic/homut_ldn.bmp';
          if dbb[1079]=1   then F:='pic/homut_lmd.bmp';
          if dbb[1079]=2   then F:='pic/homut_lup.bmp';
          if FileExists(F) then Image_homut3.Picture.Bitmap.LoadFromFile(F);
       end;
       // крышка
       if(dbb[1080]<>dbbp[1080]) then begin
          F:='pic/lid_l_e.bmp';
          if dbb[1080]=0   then F:='pic/lid_l_c.bmp';
          if dbb[1080]=1   then F:='pic/lid_l_i.bmp';
          if dbb[1080]=2   then F:='pic/lid_l_o.bmp';
          if FileExists(F) then Image_krish3.Picture.Bitmap.LoadFromFile(F);
       end;
       //СБУ
       if(dbb[1081]<>dbbp[1081]) then begin
          F:='pic/sbp_off.bmp';
          if dbb[1081]>0   then F:='pic/sbp_on.bmp';
          if FileExists(F) then Image_SBP3.Picture.Bitmap.LoadFromFile(F);
       end;
       // байонет
       if(dbb[1082]<>dbbp[1082]) then begin
          F:='pic/bayonet_e.bmp';
          if dbb[1082]=0   then F:='pic/bayonet_r.bmp';
          if dbb[1082]=1   then F:='pic/bayonet_y.bmp';
          if dbb[1082]=2   then F:='pic/bayonet_g.bmp';
          if FileExists(F) then Image_bayonet3.Picture.Bitmap.LoadFromFile(F);
       end;
       dbbp[1079]:=dbb[1079]; dbbp[1080]:=dbb[1080];
       dbbp[1081]:=dbb[1081]; dbbp[1082]:=dbb[1082];

    // автоклав 2 -----------------------------------------------------------
       //хомут
       if(dbb[1139]<>dbbp[1139]) then begin
          F:='pic/homut_ler.bmp';
          if dbb[1139]=0   then F:='pic/homut_ldn.bmp';
          if dbb[1139]=1   then F:='pic/homut_lmd.bmp';
          if dbb[1139]=2   then F:='pic/homut_lup.bmp';
          if FileExists(F) then Image_homut2l.Picture.Bitmap.LoadFromFile(F);
       end;
       // крышка
       if(dbb[1140]<>dbbp[1140]) then begin
          F:='pic/lid_l_e.bmp';
          if dbb[1140]=0   then F:='pic/lid_l_c.bmp';
          if dbb[1140]=1   then F:='pic/lid_l_i.bmp';
          if dbb[1140]=2   then F:='pic/lid_l_o.bmp';
          if FileExists(F) then Image_krish2l.Picture.Bitmap.LoadFromFile(F);
       end;
       //СБУ
       if(dbb[1141]<>dbbp[1141]) then begin
          F:='pic/sbp_off.bmp';
          if dbb[1141]>0   then F:='pic/sbp_on.bmp';
          if FileExists(F) then Image_SBP2l.Picture.Bitmap.LoadFromFile(F);
       end;
       // байонет
       if(dbb[1142]<>dbbp[1142]) then begin
          F:='pic/bayonet_e.bmp';
          if dbb[1142]=0   then F:='pic/bayonet_r.bmp';
          if dbb[1142]=1   then F:='pic/bayonet_y.bmp';
          if dbb[1142]=2   then F:='pic/bayonet_g.bmp';
          if FileExists(F) then Image_bayonet2l.Picture.Bitmap.LoadFromFile(F);
       end;
       dbbp[1139]:=dbb[1139]; dbbp[1140]:=dbb[1140];
       dbbp[1141]:=dbb[1141]; dbbp[1142]:=dbb[1142];

    // автоклав 2 (правая)
       //хомут
       if(dbb[1143]<>dbbp[1143]) then begin
          F:='pic/homut_er.bmp';
          if dbb[1143]=0   then F:='pic/homut_dn.bmp';
          if dbb[1143]=1   then F:='pic/homut_md.bmp';
          if dbb[1143]=2   then F:='pic/homut_up.bmp';
          if FileExists(F) then Image_homut2.Picture.Bitmap.LoadFromFile(F);
       end;
       // крышка
       if(dbb[1144]<>dbbp[1144]) then begin
          F:='pic/lid_r_e.bmp';
          if dbb[1144]=0   then F:='pic/lid_r_c.bmp';
          if dbb[1144]=1   then F:='pic/lid_r_i.bmp';
          if dbb[1144]=2   then F:='pic/lid_r_o.bmp';
          if FileExists(F) then Image_krish2.Picture.Bitmap.LoadFromFile(F);
       end;
       //СБУ
       if(dbb[1145]<>dbbp[1145]) then begin
          F:='pic/sbp_off.bmp';
          if dbb[1145]>0   then F:='pic/sbp_on.bmp';
          if FileExists(F) then Image_SBP2.Picture.Bitmap.LoadFromFile(F);
       end;
       // байонет
       if(dbb[1146]<>dbbp[1146]) then begin
          F:='pic/bayonet_e.bmp';
          if dbb[1146]=0   then F:='pic/bayonet_r.bmp';
          if dbb[1146]=1   then F:='pic/bayonet_y.bmp';
          if dbb[1146]=2   then F:='pic/bayonet_g.bmp';
          if FileExists(F) then Image_bayonet2.Picture.Bitmap.LoadFromFile(F);
       end;
       dbbp[1143]:=dbb[1143]; dbbp[1144]:=dbb[1144];
       dbbp[1145]:=dbb[1145]; dbbp[1146]:=dbb[1146];


    // автоклав 1 -----------------------------------------------------------
       //хомут
       if(dbb[1179]<>dbbp[1179]) then begin
          F:='pic/homut_ler.bmp';
          if dbb[1179]=0   then F:='pic/homut_ldn.bmp';
          if dbb[1179]=1   then F:='pic/homut_lmd.bmp';
          if dbb[1179]=2   then F:='pic/homut_lup.bmp';
          if FileExists(F) then Image_homut1l.Picture.Bitmap.LoadFromFile(F);
       end;
       // крышка
       if(dbb[1180]<>dbbp[1180]) then begin
          F:='pic/lid_l_e.bmp';
          if dbb[1180]=0   then F:='pic/lid_l_c.bmp';
          if dbb[1180]=1   then F:='pic/lid_l_i.bmp';
          if dbb[1180]=2   then F:='pic/lid_l_o.bmp';
          if FileExists(F) then Image_krish1l.Picture.Bitmap.LoadFromFile(F);
       end;
       //СБУ
       if(dbb[1181]<>dbbp[1181]) then begin
          F:='pic/sbp_off.bmp';
          if dbb[1181]>0   then F:='pic/sbp_on.bmp';
          if FileExists(F) then Image_SBP1l.Picture.Bitmap.LoadFromFile(F);
       end;
       // байонет
       if(dbb[1182]<>dbbp[1182]) then begin
          F:='pic/bayonet_e.bmp';
          if dbb[1182]=0   then F:='pic/bayonet_r.bmp';
          if dbb[1182]=1   then F:='pic/bayonet_y.bmp';
          if dbb[1182]=2   then F:='pic/bayonet_g.bmp';
          if FileExists(F) then Image_bayonet1l.Picture.Bitmap.LoadFromFile(F);
       end;
       dbbp[1179]:=dbb[1179]; dbbp[1180]:=dbb[1180];
       dbbp[1181]:=dbb[1181]; dbbp[1182]:=dbb[1182];

    // автоклав 1 (правая)
       //хомут
       if(dbb[1183]<>dbbp[1183]) then begin
          F:='pic/homut_er.bmp';
          if dbb[1183]=0   then F:='pic/homut_dn.bmp';
          if dbb[1183]=1   then F:='pic/homut_md.bmp';
          if dbb[1183]=2   then F:='pic/homut_up.bmp';
          if FileExists(F) then Image_homut1.Picture.Bitmap.LoadFromFile(F);
       end;
       // крышка
       if(dbb[1184]<>dbbp[1184]) then begin
          F:='pic/lid_r_e.bmp';
          if dbb[1184]=0   then F:='pic/lid_r_c.bmp';
          if dbb[1184]=1   then F:='pic/lid_r_i.bmp';
          if dbb[1184]=2   then F:='pic/lid_r_o.bmp';
          if FileExists(F) then Image_krish1.Picture.Bitmap.LoadFromFile(F);
       end;
       //СБУ
       if(dbb[1185]<>dbbp[1185]) then begin
          F:='pic/sbp_off.bmp';
          if dbb[1185]>0   then F:='pic/sbp_on.bmp';
          if FileExists(F) then Image_SBP1.Picture.Bitmap.LoadFromFile(F);
       end;
       // байонет
       if(dbb[1186]<>dbbp[1186]) then begin
          F:='pic/bayonet_e.bmp';
          if dbb[1186]=0   then F:='pic/bayonet_r.bmp';
          if dbb[1186]=1   then F:='pic/bayonet_y.bmp';
          if dbb[1186]=2   then F:='pic/bayonet_g.bmp';
          if FileExists(F) then Image_bayonet1.Picture.Bitmap.LoadFromFile(F);
       end;
       dbbp[1183]:=dbb[1183]; dbbp[1184]:=dbb[1184];
       dbbp[1185]:=dbb[1185]; dbbp[1186]:=dbb[1186];
    //------------

    end;
end;
//---------------------------------------------------------------------------

end.
