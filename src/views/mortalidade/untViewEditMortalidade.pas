unit untViewEditMortalidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untViewEditBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmViewEditMortalidade = class(TfrmViewEditBase)
    Label1: TLabel;
    edtDate: TDateTimePicker;
    Label2: TLabel;
    edtQtd: TEdit;
    Label3: TLabel;
    edtObs: TEdit;
    procedure FormShow(Sender: TObject);
  private
    procedure Save; override;
  public
  end;

var
  frmViewEditMortalidade: TfrmViewEditMortalidade;

implementation

{$R *.dfm}

uses Vcl.Navigation, untModelMortalidade, untDAOMortalidade, DataModule.Main;

procedure TfrmViewEditMortalidade.Save;
var
  DAO: TDAOMortalidade;
  Mort: TMortalidade;
  erro: string;
  insert: Boolean;
begin
  inherited;
  DAO := TDAOMortalidade.Create(DMMain.FDConn);
  Mort := TMortalidade.Create;

  try
    Mort.IDLote := TNavigation.ParamInt;
    Mort.Data := edtDate.Date;
    Mort.Qtd := StrToInt(edtQtd.Text);
    Mort.Obs := edtObs.Text;

    insert := DAO.Save(Mort, erro);

    if not insert then
    begin
      raise Exception.Create(erro);
    end;
  finally
    DAO.Free;
    Mort.Free;
  end;
end;

procedure TfrmViewEditMortalidade.FormShow(Sender: TObject);
begin
  inherited;
  lblTitle.Caption := 'Nova Mortalidade para lote: ' +
    IntToStr(TNavigation.ParamInt);
  edtDate.Date := Now;
end;

end.
