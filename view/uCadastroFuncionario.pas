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
    cxGridFuncionario: TcxGridDBTableView;
    cxGridFuncionarioFNCCOD: TcxGridDBColumn;
    cxGridFuncionarioFNCSLR: TcxGridDBColumn;
    cxGridFuncionarioFNCCRG: TcxGridDBColumn;
    cxGridFuncionarioPESEND: TcxGridDBColumn;
    cxGridFuncionarioPESDOC: TcxGridDBColumn;
    cxGridFuncionarioPESNOM: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
  protected
    procedure Gravar; override;
    procedure Inserir; override;
    procedure Alterar; override;
    procedure CarregarPessoa; override;
    procedure HabilitarControles(aOperacao: TOperacao); override;
    procedure ExcluirFuncionario;
    procedure LimparCampos; override;
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

procedure TCadastroFuncionario.btnListarClick(Sender: TObject);
begin
  inherited;
  dsPesqFuncionario.DataSet.Refresh;
end;

procedure TCadastroFuncionario.CarregarPessoa;
var
  oFuncionario: TFuncionario;
  oFuncioanrioController: TFuncionarioController;
begin

  oFuncionario := TFuncionario.Create;
  oFuncioanrioController := TFuncionarioController.Create;
  try
    oFuncioanrioController.CarregarFuncionario(oFuncionario,
      dsPesqFuncionario.DataSet.FieldByName('PESCOD').AsInteger);
    begin
      edCodigoFuncionario.Text := IntToStr(oFuncionario.CodigoFuncionario);
      edtNome.Text := oFuncionario.NomeFuncionario;
      edtDocumento.Text := oFuncionario.DocumentoFuncionario;
      edtEndereco.Text := oFuncionario.EnderecoFuncionario;
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
  try
    if (dsPesqFuncionario.DataSet.Active) then
    begin
      if MessageDlg(Format('Voce realmente deseja exluir o cadastro de %s?', [dsPesqFuncionario.DataSet.FieldByName('PESNOM').AsString]), mtConfirmation, [mbYes,
        mbNo], 0) = IDYES then
      begin
        if
          oFuncionarioController.ExcluirFuncionario(dsPesqFuncionario.DataSet.FieldByName('PESCOD').AsInteger,
          sErro) = True then
          raise Exception.Create(sErro);
          dsPesqFuncionario.DataSet.Refresh;
//       oFuncionarioController.PesquisarFuncionario(edtPesquisar.Text);
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
    if FuncionarioController.Inserir(Funcionario, Erro) then
      raise Exception.Create(Erro);
  finally
    FreeAndNil(Funcionario);
    FreeAndNil(FuncionarioController);
end;
end;

procedure TCadastroFuncionario.LimparCampos;
begin
  inherited;
  edCodigoFuncionario.Clear;
  edSalario.Clear;
  edCargo.Clear;
  edEspecialidade.Clear;
end;

end.
