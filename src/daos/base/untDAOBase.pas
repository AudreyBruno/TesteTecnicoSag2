unit untDAOBase;

interface

uses FireDAC.Comp.Client, FireDAC.DApt;

type
  TDAOBase = class
  protected
    FConn: TFDConnection;
  public
    constructor Create(AConn: TFDConnection);
    function getAll(ADescription: string; out erro: string): TFDQuery; virtual; abstract;
  end;

implementation

{ TDAOBase }

constructor TDAOBase.Create(AConn: TFDConnection);
begin
  FConn := AConn;
end;

end.
