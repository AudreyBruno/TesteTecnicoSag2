unit untViewEditLote;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untViewEditBase, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmViewEditLote = class(TfrmViewEditBase)
    Label1: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    edtQtd: TEdit;
    Label3: TLabel;
    edtDate: TDateTimePicker;
    procedure FormShow(Sender: TObject);
  private
  protected
    procedure Save; override;
  public
  end;

var
  frmViewEditLote: TfrmViewEditLote;

implementation

{$R *.dfm}

uses Vcl.Navigation, untDAOLote, untModelLote, DataModule.Main;
{ TfrmViewEditLote }

{ TfrmViewEditLote }

procedure TfrmViewEditLote.FormShow(Sender: TObject);
var
  DAO: TDAOLote;
  Lote: TLote;
  erro: string;
begin
  inherited;
  if TNavigation.ParamInt > 0 then
  begin
    lblTitle.Caption := 'Editar Lote: ' + IntToStr(TNavigation.ParamInt);

    DAO := TDAOLote.Create(DMMain.FDConn);
    Lote := TLote.Create;
    try
      Lote := DAO.getById(TNavigation.ParamInt, erro);

      edtDescricao.Text := Lote.Descricao;
      edtDate.Date := Lote.DataEntrada;
      edtQtd.Text := IntToStr(Lote.QuantidadeInicial);
    finally
      DAO.Free;
      Lote.Free;
    end;

    Exit;
  end;

  lblTitle.Caption := 'Cadastrar Lote';
  edtDate.Date := Now;
end;

procedure TfrmViewEditLote.Save;
var
  DAO: TDAOLote;
  Lote: TLote;
  erro: string;
  insert: Boolean;
begin
  inherited;
  DAO := TDAOLote.Create(DMMain.FDConn);
  Lote := TLote.Create;

  try
    Lote.ID := TNavigation.ParamInt;
    Lote.Descricao := edtDescricao.Text;
    Lote.DataEntrada := edtDate.Date;
    Lote.QuantidadeInicial := StrToInt(edtQtd.Text);

    insert := DAO.Save(Lote, erro);

    if not insert then
    begin
      raise Exception.Create(erro);
    end;
  finally
    DAO.Free;
    Lote.Free;
  end;
end;

end.
