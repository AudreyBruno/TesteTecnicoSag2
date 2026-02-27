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

uses Vcl.Navigation;
{ TfrmViewEditLote }

{ TfrmViewEditLote }

procedure TfrmViewEditLote.FormShow(Sender: TObject);
begin
  inherited;
  if TNavigation.ParamInt > 0 then
  begin
    lblTitle.Caption := 'Editar Lote: ' + IntToStr(TNavigation.ParamInt);

    Exit;
  end;

  lblTitle.Caption := 'Cadastrar Lote';
  edtDate.Date := Now;
end;

procedure TfrmViewEditLote.Save;
begin
  inherited;
  Sleep(3000);
end;

end.
