unit untDAOBase;

interface

uses FireDAC.Comp.Client, FireDAC.DApt;

type
  TDAOBase<T: class> = class
  protected
    FConn: TFDConnection;
  public
    constructor Create(AConn: TFDConnection);
    function getAll(AValue: string; out erro: string): TFDQuery;
      virtual; abstract;
    function getById(AId: Integer; out erro: string): T; virtual; abstract;
    function save(AEntity: T; out erro: string): Boolean; virtual; abstract;
  end;

implementation

{ TDAOBase }

constructor TDAOBase<T>.Create(AConn: TFDConnection);
begin
  FConn := AConn;
end;

end.
