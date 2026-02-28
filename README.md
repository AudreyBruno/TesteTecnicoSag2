# Avaliação Prática – Desenvolvedor Delphi

# Tecnologias Utilizadas

* Delphi 12
* Firebird 2.1

---

# Como Executar o Projeto

## 1. Clone o repositório ou extraia o zip

## 2. Criar Banco de Dados

Executar os scripts:

```
/database/scripts
```
### ou extraia o ABDB.zip

---

## 3. Abrir Projeto

Abrir no Delphi:

```
TesteTecnicoSag.dproj
```

Compilar e executar.

---

## 4. Configurar Conexão

Copie o arquivo Config.ini pra mesma pasta onde esta o TesteTecnicoSag.exe
Configure o caminho do banco, usuário e senha
O ABDB.zip esta com usuário e senha padrão do firebird:
  USER: SYSDBA
  PASSWORD: masterkey

# Fluxo de Uso

1. Criar ou visualizar lotes
2. Selecionar um lote
3. Registrar pesagens
4. Registrar mortalidades
5. Acompanhar indicador de saúde do lote

---

# Requisitos para Execução

* Delphi instalado
* Acesso a banco Firebird >= 2.1
* Scripts executados previamente ou banco descompactado