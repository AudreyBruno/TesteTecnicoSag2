unit untDAOLote;

interface

uses FireDAC.Comp.Client, FireDAC.DApt, System.SysUtils, untDAOBase;

type
  TDAOLote = class(TDAOBase)
  public
    function getAll(ADescription: string; out erro: string): TFDQuery; override;
  end;

implementation

{ TDAOLote }

{ TDAOLote }

function TDAOLote.getAll(ADescription: string; out erro: string): TFDQuery;
var
  qry: TFDQuery;
begin
  Result := nil;

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := FConn;

    qry.sql.Text := 'SELECT l.*, l.quantidade_inicial - m.quantidade_morta' +
      ' AS quantidade_restante FROM tab_lote_aves l' +
      ' LEFT JOIN tab_mortalidade m ON l.id_lote = m.id_lote_fk';

    if ADescription <> '' then
    begin
      qry.sql.Add('WHERE l.descricao LIKE :DESCRICAO');
      qry.ParamByName('DESCRICAO').AsString := '%' + ADescription + '%';
    end;

    qry.Open;

    Result := qry;
    erro := '';
  except
    on ex: exception do
    begin
      erro := 'Erro ao buscar lotes: ' + ex.Message;
    end;
  end;
end;

end.
