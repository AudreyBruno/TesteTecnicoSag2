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
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewEditMortalidade: TfrmViewEditMortalidade;

implementation

{$R *.dfm}

uses Vcl.Navigation;

procedure TfrmViewEditMortalidade.FormShow(Sender: TObject);
begin
  inherited;
  lblTitle.Caption := 'Nova Mortalidade para lote: ' +
    IntToStr(TNavigation.ParamInt);
  edtDate.Date := Now;
end;

end.
