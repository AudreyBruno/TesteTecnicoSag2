unit untDAOLote;

interface

uses FireDAC.Comp.Client, FireDAC.DApt, System.SysUtils, FireDAC.Stan.Error,
  untDAOBase, untModelLote;

type
  TDAOLote = class(TDAOBase<TLote>)
  public
    function getAll(AValue: string; out erro: string): TFDQuery; override;
    function getById(AId: Integer; out erro: string): TLote; override;
    function save(AEntity: TLote; out erro: string): Boolean; override;
    function deleteById(AId: Integer; out erro: string): Boolean; override;
  end;

implementation

{ TDAOLote }

function TDAOLote.getById(AId: Integer; out erro: string): TLote;
var
  qry: TFDQuery;
  Lote: TLote;
begin
  Result := nil;

  try
    qry := TFDQuery.Create(nil);

    try
      qry.Connection := FConn;

      qry.sql.Text := 'SELECT * FROM tab_lote_aves WHERE id_lote LIKE :ID_LOTE';
      qry.ParamByName('ID_LOTE').AsInteger := AId;

      qry.Open;

      if not qry.IsEmpty then
      begin
        Lote := TLote.Create;
        Lote.ID := qry.FieldByName('id_lote').AsInteger;
        Lote.Descricao := qry.FieldByName('descricao').AsString;
        Lote.DataEntrada := qry.FieldByName('data_entrada').AsDateTime;
        Lote.QuantidadeInicial := qry.FieldByName('quantidade_inicial')
          .AsInteger;

        Result := Lote;
      end;

      erro := '';
    finally
      qry.Free;
    end;
  except
    on ex: exception do
    begin
      erro := 'Erro ao buscar lote: ' + ex.Message;
    end;
  end;
end;

function TDAOLote.save(AEntity: TLote; out erro: string): Boolean;
var
  sp: TFDStoredProc;
begin
  Result := False;

  try
    sp := TFDStoredProc.Create(nil);
    try
      sp.Connection := FConn;
      sp.StoredProcName := 'SP_INSERIR_ALTERAR_LOTE';
      sp.Prepare;

      if AEntity.ID > 0 then
        sp.Params.ParamByName('PID_LOTE').AsInteger := AEntity.ID
      else
        sp.Params.ParamByName('PID_LOTE').Clear;

      sp.Params.ParamByName('PDESCRICAO').AsString := AEntity.Descricao;
      sp.Params.ParamByName('PDATA_ENTRADA').AsDate := AEntity.DataEntrada;
      sp.Params.ParamByName('PQTD_INICIAL').AsInteger :=
        AEntity.QuantidadeInicial;

      sp.ExecProc;
    finally
      sp.Free;
    end;

    Result := True;
  except
    on ex: exception do
    begin
      erro := 'Erro ao salvar lote: ' + ex.Message;
    end;
  end;
end;

function TDAOLote.deleteById(AId: Integer; out erro: string): Boolean;
var
  sp: TFDStoredProc;
begin
  Result := False;

  try
    sp := TFDStoredProc.Create(nil);
    try
      sp.Connection := FConn;
      sp.StoredProcName := 'SP_EXCLUIR_LOTE';
      sp.Prepare;

      sp.Params.ParamByName('PID_LOTE').AsInteger := AId;

      sp.ExecProc;
    finally
      sp.Free;
    end;

    Result := True;
  except
    on ex: exception do
    begin
      erro := 'Erro ao excluir lote: ' + ex.Message;
    end;
  end;
end;

function TDAOLote.getAll(AValue: string; out erro: string): TFDQuery;
var
  qry: TFDQuery;
begin
  Result := nil;

  try
    qry := TFDQuery.Create(nil);
    qry.Connection := FConn;

    qry.sql.Text :=
      'SELECT l.*, l.quantidade_inicial - COALESCE(m.total_morta, 0)' +
      ' AS quantidade_restante, p.peso_medio FROM tab_lote_aves l' +
      ' LEFT JOIN (SELECT id_lote_fk, SUM(quantidade_morta) AS total_morta' +
      ' FROM tab_mortalidade GROUP BY id_lote_fk) m' +
      ' ON m.id_lote_fk = l.id_lote LEFT JOIN (SELECT id_lote_fk,' +
      ' AVG(peso_medio) AS peso_medio FROM tab_pesagem GROUP BY id_lote_fk)' +
      ' p ON p.id_lote_fk = l.id_lote';

    if AValue <> '' then
    begin
      qry.sql.Add('WHERE l.descricao LIKE :DESCRICAO');
      qry.ParamByName('DESCRICAO').AsString := '%' + AValue + '%';
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
