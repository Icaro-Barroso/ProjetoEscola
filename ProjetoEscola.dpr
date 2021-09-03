program ProjetoEscola;

uses
  Forms,
  uFrmPrincipal in 'view\uFrmPrincipal.pas' {frmPrincipal},
  uPesquisar in 'view\uPesquisar.pas' {Form2},
  uCadastro in 'view\uCadastro.pas' {Cadastro},
  uClienteModel in 'model\uClienteModel.pas',
  uClienteController in 'controller\uClienteController.pas',
  uDmConexao in 'dao\uDmConexao.pas' {DmConexao: TDataModule},
  uDmCliente in 'dao\uDmCliente.pas' {DataModule1: TDataModule},
  uCadastroAluno in 'view\uCadastroAluno.pas' {CadastroAluno},
  uAlunoModel in 'model\uAlunoModel.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TCadastroAluno, CadastroAluno);
  //  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
