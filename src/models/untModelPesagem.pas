unit untModelPesagem;

interface

type
  TPesagem = class
  private
    FIDLote: Integer;
    FData: TDate;
    FID: Integer;
    FPesoMedio: Double;
    FQtd: Integer;
  public
    property ID: Integer read FID write FID;
    property IDLote: Integer read FIDLote write FIDLote;
    property Data: TDate read FData write FData;
    property PesoMedio: Double read FPesoMedio write FPesoMedio;
    property Qtd: Integer read FQtd write FQtd;
  end;

implementation

end.
