program ProjetoEscola;

uses
  Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {frmPrincipal},
  uPesquisar in 'view\uPesquisar.pas' {Form2},
  uCadastro in 'view\uCadastro.pas' {Cadastro},
  uPessoaModel in 'model\uPessoaModel.pas',
  uPessoaController in 'controller\uPessoaController.pas',
  uDmConexao in 'dao\uDmConexao.pas' {DmConexao: TDataModule},
  uDmPessoa in 'dao\uDmPessoa.pas' {DataModulePessoa: TDataModule},
  uCadastroAluno in 'view\uCadastroAluno.pas' {CadastroAluno},
  uAlunoModel in 'model\uAlunoModel.pas',
  uAlunoController in 'controller\uAlunoController.pas',
  uDmAluno in 'dao\uDmAluno.pas' {DmAluno: TDataModule},
  uFuncionarioModel in 'model\uFuncionarioModel.pas',
  uDmFuncionario in 'dao\uDmFuncionario.pas' {DmFuncionario: TDataModule},
  uCadastroFuncionario in 'view\uCadastroFuncionario.pas' {CadastroFuncionario},
  uFuncionarioController in 'controller\uFuncionarioController.pas',
  RelatorioAluno in 'Relatorio\RelatorioAluno.pas' {Form1},
  ConexaoRelatorios in 'Relatorio\ConexaoRelatorios.pas' {Form3},
  uEscola in 'view\uEscola.pas' {CadastroEscola},
  uEscolaModel in 'model\uEscolaModel.pas',
  uDmEscola in 'dao\uDmEscola.pas' {DmEscola: TDataModule},
  uEscolaController in 'controller\uEscolaController.pas',
  uNotaAluno in 'view\uNotaAluno.pas' {NotaAluno},
  uNotaController in 'controller\uNotaController.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TDmAluno, DmAluno);
  Application.CreateForm(TDmFuncionario, DmFuncionario);
  Application.CreateForm(TCadastroFuncionario, CadastroFuncionario);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TNotaAluno, NotaAluno);
  // Application.CreateForm(TEscola, Escola);
  Application.CreateForm(TDmEscola, DmEscola);
  //Application.CreateForm(TCadastroAluno, CadastroAluno);
  //Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
