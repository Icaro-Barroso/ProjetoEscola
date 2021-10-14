unit uCadastroAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastro, DB, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxClasses, cxGridLevel, cxGrid, uAlunoModel, uDmAluno, uAlunoController,
  uPessoaModel, uPessoaController, Mask, DBCtrls;

type
  TCadastroAluno = class(TCadastro)
    edCodigoAluno: TLabeledEdit;
    edSerie: TLabeledEdit;
    cxAlunos: TcxGridDBTableView;
    dsCxgridAluno: TDataSource;
    DataSource2: TDataSource;
    DataSource1: TDataSource;
    cxAlunosALNCOD: TcxGridDBColumn;
    cxAlunosPESNOM: TcxGridDBColumn;
    cxAlunosPESEND: TcxGridDBColumn;
    cxAlunosPESDOC: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject); override;
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
  protected
    procedure Gravar; override;
    procedure Inserir; override;
    procedure Alterar; override;
    procedure CarregarPessoa; override;
    procedure HabilitarControles(aOperacao: TOperacao); override;
    procedure ExcluirAluno;
    procedure LimparCampos; override;
  public
    { Public declarations }
  end;
var
  CadastroAluno: TCadastroAluno;
implementation

{$R *.dfm}

{ TCadastroAluno }

{ TCadastroAluno }

procedure TCadastroAluno.Alterar;
var
  oAluno: TAluno;
  oAlunoController: TAlunoController;
  sErro: string;
begin
  oAluno := TAluno.Create;
  oAlunoController := TAlunoController.Create;
  try
    begin
      oAluno.CodigoPessoa := StrToIntDef(edtCodigo.Text, 0);
      oAluno.CodigoAluno := StrToInt(edCodigoAluno.Text);
      oAluno.CodigoEscola := StrToInt(edtCodigoEscola.Text);
      oAluno.NomeAluno := edtNome.Text;
      oAluno.DocumentoAluno := edtDocumento.Text;
      oAluno.EnderecoAluno := edtEndereco.Text;
      oAluno.CodigoSerie := StrToInt(edSerie.Text);
      oAlunoController.Alterar(oAluno, sErro);
    end;
    if oAlunoController.Alterar(oAluno, sErro) = true then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oAluno);
    FreeAndNil(oAlunoController);
  end;
end;

procedure TCadastroAluno.btnExcluirClick(Sender: TObject);
begin
 ExcluirAluno;

end;

procedure TCadastroAluno.btnListarClick(Sender: TObject);
begin
  inherited;
  dsCxgridAluno.DataSet.Refresh;
end;

procedure TCadastroAluno.CarregarPessoa;
var
  oAluno: TAluno;
  oAlunoController: TAlunoController;
begin
  //inherited;
  oAluno := TAluno.Create;
  oAlunoController := TAlunoController.Create;
  try

    oAlunoController.CarregarAluno(oAluno,
    dsCxgridAluno.DataSet.FieldByName('PESCOD').AsInteger);
    begin
      edtCodigo.Text := IntToStr(oAluno.CodigoPessoa);
      edtCodigoEscola.Text := IntToStr(oAluno.CodigoEscola);
      edtNome.Text := oAluno.NomeAluno;
      cbxTipo.ItemIndex := 0;
      edtDocumento.Text := oAluno.DocumentoAluno;
      edtEndereco.Text := oAluno.EnderecoAluno;
      edCodigoAluno.Text := IntToStr(oAluno.CodigoAluno);
      edSerie.Text := IntToStr(oAluno.CodigoSerie);
    end;
  finally
    FreeAndNil(oAluno);
    FreeAndNil(oAlunoController);
  end;
end;

procedure TCadastroAluno.ExcluirAluno;
var
//codigopessoa: Integer;
oAlunoController: TAlunoController;
  sErro: string;
begin
  oAlunoController := TAlunoController.Create;
  try
//   dsPesq.DataSet.IsEmpty
    if (dsCxgridAluno.DataSet.Active) then
    begin
      if MessageDlg(format('Voce realmente deseja exluir o cadastro de %s?', [dsCxgridAluno.DataSet.FieldByName('PESNOM').AsString]), mtConfirmation, [mbYes,
        mbNo], 0) = IDYES then
      begin
        if oAlunoController.ExcluirAluno(dsCxgridAluno.DataSet.FieldByName('PESCOD').AsInteger, sErro) = True then
          raise Exception.Create(sErro);
          dsCxgridAluno.DataSet.Refresh;
//       oAlunoController.PesquisarAluno(edtPesquisar.Text);
      end;
    end
    else
      raise Exception.Create('Não ha registro a ser excluido');
  finally
    FreeAndNil(oAlunoController);
  end;
end;

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

procedure TCadastroAluno.HabilitarControles(aOperacao: TOperacao);
begin
  inherited;
  case aOperacao of
    opNovo, opAlterar:
      begin
        edCodigoAluno.Enabled := False;
        edtCodigoEscola.Enabled := True;
        edSerie.Enabled := True;

      end;
    opNavegar:
      begin
        edCodigoAluno.Enabled := False;
        edtCodigoEscola.Enabled := False;
        edSerie.Enabled := False;
      end;
  end;
end;

//procedure TCadastroAluno.Inserir;
//var
//  Pessoa: TPessoa;
//  PessoaController: TPessoaController;
//  Aluno: TAluno;
//  AlunoController: TAlunoController;
//  Erro: string;
//begin
//  inherited;
//  Pessoa := TPessoa.Create;
//  //PessoaController := TPessoaController.Create;
//  Aluno := TAluno.Create;
//  AlunoController := TAlunoController.Create;
//  try
//    Pessoa.ID := PessoaController.GerarCodigo;
//    Pessoa.Nome := edtNome.Text;
//    Pessoa.CodigoEscola := StrToInt(edtCodigoEscola.Text);
//    if cbxTipo.ItemIndex = 0 then
//      Pessoa.Tipo := 'F'
//    else if cbxTipo.ItemIndex = 1 then
//      Pessoa.Tipo := 'J'
//    else
//      Pessoa.Tipo := EmptyStr;
//    Pessoa.Endereco := edtEndereco.Text;
//    Pessoa.Documento := edtDocumento.Text;
//
//    //Aluno.CodigoAluno := StrToInt(edCodigoAluno.Text);
//    //Aluno.CodigoPessoa := Pessoa.ID;
//    Aluno.CodigoSerie := StrToInt(edSerie.Text);
//
//    if not AlunoController.Inserir(Pessoa, Erro) then
//      raise Exception.Create(Erro);
//        //if not AlunoController.Inserir(Aluno, Erro) then
//    //      Raise Exception.Create(Erro);
//
//  finally
//    FreeAndNil(Pessoa);
//    //FreeAndNil(PessoaController);
//    FreeAndNil(Aluno);
//    FreeAndNil(AlunoController);
//  end;
//end;

procedure TCadastroAluno.Inserir;
var
  Aluno: TAluno;
  AlunoController: TAlunoController;
  Erro: string;
begin
  inherited;
  Aluno := TAluno.Create;
  AlunoController := TAlunoController.Create;
  try
    Aluno.NomeAluno := edtNome.Text;
    Aluno.CodigoEscola := StrToInt(edtCodigoEscola.Text);
    Aluno.EnderecoAluno := edtEndereco.Text;
    Aluno.DocumentoAluno := edtDocumento.Text;
    Aluno.CodigoSerie := StrToInt(edSerie.Text);
    if AlunoController.Inserir(Aluno, Erro) = true then
      raise Exception.Create(Erro);
  finally
    FreeAndNil(Aluno);
    FreeAndNil(AlunoController);
  end;

end;

procedure TCadastroAluno.LimparCampos;
begin
  inherited;
   edSerie.clear;
   edCodigoAluno.clear;

end;

end.

