unit untViewEditPesagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untViewEditBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmViewEditPesagem = class(TfrmViewEditBase)
    Label2: TLabel;
    edtPesoMedio: TEdit;
    Label1: TLabel;
    edtDate: TDateTimePicker;
    Label3: TLabel;
    edtQtd: TEdit;
    procedure FormShow(Sender: TObject);
  private
    procedure Save; override;
  public
  end;

var
  frmViewEditPesagem: TfrmViewEditPesagem;

implementation

{$R *.dfm}

uses Vcl.Navigation, untDAOPesagem, untModelPesagem, DataModule.Main;

procedure TfrmViewEditPesagem.Save;
var
  DAO: TDAOPesagem;
  Pesa: TPesagem;
  erro: string;
  insert: Boolean;
begin
  inherited;
  DAO := TDAOPesagem.Create(DMMain.FDConn);
  Pesa := TPesagem.Create;

  try
    Pesa.IDLote := TNavigation.ParamInt;
    Pesa.Data := edtDate.Date;
    Pesa.PesoMedio := StrToFloat(edtPesoMedio.Text);
    Pesa.Qtd := StrToInt(edtQtd.Text);

    insert := DAO.Save(Pesa, erro);

    if not insert then
    begin
      raise Exception.Create(erro);
    end;
  finally
    DAO.Free;
    Pesa.Free;
  end;
end;

procedure TfrmViewEditPesagem.FormShow(Sender: TObject);
begin
  inherited;
  lblTitle.Caption := 'Nova Pesagem para lote: ' +
    IntToStr(TNavigation.ParamInt);
  edtDate.Date := Now;
end;

end.
