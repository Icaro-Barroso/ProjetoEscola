unit uCadastro;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, uPessoaController,
  uPessoaModel, uDmPessoa, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxClasses, cxGridLevel, cxGrid;

type
  TOperacao = (opNovo, opAlterar, opNavegar);

  TCadastro = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodape: TPanel;
    tbPesq: TTabSheet;
    tbDados: TTabSheet;
    btnFechar: TButton;
    pnlFiltro: TPanel;
    edtPesquisar: TLabeledEdit;
    btnPesquisar: TButton;
    pnlBtnsPesq: TPanel;
    btnNovo: TButton;
    btnDetalhar: TButton;
    btnExcluir: TButton;
    DBGridPesquisa: TDBGrid;
    dsPesq: TDataSource;
    edtCodigo: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtDocumento: TLabeledEdit;
    cbxTipo: TComboBox;
    edtEndereco: TLabeledEdit;
    Label1: TLabel;
    pnlBtnsCad: TPanel;
    btnListar: TButton;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    edtCodigoEscola: TLabeledEdit;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    procedure FormShow(Sender: TObject); virtual;
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DBGridPesquisaDblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    FOperacao: TOperacao;
    procedure Novo;
    procedure Detalhar;
    procedure Configuracao;
    procedure Pesquisar; 
    procedure ResetarGrid;
  protected
    procedure HabilitarControles(aOperacao: TOperacao); Virtual;
    procedure CarregarPessoa; virtual;
    procedure Listar; virtual;
    procedure Alterar; virtual;
    procedure Excluir; virtual;
    procedure Inserir; virtual;
    procedure Gravar; virtual;
    procedure LimparCampos; Virtual;
  public
    property Operacao: TOperacao read FOperacao;

  end;

var
  Cadastro: TCadastro;

implementation

{$R *.dfm}

procedure TCadastro.Alterar;
var
  oPessoa: TPessoa;
  oPessoaController: TPessoaController;
  sErro: string;
begin
  oPessoa := TPessoa.Create;
  oPessoaController := TPessoaController.Create;
  try
    with oPessoa do
    begin
      ID := StrToIntDef(edtCodigo.Text, 0);
      CodigoEscola := StrToInt(edtCodigoEscola.Text);
      Nome := edtNome.Text;
      if cbxTipo.ItemIndex = 0 then
        Tipo := 'F'
      else if cbxTipo.ItemIndex = 1 then
        Tipo := 'J'
      else
        Tipo := EmptyStr;
      Documento := edtDocumento.Text;
      Endereco := edtEndereco.Text;
    end;
    if oPessoaController.Alterar(oPessoa, sErro) = False then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oPessoa);
    FreeAndNil(oPessoaController);
  end;
end;

procedure TCadastro.btnAlterarClick(Sender: TObject);
begin
  FOperacao := opAlterar;
  HabilitarControles(opAlterar);
end;

procedure TCadastro.btnCancelarClick(Sender: TObject);
begin
  HabilitarControles(opNavegar);
end;

procedure TCadastro.btnDetalharClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TCadastro.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TCadastro.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TCadastro.btnGravarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(opNavegar);
end;

procedure TCadastro.btnListarClick(Sender: TObject);
begin
  Listar;
end;

procedure TCadastro.btnNovoClick(Sender: TObject);
begin
  Novo;
  HabilitarControles(opNovo);
end;

procedure TCadastro.btnPesquisarClick(Sender: TObject);
begin
  Pesquisar;
end;

procedure TCadastro.CarregarPessoa;
var
  oPessoa: TPessoa;
  oPessoaController: TPessoaController;
begin
  oPessoa := TPessoa.Create;
  oPessoaController := TPessoaController.Create;
  try
    oPessoaController.CarregarPessoa(oPessoa, DBGridPesquisa.SelectedField.AsInteger);
    //DBGridPesquisa.SELECTEDROWS.ITEMS <- UTILIZAR ISSO PRA PEGAR DE QLQR CAMPO
    with oPessoa do
    begin
      edtCodigo.Text := IntToStr(ID);
      edtCodigoEscola.Text := IntToStr(CodigoEscola);
      edtNome.Text := Nome;
      if Tipo = 'F' then
        cbxTipo.ItemIndex := 0
      else if Tipo = 'J' then
        cbxTipo.ItemIndex := 1
      else
        cbxTipo.ItemIndex := -1;
      edtDocumento.Text := Documento;
      edtEndereco.Text := Endereco;
    end;
  finally
    FreeAndNil(oPessoa);
    FreeAndNil(oPessoaController);
  end;
end;

procedure TCadastro.Configuracao;
begin
  tbPesq.TabVisible := False;
  tbDados.TabVisible := False;
  pgcPrincipal.ActivePage := tbPesq;
  //dsPesq.DataSet.Active := True;
end;

procedure TCadastro.DBGridPesquisaDblClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TCadastro.Detalhar;
begin
  CarregarPessoa;
  HabilitarControles(opNavegar);
  FOperacao := opNavegar;
  pgcPrincipal.ActivePage := tbDados;
end;


procedure TCadastro.Excluir;
var
  oPessoaController: TPessoaController;
  sErro: string;
begin
  oPessoaController := TPessoaController.Create;
  DataModulePessoa.cdsPesquisar.Active := True;
  try

    if (DataModulePessoa.cdsPesquisar.Active) then
    begin
      if MessageDlg('Voce realmente deseja exluir?', mtConfirmation, [mbYes,
        mbNo], 0) = IDYES then
      begin
        if
          oPessoaController.Excluir(DataModulePessoa.cdsPesquisarPESCOD.AsInteger,
          sErro) = False then
          raise Exception.Create(sErro);
       // oPessoaController.Pesquisar(edtPesquisar.Text);
      end;
    end
    else
      raise Exception.Create('Não ha registro a ser excluido');
  finally
    FreeAndNil(oPessoaController);
  end;
end;

procedure TCadastro.FormCreate(Sender: TObject);
begin
  DataModulePessoa := TDataModulePessoa.Create(nil);
end;

procedure TCadastro.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DataModulePessoa);
end;

procedure TCadastro.FormShow(Sender: TObject);
begin
  Configuracao;
end;

procedure TCadastro.Gravar;
begin
end;

procedure TCadastro.HabilitarControles(aOperacao: TOperacao);
begin
  case aOperacao of
    opNovo, opAlterar:
      begin
        edtNome.Enabled := True;
        cbxTipo.Enabled := True;
        edtDocumento.Enabled := True;
        edtEndereco.Enabled := True;
        btnListar.Enabled := False;
        btnFechar.Enabled := False;
        btnAlterar.Enabled := False;
        btnGravar.Enabled := True;
        btnCancelar.Enabled := True;
      end;
    opNavegar:
      begin
        edtNome.Enabled := False;
        cbxTipo.Enabled := False;
        edtDocumento.Enabled := False;
        edtEndereco.Enabled := False;
        btnListar.Enabled := True;
        btnFechar.Enabled := True;
        btnAlterar.Enabled := True;
        btnGravar.Enabled := False;
        btnCancelar.Enabled := False;
      end;
  end;
end;

procedure TCadastro.Inserir;
begin
end;

procedure TCadastro.LimparCampos;
begin
    edtCodigo.Clear;
    edtNome.Clear;
    edtDocumento.Clear;
    edtEndereco.Clear;
    edtCodigoEscola.clear;
end;

procedure TCadastro.Listar;
begin
  pgcPrincipal.ActivePage := tbPesq;
end;

procedure TCadastro.Novo;
begin
  LimparCampos;
  FOperacao := opNovo;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TCadastro.Pesquisar;
var
  oPessoaController: TPessoaController;
begin
  oPessoaController := TPessoaController.Create;
  try
    dsPesq.DataSet.Filtered := False;
    dsPesq.DataSet.Filter := 'PESNOM = ' + QuotedStr(edtPesquisar.Text);
    dsPesq.DataSet.Filtered := True;
    oPessoaController.Pesquisar(edtPesquisar.Text);
    if edtPesquisar.Text = '' then
      ResetarGrid;
  finally
    FreeAndNil(oPessoaController);
  end;

end;

procedure TCadastro.ResetarGrid;
begin
  dsPesq.DataSet.Filtered := False;
  dsPesq.DataSet.Filter := 'PESCOD <> NULL';
  dsPesq.DataSet.Filtered := True;
end;

end.

