SET TERM ^ ;

create or alter procedure SP_EXCLUIR_LOTE (
    PID_LOTE integer
)
as
begin
    if (PID_LOTE is null) then
        exception EX_REGISTRO_NAO_ENCONTRADO;

    delete from TAB_LOTE_AVES
    where ID_LOTE = :PID_LOTE;

    if (row_count = 0) then
        exception EX_REGISTRO_NAO_ENCONTRADO;
end^

SET TERM ; ^

GRANT SELECT,DELETE ON TAB_LOTE_AVES TO PROCEDURE SP_EXCLUIR_LOTE;

GRANT EXECUTE ON PROCEDURE SP_EXCLUIR_LOTE TO SYSDBA;