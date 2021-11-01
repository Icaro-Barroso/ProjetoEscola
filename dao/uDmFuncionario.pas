unit uDmFuncionario;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr, uFuncionarioModel, uDmConexao;

type
  TDmFuncionario = class(TDataModule)
    sqlFuncionario: TSQLDataSet;
    dsFuncionario: TDataSetProvider;
    cdsFuncionario: TClientDataSet;
    sqlPesquisarFuncionario: TSQLDataSet;
    dsPesquisarFuncionario: TDataSetProvider;
    cdsPesquisarFuncionario: TClientDataSet;
    cdsFuncionarioFNCCOD: TIntegerField;
    cdsFuncionarioPESCOD: TIntegerField;
    cdsFuncionarioFNCSLR: TFloatField;
    cdsFuncionarioFNCCRG: TStringField;
    cdsFuncionarioPESNOM: TStringField;
    cdsFuncionarioPESEND: TStringField;
    cdsFuncionarioPESDOC: TStringField;
    cdsFuncionarioPESIDT: TStringField;
    cdsFuncionarioESPTIP: TWideStringField;
    cdsFuncionarioESPCOD: TIntegerField;
  private
    { Private declarations }
  public
    procedure PesquisarFuncionario(sNome: string);
    procedure CarregarFuncionario(Funcionario: TFuncionario; iCodigo: integer);
    procedure CarregarTodosFuncionario;
    function Alterar(oFuncionario: TFuncionario; out sErro: string): boolean;
    function Inserir(oFuncionario: TFuncionario; out sErro: string): boolean;
    function GerarIdFuncionario(ANomeTabela: string): Integer;
    function GerarId: Integer;
    function ExcluirFuncionario(iFuncionario: Integer; out sErro: string): boolean;
  end;

var
  DmFuncionario: TDmFuncionario;

implementation

{$R *.dfm}

{ TDmFuncionario }

function TDmFuncionario.Alterar(oFuncionario: TFuncionario; out sErro: string): boolean;
begin
cdsPesquisarFuncionario.CommandText := format('SELECT * FROM PESSOA WHERE PESCOD = %d',
    [oFuncionario.CodigoPessoa]);
  cdsPesquisarFuncionario.Open;
  cdsPesquisarFuncionario.Edit;
  cdsPesquisarFuncionario.FieldByName('PESNOM').AsString := oFuncionario.NomeFuncionario;
  cdsPesquisarFuncionario.FieldByName('PESEND').AsString := oFuncionario.EnderecoFuncionario;
  cdsPesquisarFuncionario.FieldByName('PESDOC').AsString := oFuncionario.DocumentoFuncionario;
  cdsPesquisarFuncionario.Post;
  Result := cdsPesquisarFuncionario.ApplyUpdates(0) <> 0;
end;

procedure TDmFuncionario.CarregarFuncionario(Funcionario: TFuncionario; iCodigo: integer);
var
  sqlFuncionario: TSQLDataSet;
begin

  sqlFuncionario := TSQLDataSet.create(nil);
  try
    begin
      sqlFuncionario.close;
      sqlFuncionario.SQLConnection := DmConexao.sqlConexao;
      sqlFuncionario.CommandText := format('select * from v_FUNCIONARIO where pescod = %d',
    [iCodigo]);
      sqlFuncionario.Open;
      begin
        Funcionario.CodigoFuncionario := sqlFuncionario.FieldByName('FNCCOD').AsInteger;
        Funcionario.CodigoPessoa := sqlFuncionario.FieldByName('PESCOD').AsInteger;
        Funcionario.NomeFuncionario := sqlFuncionario.FieldByName('PESNOM').AsString;
        Funcionario.DocumentoFuncionario := sqlFuncionario.FieldByName('PESDOC').AsString;
        Funcionario.FuncionarioCargo := sqlFuncionario.FieldByName('FNCCRG').AsString;
        Funcionario.CodigoEspecialidade := sqlFuncionario.FieldByName('ESPCOD').AsInteger;
        Funcionario.FuncionarioSalario := sqlFuncionario.FieldByName('FNCSLR').AsString;
        Funcionario.EnderecoFuncionario:= sqlFuncionario.FieldByName('PESEND').AsString;
      end;
    end;
  finally
    FreeAndNil(sqlFuncionario);
  end;
end;

procedure TDmFuncionario.CarregarTodosFuncionario;
begin
  sqlFuncionario.CommandText := 'SELECT * FROM V_FUNCIONARIO';
end;

function TDmFuncionario.ExcluirFuncionario(iFuncionario: Integer; out sErro: string): boolean;
begin

  sqlPesquisarFuncionario.CommandText := format('select * from pessoa where pescod = %d', [iFuncionario]);
  cdsPesquisarFuncionario.Open;
  cdsPesquisarFuncionario.delete;
  Result := cdsPesquisarFuncionario.ApplyUpdates(0) <> 0;

end;

function TDmFuncionario.GerarId: Integer;
var
  sqlSequencia: TSQLDataSet;
begin
  try
    sqlSequencia := TSQLDataSet.Create(nil);
    sqlSequencia.SQLConnection := DmConexao.sqlConexao;
    sqlSequencia.CommandText := 'select coalesce(max(PESCOD),0)+1 as seq from PESSOA' ;
   sqlSequencia.Open;
    Result := sqlSequencia.FieldByName('seq').AsInteger;
  finally
    FreeAndNil(sqlSequencia);
  end;
end;

function TDmFuncionario.GerarIdFuncionario(ANomeTabela: string): Integer;
  var
  sqlSequencia: TSQLDataSet;
begin
  try
    sqlSequencia := TSQLDataSet.Create(nil);
    sqlSequencia.SQLConnection := DmConexao.sqlConexao;
    sqlSequencia.CommandText := 'SELECT COALESCE(MAX(FNCCOD),0)+1 AS SEQ FROM FUNCIONARIO' ;
   sqlSequencia.Open;
    Result := sqlSequencia.FieldByName('SEQ').AsInteger;
  finally
    FreeAndNil(sqlSequencia);
  end;
end;

function TDmFuncionario.Inserir(oFuncionario: TFuncionario; out sErro: string): boolean;
VAR
 IDPESSOA: INTEGER;
begin
  IDPESSOA := GerarId;
  sqlPesquisarFuncionario.CommandText := ('select p.* from pessoa p  where 1=0');
  cdsPesquisarFuncionario.Open;
  cdsPesquisarFuncionario.Append;
  cdsPesquisarFuncionario.FieldByName('PESCOD').AsInteger := IDPESSOA;
  cdsPesquisarFuncionario.FieldByName('PESNOM').AsString := oFuncionario.NomeFuncionario;
  cdsPesquisarFuncionario.FieldByName('PESEND').AsString := oFuncionario.EnderecoFuncionario;
  cdsPesquisarFuncionario.FieldByName('PESIDT').AsString := 'F';
  cdsPesquisarFuncionario.FieldByName('PESDOC').AsString := oFuncionario.DocumentoFuncionario;
  cdsPesquisarFuncionario.FieldByName('ESCCOD').AsInteger := 1;
  cdsPesquisarFuncionario.Post;
  cdsPesquisarFuncionario.ApplyUpdates(0);
  cdsPesquisarFuncionario.Close;
  sqlPesquisarFuncionario.CommandText := 'SELECT * FROM FUNCIONARIO WHERE 1=0';
  cdsPesquisarFuncionario.Open;
  cdsPesquisarFuncionario.Append;
  cdsPesquisarFuncionario.FieldByName('PESCOD').AsInteger := IDPESSOA;
  cdsPesquisarFuncionario.FieldByName('FNCCOD').AsInteger := GerarIdFuncionario('FUNCIONARIO');
  cdsPesquisarFuncionario.FieldByName('FNCSLR').AsString := oFuncionario.FuncionarioSalario;
  cdsPesquisarFuncionario.FieldByName('FNCCRG').AsString := oFuncionario.FuncionarioCargo;
  cdsPesquisarFuncionario.FieldByName('ESPCOD').AsInteger := oFuncionario.CodigoEspecialidade;
  cdsPesquisarFuncionario.Post;
  Result := cdsPesquisarFuncionario.ApplyUpdates(0) <> 0;
end;

procedure TDmFuncionario.PesquisarFuncionario(sNome: string);
begin
  if cdsFuncionario.Active then
    cdsFuncionario.close;
    cdsFuncionario.CommandText :=
    Format('SELECT * FROM V_FUNCIONARIO where PESNOM like %s', ['%' + sNome + '%']);
    cdsFuncionario.Open;
    cdsFuncionario.First;
end;

end.
