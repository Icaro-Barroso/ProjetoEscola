unit uCadastroFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastro, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, DB, StdCtrls, cxClasses,
  cxGridLevel, cxGrid, Grids, DBGrids, ExtCtrls, ComCtrls, uDmFuncionario, uFuncionarioModel, uFuncionarioController,
  uPessoaController, uPessoaModel,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView;

type
  TCadastroFuncionario = class(TCadastro)
    edCodigoFuncionario: TLabeledEdit;
    edSalario: TLabeledEdit;
    edCargo: TLabeledEdit;
    edEspecialidade: TLabeledEdit;
    dsPesqFuncionario: TDataSource;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1FNCCOD: TcxGridDBColumn;
    cxGrid1DBTableView1PESCOD: TcxGridDBColumn;
    cxGrid1DBTableView1FNCSLR: TcxGridDBColumn;
    cxGrid1DBTableView1FNCCRG: TcxGridDBColumn;
    cxGrid1DBTableView1PESEND: TcxGridDBColumn;
    cxGrid1DBTableView1PESDOC: TcxGridDBColumn;
    cxGrid1DBTableView1ESCNOM: TcxGridDBColumn;
    cxGrid1DBTableView1PESIDT: TcxGridDBColumn;
    cxGrid1DBTableView1ESPTIP: TcxGridDBColumn;
    cxGrid1DBTableView1ESCCOD: TcxGridDBColumn;
    cxGrid1DBTableView1PESNOM: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject); override;
    procedure btnExcluirClick(Sender: TObject);
  protected
    procedure Gravar; override;
    procedure Inserir; override;
    procedure Alterar; override;
    procedure CarregarPessoa; override;
    procedure HabilitarControles(aOperacao: TOperacao); override;
    procedure ExcluirFuncionario;
  public
    { Public declarations }
  end;

var
  CadastroFuncionario: TCadastroFuncionario;

implementation

{$R *.dfm}



{ TCadastroFuncionario }

procedure TCadastroFuncionario.Alterar;
var
  oFuncionario: TFuncionario;
  oFuncionarioController: TFuncionarioController;
  sErro: string;
begin
  oFuncionario := TFuncionario.Create;
  oFuncionarioController := TFuncionarioController.Create;
  try
    begin
      oFuncionario.CodigoPessoa := StrToIntDef(edtCodigo.Text, 0);
      oFuncionario.CodigoFuncionario := StrToIntDef(edCodigoFuncionario.Text, 0);
      oFuncionario.FuncionarioCargo := edCargo.Text;
      oFuncionario.FuncionarioSalario := edSalario.Text;
      oFuncionario.CodigoEspecialidade := StrToIntDef(edEspecialidade.Text, 0);
      oFuncionario.NomeFuncionario := edtNome.Text;
      oFuncionario.DocumentoFuncionario := edtDocumento.Text;
      oFuncionario.EnderecoFuncionario := edtEndereco.Text;
    end;
    if oFuncionarioController.Alterar(oFuncionario, sErro) = true then
      raise Exception.Create(sErro);

  finally
    FreeAndNil(oFuncionario);
    FreeAndNil(oFuncionarioController);
  end;
end;

procedure TCadastroFuncionario.HabilitarControles(aOperacao: TOperacao);
begin
  inherited;
  case aOperacao of
    opNovo, opAlterar:
      begin
        edCodigoFuncionario.Enabled := False;
        edtCodigoEscola.Enabled := True;
        edSalario.Enabled := True;
        edCargo.Enabled := True;
        edEspecialidade.Enabled := True;
      end;
    opNavegar:
      begin
        edCodigoFuncionario.Enabled := False;
        edtCodigoEscola.Enabled := False;
        edSalario.Enabled := False;
        edCargo.Enabled := False;
        edEspecialidade.Enabled := False;
      end;
  end;
end;

procedure TCadastroFuncionario.btnExcluirClick(Sender: TObject);
begin
 ExcluirFuncionario;

end;

procedure TCadastroFuncionario.CarregarPessoa;
var
  oFuncionario: TFuncionario;
  oFuncioanrioController: TFuncionarioController;
begin
  inherited;
  oFuncionario := TFuncionario.Create;
  oFuncioanrioController := TFuncionarioController.Create;
  try

    oFuncioanrioController.CarregarFuncionario(oFuncionario,
      DBGridPesquisa.SelectedField.AsInteger);
    begin
      edCodigoFuncionario.Text := IntToStr(oFuncionario.CodigoFuncionario);
      edSalario.Text := oFuncionario.FuncionarioSalario;
      edCargo.Text := oFuncionario.FuncionarioCargo;
      edEspecialidade.Text := IntToStr(oFuncionario.CodigoEspecialidade);
      edSalario.Text := oFuncionario.FuncionarioSalario;
      edEspecialidade.Text := IntToStr(oFuncionario.CodigoEspecialidade);
    end;
  finally
    FreeAndNil(oFuncionario);
    FreeAndNil(oFuncioanrioController);
  end;
end;

procedure TCadastroFuncionario.ExcluirFuncionario;
var
oFuncionarioController: TFuncionarioController;
  sErro: string;
begin
  oFuncionarioController := TFuncionarioController.Create;
  DmFuncionario.cdsFuncionario.Active := True;
  try

    if (DmFuncionario.cdsFuncionario.Active) then
    begin
      if MessageDlg('Voce realmente deseja exluir?', mtConfirmation, [mbYes,
        mbNo], 0) = IDYES then
      begin
        if
          oFuncionarioController.ExcluirFuncionario(DmFuncionario.cdsFuncionarioPESCOD.AsInteger,
          sErro) = False then
          raise Exception.Create(sErro);
       oFuncionarioController.PesquisarFuncionario(edtPesquisar.Text);
      end;
    end
    else
      raise Exception.Create('Não ha registro a ser excluido');
  finally
    FreeAndNil(oFuncionarioController);
  end;
end;

procedure TCadastroFuncionario.FormCreate(Sender: TObject);
begin
  DmFuncionario := TDmFuncionario.Create(nil);
end;

procedure TCadastroFuncionario.FormDestroy(Sender: TObject);
begin
          //aa
end;

procedure TCadastroFuncionario.FormShow(Sender: TObject);
begin
  inherited;
  //a

end;

procedure TCadastroFuncionario.Gravar;
var
  oFuncionarioController: TFuncionarioController;
begin
  inherited;
  oFuncionarioController := TFuncionarioController.Create;
  try
    case Operacao of
      opNovo: Inserir;
      opAlterar: Alterar;
    end;
  //oFuncionarioController.Pesquisar(edtNome.Text);
  finally
    FreeAndNil(oFuncionarioController);
  end;
end;

procedure TCadastroFuncionario.Inserir;
var
  Funcionario: TFuncionario;
  FuncionarioController: TFuncionarioController;
  Erro: string;
begin
  inherited;
  Funcionario := TFuncionario.Create;
  FuncionarioController := TFuncionarioController.Create;
  try
    Funcionario.NomeFuncionario := edtNome.Text;
    Funcionario.EnderecoFuncionario := edtEndereco.Text;
    Funcionario.DocumentoFuncionario := edtDocumento.Text;
    Funcionario.FuncionarioSalario := edSalario.Text;
    Funcionario.FuncionarioCargo := edCargo.Text;
    Funcionario.CodigoEspecialidade := StrToInt(edEspecialidade.Text);

    //TIPO
    if FuncionarioController.Inserir(Funcionario, Erro) then
      raise Exception.Create(Erro);
  finally
    FreeAndNil(Funcionario);
    FreeAndNil(FuncionarioController);
end;
end;

end.
