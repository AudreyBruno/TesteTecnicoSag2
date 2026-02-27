unit untViewMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.Menus, FireDAC.Comp.Client;

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
    Panel1: TPanel;
    pWhite: TPanel;
    pGreen: TPanel;
    pYellow: TPanel;
    pRed: TPanel;
    Label2: TLabel;
    procedure sBtnAddClick(Sender: TObject);
    procedure editPesagemClick(Sender: TObject);
    procedure editMortalidadeClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sBtnFilterClick(Sender: TObject);
    procedure DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    procedure OpenEditLote(id_lote: Integer);
    procedure getData;
    procedure adjustTitles(DataSet: TDataSet);
  public
  end;

var
  frmViewMain: TfrmViewMain;

implementation

{$R *.dfm}

uses Vcl.Loading, Vcl.Navigation, untViewEditLote, untViewEditMortalidade,
  untViewEditPesagem, untDAOLote, DataModule.Main, utils;

procedure TfrmViewMain.adjustTitles(DataSet: TDataSet);
var
  i: Integer;
begin
  for i := 0 to DataSet.Fields.Count - 1 do
    DataSet.Fields[i].DisplayLabel :=
      TUtils.formatTitle(DataSet.Fields[i].FieldName);
end;

procedure TfrmViewMain.DBGridDrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  vlInit, vlRest: Integer;
  percent: Double;
begin
  vlInit := Column.Field.DataSet.FieldByName('quantidade_inicial').AsInteger;
  vlRest := Column.Field.DataSet.FieldByName('quantidade_restante').AsInteger;

  if vlRest <= 0 then
    Exit;

  percent := 100 - ((vlRest / vlInit) * 100);

  if percent < 5 then
    DBGrid.Canvas.Brush.Color := clGreen
  else if percent <= 10 then
    DBGrid.Canvas.Brush.Color := clYellow
  else
    DBGrid.Canvas.Brush.Color := clRed;

  DBGrid.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmViewMain.editMortalidadeClick(Sender: TObject);
begin
  TNavigation.ParamInt := 1;
  TNavigation.OpenModal(TfrmViewEditMortalidade, frmViewEditMortalidade,
    frmViewMain);
end;

procedure TfrmViewMain.editPesagemClick(Sender: TObject);
begin
  TNavigation.ParamInt := 1;
  TNavigation.OpenModal(TfrmViewEditPesagem, frmViewEditPesagem, frmViewMain);
end;

procedure TfrmViewMain.FormShow(Sender: TObject);
begin
  getData;
end;

procedure TfrmViewMain.getData;
var
  DAO: TDAOLote;
  qry: TFDQuery;
  erro: string;
begin
  DAO := TDAOLote.Create(DMMain.FDConn);

  try
    qry := DAO.getAll(edtFilter.Text, erro);

    if erro <> '' then
    begin
      ShowMessage(erro);
      Exit;
    end;

    DataSource.DataSet := qry;
    adjustTitles(qry);
  finally
    DAO.Free;
  end;
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

procedure TfrmViewMain.sBtnFilterClick(Sender: TObject);
begin
  getData;
end;

end.
