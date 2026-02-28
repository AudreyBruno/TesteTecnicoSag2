unit untDAOMortalidade;

interface

uses FireDAC.Comp.Client, FireDAC.DApt, System.SysUtils, FireDAC.Stan.Error,
  untDAOBase, untModelMortalidade;

type
  TDAOMortalidade = class(TDAOBase<TMortalidade>)
  public
    function save(AEntity: TMortalidade; out erro: string): Boolean; override;
  end;

implementation

{ TDAOLote }

function TDAOMortalidade.save(AEntity: TMortalidade; out erro: string): Boolean;
var
  sp: TFDStoredProc;
begin
  Result := False;

  try
    sp := TFDStoredProc.Create(nil);
    try
      sp.Connection := FConn;
      sp.StoredProcName := 'SP_INSERIR_MORTALIDADE';
      sp.Prepare;

      sp.Params.ParamByName('PID_LOTE').AsInteger := AEntity.IDLote;
      sp.Params.ParamByName('PDATA').AsDate := AEntity.Data;
      sp.Params.ParamByName('PQTD').AsInteger := AEntity.Qtd;
      sp.Params.ParamByName('POBS').AsString := AEntity.Obs;

      sp.ExecProc;
    finally
      sp.Free;
    end;

    Result := True;
  except
    on ex: exception do
    begin
      erro := 'Erro ao salvar mortalidade: ' + ex.Message;
    end;
  end;
end;

end.
