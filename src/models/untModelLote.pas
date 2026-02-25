unit untModelLote;

interface

type
  TLote = class
  private
    FID: Integer;
    FDescricao: string;
    FDataEntrada: TDate;
    FQuantidadeInicial: Integer;
  public
    property ID: Integer read FID write FID;
    property Descricao: string read FDescricao write FDescricao;
    property DataEntrada: TDate read FDataEntrada write FDataEntrada;
    property QuantidadeInicial: Integer read FQuantidadeInicial
      write FQuantidadeInicial;
  end;

implementation

end.
