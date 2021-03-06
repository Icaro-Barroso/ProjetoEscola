unit uEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, cxGraphics, cxControls, cxLookAndFeels,
    cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, DB,
    cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
    cxGrid, uDmEscola, uEscolaController, uEscolaModel;

type
  TOperacao = (opNovo, opAlterar, opNavegar);

  TCadastroEscola = class(TForm)
    PgcPrincipal: TPageControl;
    TbPesquisar: TTabSheet;
    TbDados: TTabSheet;
    Panel1: TPanel;
    btnPesquisar: TButton;
    LabeledEdit1: TLabeledEdit;
    pnlRodape: TPanel;
    btnFechar: TButton;
    Panel2: TPanel;
    btnNovo: TButton;
    btnDetalhar: TButton;
    btnExcluir: TButton;
    cxEscola: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel3: TPanel;
    btnListar: TButton;
    btnAlterar: TButton;
    btnGravar: TButton;
    btnCancelar: TButton;
    edtCodigoEscola: TLabeledEdit;
    edtNomeEscola: TLabeledEdit;
    edtEndereco: TLabeledEdit;
    edtCnpj: TLabeledEdit;
    DsCxgridEscola: TDataSource;
    cxEscolaESCCOD: TcxGridDBColumn;
    cxEscolaESCNOM: TcxGridDBColumn;
    cxEscolaESCEND: TcxGridDBColumn;
    cxEscolaESCCNJ: TcxGridDBColumn;
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnDetalharClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    FOperacao: TOperacao;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Gravar;
    procedure Inserir;
    procedure Alterar;
    procedure CarregarEscola;
    procedure ExcluirEscola;
    procedure HabilitarControles(aOperacao: TOperacao);
    procedure Novo;
    procedure LimparCampos;
    procedure Detalhar;
    procedure Listar;

    //    procedure Novo;
    //    procedure Detalhar;
    //    procedure Configuracao;
    //    procedure Pesquisar;
  public
    { Public declarations }
    property Operacao: TOperacao read FOperacao;
  end;

var
  CadastroEscola: TCadastroEscola;

implementation

{$R *.dfm}

{ TCadastroEscola }

procedure TCadastroEscola.Alterar;
var
  oEscola: TEscola;
  oEscolaController: TEscolaController;
  sErro: string;
begin
  oEscola := TEscola.Create;
  oEscolaController := TEscolaController.Create;
  try
    begin
      oEscola.EscolaCodigo := StrToIntDef(edtCodigoEscola.Text, 0);
      oEscola.EscolaNome := edtNomeEscola.Text;
      oEscola.EscolaEndereco := edtEndereco.Text;
      oEscola.EscolaCnpj := edtCnpj.Text;
    end;
    if oEscolaController.Alterar(oEscola, sErro) = true then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oEscola);
    FreeAndNil(oEscolaController);
  end;
end;

procedure TCadastroEscola.btnAlterarClick(Sender: TObject);
begin
  FOperacao := opAlterar;
  HabilitarControles(opAlterar);
end;

procedure TCadastroEscola.btnCancelarClick(Sender: TObject);
begin
 HabilitarControles(opNavegar);
end;

procedure TCadastroEscola.btnDetalharClick(Sender: TObject);
begin
  Detalhar;
end;

procedure TCadastroEscola.btnExcluirClick(Sender: TObject);
begin
  ExcluirEscola;
end;

procedure TCadastroEscola.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TCadastroEscola.btnGravarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(opNavegar);
end;

procedure TCadastroEscola.btnListarClick(Sender: TObject);
begin
  Listar;
  DsCxgridEscola.DataSet.Refresh;
end;

procedure TCadastroEscola.btnNovoClick(Sender: TObject);
begin
  Novo;
  HabilitarControles(opNovo);
end;

procedure TCadastroEscola.CarregarEscola;
var
  oEscola: TEscola;
  oEscolaController: TEscolaController;
begin
  oEscola := TEscola.Create;
  oEscolaController := TEscolaController.Create;
  try

    oEscolaController.CarregarEscola(oEscola,
      DsCxgridEscola.DataSet.FieldByName('ESCCOD').AsInteger);
    begin
      edtCodigoEscola.Text := IntToStr(oEscola.EscolaCodigo);
      edtNomeEscola.Text := oEscola.EscolaNome;
      edtEndereco.Text := oEscola.EscolaEndereco;
      edtCnpj.Text := oEscola.EscolaCnpj;
    end;
  finally
    FreeAndNil(oEscola);
    FreeAndNil(oEscolaController);
  end;
end;

procedure TCadastroEscola.Detalhar;
begin
  CarregarEscola;
  HabilitarControles(opNavegar);
  FOperacao := opNavegar;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TCadastroEscola.ExcluirEscola;
var
  oEscolaController: TEscolaController;
  sErro: string;
begin
  oEscolaController := TEscolaController.Create;
  try
    if (DsCxgridEscola.DataSet.Active) then
    begin
      if MessageDlg(format('Voce realmente deseja exluir o cadastro de %s?',
        [DsCxgridEscola.DataSet.FieldByName('ESCNOM').AsString]), mtConfirmation,
        [mbYes,
        mbNo], 0) = IDYES then
      begin
        if
          oEscolaController.ExcluirEscola(DsCxgridEscola.DataSet.FieldByName('ESCCOD').AsInteger, sErro) = True then
          raise Exception.Create(sErro);
        DsCxgridEscola.DataSet.Refresh;
      end;
    end
    else
      raise Exception.Create('N?o ha registro a ser excluido');
  finally
    FreeAndNil(oEscolaController);
  end;
end;

procedure TCadastroEscola.FormCreate(Sender: TObject);
begin
  DmEscola := TDmEscola.Create(nil);
end;

procedure TCadastroEscola.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DmEscola);
end;

procedure TCadastroEscola.Gravar;
begin
    case Operacao of
      opNovo: Inserir;
      opAlterar: Alterar;
    end;
end;

procedure TCadastroEscola.HabilitarControles(aOperacao: TOperacao);
begin
  case aOperacao of
    opNovo, opAlterar:
      begin
        edtCodigoEscola.Enabled := False;
        edtNomeEscola.Enabled := True;
        edtEndereco.Enabled := True;
        edtCnpj.Enabled := True;
      end;
    opNavegar:
      begin
        edtCodigoEscola.Enabled := False;
        edtNomeEscola.Enabled := False;
        edtEndereco.Enabled := False;
        edtCnpj.Enabled := False;
      end;
  end;
end;

procedure TCadastroEscola.Inserir;
var
  Escola: TEscola;
  EscolaController: TEscolaController;
  Erro: string;
begin
  Escola := TEscola.Create;
  EscolaController := TEscolaController.Create;
  try
//    Escola.EscolaCodigo := StrToInt(edtCodigoEscola.Text);
    Escola.EscolaNome := edtNomeEscola.Text;
    Escola.EscolaEndereco := edtEndereco.Text;
    Escola.EscolaCnpj := edtCnpj.Text;
    if EscolaController.Inserir(Escola, Erro) = true then
      raise Exception.Create(Erro);
  finally
    FreeAndNil(Escola);
    FreeAndNil(EscolaController);
  end;
end;

procedure TCadastroEscola.LimparCampos;
begin
  edtCodigoEscola.Clear;
  edtNomeEscola.Clear;
  edtEndereco.Clear;
  edtCnpj.Clear;
end;

procedure TCadastroEscola.Listar;
begin
  pgcPrincipal.ActivePage := TbPesquisar;
end;

procedure TCadastroEscola.Novo;
begin
  LimparCampos;
  FOperacao := opNovo;
  pgcPrincipal.ActivePage := tbDados;
end;

end.

