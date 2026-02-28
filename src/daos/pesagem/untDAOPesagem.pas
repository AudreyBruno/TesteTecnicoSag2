unit untDAOPesagem;

interface

uses FireDAC.Comp.Client, FireDAC.DApt, System.SysUtils, FireDAC.Stan.Error,
  untDAOBase, untModelPesagem;

type
  TDAOPesagem = class(TDAOBase<TPesagem>)
  public
    function save(AEntity: TPesagem; out erro: string): Boolean; override;
  end;

implementation

{ TDAOLote }

function TDAOPesagem.save(AEntity: TPesagem; out erro: string): Boolean;
var
  sp: TFDStoredProc;
begin
  Result := False;

  try
    sp := TFDStoredProc.Create(nil);
    try
      sp.Connection := FConn;
      sp.StoredProcName := 'SP_INSERIR_PESAGEM';
      sp.Prepare;

      sp.Params.ParamByName('PID_LOTE').AsInteger := AEntity.IDLote;
      sp.Params.ParamByName('PDATA').AsDate := AEntity.Data;
      sp.Params.ParamByName('PPESO_MEDIO').Value := AEntity.PesoMedio;
      sp.Params.ParamByName('PQTD').AsInteger := AEntity.Qtd;

      sp.ExecProc;
    finally
      sp.Free;
    end;

    Result := True;
  except
    on ex: exception do
    begin
      erro := 'Erro ao salvar pesagem: ' + ex.Message;
    end;
  end;
end;

end.
