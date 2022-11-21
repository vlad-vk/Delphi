program disomatp;

uses
  Forms,
  disomat in 'disomat.pas' {Form01};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm01, Form01);
  Application.Run;
end.
