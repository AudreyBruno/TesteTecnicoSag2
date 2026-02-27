unit untViewMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Menus;

type
  TfrmViewMain = class(TForm)
    pHeader: TPanel;
    lblTitle: TLabel;
    pBtnDelete: TPanel;
    sBtnDelete: TSpeedButton;
    pBtnAdd: TPanel;
    sBtnAdd: TSpeedButton;
    pBtnEdit: TPanel;
    sBtnEdit: TSpeedButton;
    pFilter: TPanel;
    pBtnFilter: TPanel;
    sBtnFilter: TSpeedButton;
    edtFilter: TEdit;
    DBGrid: TDBGrid;
    DataSource: TDataSource;
    PopupMenu: TPopupMenu;
    editPesagem: TMenuItem;
    editMortalidade: TMenuItem;
    Label1: TLabel;
    procedure sBtnAddClick(Sender: TObject);
    procedure editPesagemClick(Sender: TObject);
    procedure editMortalidadeClick(Sender: TObject);
  private
    procedure OpenEditLote(id_lote: Integer);
  public
  end;

var
  frmViewMain: TfrmViewMain;

implementation

{$R *.dfm}

uses Vcl.Loading, Vcl.Navigation, untViewEditLote, untViewEditMortalidade,
  untViewEditPesagem;

procedure TfrmViewMain.editMortalidadeClick(Sender: TObject);
begin
  TNavigation.ParamInt := 1;
  TNavigation.OpenModal(TfrmViewEditMortalidade, frmViewEditMortalidade, frmViewMain);
end;

procedure TfrmViewMain.editPesagemClick(Sender: TObject);
begin
  TNavigation.ParamInt := 1;
  TNavigation.OpenModal(TfrmViewEditPesagem, frmViewEditPesagem, frmViewMain);
end;

procedure TfrmViewMain.OpenEditLote(id_lote: Integer);
begin
  TNavigation.ParamInt := id_lote;
  TNavigation.OpenModal(TfrmViewEditLote, frmViewEditLote, frmViewMain);
end;

procedure TfrmViewMain.sBtnAddClick(Sender: TObject);
begin
  OpenEditLote(0);
end;

end.
