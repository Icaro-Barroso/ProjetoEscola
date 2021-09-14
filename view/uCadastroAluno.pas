unit uCadastroAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastro, DB, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxClasses, cxGridLevel, cxGrid, uAlunoModel, uDmCliente, uClienteModel,
    uClienteController,
  uAlunoController;

type
  TCadastroAluno = class(TCadastro)
    edCodigoAluno: TLabeledEdit;
    edSerie: TLabeledEdit;
    cxAlunos: TcxGridDBTableView;
    cxAlunosCodigo: TcxGridDBColumn;
    cxAlunosNome: TcxGridDBColumn;
    cxAlunosDocumento: TcxGridDBColumn;
    teste: TDataSource;
  private
    //FOperacao : TOperacao;
  protected
    procedure Gravar; override;
    procedure Inserir; override;

    //procedure CarregarAluno;
  public
    { Public declarations }
  end;
var
  CadastroAluno: TCadastroAluno;
  implementation

{$R *.dfm}

{ TCadastroAluno }

{ TCadastroAluno }

procedure TCadastroAluno.Gravar;
var
  oAlunoController: TAlunoController;
begin
  inherited;

  oAlunoController := TAlunoController.Create;
  try
    case Operacao of
      opNovo: Inserir;
      opAlterar: Alterar;
    end;
    // oAlunoController.Pesquisar(edtNome.Text);
  finally
    FreeAndNil(oAlunoController);
  end;
end;

procedure TCadastroAluno.Inserir;
var
  Cliente: TCliente;
  CLienteController: TClienteController;
  Aluno: TAluno;
  AlunoController: TAlunoController;
  Erro: string;
begin
  inherited;
  Cliente := TCliente.Create;
  CLienteController := TClienteController.Create;
  Aluno := TAluno.Create;
  AlunoController := TAlunoController.Create;
  try
    Cliente.ID := CLienteController.GerarCodigo;
    Cliente.Nome := edtNome.Text;
    Cliente.CodigoEscola := StrToInt(edtCodigoEscola.Text);
    if cbxTipo.ItemIndex = 0 then
      Cliente.Tipo := 'F'
    else if cbxTipo.ItemIndex = 1 then
      Cliente.Tipo := 'J'
    else
      Cliente.Tipo := EmptyStr;
    Cliente.Endereco := edtEndereco.Text;
    Cliente.Documento := edtDocumento.Text;

    Aluno.CodigoAluno := StrToInt(edCodigoAluno.Text);
    Aluno.CodigoPessoa := Cliente.ID;
    Aluno.CodigoSerie := StrToInt(edSerie.Text);

    if not CLienteController.Inserir(Cliente, Erro) then
      raise Exception.Create(Erro);
    //    if not AlunoController.Inserir(Aluno, Erro) then
    //      Raise Exception.Create(Erro);

  finally
    FreeAndNil(Cliente);
    FreeAndNil(CLienteController);
    FreeAndNil(Aluno);
    FreeAndNil(AlunoController);
  end;
end;

end.

