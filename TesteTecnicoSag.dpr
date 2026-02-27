program TesteTecnicoSag;

uses
  Vcl.Forms,
  untViewMain in 'src\views\main\untViewMain.pas' {frmViewMain},
  untModelLote in 'src\models\untModelLote.pas',
  untModelPesagem in 'src\models\untModelPesagem.pas',
  untModelMortalidade in 'src\models\untModelMortalidade.pas',
  Vcl.Loading in 'src\units\Vcl.Loading.pas',
  untViewEditBase in 'src\views\bases\edit\untViewEditBase.pas' {frmViewCadBase},
  Vcl.Navigation in 'src\units\Vcl.Navigation.pas',
  untViewEditLote in 'src\views\lote\untViewEditLote.pas' {frmViewEditLote};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmViewMain, frmViewMain);
  Application.Run;
end.
