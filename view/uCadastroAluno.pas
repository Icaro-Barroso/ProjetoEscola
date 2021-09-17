unit uCadastroAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastro, DB, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxClasses, cxGridLevel, cxGrid, uAlunoModel, uDmAluno, uAlunoController, uPessoaModel,
  uPessoaController;

type
  TCadastroAluno = class(TCadastro)
    edCodigoAluno: TLabeledEdit;
    edSerie: TLabeledEdit;
    cxAlunos: TcxGridDBTableView;
    cxAlunosCodigo: TcxGridDBColumn;
    cxAlunosNome: TcxGridDBColumn;
    cxAlunosDocumento: TcxGridDBColumn;
    teste: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject); override;
  protected
    procedure Gravar; override;
    procedure Inserir; override;
  public
    { Public declarations }
  end;
var
  CadastroAluno: TCadastroAluno;
implementation

{$R *.dfm}

{ TCadastroAluno }

{ TCadastroAluno }

procedure TCadastroAluno.FormCreate(Sender: TObject);
begin
  inherited;
  DmAluno := TDmAluno.Create(nil);
end;

procedure TCadastroAluno.FormDestroy(Sender: TObject);
begin
  inherited;
//  FreeAndNil(DmAluno);
end;

procedure TCadastroAluno.FormShow(Sender: TObject);
begin
  //dsPesq.DataSet := DmAluno.cdsPesquisarAluno;
  inherited;
end;

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
  Pessoa: TPessoa;
  PessoaController: TPessoaController;
  Aluno: TAluno;
  AlunoController: TAlunoController;
  Erro: string;
begin
  inherited;
  Pessoa := TPessoa.Create;
  PessoaController := TPessoaController.Create;
  Aluno := TAluno.Create;
  AlunoController := TAlunoController.Create;
  try
    Pessoa.ID := PessoaController.GerarCodigo;
    Pessoa.Nome := edtNome.Text;
    Pessoa.CodigoEscola := StrToInt(edtCodigoEscola.Text);
    if cbxTipo.ItemIndex = 0 then
      Pessoa.Tipo := 'F'
    else if cbxTipo.ItemIndex = 1 then
      Pessoa.Tipo := 'J'
    else
      Pessoa.Tipo := EmptyStr;
    Pessoa.Endereco := edtEndereco.Text;
    Pessoa.Documento := edtDocumento.Text;

    Aluno.CodigoAluno := StrToInt(edCodigoAluno.Text);
    Aluno.CodigoPessoa := Pessoa.ID;
    Aluno.CodigoSerie := StrToInt(edSerie.Text);

    if not PessoaController.Inserir(Pessoa, Erro) then
      raise Exception.Create(Erro);
    //    if not AlunoController.Inserir(Aluno, Erro) then
    //      Raise Exception.Create(Erro);

  finally
    FreeAndNil(Pessoa);
    FreeAndNil(PessoaController);
    FreeAndNil(Aluno);
    FreeAndNil(AlunoController);
  end;
end;

end.

