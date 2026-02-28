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
    procedure sBtnEditClick(Sender: TObject);
    procedure sBtnDeleteClick(Sender: TObject);
  private
    procedure OpenEditLote(id_lote: Integer);
    procedure getData;
    procedure adjustTitles(DataSet: TDataSet);
    procedure TThreadTerminate(Sender: TObject);
    procedure TThreadTerminateDelete(Sender: TObject);
  public
  end;

var
  frmViewMain: TfrmViewMain;

implementation

{$R *.dfm}

uses Vcl.Loading, Vcl.Navigation, untViewEditLote, untViewEditMortalidade,
  untViewEditPesagem, untDAOLote, DataModule.Main, utils;

procedure TfrmViewMain.TThreadTerminate(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
    if Assigned(TThread(Sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(Sender).FatalException).Message);
      Exit;
    end;
end;

procedure TfrmViewMain.TThreadTerminateDelete(Sender: TObject);
begin
  TLoading.Hide;

  if Sender is TThread then
    if Assigned(TThread(Sender).FatalException) then
    begin
      ShowMessage(Exception(TThread(Sender).FatalException).Message);
      Exit;
    end;

  getData;
end;

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

  if vlRest = vlInit then
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
var
  id_lote: Integer;
begin
  id_lote := DBGrid.DataSource.DataSet.FieldByName('ID_LOTE').AsInteger;
  TNavigation.ParamInt := id_lote;
  TNavigation.ExecuteOnClose := getData;
  TNavigation.OpenModal(TfrmViewEditMortalidade, frmViewEditMortalidade,
    frmViewMain);
end;

procedure TfrmViewMain.editPesagemClick(Sender: TObject);
var
  id_lote: Integer;
begin
  id_lote := DBGrid.DataSource.DataSet.FieldByName('ID_LOTE').AsInteger;
  TNavigation.ParamInt := id_lote;
  TNavigation.ExecuteOnClose := getData;
  TNavigation.OpenModal(TfrmViewEditPesagem, frmViewEditPesagem, frmViewMain);
end;

procedure TfrmViewMain.FormShow(Sender: TObject);
begin
  getData;
end;

procedure TfrmViewMain.getData;
var
  erro: string;
begin
  TLoading.Show();

  TLoading.ExecuteThread(
    procedure
    var
      DAO: TDAOLote;
      qry: TFDQuery;
    begin
      DAO := TDAOLote.Create(DMMain.FDConn);
      try
        qry := DAO.getAll(edtFilter.Text, erro);

        if erro <> '' then
          raise Exception.Create(erro);

        TThread.Queue(nil,
          procedure
          begin
            DataSource.DataSet := qry;
            adjustTitles(qry);
          end);

      finally
        DAO.Free;
      end;
    end, TThreadTerminate);
end;

procedure TfrmViewMain.OpenEditLote(id_lote: Integer);
begin
  TNavigation.ParamInt := id_lote;
  TNavigation.ExecuteOnClose := getData;
  TNavigation.OpenModal(TfrmViewEditLote, frmViewEditLote, frmViewMain);
end;

procedure TfrmViewMain.sBtnAddClick(Sender: TObject);
begin
  OpenEditLote(0);
end;

procedure TfrmViewMain.sBtnDeleteClick(Sender: TObject);
var
  DAO: TDAOLote;
  erro: string;
  id_lote: Integer;
begin
  id_lote := DBGrid.DataSource.DataSet.FieldByName('ID_LOTE').AsInteger;
  if MessageDlg('Realmente deseja excluir o lote ' + IntToStr(id_lote) + '?',
    mtConfirmation, [TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo], 0) = mrYes then
  begin
    TLoading.Show;
    TLoading.ExecuteThread(
      procedure
      begin
        DAO := TDAOLote.Create(DMMain.FDConn);

        try
          if not DAO.deleteById(id_lote, erro) then
          begin
            raise Exception.Create(erro);
          end;
        finally
          DAO.Free;
        end;
      end, TThreadTerminateDelete);
  end;
end;

procedure TfrmViewMain.sBtnEditClick(Sender: TObject);
var
  id_lote: Integer;
begin
  id_lote := DBGrid.DataSource.DataSet.FieldByName('ID_LOTE').AsInteger;
  OpenEditLote(id_lote);
end;

procedure TfrmViewMain.sBtnFilterClick(Sender: TObject);
begin
  getData;
end;

end.
