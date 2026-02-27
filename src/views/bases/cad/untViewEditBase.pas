unit untViewEditBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmViewEditBase = class(TForm)
    pFooter: TPanel;
    pBtnCancel: TPanel;
    sBtnCancel: TSpeedButton;
    pBtnSave: TPanel;
    sBtnSave: TSpeedButton;
    Label1: TLabel;
    procedure sBtnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure sBtnCancelClick(Sender: TObject);
  private
    procedure Save;
    procedure TThreadTerminate(Sender: TObject);
  public
  end;

var
  frmViewEditBase: TfrmViewEditBase;

implementation

{$R *.dfm}

uses Vcl.Loading, Vcl.Navigation;

{ TfrmViewCadBase }

procedure TfrmViewEditBase.TThreadTerminate(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
    if Assigned(TThread(Sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(Sender).FatalException).Message);
      Exit;
    end;
end;

procedure TfrmViewEditBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmViewEditBase.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F4:
      begin
        if (ssAlt in Shift) then
          Key := 0;

        TNavigation.Close(Self);
      end;

    VK_ESCAPE:
      begin
        Key := 0;
        TNavigation.Close(Self);
      end;
  end;
end;

procedure TfrmViewEditBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
    Key := #0;
end;

procedure TfrmViewEditBase.Save;
begin

end;

procedure TfrmViewEditBase.sBtnCancelClick(Sender: TObject);
begin
  TNavigation.Close(Self);
end;

procedure TfrmViewEditBase.sBtnSaveClick(Sender: TObject);
begin
  TLoading.Show();

  TLoading.ExecuteThread(Save, TThreadTerminate);
end;

end.
