unit TestuAlunoController;

interface

uses
  TestFramework, uAlunoController, uDmAluno, uPessoaController, uAlunoModel, SqlExpr;

type

  TestTAlunoController = class(TTestCase)
  strict private
    FAlunoController: TAlunoController;
    procedure CriarAluno(var Aluno: TAluno; const ANome, AEndereco, ADocumento: string;
  ACodigoEscola, ACodigoSerie: Integer);

  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestAlterar;
    procedure TestInserir;
    procedure TestCarregarAluno;
  end;

implementation

const
  NOME_ALUNO = 'ICARO';
  CODIGO_ESCOLA = 1;
  //TERMINAR DE PREENCHER AS CONSTANTES

procedure TestTAlunoController.CriarAluno(var Aluno: TAluno; const ANome, AEndereco, ADocumento: string;
  ACodigoEscola, ACodigoSerie: Integer);
begin
  Aluno := TAluno.Create;
  Aluno.CodigoSerie := ACodigoSerie;
  Aluno.NomeAluno := ANome;
  Aluno.CodigoEscola := ACodigoEscola;
  Aluno.DocumentoAluno := ADocumento;
  Aluno.EnderecoAluno := AEndereco;
end;

procedure TestTAlunoController.SetUp;
begin
  FAlunoController := TAlunoController.Create;
end;

procedure TestTAlunoController.TearDown;
begin
  FAlunoController.Free;
  FAlunoController := nil;
end;

procedure TestTAlunoController.TestAlterar;
begin
//metodo 1
//  CriarAluno(nome_aluno_2);// CRIAR O ALUNO PARA ALTERACAO
//  FAlunoController.Inserir(Aluno, sErro); // INSERIA O ALUNO NO BANCO
//  CheckEqualsString(NOME_ALUNO_2, CONSULTAULTINONOMEALUNO, 'NAO INSERIU ALUNO CORRETAMENTE');  CHECAR SE ALUNO FOI CRIADO COM O NOME DEFINIDO
//  oAluno.NomeAluno := 'NOVONOMEDOALUNO'; // ALTERAR NOME DO ALUNO
//  CheckTrue(FAlunoController.Alterar(oAluno, sErro), 'ERRO AO ALTERAR ALUNO'); // ALTERAVA O ALUNO
//  CheckNotEqualsString(CONSULTAULTINONOMEALUNO, CONSULTAULTINONOMEALUNO, 'NAO alterou ALUNO CORRETAMENTE');  // VERIFICAVA NO BANCO SE O NOME FOI ALTERADO MESMO



//metodo 2
// ALUNO.CREATE// CRIAVA O OBJETIO ALUNO
// Carregava o objeto aluno com algum aluno da tabela pessoa,
//  oAluno.NomeAluno := 'NOVONOMEDOALUNO'; // ALTERAR NOME DO ALUNO
//  CheckTrue(FAlunoController.Alterar(oAluno, sErro), 'ERRO AO ALTERAR ALUNO'); // ALTERAVA O ALUNO
//  CheckNotEqualsString(NOVONOMEDOALUNO, CONSULTAULTINONOMEALUNO, 'NAO alterou ALUNO CORRETAMENTE');  // VERIFICAVA NO BANCO SE O NOME FOI ALTERADO MESMO
end;

procedure TestTAlunoController.TestInserir;
var
  sErro: string;
  Aluno: TAluno;
//  sqlSequencia: TSQLDataSet;
begin
  CriarAluno(Aluno, NOME_ALUNO, 'RUA DA VACINA', '123456',  CODIGO_ESCOLA, 1);
  CheckTrue(FAlunoController.Inserir(Aluno, sErro), 'Erro ao inserir aluno');
//  ConsultaNomeDoUltimoAlunoNoBanco = (select PESNOM from v_ALUNO order by ALUCOD DESC);
//  CheckEqualsString(NOME_ALUNO, ConsultaNomeDoUltimoAlunoNoBanco, 'Erro ao inserir nome do aluno');
//  ConsultaDocumentoDoUltimoAlunoNoBanco  = (select PESDOC from v_ALUNO order by ALUCOD DESC);
//  CheckEqualsString(DOCUMENTO_ALUNO, ConsultaDocumentoDoUltimoAlunoNoBanco, 'Erro ao inserir nome do aluno');

end;

procedure TestTAlunoController.TestCarregarAluno;
var
  iCodigo: Integer;
  oAluno: TAluno;
begin
  oAluno := TAluno.Create;
  iCodigo := 1;    // escolhe um codigo de pessoa para alterar
  FAlunoController.CarregarAluno(oAluno, iCodigo);  //  carregava o objeto aluno
  CheckEqualsString('06298334351', oAluno.DocumentoAluno, 'Erro ao carregar aluno'); // checar se o documento no banco é igual ao que foi carregado
end;

initialization
  RegisterTest(TestTAlunoController.Suite);
end.

