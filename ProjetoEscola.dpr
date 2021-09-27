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
  uDmFuncionario in 'dao\uDmFuncionario.pas' {DataModule1: TDataModule},
  uCadastroFuncionario in 'view\uCadastroFuncionario.pas' {Cadastro1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TDmAluno, DmAluno);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TCadastro1, Cadastro1);
  //Application.CreateForm(TCadastroAluno, CadastroAluno);
  //Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
