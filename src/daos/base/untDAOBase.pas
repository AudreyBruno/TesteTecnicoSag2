unit untDAOBase;

interface

uses FireDAC.Comp.Client;

type
  TDAOBase = class
  protected
    FConn: TFDConnection;
  public
    constructor Create(AConn: TFDConnection);
  end;

implementation

{ TDAOBase }

constructor TDAOBase.Create(AConn: TFDConnection);
begin
  FConn := AConn;
end;

end.
