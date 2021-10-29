unit uFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, RLReport, uCadastro, uCadastroAluno, uCadastroFuncionario, RelatorioAluno, uEscola, uNotaAluno;

type
  TfrmPrincipal = class(TForm)
    lbProjetoEscola: TRLLabel;
    btEntrar: TButton;
    MainMenu1: TMainMenu;
    Cadastrar1: TMenuItem;
    Cadastrar2: TMenuItem;
    Funcionario: TMenuItem;
    Escola1: TMenuItem;
    Aluno1: TMenuItem;
    AdicionarNotas1: TMenuItem;
    procedure btEntrarClick(Sender: TObject);
    procedure Aluno1Click(Sender: TObject);
    procedure FuncionarioClick(Sender: TObject);
    procedure Escola1Click(Sender: TObject);
    procedure AdicionarNotas1Click(Sender: TObject);
  private
    procedure AbrirCliente;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AbrirCliente;
begin
  Form1 := TForm1.Create(nil);
  try
    Form1.RLReport1.Preview;
  finally
    FreeAndNil(Form1);
  end;
end;

procedure TfrmPrincipal.AdicionarNotas1Click(Sender: TObject);
begin
    NotaAluno := TNotaAluno.Create(nil);
  try
     NotaAluno.ShowModal;
  finally
    FreeAndNil(NotaAluno);
  end;
end;

procedure TfrmPrincipal.Aluno1Click(Sender: TObject);
begin
  CadastroAluno := TCadastroAluno.Create(nil);
  //Cadastro := TCadastro.Create(nil);
  try
    CadastroAluno.ShowModal;
  finally
    FreeAndNil(CadastroAluno);
  end;
end;

procedure TfrmPrincipal.btEntrarClick(Sender: TObject);
begin
  AbrirCliente;
end;


procedure TfrmPrincipal.Escola1Click(Sender: TObject);
begin
  CadastroEscola := TCadastroEscola.Create(nil);
  try
    CadastroEscola.ShowModal;
  finally
    FreeAndNil(CadastroAluno);
  end;
end;

procedure TfrmPrincipal.FuncionarioClick(Sender: TObject);
begin
  CadastroFuncionario := TCadastroFuncionario.Create(nil);
  try
    CadastroFuncionario.ShowModal;
  finally
    FreeAndNil(CadastroAluno);
  end;
end;

end.

