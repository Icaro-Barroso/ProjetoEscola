unit uDmAluno;

interface

uses
  SysUtils, Classes, uDmConexao, FMTBcd, DBClient, Provider, DB, SqlExpr,
    uAlunoModel;

type
  TDmAluno = class(TDataModule)
    sqlPesquisarAluno: TSQLDataSet;
    sqlInserirAluno: TSQLDataSet;
    sqlAlterarAluno: TSQLDataSet;
    sqlExcluirAluno: TSQLDataSet;
    dspPesquisarAluno: TDataSetProvider;
    cdsPesquisarAluno: TClientDataSet;
    SQLDataSet2: TSQLDataSet;
    DataSetProvider2: TDataSetProvider;
    ClientDataSet2: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PesquisarAluno(sNome: string);
    procedure CarregarAluno(Aluno: TAluno; iCodigo: integer);
    procedure CarregarTodosAlunos;
    function Alterar(oAluno: TAluno; out sErro: string): boolean;
    function Inserir(oAluno: TAluno; out sErro: string): boolean;
    function GerarIdAluno(ANomeTabela: string): Integer;
    function GerarId(ANomeTabela: string): Integer;
  end;

var
  DmAluno: TDmAluno;

implementation

{$R *.dfm}

{ TDmAluno }

function TDmAluno.Alterar(oAluno: TAluno; out sErro: string): boolean;
begin
  SQLDataSet2.CommandText := format('select * from pessoa where pescod = %d',
    [oAluno.CodigoPessoa]);
  ClientDataSet2.Open;
  ClientDataSet2.Edit;
  ClientDataSet2.FieldByName('ESCCOD').AsInteger := oAluno.CodigoEscola;
  ClientDataSet2.FieldByName('PESNOM').AsString := oAluno.NomeAluno;
  ClientDataSet2.FieldByName('PESEND').AsString := oAluno.EnderecoAluno;
  //  ClientDataSet2.FieldByName('PESIDT').AsString := oAluno.DocumentoAluno;
  ClientDataSet2.FieldByName('PESDOC').AsString := oAluno.DocumentoAluno;
  ClientDataSet2.Post;
  Result := ClientDataSet2.ApplyUpdates(0) <> 0;
end;

procedure TDmAluno.CarregarAluno(Aluno: TAluno; iCodigo: integer);
var
  sqlAluno: TSQLDataSet;
begin

  sqlAluno := TSQLDataSet.create(nil);
  try
    begin
      sqlAluno.SQLConnection := DmConexao.sqlConexao;
      sqlAluno.CommandText := format('select * from v_Aluno where pescod = %d',
    [iCodigo]);
      sqlAluno.Open;
      begin
        Aluno.CodigoAluno := sqlAluno.FieldByName('ALNCOD').AsInteger;
        Aluno.CodigoPessoa := sqlAluno.FieldByName('PESCOD').AsInteger;
        Aluno.NomeAluno := sqlAluno.FieldByName('PESNOM').AsString;
         Aluno.CodigoSerie := sqlAluno.FieldByName('SRICOD').AsInteger;
        Aluno.DocumentoAluno := sqlAluno.FieldByName('PESDOC').AsString;
        //Aluno.EnderecoAluno := sqlAluno.FieldByName('PESEND').AsString;
       //funcao carregaaluno (oaluno, codigodele ) select * from aluno wherre pescod = CODIGODELE
      end;
    end;
  finally
    FreeAndNil(sqlAluno);
  end;
end;

procedure TDmAluno.CarregarTodosAlunos;
begin
  sqlPesquisarAluno.CommandText := 'SELECT * FROM V_ALUNO';
end;

function TDmAluno.GerarId(ANomeTabela: string): Integer;
begin
  result := 10;
end;

function TDmAluno.GerarIdAluno(ANomeTabela: string): Integer;
begin
  result := 2;
end;



function TDmAluno.Inserir(oAluno: TAluno; out sErro: string): boolean;
VAR
 IDPESSOA: INTEGER;
begin
  IDPESSOA := GerarId('PESSOA');
  SQLDataSet2.CommandText := ('select p.* from pessoa p  where 1=0');
  ClientDataSet2.Open;
  ClientDataSet2.Append;
  ClientDataSet2.FieldByName('PESCOD').AsInteger := IDPESSOA;
  ClientDataSet2.FieldByName('ESCCOD').AsInteger := oAluno.CodigoEscola;
  ClientDataSet2.FieldByName('PESNOM').AsString := oAluno.NomeAluno;
  ClientDataSet2.FieldByName('PESEND').AsString := oAluno.EnderecoAluno;
  ClientDataSet2.FieldByName('PESIDT').AsString := 'F';
  ClientDataSet2.FieldByName('PESDOC').AsString := oAluno.DocumentoAluno;

  ClientDataSet2.Post;
  ClientDataSet2.ApplyUpdates(0);
  ClientDataSet2.Close;
    SQLDataSet2.CommandText := 'select * from Aluno where 1=0';
  ClientDataSet2.Open;
  ClientDataSet2.Append;
  ClientDataSet2.FieldByName('PESCOD').AsInteger := IDPESSOA;
  ClientDataSet2.FieldByName('ALNCOD').AsInteger := GerarIdAluno('ALUNO');
  ClientDataSet2.FieldByName('SRICOD').AsInteger := oAluno.CodigoSerie;
  ClientDataSet2.Post;
  Result := ClientDataSet2.ApplyUpdates(0) <> 0;
end;

procedure TDmAluno.PesquisarAluno(sNome: string);
begin
  if cdsPesquisarAluno.Active then
    cdsPesquisarAluno.close;
  cdsPesquisarAluno.CommandText :=
    Format('select * from V_Aluno where PESNOM like %s', ['%' + sNome + '%']);
  //cdsPesquisar.Params[0].AsString := '%' + sNome + '%';
  cdsPesquisarAluno.Open;
  cdsPesquisarAluno.First;
end;

end.

