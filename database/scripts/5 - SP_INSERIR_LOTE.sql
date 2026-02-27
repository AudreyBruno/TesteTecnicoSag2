SET TERM ^ ;

create or alter procedure SP_INSERIR_LOTE (
    PID_LOTE integer,
    PDESCRICAO varchar(100),
    PDATA_ENTRADA date,
    PQTD_INICIAL integer
)
as
begin
    if (PQTD_INICIAL <= 0) then
        exception EX_QTD_INVALIDA;

    if (PID_LOTE is null) then
    begin
        insert into TAB_LOTE_AVES (
            DESCRICAO,
            DATA_ENTRADA,
            QUANTIDADE_INICIAL
        )
        values (
            :PDESCRICAO,
            :PDATA_ENTRADA,
            :PQTD_INICIAL
        );
    end
    else
    begin
        update TAB_LOTE_AVES
        set
            DESCRICAO = :PDESCRICAO,
            DATA_ENTRADA = :PDATA_ENTRADA,
            QUANTIDADE_INICIAL = :PQTD_INICIAL
        where ID_LOTE = :PID_LOTE;

        if (row_count = 0) then
            exception EX_REGISTRO_NAO_ENCONTRADO;
    end
end^

SET TERM ; ^

GRANT SELECT,INSERT,UPDATE ON TAB_LOTE_AVES TO PROCEDURE SP_INSERIR_LOTE;

GRANT EXECUTE ON PROCEDURE SP_INSERIR_LOTE TO SYSDBA;