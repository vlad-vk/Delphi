program pCodus_client;

uses
  Forms,
  ufmStForm in 'ufmStForm.pas' {fmStForm},
  ufmGrifik in 'ufmGrifik.pas' {fmGrafik},
  UDM in 'UDM.pas' {DM: TDataModule},
  uBD in 'uBD.pas' {fmBD},
  Unit1 in 'Unit1.pas' {fmMnemo},
  uPrint in 'uPrint.pas' {fmPrint},
  uSHK in 'uSHK.pas' {fmShk},
  usplash in 'usplash.pas' {splash};

{$R *.res}

begin
  Application.Initialize;
  splash:=Tsplash.Create(Application);
  splash.Show;
  splash.Update;
  Application.Title := 'АСУ ТП - клиент';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfmStForm, fmStForm);
  splash.Hide;
  splash.Free;
  Application.Run;
end.
