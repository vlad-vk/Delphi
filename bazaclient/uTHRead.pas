//--------------------------------------------------------------------------
// coding: cp1251
// ���������� ������� ����� (������������ � ����� ������)

// IBQuery1     [TIBQery]       - �������,���������,��������� SQL-��������
// RepData      [TrxMemoryData] - ������ ������, ���������� ��������� ������� ��
// frDBDataSet1 [TfrDBDataSet]  - ��������� �� RepData ��� ������� �� TfrReport
// fr_dozatp    [TfrReport]     - ���������� � ����� ������� ����� TfrDBDataSet

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
// �������������� ������ ������� � �����
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
        // ���������
        DZ_Report;
    end else begin
        // ���������
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
//  ������������ ������ ���������
procedure TMThread.DZ_Report;
var
    NDZ,        // ����� ������� ��� �������� ��������� �����
    SHLO,       // ����� ���������� ��������� ������� �������� ������ (��)(�������)
    SHLV,       // ...  (��������)
    SHFZ,       // ���� ��������-�������� ��
    SHFH,       // ������� �������� �� ������� �����������  ��� �� (������� ��������)
    SHFL,       // ������� �������� �� ������  ������������ ��� �� (������� ��������)
    SHZR,       // ���� ������� ��������
    SHWS,       // ����� �������� ������������ ���� ��
    MKLO,       // ����� ���������� ��������� ������� �������� ������� (��)
    MKFH,       // ������� �������� �� ������� �����������  ��� �� (������� ��������)
    MKFL,       // ������� �������� �� ������  ������������ ��� �� (������� ��������)
    MKFZ,       // ���� ��������-�������� ��
    MKWS,       // ����� �������� ������������ ���� ��
    MKZR,       // ���� ������� ��������
    FLVV,       // ���� �������� ����
    PALO,       // ����� ���������� ��������� ������� �������� �����

    TMPRV,      // ����� ���������� ������
    TMCUR,      // ����� ������� ������

    NM_KCEM1,   // ���� ����� ����� ������� 1
    NM_KCEM,    // ���� ����� ����� ������� 2
    NM_KVYG,    // ���� ��� ����� �����
    NM_KVRS,    // ���� �������� ��
    NM_KVOD,    // ���� ������ ���� (168, DOM19V)
    NM_KSLM,    // ���� ������ �����
    NM_KOTH,    // ���� ������ �������
    NM_KVRM,    // ���� �������� ��
    NM_KALM,    // ���� ������ �� ����
    NM_KVRA,    // ���� �������� ��

    DateFL,
    mRecPRV,
    TFF,        // ���� ����������� ������� � ��
    FirstRun,   // ���� ���������� �����
    CycCNT,     // ������� ������ ��� ��������� �������
    FLCM,       // ���� �������� �������
    FLVG,       // ���� �������� �������
    FLNR:       // ���� ����� ������
integer;

    mRecCNT,    // ���������� �������������� �������
    mRecCUR,    // ������ ������� ������
    mRecPRC,    // �������� ������������ ������

    SHVL,       // ������ ��� ����� ��������  �� ��������� �����������
    SHVH,       // ������� ��� ����� �������� �� ��������� �����������
    SHVC,       // ��� �������  ��� ������
    SHVV,       // ��� �������� ��� ������
    SHVC1,      // ��� �������  ��� �������� � �����
    SHVV1,      // ��� �������� ��� �������� � �����
    SHVC2,      // ��� �������  ��� ���������� ����
    SHVV2,      // ��� �������� ��� ���������� ����
    SHVU,       // ��� ������ (����� ������� ��� �������)
    CEMUT,      //
    VAGUT,      //

    CEMUTP,     // ������� ������� � ���� ������
    SHVZ,       // ��� �������� ��
    MKVH,       // ������� ��� ����� �������� �� ��������� �����������
    MKVL,       // ������  ��� ����� �������� �� ��������� �����������
    MKVV,       // ��� ����
    MKVS,       // ��� �����
    MKVO,       // ��� �� �����
    MKVU,       // ��� ������ (����� ������� ��� �������)
    MKVZ,       // ��� �������� �������� �������
    PUVZ,       // ��� �������� �����
    PAVZ:       // ��� �������� �����
real;
    SQL_REQ,    // ������ SQL �������
    DATE_INSERT,// ������ ������ �������
    TMBG,       // ����� ������ ���������
    TMEN,       // ����� ��������� ���������

    TMSHL,      // ����� ��������� ����������� ������ ��� �������� ������
    TMSHZ,      // ����� ������� ��� ����������� ���� �������� ������

    TMMKL,      // ����� ��������� ����������� ������ ��� �������� �������
    TMMKZ,      // ����� ������� ��� ����������� ���� �������� �������
    TestSTR,
    YearSTR, MonSTR, DaySTR,
    MirrSTR:
string;

    // ���������� �� SQL-�������
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

    // ����� ������� ��������� ��� �������� ��������� �����
    NDZ:=fmPrint.VibDZ.Value; if(NDZ<1) then NDZ:=1; if(NDZ>2) then NDZ:=2;


    //--------------------------------------------------------------------------
    // ���������� SQL-������� ��� ������� ��������� N1
    if(NDZ=1) then begin
    SQL_REQ:='select DATE_INSERT,TIM,AIW61,AIW62,AIW64,AIW65,DOM22,DOM23,DOL62V, '+
             'DIS83____V,DOM15V,DOM13,DOL61,DIS30,DOL64,DIS85____V,DIS86____V,   '+
             'DIS87____V,DIS88____V,DOM35,DBB012,DBB013,DBB014,DBB107,DBB108,PsV '+
             'from ';
    end else begin
    //--------------------------------------------------------------------------
    // ���������� SQL-������� ��� ������� ��������� N2
    SQL_REQ:='select DATE_INSERT,TIM, AIW252___V, AIW218___V, AIW216___V,'+
             'DIS229D2_V, DIS229B2_V, DIS220F__V, DIS251G1_V, DIS251F1_V,'+
             'DIS251E1_V, DIS251F2_V, DIS251E2_V, DIS251G2_V, DIS216F__V,'+
             'DIS216G__V, OBJM56___V, M46C06___V, M46C07___V, M21C08___V,'+
             'DIS2294__V, AIW219___V  from ';
    end;
    //--------------------------------------------------------------------------


    //----------------------------------
    // ������ ���������� �� ini �����
    SBText('������ ����������');
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
    // ����������� ��������� �������� ����������
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

    // �������� ����� ������ ������� ������� ��� ������
    TMSTARTI:=StrTMToInt( timetostr(fmPrint.TimeB.time) );

    // �������� ����� ��������� ������� ������� ��� ������
    TMENDI  :=StrTMToInt( timetostr(fmPrint.TimeE.time) );
    //----------------------------------


    //----------------------------------
    // �������� ������� � ������� �� ��� ��������� ����
    while True do
    begin
       TFF:=0;
       // ���������� ������ ��������� ������� �� ���������� ��������� ���
       if(fmPrint.GetCurTBNL=0) then begin break; end;
       // ��������� ���� �� �������� ������� � �� FireBird
       if fmPrint.IsTableFound(CurTBNL)>0 then begin TFF:=1; break; end;
    end;
    // ���� ��������� ������� �� ������� - ����� �� ��������� ������������ ������
    if (TFF=0) then begin
       SBText('�� ��������� ������ ��� ������');
       Sleep(2000);
       DTCURI:=0;
       Exit;
    end;
    //----------------------------------


    //----------------------------------
    // ����������� ������ ��������� �������, ���������� � ��� �������
    // � ���������� SQL-�������
    RunRep:=1;
    BrCyc:=0;
    fmStForm.StatusBar1.Panels[3].Text:='�����'; fmStForm.StatusBar1.Update;
    SBText('�������� ������� ' + CurTBNL);
    // ���� ������� ��������� �������- ������� �� � ���������� ���-�� �������
    TBLOpenF:=1;
    fmPrint.IBQuery1.close;
    fmPrint.IBQuery1.SQL.Clear;
    fmPrint.IBQuery1.SQL.add(SQL_REQ+CurTBNL);
    SBText('�������� ������� ' + CurTBNL);
    fmPrint.IBQuery1.Open;
    fmPrint.IBQuery1.Active:=true;
//    SBText('�������� ������� ' + CurTBNL + ' [Last1]');
//    fmPrint.IBQuery1.Last;
//    SBText('�������� ������� ' + CurTBNL + ' [Count1]');
//    mRecCNT:=fmPrint.IBQuery1.RecordCount;
    mRecCNT:=86400;
    fmPrint.IBQuery1.First;
    TMCUR:= fmPrint.IBQuery1.FieldByName('TIM').Value;
    SBText('��������� ������ ������� ['+CurTBNL+'] ');
    // ������� ������� ������ ������
    fmPrint.RepData.Open;
    TBLOpenF:=0;
    //----------------------------------



    //----------------------------------
    // �������� ���� ��������� ������ :
    with fmPrint.IBQuery1 do
    begin
      SBText('�������� ������� ' + CurTBNL);
      fmPrint.IBQuery1.First;
//    Sleep(2000);

      while BrCyc=0 do
      begin

//    Sleep(0);
      CycCNT:=CycCNT+1;

      //-34xx------------------------------------------
      // ���� ������� �� ������� ��� ���� ����� �������
      if(TFF=0) or (fmPrint.IBQuery1.Eof) then
      begin
         SBText('�������� ������� ' + CurTBNL);
         Sleep (2000);
         fmPrint.IBQuery1.Close; TFF:=0;
         // ���������� ��� ������� �������������� �������
         // ���� ��� ��� ���������� ���������- ����� �� �����
         if(fmPrint.GetCurTBNL=0) then begin
            SBText('�������� ������� ' + CurTBNL);
            Sleep (2000);
            break;
         end;
         SBText('�������� ������� ' + CurTBNL);
         Sleep (2000);
         // ��������� ���� �� �������� ������� � �� FireBird
         if (fmPrint.IsTableFound(CurTBNL)>0) then begin
             TFF:=1;
         end else begin
             SBText('�������� ������� ' + CurTBNL);
             Sleep (2000);
             continue;
         end;
         SBText('�������� ������� ' + CurTBNL);
         TBLOpenF:=1;
         fmPrint.IBQuery1.Close;
         fmPrint.IBQuery1.SQL.Clear;
         fmPrint.IBQuery1.SQL.add(SQL_REQ+CurTBNL);
         SBText('�������� ������� ' + CurTBNL);
         fmPrint.IBQuery1.Open;
         fmPrint.IBQuery1.Active:=true;
//         SBText('�������� ������� ' + CurTBNL + ' [Last2]');
//         fmPrint.IBQuery1.Last;
//         SBText('�������� ������� ' + CurTBNL + ' [Count2]');
//         mRecCNT:=fmPrint.IBQuery1.RecordCount;
         mRecCNT:=86400;
         TBLOpenF:=0;
         CycCNT:=1;
         // ���� �� ����� �������� ������� ���� ������� ������� �����
         Sleep(100);
         if(BrCyc>0) then begin break; end;
         // ���� � ������� ��� �������- ������� � ��������� �������
         if(mRecCNT=0) then begin TFF:=0; continue; end;
         // ������� � ������ ������� �������� �������
         SBText('�������� ������� ' + CurTBNL);
         fmPrint.IBQuery1.First;
         TMCUR:= fmPrint.IBQuery1.FieldByName('TIM').Value;
         // ����� 2���, ����� ������� ���������
         Sleep(2000);
      end;
      //-34xx------------------------------------------


      // ��� ��������� � ����������� �������, ��� �������� ����� ����
      // ����������� �������� �������� �� �� ����������� � ������ SQL-�������
      // TMCUR:=fmPrint.IBQuery1.FieldByName('TIM').Value
      //                                      ^^^
      // select DATE_INSERT, TIM, AIW61 ... .
      //                     ^^^


      //-----------------------------------------------
      // ��������� ������� ��������� �������
      if(mRecCNT=0) then begin mRecCNT:=1; end;
      mRecCUR:=fmPrint.IBQuery1.RecNo;
      mRecPRC:=mRecCUR *(100 / mRecCNT);
      mRecPRV:=Trunc(mRecPRC);
      fmStForm.StatusBar1.Panels[0].Text:=
      '��������� ������ ������� ['+CurTBNL+']'+
//    ' ['+IntToStr(Trunc(mRecCUR))+':'+IntToStr(Trunc(mRecCNT))+']'+
      ' ['+IntToStr(mRecPRV)+'%]'+
//    ' ['+IntToStr(CycCNT)+']'+
//    ' ['+IntToStr(Trunc(VODA))+']'+
      ' ';
      if(Frac(CycCNT/5)=0) then begin
         fmStForm.StatusBar1.Update;
      end;
      //-----------------------------------------------


      // ��������� ����� ���������� ������
      TMPRV:= TMCUR;

      // ������ �������� �� �� � ���������� (���������� SQL-�������)
      VLDATINS:= fmPrint.IBQuery1.FieldByName('DATE_INSERT').Value;
      VLTIM   := fmPrint.IBQuery1.FieldByName('TIM').Value;        // �����


      // ��������� �������� �� ���������� SQL ������� :
      //------------------------------------------------------------------------
      // ������� ��������� 1
      if(NDZ=1) then begin
      VL_WDZM := fmPrint.IBQuery1.FieldByName('AIW61').Value;      // 1 ��� ��
      VL_WDZS := fmPrint.IBQuery1.FieldByName('AIW62').Value;      // 2 ��� ��
      VL_WDZA := fmPrint.IBQuery1.FieldByName('AIW65').Value;      // 3 ��� ��
      VL_KCEM := fmPrint.IBQuery1.FieldByName('DOM22').Value;      // 4 ���� ���
      VL_KVYG := fmPrint.IBQuery1.FieldByName('DOM23').Value;      // 5 ���� ���
      VL_KVRS := fmPrint.IBQuery1.FieldByName('DOL62V').Value;     // 6 ���� ��� ��
      VL_KVOD := fmPrint.IBQuery1.FieldByName('DIS83____V').Value; // 7 ���� ���
      VL_KSLM := fmPrint.IBQuery1.FieldByName('DOM15V').Value;     // 8 ���� �����
      VL_KSL2 := fmPrint.IBQuery1.FieldByName('DOM15V').Value;     // 9 ���� ����� ������
      VL_KOTH := fmPrint.IBQuery1.FieldByName('DOM13').Value;      // 0 ���� �����
      VL_KOT2 := fmPrint.IBQuery1.FieldByName('DOM13').Value;      // 1 ���� ����� ������
      VL_KVRM := fmPrint.IBQuery1.FieldByName('DOL61').Value;      // 2 ���� ��� ��
      VL_KPA1 := fmPrint.IBQuery1.FieldByName('DIS85____V').Value; // 3 ���� ��� �1
      VL_KPA2 := fmPrint.IBQuery1.FieldByName('DIS87____V').Value; // 4 ���� ��� �2
      VL_KVRA := fmPrint.IBQuery1.FieldByName('DIS88____V').Value; // 5 ���� ��� ��
      VL_VOTH := fmPrint.IBQuery1.FieldByName('DBB012').Value;     // 6 ����� � ���
      VL_KO22 := fmPrint.IBQuery1.FieldByName('DBB014').Value;     // 7 ����2 ��� �2
      VL_PinV := fmPrint.IBQuery1.FieldByName('DBB107').Value;     // % ����� � �����
      VL_PinA := fmPrint.IBQuery1.FieldByName('DBB108').Value;     // % ����� � ��.����
      PL_SLAM := fmPrint.IBQuery1.FieldByName('PsV').Value;        // ��������� �����
      VL_KPAC := fmPrint.IBQuery1.FieldByName('DIS30').Value;      // ���� ��� ������
      VL_KCEM1:= 0;

      NM_KCEM := 135;    // ���� ��� ����� �����
      NM_KVYG := 138;    // ���� ��� ����� �����
      NM_KVRS := 172;    // ���� �������� ��
      NM_KVOD := 222;    // ���� ������ ���� (168, DOM19V)
      NM_KSLM := 170;    // ���� ������ �����
      NM_KOTH := 130;    // ���� ������ �������
      NM_KVRM := 131;    // ���� �������� ��
      NM_KALM := 150;    // ���� ������ �� ����
      NM_KVRA := 151;    // ���� �������� ��
      end else begin

      //-----------------------------------------------
      // ������� ��������� 2 (NDZ=2)
      VL_WDZM := fmPrint.IBQuery1.FieldByName('AIW252___V').Value; // 1 ��� ��
      VL_WDZS := fmPrint.IBQuery1.FieldByName('AIW218___V').Value; // 2 ��� ��
      VL_WDZA := fmPrint.IBQuery1.FieldByName('AIW216___V').Value; // 3 ��� ��
      VL_KCEM := fmPrint.IBQuery1.FieldByName('DIS229D2_V').Value; // 4 ���� ������� 2
      VL_KVYG := fmPrint.IBQuery1.FieldByName('DIS229B2_V').Value; // 5 ���� ���
      VL_KVRS := fmPrint.IBQuery1.FieldByName('DIS220F__V').Value; // 6 ���� ��� ��
      VL_KVOD := fmPrint.IBQuery1.FieldByName('DIS251G1_V').Value; // 7 ���� ��� ����
      VL_KSLM := fmPrint.IBQuery1.FieldByName('DIS251F1_V').Value; // 8 ���� �����
      VL_KSL2 := fmPrint.IBQuery1.FieldByName('DIS251E1_V').Value; // 9 ���� ����� ������
      VL_KOTH := fmPrint.IBQuery1.FieldByName('DIS251F2_V').Value; // 0 ���� �����
      VL_KOT2 := fmPrint.IBQuery1.FieldByName('DIS251E2_V').Value; // 1 ���� ����� ������
      VL_KVRM := fmPrint.IBQuery1.FieldByName('DIS251G2_V').Value; // 2 ���� ��� ��
      VL_KPA1 := fmPrint.IBQuery1.FieldByName('DIS216F__V').Value; // 3 ���� ��� �1
      VL_KPA2 := fmPrint.IBQuery1.FieldByName('DIS216F__V').Value; // 4 ���� ��� �2
      VL_KVRA := fmPrint.IBQuery1.FieldByName('DIS216G__V').Value; // 5 ���� ��� ��
      VL_VOTH := fmPrint.IBQuery1.FieldByName('OBJM56___V').Value; // 6 ����� � ���
      VL_KO22 := fmPrint.IBQuery1.FieldByName('DIS251F2_V').Value; // 7 ����2 ��� �2
      VL_PinV := fmPrint.IBQuery1.FieldByName('M46C06___V').Value; // % ����� � �����
      VL_PinA := fmPrint.IBQuery1.FieldByName('M46C07___V').Value; // % ����� � ��.����
      PL_SLAM := fmPrint.IBQuery1.FieldByName('M21C08___V').Value; // ��������� �����
      VL_KCEM1:= fmPrint.IBQuery1.FieldByName('DIS2294__V').Value; // ������ �������1
      VL_WDZI := fmPrint.IBQuery1.FieldByName('AIW219___V').Value; // ��� ��

//    NM_KCEM1:= 442;    // ���� ����� ����� �������1
      NM_KCEM := 517;    // ���� ����� ����� �������2
      NM_KVYG := 513;    // ���� ��� ����� �����
      NM_KVRS := 518;    // ���� �������� ��
      NM_KVOD := 524;    // ���� ������ ����
      NM_KSLM := 523;    // ���� ������ �����
      NM_KOTH := 527;    // ���� ������ �������
      NM_KVRM := 529;    // ���� �������� ��
      NM_KALM := 532;    // ���� ������ �� ����
      NM_KVRA := 533;    // ���� �������� ��
      end;
      //------------------------------------------------------------------------


//      VL_WREZ := fmPrint.IBQuery1.FieldByName('AIW64').Value;      // ������
//      VL_KRZ2 := fmPrint.IBQuery1.FieldByName('DOL64').Value;      // ������
//      VL_KRZ3 := fmPrint.IBQuery1.FieldByName('DIS86____V').Value; // ������
//      VL_KRZ4 := fmPrint.IBQuery1.FieldByName('DOM35').Value;      // ������
//      VL_KRZ5 := fmPrint.IBQuery1.FieldByName('DBB013').Value;     // ������

      // ���� ���� ������� ������� ������ ����� ��������� ��������� ���� �
      // ���� ����� ������� ������ ������ ��������� ����������- ������� � ��������� ������
      // (���� �� ����� �� ��������� ���������� ���������- ���������� �������� ������
      // ��� ���������) (��)
      if(DTCURI<=DTSTARTI) and (TMSTARTI>VLTIM) then begin
         fmPrint.IBQuery1.Next; continue;
      end;

      // ����� ����� ����� ��������� (��) � (�����) ����������� "����" �������� ����
      // ...

      // ���� ���� ������� ������� ������ ����� �������� ��������� ���� �
      // ���� ����� ������� ������ ������ ��������� ���������- ����� �� �����
      // (���� ����� �� �������� ��������- ��������� ����) (�����)
      if(DTCURI>=DTENDI) and (TMENDI<VLTIM) then begin
         SBText('��������� ��������� ������� ������� ' + CurTBNL); Sleep(1000);
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
      // ����� ��������� �������� ���� ����� 20.02.2014 ������ �� ���2
      if((VL_KCEM>0) or (VL_KCEM1>0) or (VL_KVYG> 0)) and (SHLO=0) and
        ((TestSTR='1') and (NDZ=2)) then begin
        FLNR:=2;
      end;


      // ������������ � �������� ������� ��� ���������� ������
      //------------------------------------------------------------------------
      // ���� ������ ������ ������ ������� � ��� ���.��������� -
      // ������ ��������� �������
      if(FLNR >0) then begin
        // ���� ��� �� ������ ������- �������� ������ � �����
        if FirstRun=2 then begin
          SHVC:=SHVC1;                 // ��� �������  ������� ���������
          SHVV:=SHVV1;                 // ��� �������� ������� ���������
//!!!
          // ���������� ���������� �������� ����� �������������� ����������, ����
          // VODA, SLAM, SLOB, PAST, CMNT, VYAJ,  ������� ����������� �� �����
          // �������� �� �������� ���� ���������� ��� ��� �������� �� ��������
          // MKVV:=VODA; MKVS:=SLAM; MKVO:=SHOB; ...

          // ���-�� ����� � ����� DBB[246],DBB[457]-��������� �����
          if (PL_SLAM=0) then begin PL_SLAM:=1; end;
          CEMUT:=MKVS*1.66*(PL_SLAM-1)/PL_SLAM;

          // ���-�� ����� � �������
          if(VL_PinV=0) then begin VL_PinV:=15; end;
          VAGUT:=SHVV*VL_PinV*0.01;
          // ���-�� ������� �� �������
          MKVZ:=SHVV-VAGUT;
          // ����� ���-�� �����
          SHVZ:=CEMUT+VAGUT;
          // ����� �� ���������
          if(VL_PinA=0) then begin VL_PinA:=12.5; end;
          PUVZ:=PAVZ*VL_PinA*0.01;

          // ������ ������ � ������� � ��� ������ ��������������� ������ �
          // RepData: TRxMemoryData
          fmPrint.RepData.FieldDefs.DataSet.AppendRecord(
          // TMBG,TMEN  - ����� ������ � ����� ���������    [+,+]
          // SHVC,SHVV  - �����:��� �������,��� �������     [+,+]
          // CEMUT,VAGUT- ������ ������� � ��������         [-,-] ����� �����[+],��������[+]
          // SHVZ       - �����:��� �������� ��������       [-]   ����� �����[+]
          // MKVV,MKVO,MKVS,MKVZ- ������:��� ����,�������,�����,�������� [+,+,+,-] ��� � ���[+]
          // PUVZ,PAVZ  - ��� �������� �����,�����(��.����) [-,+] ����� ����(��.��/8)[+]
          // DATE_INSERT- ����� �������� ������ � ��        [+]
          [NDZ,TMBG,TMEN,SHVC,SHVV,CEMUT,VAGUT,SHVZ,MKVV,MKVO,MKVS,MKVZ,PUVZ,PAVZ,DATE_INSERT,TestSTR]);
          // ���� ���������� ������ � RepData
          FLIns:=1;
//<<<break point
          // ������ ������ � ���� �������
          // ...
          // ��������� �������� ���� � ������ ���������
          SHVU:=0;                       // ��� ������ ������� ���������
          SHVZ:=0;                       // ��� �������� ������
          SHFL:=0;                       // ���� �������� ��������
          SHZR:=0;                       // ���� ������� ��������
          PAVZ:=0;                       // ��� �������� �����
          PUVZ:=0;
          FLCM:=0;
          FLVG:=0;

          SHVC1:=0;
          SHVV1:=0;

          // ����� ������ ���������
          TMBG:=IntToStr(VLTIM);
          // ��������� ����� ������ ������
          TMSHL:=IntToStr(VLTIM);
          // ��������� ���� ��
          if(MKFZ=0)and(MKFH=0)and(MKFL=0)then begin
             MKVV:=0; MKVS:=0; MKVO:=0; MKVZ:=0;
          end;
        end;
        SHVC2:=0;
        SHVV2:=0;
        // �������������� ����� ���� ���� ����
        if (FLNR=2) then begin
            if(VL_WDZS<50) and (VL_WDZI<50) then begin SHLO:=10; SHLV:=10; end;
        end else begin
            SHLO:=NM_KCEM;
        end;
        FLNR:=0;
        FirstRun:=1;
      end;
      //------------------------------------------------------------------------



      // ������� ������ ########################################################


      //------------------------------------------------------------------------
      // ���� ������������� ������ ����� 2014-02-20 � ���2
      if((TestSTR='1') and (NDZ=2)) then begin
          //-----------------------------------------
          // Esli zakrit klap nabora i otkrit klap vigruz - vigruzka
          // do etogo schitaem ves dozatora
          if (VL_KCEM=0) and (VL_KVRS>0) then begin FLCM:=2; end;
          if (VL_KVYG=0) and (VL_KVRS>0) then begin FLVG:=2; end;
          //-----------------------------------------
          // ������ ��������
          // Otkrit klap nabora cem, ves>30kg, zakrit klap vigruz
          if (VL_WDZS>30) and (FLCM=0) then begin
              if(VL_WDZS>SHVC2) then begin SHVC2:=VL_WDZS; end;
              SHLO:=20;
//<<<break point
          end;
          //-----------------------------------------
          // ������� ��������
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
      // ���� ������������� ������ �� 2014-02-20 ��� � ���1
      if((TestSTR='0') or (NDZ=1)) then begin

          //--------------------------
          // ����������� ��������� �������
          // ���� ������ ������ ������ ������� � �� �� � ��� ������
          if (VL_KCEM>0) and (SHLO=NM_KCEM) and ((FLCM=0) or (FLCM=1)) then begin
              if(VL_WDZS>SHVZ) then begin
                  SHVC2:=VL_WDZS; SHVZ:=VL_WDZS;
              end;
              SHLO:=NM_KCEM; FLCM:=1;
          end;
          // ��������� ��������� �������
          // ���� ������ ������ ������� ������ � ����� ���� �������� ������
          if (VL_KCEM=0) and (SHLO=NM_KCEM) and ((FLCM=1) or (FLCM=2)) then begin
              if(VL_WDZS>SHVZ) then begin
                  SHVC2:=VL_WDZS; SHVZ:=VL_WDZS;
              end;
              TMSHL:=IntToStr(VLTIM);
              SHLO:=NM_KCEM; FLCM:=2;
          end;

          //--------------------------
          // ������ ��������� ��������
          // ���� ������ ������ ������ �������� � ����� ���� �������� ������
          if (VL_KVYG>0) and (SHLO=NM_KCEM) and (FLVG=0) then begin
              if(VL_WDZS>SHVZ) then begin
                  SHVC2:=VL_WDZS; SHVZ:=VL_WDZS;
              end;
              SHLO:=NM_KVYG;
          end;
          // ����������� ��������� ��������
          // ���� ������ ������ ������ �������� � �������� �������
          if (VL_KVYG>0) and ((SHLO=NM_KVYG) or (SHLO=NM_KCEM)) then begin
              if(VL_WDZS>SHVZ) then begin
                  SHVV2:=VL_WDZS-SHVC2;
                  SHVZ :=VL_WDZS;
              end;
              SHLO:=NM_KVYG; FLVG:=1;
          end;
          // ��������� ��������� ��������
          // ���� ������ ������ ������ �������� � ��� ������
          if (VL_KVYG=0) and (SHLO=NM_KVYG) and (FLVG=1) then begin
              if(VL_WDZS>SHVZ) then begin
                  SHVV2:=VL_WDZS-SHVC2;
                  SHVZ :=VL_WDZS;
              end;
              TMSHL:=IntToStr(VLTIM);
              SHLO:=NM_KVYG;
          end;
          // ��������� ��� �������� � �������� ����� TMSHZ ������
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
// ��� �������� ������� �������� �������� ���.
// ������� ��� �� (��������)���� ���������� �� ����� �������
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
      // ����������� ����� ���������

      // ��������:
      if(VL_WDZS>SHVH) then begin
         // ����� ���������� ��� SHWS ���
         if(SHFH<= SHWS) then begin SHFH:=SHFH+1; end;
      end else begin
         if(SHFH> 0) then begin SHFH:=SHFH-1; end;
      end;

      // dozator suhogo zagrujen
      if(SHFH>SHWS) then begin
         SHFZ:=1;
         SHFL:=0;
         if(VL_WDZS>SHVZ) then begin
            // ��� ��������
            SHVZ:=VL_WDZS;
         end;
      end;


      // ��������:
      if(VL_WDZS<SHVL) then begin
        if(SHFZ>0) then begin
          // ����� ���������� ��� SHWS ���
          if(SHFL<=SHWS) then begin SHFL:=SHFL+1; end;
        end;
      end else begin
          if(SHFL>    0) then begin SHFL:=SHFL-1; end;
      end;

      // ������� ��������
      if(SHFL>SHWS)then begin
         SHFZ:=0;
         SHFH:=0;
         SHFL:=0;
      end;


      //-----------------------------------------------
      // ���� ��� ������� �������� ������ ������� � ��� �������� ������ �������-
      // �������� ��� ����� (��������� ���������)
      if (VL_KCEM=0) and (VL_KCEM1=0  ) and (VL_KVYG=0) and
         (VL_KVRS=0) and (VL_WDZS<SHVL) then begin
         SHZR:=SHZR+1;
      end else begin
         SHZR:=0;
      end;

      if (SHZR>3) then
      begin
         // ����� ��������� ���������
         if(SHZR=4) then begin TMEN:=IntToStr(VLTIM); end;
         SHFZ:=0;
         SHFH:=0;
         SHFL:=0;
         SHLO:=0;
         TMSHL:=IntToStr(VLTIM);
      end;
      //-----------------------------------------------

      // #####################################################################




//    // ������� ������� #####################################################

      if(NDZ=1) then begin
      //----------------------------------------------------------------------
      // 1 ���� ������ ������ ��� ���� � ��� ���.��������� - ������ ������ ����
      if (VL_KVOD>0) and (MKLO=0) then
      begin
        // ���������   ����� ������ ������
        TMMKL:=IntToStr(VLTIM);
        if(VL_WDZM<MKVL) then
        begin
           MKVZ:=0;
        end;
        MKLO:=NM_KVOD;
        FLVV:=1;
      end;
      // ����������� ������ ����
      // ���� ������ ������ ������ ���� � �� �� � ��� ������
      if((VL_KVOD>0) and (MKLO=NM_KVOD)) then
      begin
        if(VL_WDZM>MKVZ) then begin MKVZ:=VL_WDZM; end;
        MKLO:=NM_KVOD;
      end;
      // ���� ������ ������ ������ ���� � �� �� � ��� ������
      if((VL_KVOD=0) and (MKLO=NM_KVOD)) then
      begin
        if(VL_WDZM>MKVZ) then begin MKVZ:=VL_WDZM; end;
        MKLO:=NM_KVOD;
      end;

      //--------------------
      // ������ ������ �����
      // ���� ������ ������ ������ ����� ��� ��� ��������� ���������
      if (VL_KSLM>0) and ((MKLO=NM_KVOD) or (MKLO=0)) then
      begin
          // ��������� ��� ���� MKVV
          MKVV:=MKVZ;
          // ��������� ����� ������ ������
          TMMKL:=IntToStr(VLTIM);
          // �������������� ����� ���� ���� ����
          MKLO:=NM_KSLM;
      end;
      // ����������� ������ �����
      // ���� ������ ������ ������ ����� � �� �� � ��� ������
      if((VL_KSLM>0) and (MKLO=NM_KSLM)) then
      begin
          // ��������� ��� ����� MKVS
          if(VL_WDZM>MKVZ) then begin
             MKVS:=VL_WDZM-MKVV;
             MKVZ:=VL_WDZM;
          end;
          MKLO:=NM_KSLM;
      end;
      // ��������� ������ �����
      // ���� ������ ������ ����� ������ � ����� ���� �������� ����
      if((VL_KSLM=0) and (MKLO=NM_KSLM)) then
      begin
          // ��������� ��� ����� MKVS
          if(VL_WDZM>MKVZ) then begin
             MKVS:=VL_WDZM-MKVV;
             MKVZ:=VL_WDZM;
          end;
          TMMKL:=IntToStr(VLTIM);
          MKLO:=NM_KSLM;
      end;

      //--------------------
      // ������ ������ ��������� �����
      // ���� ������ ������ ������ �� ����� � ����� ���� ��� ������ ������ �����
      if(((VL_KOTH>0) or (VL_KO22>0)) and (MKLO=NM_KSLM)) then
      begin
         // ��������� ��� ����� MKVS
         if(VL_WDZM>MKVZ) then begin
            MKVS:=VL_WDZM-MKVV;
            MKVZ:=VL_WDZM;
         end;
         // ��������� ����� ������ ������
         TMMKL:=IntToStr(VLTIM);
         // �������������� ����� ���� ���� ����
         MKLO:=NM_KOTH;
      end;
      // ����������� ������ �� �����
      // ���� ������ ������ ������ �� ����� � �� �� � ��� ������
      if(((VL_KOTH>0) or (VL_KO22>0)) and (MKLO=NM_KOTH)) then
      begin
         if(VL_WDZM>MKVZ) then begin
            MKVO:=VL_WDZM-MKVV-MKVS;
            MKVZ:=VL_WDZM;
         end;
         MKLO:=NM_KOTH;
      end;
      // ��������� ������ ��������� �����
      // ���� ������ ������ �� ����� ������ � ����� ���� �������� �� ����
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
      // ������ �������� �� �������� �������
      if (VL_KVRM>0) and ((MKLO=NM_KOTH) or (MKLO=NM_KSLM)) and (MKFZ=1) then
      begin
        // ��������� ��� �� ����� MKVO
        // ���������, ������ ��� ������ ��� �������� ������� - ��� ������ ����� (������ �� 100��)
        // ������� ��� ��������� ����� ���������� ������ �� �������� ������� ��������
        // MKVO:=VL_WDZM-MKVV-MKVS;
        // ����� ���������� ��������� �������
        MKLO:=NM_KVRM;
      end;



//    // #####################################################################
      //  NDZ= 2
      end else begin

      //--------------------
      // ������ ������ ��������� �����
      // ���� ������ ������ ������ �� ����� � ��� ������ ������
      if(((VL_KOTH>0) or (VL_KO22>0)) and (MKLO=0)) then
      begin
         // ��������� ��� ����� MKVS
         if(VL_WDZM>MKVZ) then begin
//<<<break point
            MKVZ:=VL_WDZM; MKVO:=VL_WDZM;
         end;
         // ��������� ����� ������ ������
         TMMKL:=IntToStr(VLTIM);
         // �������������� ����� ���� ���� ����
         MKLO:=NM_KOTH;
      end;
      // ����������� ������ �� �����
      // ���� ������ ������ ������ �� ����� � �� �� � ��� ������
      if(((VL_KOTH>0) or (VL_KO22>0)) and (MKLO=NM_KOTH)) then
      begin
         if(VL_WDZM>MKVZ) then begin
            MKVO:=VL_WDZM; MKVZ:=VL_WDZM;
         end;
         MKLO:=NM_KOTH;
      end;
      // ��������� ������ ��������� �����
      // ���� ������ ������ �� ����� ������ � ����� ���� �������� �� ����
      if(((VL_KOTH=0) and (VL_KO22=0)) and (MKLO=NM_KOTH)) then
      begin
         if(VL_WDZM>MKVZ) then begin MKVO:=VL_WDZM; MKVZ:=VL_WDZM; end;
         TMMKL:=IntToStr(VLTIM);
         MKLO:=NM_KOTH;
      end;

      //--------------------
      // ������ ������ �����
      // ���� ������ ������ ������ ����� � ��� ��������� ���������
      if (VL_KSLM>0) and ((MKLO=NM_KOTH) or (MKLO=0)) then
      begin
          // ��������� ��� ��� �����
          if(VL_WDZM>MKVZ) then begin MKVO:=VL_WDZM; MKVZ:=VL_WDZM; end;
//<<<break point
          // ��������� ����� ������ ������
          TMMKL:=IntToStr(VLTIM);
          // �������������� ����� ���� ���� ����
          MKLO:=NM_KSLM;
      end;
      // ����������� ������ �����
      // ���� ������ ������ ������ ����� � �� �� � ��� ������
      if((VL_KSLM>0) and (MKLO=NM_KSLM)) then
      begin
          // ��������� ��� ����� MKVS
          if(VL_WDZM>MKVZ) then begin
             MKVS:=VL_WDZM-MKVO; MKVZ:=VL_WDZM;
          end;
          MKLO:=NM_KSLM;
      end;
      // ��������� ������ �����
      // ���� ������ ������ ����� ������ � ����� ���� �������� ����
      if((VL_KSLM=0) and (MKLO=NM_KSLM)) then
      begin
          // ��������� ��� ����� MKVS
          if(VL_WDZM>MKVZ) then begin
             MKVS:=VL_WDZM-MKVO; MKVZ:=VL_WDZM;
          end;
          TMMKL:=IntToStr(VLTIM);
          MKLO:=NM_KSLM;
      end;

      //----------------------
      // ������ �������� �� ��
      if (VL_KVRM>0) and ((MKLO=NM_KOTH) or (MKLO=NM_KSLM)) and (MKFZ=1) then
      begin
        // ��������� ��� ����� MKVS
        MKVS:=VL_WDZM-MKVO;
        // ����� ���������� ��������� �������
        MKLO:=NM_KVRM;
      end;

      //----------------------------------------------------------------------
      // ���� ������ ������ ��� ���� � ��� ������ ������ ��������
      if (VL_KVOD>0) and (MKLO=NM_KVRM) then
      begin
        // ���������   ����� ������ ������
        TMMKL:=IntToStr(VLTIM);
        MKVZ:=MKVO+MKVS+VL_WDZM;
        MKLO:=NM_KVOD;
        FLVV:=0;
      end;
      // ����������� ������ ����
      // ���� ������ ������ ������ ���� � �� �� � ��� ������
      if((VL_KVOD>0) and (MKLO=NM_KVOD)) then
      begin
        if(VL_WDZM>MKVZ) then begin MKVZ:=MKVO+MKVS+VL_WDZM; end;
        MKLO:=NM_KVOD;
      end;
      // ���� ������ ������ ������ ���� � �� �� � ��� ������
      if((VL_KVOD=0) and (MKLO=NM_KVOD)) then
      begin
        if(VL_WDZM>MKVZ) then begin MKVZ:=MKVO+MKVS+VL_WDZM; end;
        MKLO:=NM_KVOD;
        FLVV:=1;
      end;

      //----------------------
      // ��������� �������� �� ��
      if (VL_KVRM>0) and (MKLO=NM_KVOD) and (MKFZ=1) then
      begin
        MKLO:=NM_KVRM;
      end;

      end;
      //----------------------------------------------------------------------



      //----------------------------------------------------------------------
      // ����������� ����� ���������

      // ��������:
      if(VL_WDZM>MKVH) then
      begin
         // ����� ���������� ��� MKWS ���
         if MKFH<= MKWS then begin MKFH:=MKFH+1; end;
      end else begin
         if(MKFH> 0) then begin MKFH:=MKFH-1; end;
      end;
      // ������� ��������
      if(MKFH>MKWS)then
      begin
         MKFZ:=1;
         MKFL:=0;
         if(VL_WDZM>MKVZ) then begin MKVZ:=VL_WDZM; end;
      end;

      // ��������:
      if(VL_WDZM<MKVL) then
      begin
        if(MKFZ>0) then
        begin
          // ����� ���������� ��� MKWS ���
          if(MKFL<=MKWS) then begin MKFL:=MKFL+1; end;
        end
      end else begin
          if(MKFL>    0) then begin MKFL:=MKFL-1; end;
      end;

      // ������� ��������
      if(MKFL>MKWS)then begin
         MKFZ:=0;
         MKFH:=0;
         MKFL:=0;
      end;

      // ���� ��� ������� �������� ������� ������� � ��� �������� ������ �������
      // � ���������� ���� ������ ����- �������� ��� ����� (��������� ���������)
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



      // ������� ����� #######################################################

      //----------------------------------------------------------------------
      // ���� ������ ������ ������ ��.����� � ��� ���.���������
      if(((VL_KPA2>0) or (VL_KPA1>0) or (VL_KPAC>0)) and (PALO=0)) then
      begin
        PALO:=NM_KALM;              // ���������� ����� ���� ���� ����
      end;
      // ����������� ������ �����
      // ���� ������ ������ ������ ����� � �� �� � ��� ������
      if(((VL_KPA2>0) or (VL_KPA1>0) or (VL_KPAC>0)) and (PALO=NM_KALM)) then
      begin
          if(VL_WDZA>PAVZ) then begin PAVZ:=VL_WDZA; end;
          PALO:=NM_KALM;
      end;
      // ��������� ������ �����
      // ���� ������ ������ ����� ������ � �� �� � ��� ������
      if((VL_KPA2=0) and (VL_KPA1=0) and (VL_KPAC=0)) and (PALO=NM_KALM) then
      begin
          if(VL_WDZA>PAVZ) then begin PAVZ:=VL_WDZA; end;
          PALO:=NM_KALM;
      end;
      // �������� �� �������� ��.���������
      if((VL_KVRA>0) and (PALO=NM_KALM)) then
      begin
          if(VL_WDZA>PAVZ) then begin PAVZ:=VL_WDZA; end;
          PALO:=NM_KVRA;
      end;
      // ���� ������ �������� ��.��������� ������, � ��� ������
      if(VL_KVRA=0)and(PALO=NM_KVRA) then
      begin
          PALO:=152;
      end;
      // #####################################################################

      // �������� �� ������ ��.��������� (�������� �����)
      // ��� ����� ��������� ��� ��� �������� ���������
      // 152- ��� �� ����� �������, � ���� ��������� ���������

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
// ����� ������ ��������� �� �����
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
        fmStForm.StatusBar1.Panels[0].Text:='��� ������ �� ��������� ������';
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
//  ������������ ������ �� ����������
procedure TMThread.AK_Report;
var
    PRV           : array [0..4] of integer;       // ���������� ����

    WRFlag,        // ���� ������ � ������� ������ ������� ������
    TMPRV,         // ����� ���������� ������
    TMCUR,         // ����� ������� ������
    TMSAV,         // ����� ��������� �������� ������ ���������� ����������  
    mRecPRV,       // ������� ��������� ��������� �������
    TFF,           // ���� ����������� ������� � ��
    FirstRun:      // ���� ���������� �����
integer;

    // ���������� ������:
    NNAR,          // ����� ������
    NAUT,          // ����� ���������
    D6DE,          // ����� ������ D600:
    D6VIII,        //
    D6VI,          //
    D6III,         //
    D6ZAK,         //
    D6NEK,         //
    D4DE,          // ����� ������ D400:
    D4VIII,        //
    D4VI,          //
    D4III,         //
    D4ZAK,         //
    D4NEK,         //
    mRecCNT,       // ���������� �������������� �������
    mRecCUR,       // ������ ������� ������
    mRecPRC:       // �������� ������������ ������
real;

    SQLQuery,      // SQL ������
    DATE_INSERT,   // ������ ������ �������
    ZNAK,          // ������� ��������-��������
    TMCR:          // ����� ��������� ���������
string;

begin
    if(RunRep>0) then exit;

    // �������� ����� ������ ������� ������� ��� ������
    TMSTARTI:=StrTMToInt( timetostr(fmPrint.TimeB.time) );
    // �������� ����� ��������� ������� ������� ��� ������
    TMENDI  :=StrTMToInt( timetostr(fmPrint.TimeE.time) );

    //------------------------------------
    // ������ ���������� �� ini �����
    fmStForm.StatusBar1.Panels[0].Text:='������ ����������';
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
       // ���������� ������ ��������� ������� �� ���������� ��������� ���
       if(fmPrint.GetCurTBNL=0) then break;
       // ��������� ���� �� �������� ������� � �� FireBird
       if fmPrint.IsTableFound(CurTBNL)>0 then begin TFF:=1; break; end
    end;

    // ���� ��������� ������� �� ������� - ����� �� ��������� ������������ ������
    if (TFF=0) then begin
       fmStForm.StatusBar1.Panels[0].Text:='�� ��������� ������ ��� ������';
       fmStForm.StatusBar1.Update;
       Sleep(2000);
       DTCURI:=0;
       Exit;
    end;

    RunRep:=1;
    BrCyc:=0;
    fmStForm.StatusBar1.Panels[0].Text:='�������� ������� ' + CurTBNL;
    fmStForm.StatusBar1.Update;
    fmStForm.StatusBar1.Panels[3].Text:='�����'; fmStForm.StatusBar1.Update;

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
    // ���� ������� ��������� �������- ������� �� � ���������� ���-�� �������
    fmPrint.IBQuery1.close;
    fmPrint.IBQuery1.SQL.Clear;
    fmPrint.IBQuery1.SQL.add(SQLQuery);
    fmPrint.IBQuery1.Open;
    fmPrint.IBQuery1.Last;
    mRecCNT:=fmPrint.IBQuery1.RecordCount;
    fmPrint.IBQuery1.First;
    TMCUR:= fmPrint.IBQuery1.FieldByName('TIM').Value;
    TMSAV:= TMCUR;

    fmStForm.StatusBar1.Panels[0].Text:='��������� ������ ������� ['+CurTBNL+']: ';
    fmStForm.StatusBar1.Update;

    // ������� ������� ������ ������
    fmPrint.AK_Data.Open;
    TBLOpenF:=0;
    Sleep(100);

    with fmPrint.IBQuery1 do
    begin
      fmPrint.IBQuery1.First;
      while BrCyc=0 do
      begin

      // ���� ������ ������ �������� ������������ ������- �����
      if(BrCyc>0) then break;
      Sleep(0);

      // ���� ������� �� ������� ��� ���� ����� �������
      if(TFF=0) or (fmPrint.IBQuery1.Eof) then
      begin
         fmPrint.IBQuery1.Close; TFF:=0;
         // ���������� ��� ������� �������������� �������
         // ���� ��� ��� ���������� ���������- ����� �� �����
         if(fmPrint.GetCurTBNL=0) then break;
         // ��������� ���� �� �������� ������� � �� FireBird
         if fmPrint.IsTableFound(CurTBNL)>0 then begin TFF:=1;   end
         else                                    begin continue; end;
         TBLOpenF:=1;
         fmPrint.IBQuery1.Close;
         fmPrint.IBQuery1.SQL.Clear;
         fmPrint.IBQuery1.SQL.add(SQLQuery);
         fmStForm.StatusBar1.Panels[0].Text:='�������� ������� ' + CurTBNL;
         fmStForm.StatusBar1.Update;
         fmPrint.IBQuery1.Open;
         // ���������� ���������� ������� � �������
         fmPrint.IBQuery1.Last;
         mRecCNT:=fmPrint.IBQuery1.RecordCount;
         TBLOpenF:=0;
         //
         Sleep(100);
         if(BrCyc>0) then break;
         // ���� � ������� ��� �������- ������� � ��������� �������
         if(mRecCNT=0) then begin TFF:=0; continue; end;
         // ������� � ������ ������� �������� �������
         fmPrint.IBQuery1.First;
         TMCUR:= fmPrint.IBQuery1.FieldByName('TIM').Value;
      end;

      // ��������� ������� ��������� �������
      if(mRecCNT>0) then
      begin
         mRecCUR:=fmPrint.IBQuery1.RecNo;
         mRecPRC:=mRecCUR * (100 / mRecCNT);
         if(mRecCur>0) then begin
            mRecPRV:=Trunc(mRecPRC);
            fmStForm.StatusBar1.Panels[0].Text:=
            '��������� ������ ������� ['+CurTBNL+']: '+IntToStr(mRecPRV)+'%';
         end;
         if(Frac(mRecCur/5)=0) then begin
            fmStForm.StatusBar1.Update;
         end;
      end;

      // ��������� ����� ���������� ������
      TMPRV:= TMCUR;
      // ��������� ����� ������� ������
      TMCUR:= fmPrint.IBQuery1.FieldByName('TIM').Value;

      // ���� ����� ������� � ���������� ������� ������� ����������� �� �������-
      // ���������  ���������� � �� ������� ������� ���������
      if ( TMCUR > TMPRV+2 ) then begin
         {...}
      end;

      // ���� ���� ������� ������� ������ ����� ��������� ��������� ���� �
      // ���� ����� ������� ������ ������ ��������� ����������- ������� � ��������� ������
      if(DTCURI>=DTSTARTI) and (TMSTARTI<fmPrint.IBQuery1.FieldByName('TIM').Value) then begin
         fmPrint.IBQuery1.Next; continue;
      end;
      // ���� ���� ������� ������� ������ ����� �������� ��������� ���� �
      // ���� ����� ������� ������ ������ ��������� ���������- ����� �� �����
      if(DTCURI>=DTENDI) and (TMENDI<fmPrint.IBQuery1.FieldByName('TIM').Value) then begin
         break;
      end;

      //----------------------------------------------------------------------
      // ��������� ������ ��� ���������� ������:

      // ���� ����� ������ ����� ����- ���������� ��� ������ (������� � ���������)
      if(fmPrint.IBQuery1.FieldByName('B1_1' ).Value>0) then begin
         fmPrint.IBQuery1.Next; continue;
      end;

      //--------------------
      // �������� 1:
      // ���� ������ ������������� �� ��������� � ����� ����� ������
      if(fmPrint.IBQuery1.FieldByName('B1_16').Value=1) and (PRV[0]<>1) then begin
         if(fmPrint.IBQuery1.FieldByName('B1_16').Value=1) then  ZNAK:='Z'
         else                                                    ZNAK:='V';
         NAUT  :=1;       // ����� ���������
         PRV[0]:=1;       // ������� ��������
         WrFlag:=1;       // ���� ������ ������ � ������� ������
      end;
      // ���� ���������� ���� �������� � ����������  ��� ���� ��������
      if(fmPrint.IBQuery1.FieldByName('B1_16').Value=2) and (PRV[0]=1) then begin
         PRV[0]:=2; TMSAV:=TMCUR;
      end;
      //--------------------
      // �������� 2:
      if(fmPrint.IBQuery1.FieldByName('B2_16').Value=1) and (PRV[1]<>1) then begin
         if(fmPrint.IBQuery1.FieldByName('B2_16').Value=1) then  ZNAK:='Z'
         else                                                    ZNAK:='V';
         NAUT:=2; PRV[1]:=1; WrFlag:=1;
      end;
      if(fmPrint.IBQuery1.FieldByName('B2_16').Value=2) and (PRV[1]=1) then begin
         PRV[1]:=2; TMSAV:=TMCUR;
      end;
      //--------------------
      // �������� 3:
      if(fmPrint.IBQuery1.FieldByName('B3_16').Value=1) and (PRV[2]<>1) then begin
         if(fmPrint.IBQuery1.FieldByName('B3_16').Value=1) then  ZNAK:='Z'
         else                                                    ZNAK:='V';
         NAUT:=3; PRV[2]:=1; WrFlag:=1;
      end;
      if(fmPrint.IBQuery1.FieldByName('B3_16').Value=2) and (PRV[2]=1) then begin
         PRV[2]:=2; TMSAV:=TMCUR;
      end;
      //--------------------
      // �������� 4:
      if(fmPrint.IBQuery1.FieldByName('B4_16').Value=1) and (PRV[3]<>1) then begin
         if(fmPrint.IBQuery1.FieldByName('B4_16').Value=1) then  ZNAK:='Z'
         else                                                    ZNAK:='V';
         NAUT:=4; PRV[3]:=1; WrFlag:=1;
      end;
      if(fmPrint.IBQuery1.FieldByName('B4_16').Value=2) and (PRV[3]=1) then begin
         PRV[3]:=2; TMSAV:=TMCUR;
      end;
      //--------------------


      // ���� ���������� ���� ������ � ��� �� ������ ������-
      // �������� ������ � ����� ������ ������� ������
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
// ����� ������ �� ���������� �� �����
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
        fmStForm.StatusBar1.Panels[0].Text:='��� ������ �� ��������� ������';
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

