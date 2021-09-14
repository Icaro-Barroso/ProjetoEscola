unit uDmCliente;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, uClienteModel, uDmConexao;

type
  TDataModule1 = class(TDataModule)
    sqlPesquisar: TSQLDataSet;
    sqlInserir: TSQLDataSet;
    sqlAlterar: TSQLDataSet;
    sqlExcluir: TSQLDataSet;
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    cdsPesquisarPESCOD: TIntegerField;
    cdsPesquisarPESDOC: TStringField;
    cdsPesquisarESCCOD: TIntegerField;
    cdsPesquisarPESIDT: TStringField;
    cdsPesquisarPESNOM: TStringField;
    cdsPesquisarPESEND: TStringField;
    sqlPesquisarAluno: TSQLDataSet;
  private
    { Private declarations }
  public
    function GerarId(ANomeTabela: string): Integer;
    procedure Pesquisar(sNome: string);
    procedure CarregarCliente(oCliente: TCliente; iCodigo: Integer);
    function Inserir(oCliente: TCliente; out sErro: string): boolean;
    function Alterar(oCliente: TCliente; out sErro: string): boolean;
    function Excluir(iCliente: Integer; out sErro: string): boolean;
  end;

var
  DataModule1: TDataModule1;

implementation


{$R *.dfm}

{ TDataModule1 }

function TDataModule1.Alterar(oCliente: TCliente; out sErro: string): boolean;
begin
  with sqlAlterar, oCliente do
  begin
    Params[0].AsString := NOME;
    Params[1].AsInteger := ID;
//    Params[2].AsString := Tipo;
//    Params[3].AsString := Documento;
//    Params[4].AsString := Endereco;
    try
      ExecSQL();
      Result := True;

    except on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao alterar: ' + sLineBreak + E.Message;
        Result := False;

      end;
    end;
  end;
end;

procedure TDataModule1.CarregarCLiente(oCliente: TCliente; iCodigo: Integer);
var
  sqlCliente: TSQLDataSet;
begin
  sqlCLiente := TSQLDataSet.create(nil);
  try
    with sqlCliente do
    begin
      SQLConnection := DmConexao.sqlConexao;
     CommandText := 'Select * from Pessoa where PESCOD = ' + IntToStr(iCodigo);
      Open;
      with oCliente do
      begin
        ID := FieldByName('PESCOD').AsInteger;
        CodigoEscola := FieldByName('ESCCOD').AsInteger;
        Nome := sqlCliente.FieldByName('PESNOM').AsString;
        Tipo := FieldByName('PESIDT').AsString;
        Documento := FieldByName('PESDOC').AsString;
        Endereco := sqlCliente.FieldByName('PESEND').AsString;

      end;
    end;
  finally
    FreeAndNil(sqlCliente);
  end;
end;

function TDataModule1.Excluir(iCliente: Integer; out sErro: string): boolean;
begin
sqlExcluir.Params[0].AsInteger := iCliente;
  with sqlExcluir do
  begin
    try
      sqlExcluir.ExecSQL();
      Result := true;
    except on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao excluir: ' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

function TDataModule1.GerarId(ANomeTabela: string): Integer;
var
  sqlSequencia: TSQLDataSet;
begin
  try
    sqlSequencia := TSQLDataSet.Create(nil);
    sqlSequencia.SQLConnection := DmConexao.sqlConexao;
    sqlSequencia.CommandText :=
      Format('SELECT COALESCE(ProximoCodigo,1) FROM CodigoAuxiliar WHERE TABELA = ''%s''',[ANomeTabela]);
    sqlSequencia.Open;
    result := sqlSequencia.Fields[0].AsInteger;
    sqlSequencia.CommandText := Format('UPDATE CODIGOAUXILIAR SET PROXIMOCODIGO = COALESCE(ProximoCodigo,1) + 1' +
    'WHERE TABELA = ''%s''',[ANomeTabela]);
    sqlSequencia.ExecSQL();
  finally
    FreeAndNil(sqlSequencia);
  end;
end;

function TDataModule1.Inserir(oCliente: TCliente; out sErro: string): boolean;
begin
  with sqlInserir, oCLiente do
  begin
    Params[0].AsInteger := GerarId('PESSOA');
    Params[1].AsInteger := CodigoEscola;
    Params[2].AsString := Nome;
    Params[3].AsString := Endereco;
    Params[4].AsString := Tipo;
    Params[5].AsString := Documento;
    try
      ExecSQL();
      Result := True;
    except on E: Exception do
      begin
        sErro := 'Ocorreu um erro ao inserir: ' + sLineBreak + E.Message;
        Result := False;
      end;
    end;
  end;
end;

procedure TDataModule1.Pesquisar(sNome: string);
begin
 if cdsPesquisar.Active then
    cdsPesquisar.close;
  cdsPesquisar.CommandText := Format('select * from PESSOA where PESNOM like %s',[ QuotedStr('%' + sNome + '%') ]);
  //cdsPesquisar.Params[0].AsString := '%' + sNome + '%';
  cdsPesquisar.Open;
  cdsPesquisar.First;

end;

end.

