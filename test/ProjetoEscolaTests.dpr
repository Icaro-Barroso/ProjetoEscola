program ProjetoEscolaTests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options 
  to use the console test runner.  Otherwise the GUI test runner will be used by 
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  uCadastroAluno in '..\view\uCadastroAluno.pas',
  uPessoaController in '..\controller\uPessoaController.pas',
  uPessoaModel in '..\model\uPessoaModel.pas',
  uDmPessoa in '..\dao\uDmPessoa.pas' {DataModulePessoa: TDataModule},
  uDmConexao in '..\dao\uDmConexao.pas' {DmConexao: TDataModule},
  uAlunoController in '..\controller\uAlunoController.pas',
  uAlunoModel in '..\model\uAlunoModel.pas',
  uDmAluno in '..\dao\uDmAluno.pas' {DmAluno: TDataModule},
  uCadastro in '..\view\uCadastro.pas' {Cadastro},
  TestuAlunoController in 'TestuAlunoController.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    TextTestRunner.RunRegisteredTests
  else
    GUITestRunner.RunRegisteredTests;
end.

