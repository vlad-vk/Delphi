//--------------------------------------------------------------------------
// ����� �������� ��� ������� ���������
unit usplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RXCtrls, ExtCtrls;

type
  Tsplash = class(TForm)
    Image1: TImage;
    procedure IsFileA (I: integer; F, M: string);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  splash: Tsplash;

implementation

{$R *.dfm}

//--------------------------------------------------------------------------
// ������� �������� ����������� ����� �� �����
procedure Tsplash.IsFileA(I: integer; F, M: string);
begin
   if not FileExists(F) then begin
      ShowMessage(M);
      if(I>0) then Halt;
   end;
end;
//--------------------------------------------------------------------------
procedure Tsplash.FormShow(Sender: TObject);
begin
   // �������� ����������� ������
   IsFileA(1,'pCodus.cfc','�� ������ ���� ������������ [pCodus.cfc]');
   IsFileA(1,'pCodus.ini','�� ������ ���� ������������ [pCodus.ini]');
   if(FileExists('pic\login.bmp')) then
      Image1.Picture.LoadFromFile('pic\login.bmp');
end;
//--------------------------------------------------------------------------

end.
//--------------------------------------------------------------------------

