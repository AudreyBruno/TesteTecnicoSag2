unit untViewMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewMain: TfrmViewMain;

implementation

{$R *.dfm}

uses Vcl.Loading;

end.
