unit uCadastro;

interface
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, uClienteController,
  uClienteModel, uDmCliente;

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
    DBGrid1: TDBGrid;
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
    procedure FormShow(Sender: TObject);
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
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    FOperacao: TOperacao;
    procedure Novo;
    procedure Detalhar;
    procedure Configuracao;
    procedure Pesquisar;
    procedure CarregarCliente;
    procedure Listar;
    procedure Alterar;
    procedure Excluir;
    procedure Inserir;
    procedure Gravar;
    procedure HabilitarControles(aOperacao: TOperacao);
  end;

var
  Cadastro : TCadastro;

implementation
 
{$R *.dfm}

procedure TCadastro.Alterar;
var
  oCliente: TCliente;
  oClienteController: TClienteController;
  sErro: string;
begin
  oCliente := TCliente.Create;
  oClienteController := TClienteController.Create;
  try
    with oCliente do
    begin
      ID := StrToIntDef(edtCodigo.Text, 0);
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
    if oClienteController.Alterar(oCliente, sErro) = False then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oCliente);
    FreeAndNil(oClienteController);
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

procedure TCadastro.CarregarCliente;
var
  oCliente: TCliente;
  oClienteController: TClienteController;
begin
  oCliente := TCliente.Create;
  oClienteController := TClienteController.Create;
  try
    oClienteController.CarregarCliente(oCliente,
      DBGrid1.SelectedField.AsInteger);
    //DBGRID1.SELECTEDROWS.ITEMS <- UTILIZAR ISSO PRA PEGAR DE QLQR CAMPO
    with oCliente do
    begin
      edtCodigo.Text := IntToStr(ID);
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
    FreeAndNil(oCliente);
    FreeAndNil(oClienteController);
  end;
end;

procedure TCadastro.Configuracao;
begin
  tbPesq.TabVisible := False;
  tbDados.TabVisible := False;
  pgcPrincipal.ActivePage := tbPesq;
  dsPesq.DataSet.Active := True;
end;

procedure TCadastro.DBGrid1DblClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TCadastro.Detalhar;
begin
  CarregarCliente;
  HabilitarControles(opNavegar);
  FOperacao := opNavegar;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TCadastro.Excluir;
var
  oClienteController: TClienteController;
  sErro: string;
begin
  oClienteController := TClienteController.Create;
  try
    if (DataModule1.cdsPesquisar.Active) and
      (DataModule1.cdsPesquisar.RecordCount > 0) then
    begin
      if MessageDlg('Voce realmente deseja exluir?', mtConfirmation, [mbYes,
        mbNo], 0) = IDYES then
      begin
        if oClienteController.Excluir(DataModule1.cdsPesquisarPESCOD.AsInteger,
          sErro) = False then
          raise Exception.Create(sErro);
        oClienteController.Pesquisar(edtPesquisar.Text);
      end;
    end
    else
      raise Exception.Create('Não ha registro a ser excluido');
  finally
    FreeAndNil(oClienteController);
  end;
end;

procedure TCadastro.FormCreate(Sender: TObject);
begin
  DataModule1 := TDataModule1.Create(nil);
end;

procedure TCadastro.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DataModule1);
end;

procedure TCadastro.FormShow(Sender: TObject);
begin
  Configuracao;
end;

procedure TCadastro.Gravar;
var
  oCLienteController: TClienteController;
begin
  oCLienteController := TClienteController.Create;
  try
    case FOperacao of
      opNovo: Inserir;
      opAlterar: Alterar;
    end;
    oCLienteController.Pesquisar(edtNome.Text);
  finally
    FreeAndNil(oCLienteController);
  end;
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
var
  oCliente: TCliente;
  oCLienteController: TClienteController;
  sErro: string;
begin
  oCliente := TCliente.Create;
  oCLienteController := TClienteController.Create;
  try
    with oCliente do
    begin
      ID := 0;
      Nome := edtNome.Text;
      if cbxTipo.ItemIndex = 0 then
        Tipo := 'F'
      else if cbxTipo.ItemIndex = 1 then
        Tipo := 'J'
      else
        Tipo := EmptyStr;
      Documento := edtDocumento.Text;
    end;
    if oCLienteController.Inserir(oCliente, sErro) = False then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oCliente);
    FreeAndNil(oCLienteController);
  end;
end;

procedure TCadastro.Listar;
begin
  pgcPrincipal.ActivePage := tbPesq;
end;

procedure TCadastro.Novo;
begin
  FOperacao := opNovo;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TCadastro.Pesquisar;
var
  oClienteController: TClienteController;
begin
  oClienteController := TClienteController.Create;
  try
    dsPesq.DataSet.Filtered := False;
    dsPesq.DataSet.Filter := 'PESNOM = ' + QuotedStr(edtPesquisar.Text);
    dsPesq.DataSet.Filtered := True;
    //    oClienteController.Pesquisar(edtPesquisar.Text);
  finally
    FreeAndNil(oClienteController);
  end;

end;

end.

