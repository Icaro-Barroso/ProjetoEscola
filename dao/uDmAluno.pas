unit uDmAluno;

interface

uses
  SysUtils, Classes, uDmConexao, FMTBcd, DBClient, Provider, DB, SqlExpr, uAlunoModel;

type
  TDmAluno = class(TDataModule)
    sqlPesquisarAluno: TSQLDataSet;
    sqlInserirAluno: TSQLDataSet;
    sqlAlterarAluno: TSQLDataSet;
    sqlExcluirAluno: TSQLDataSet;
    dspPesquisarAluno: TDataSetProvider;
    cdsPesquisarAluno: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PesquisarAluno(sNome: string);
    procedure CarregarAluno(Aluno: TAluno; iCodigo: integer);
    procedure CarregarTodosAlunos;
  end;

var
  DmAluno: TDmAluno;

implementation

{$R *.dfm}

{ TDmAluno }

procedure TDmAluno.CarregarAluno(Aluno: TAluno; iCodigo: integer);
var
  sqlAluno: TSQLDataSet;
begin
  sqlAluno := TSQLDataSet.create(nil);
  try
    begin
      sqlAluno.SQLConnection := DmConexao.sqlConexao;
      sqlAluno.CommandText := 'Select * from V_Aluno where ALNCOD = 1'  ;
      sqlAluno.Open;
      begin
        Aluno.CodigoAluno := sqlAluno.FieldByName('ALNCOD').AsInteger;
        Aluno.CodigoPessoa := sqlAluno.FieldByName('PESCOD').AsInteger;
        Aluno.NomeAluno := sqlAluno.FieldByName('PESNOM').AsString;
        Aluno.TipoAluno := sqlAluno.FieldByName('PESIDT').AsString;
        Aluno.DocumentoAluno := sqlAluno.FieldByName('PESDOC').AsString;
        Aluno.EnderecoAluno := sqlAluno.FieldByName('PESEND').AsString;

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

