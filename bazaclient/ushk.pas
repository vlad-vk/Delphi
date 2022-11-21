//--------------------------------------------------------------------------
// Определение шкалы графиков
unit uSHK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfmShk = class(TForm)
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmShk: TfmShk;

implementation

uses Unit1;

{$R *.dfm}

//--------------------------------------------------------------------------
procedure TfmShk.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=cafree;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
procedure TfmShk.FormDestroy(Sender: TObject);
begin
  fmShk:=nil;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Взять шкалу в поле редактирования
procedure TfmShk.FormCreate(Sender: TObject);
begin
       case fmMnemo.book.PageIndex of
       0: begin
            Edit1.text:=FloatToStr(fmMnemo.DBChart1.LeftAxis.Maximum);
            Edit2.text:=FloatToStr(fmMnemo.DBChart1.LeftAxis.Minimum);
            Edit3.text:=FloatToStr(fmMnemo.DBChart1.LeftAxis.Increment);
          end;
       1: begin
            Edit1.text:=FloatToStr(fmMnemo.dozat_arx.LeftAxis.Maximum);
            Edit2.text:=FloatToStr(fmMnemo.dozat_arx.LeftAxis.Minimum);
            Edit3.text:=FloatToStr(fmMnemo.dozat_arx.LeftAxis.Increment);
          end;
       2: begin
            Edit1.text:=FloatToStr(fmMnemo.DBChart2.LeftAxis.Maximum);
            Edit2.text:=FloatToStr(fmMnemo.DBChart2.LeftAxis.Minimum);
            Edit3.text:=FloatToStr(fmMnemo.DBChart2.LeftAxis.Increment);
          end;
       3: begin
            Edit1.text:=FloatToStr(fmMnemo.autoklav1.LeftAxis.Maximum);
            Edit2.text:=FloatToStr(fmMnemo.autoklav1.LeftAxis.Minimum);
            Edit3.text:=FloatToStr(fmMnemo.autoklav1.LeftAxis.Increment);
          end;
       4: begin
            Edit1.text:=FloatToStr(fmMnemo.autoklav2.LeftAxis.Maximum);
            Edit2.text:=FloatToStr(fmMnemo.autoklav2.LeftAxis.Minimum);
            Edit3.text:=FloatToStr(fmMnemo.autoklav2.LeftAxis.Increment);
          end;
       5: begin
            Edit1.text:=FloatToStr(fmMnemo.autoklav3.LeftAxis.Maximum);
            Edit2.text:=FloatToStr(fmMnemo.autoklav3.LeftAxis.Minimum);
            Edit3.text:=FloatToStr(fmMnemo.autoklav3.LeftAxis.Increment);
          end;
       6: begin
            Edit1.text:=FloatToStr(fmMnemo.autoklav4.LeftAxis.Maximum);
            Edit2.text:=FloatToStr(fmMnemo.autoklav4.LeftAxis.Minimum);
            Edit3.text:=FloatToStr(fmMnemo.autoklav4.LeftAxis.Increment);
          end;
       end;
end;
//--------------------------------------------------------------------------


//--------------------------------------------------------------------------
// Установка новых заданных границ шкалы текущего графика
procedure TfmShk.SpeedButton1Click(Sender: TObject);
begin
   if (StrToFloat(Edit1.text)- StrToFloat(Edit2.text) < 0) or (StrToFloat(Edit1.text)- StrToFloat(Edit2.text) <  StrToFloat(Edit3.text)) then
   begin
      ShowMessage('Поле MIN не может быть больше MAX, или Поле ШАГ не может быть больше разницы MAX и MIN')
   end else begin

       case p of
       0: begin
            fmMnemo.DBChart1.LeftAxis.Automatic:=true;
            fmMnemo.DBChart1.LeftAxis.Automatic:=false;
            fmMnemo.DBChart1.LeftAxis.Maximum:=StrToFloat(Edit1.text);
            fmMnemo.DBChart1.LeftAxis.Minimum:=StrToFloat(Edit2.text);
            fmMnemo.DBChart1.LeftAxis.Increment:=StrToFloat(Edit3.text);
            close;
          end;

      1: begin
           fmMnemo.dozat_arx.LeftAxis.Automatic:=true;
           fmMnemo.dozat_arx.LeftAxis.Automatic:=false;
           fmMnemo.dozat_arx.LeftAxis.Maximum:=StrToFloat(Edit1.text);
           fmMnemo.dozat_arx.LeftAxis.Minimum:=StrToFloat(Edit2.text);
           fmMnemo.dozat_arx.LeftAxis.Increment:=StrToFloat(Edit3.text);
           close;
         end;

      2: begin
           fmMnemo.DBChart2.LeftAxis.Automatic:=true;
           fmMnemo.DBChart2.LeftAxis.Automatic:=false;
           fmMnemo.DBChart2.LeftAxis.Maximum:=StrToFloat(Edit1.text);
           fmMnemo.DBChart2.LeftAxis.Minimum:=StrToFloat(Edit2.text);
           fmMnemo.DBChart2.LeftAxis.Increment:=StrToFloat(Edit3.text);
           close;
         end;

      3: begin
           fmMnemo.autoklav1.LeftAxis.Automatic:=true;
           fmMnemo.autoklav1.LeftAxis.Automatic:=false;
           fmMnemo.autoklav1.LeftAxis.Maximum:=StrToFloat(Edit1.text);
           fmMnemo.autoklav1.LeftAxis.Minimum:=StrToFloat(Edit2.text);
           fmMnemo.autoklav1.LeftAxis.Increment:=StrToFloat(Edit3.text);
           close;
         end;

      4: begin
           fmMnemo.autoklav2.LeftAxis.Automatic:=true;
           fmMnemo.autoklav2.LeftAxis.Automatic:=false;
           fmMnemo.autoklav2.LeftAxis.Maximum:=StrToFloat(Edit1.text);
           fmMnemo.autoklav2.LeftAxis.Minimum:=StrToFloat(Edit2.text);
           fmMnemo.autoklav2.LeftAxis.Increment:=StrToFloat(Edit3.text);
           close;
         end;

      5: begin
           fmMnemo.autoklav3.LeftAxis.Automatic:=true;
           fmMnemo.autoklav3.LeftAxis.Automatic:=false;
           fmMnemo.autoklav3.LeftAxis.Maximum:=StrToFloat(Edit1.text);
           fmMnemo.autoklav3.LeftAxis.Minimum:=StrToFloat(Edit2.text);
           fmMnemo.autoklav3.LeftAxis.Increment:=StrToFloat(Edit3.text);
           close;
         end;

      6: begin
           fmMnemo.autoklav4.LeftAxis.Automatic:=true;
           fmMnemo.autoklav4.LeftAxis.Automatic:=false;
           fmMnemo.autoklav4.LeftAxis.Maximum:=StrToFloat(Edit1.text);
           fmMnemo.autoklav4.LeftAxis.Minimum:=StrToFloat(Edit2.text);
           fmMnemo.autoklav4.LeftAxis.Increment:=StrToFloat(Edit3.text);
           close;
         end;
      end;

   end;
end;
//--------------------------------------------------------------------------


end.
//--------------------------------------------------------------------------

