program TesteTecnicoSag;

uses
  Vcl.Forms,
  untViewMain in 'src\views\main\untViewMain.pas' {frmViewMain};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmViewMain, frmViewMain);
  Application.Run;
end.
