unit untModelMortalidade;

interface

type
  TMortalidade = class
  private
    FIDLote: Integer;
    FQtd: Integer;
    FID: Integer;
    FData: TDate;
    FObs: string;
  public
    property ID: Integer read FID write FID;
    property IDLote: Integer read FIDLote write FIDLote;
    property Data: TDate read FData write FData;
    property Qtd: Integer read FQtd write FQtd;
    property Obs: string read FObs write FObs;
  end;

implementation

end.
