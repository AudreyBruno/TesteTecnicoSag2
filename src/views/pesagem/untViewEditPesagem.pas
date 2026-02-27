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
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewEditPesagem: TfrmViewEditPesagem;

implementation

{$R *.dfm}

uses Vcl.Navigation;

procedure TfrmViewEditPesagem.FormShow(Sender: TObject);
begin
  inherited;
  lblTitle.Caption := 'Nova Pesagem para lote: ' +
    IntToStr(TNavigation.ParamInt);
  edtDate.Date := Now;
end;

end.
