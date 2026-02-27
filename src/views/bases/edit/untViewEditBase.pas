unit untViewEditBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmViewCadBase = class(TForm)
    pFooter: TPanel;
    pBtnCancel: TPanel;
    sBtnCancel: TSpeedButton;
    pBtnSave: TPanel;
    sBtnSave: TSpeedButton;
    Label1: TLabel;
    procedure sBtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure Save;
    procedure TThreadTerminate(Sender: TObject);
  public
  end;

var
  frmViewCadBase: TfrmViewCadBase;

implementation

{$R *.dfm}

uses Vcl.Loading, Vcl.Navigation;

{ TfrmViewCadBase }

procedure TfrmViewCadBase.TThreadTerminate(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
    if Assigned(TThread(Sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(Sender).FatalException).Message);
      Exit;
    end;
end;

procedure TfrmViewCadBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmViewCadBase.Save;
begin

end;

procedure TfrmViewCadBase.sBtnSaveClick(Sender: TObject);
begin
  TLoading.Show();

  TLoading.ExecuteThread(Save, TThreadTerminate);
end;

end.
