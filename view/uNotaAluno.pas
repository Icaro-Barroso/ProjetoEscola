unit uNotaAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, uDmAluno, cxGraphics, cxControls, cxLookAndFeels,
    cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, DB,
    cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
    cxGrid, ComCtrls, uNotaController, uAlunoModel, uAlunoController;

type
  TOperacao = (opNovo, opAlterar, opNavegar);

  TNotaAluno = class(TForm)
    PgcPrincipal: TPageControl;
    tbPesq: TTabSheet;
    tbDados: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    edtPesquisar: TLabeledEdit;
    btnPesquisar: TButton;
    btnSelecionar: TButton;
    cxNotas: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dscxgridNota: TDataSource;
    edtCodigo: TLabeledEdit;
    edtNotab1: TLabeledEdit;
    edtNome: TLabeledEdit;
    edtNotabi2: TLabeledEdit;
    edtNotabi3: TLabeledEdit;
    edtNotabi4: TLabeledEdit;
    Panel3: TPanel;
    btnGravar: TButton;
    btnListar: TButton;
    cxNotasALNCOD: TcxGridDBColumn;
    cxNotasPESNOM: TcxGridDBColumn;
    cxNotasALNNOTBI1: TcxGridDBColumn;
    cxNotasALNNOTBI2: TcxGridDBColumn;
    cxNotasALNNOTBI3: TcxGridDBColumn;
    cxNotasALNNOTBI4: TcxGridDBColumn;
    procedure btnSelecionarClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
  private
    FOperacao: TOperacao;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Gravar;
    procedure Inserir;
    procedure CarregarAluno;
    procedure HabilitarControles(aOperacao: TOperacao);
    procedure LimparCampos;
    procedure Detalhar;
    procedure Listar;
  public
    { Public declarations }
     property Operacao: TOperacao read FOperacao;
  end;

var
  NotaAluno: TNotaAluno;

implementation

{$R *.dfm}

{ TNotaAluno }

procedure TNotaAluno.btnGravarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(opNovo);
end;

procedure TNotaAluno.btnListarClick(Sender: TObject);
begin
  Listar;
  dscxgridNota.DataSet.Refresh;
end;

procedure TNotaAluno.btnSelecionarClick(Sender: TObject);
begin
  Detalhar;
  HabilitarControles(opNovo);
end;

procedure TNotaAluno.CarregarAluno;
var
  oAluno: TAluno;
  oAlunoController: TAlunoController;
begin
  oAluno := TAluno.Create;
  oAlunoController := TAlunoController.Create;
  try

    oAlunoController.CarregarAluno(oAluno,
    dscxgridNota.DataSet.FieldByName('PESCOD').AsInteger);
    begin
      edtCodigo.Text := IntToStr(oAluno.CodigoAluno);
      edtNome.Text := oAluno.NomeAluno;
      edtNotab1.Text := oAluno.Notabi1;
      edtNotabi2.Text := oAluno.NotaBi2;
      edtNotabI3.Text := oAluno.NotaBi3;
      edtNotabI4.Text := oAluno.NotaBi4;
      end;
  finally
    FreeAndNil(oAluno);
    FreeAndNil(oAlunoController);
  end;
end;

procedure TNotaAluno.Detalhar;
begin
  CarregarAluno;
  HabilitarControles(opNovo);
  FOperacao := opNovo;
  pgcPrincipal.ActivePage := tbDados;
end;

procedure TNotaAluno.FormCreate(Sender: TObject);
begin
  DmAluno := TDmAluno.Create(nil);
end;

procedure TNotaAluno.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DmAluno);
end;

procedure TNotaAluno.Gravar;
var
  oNotaController: TNotaController;
begin
  oNotaController := TNotaController.Create;
  try
    case Operacao of
      opNovo: Inserir;
      opAlterar: Inserir;
    end;
  finally
    FreeAndNil(oNotaController);
  end;
end;

procedure TNotaAluno.HabilitarControles(aOperacao: TOperacao);
begin
  case aOperacao of
    opNovo, opAlterar:
      begin
        edtCodigo.Enabled := False;
        edtNome.Enabled := False;
        edtNotab1.Enabled := True;
        edtNotab1.Enabled := True;
        edtNotab1.Enabled := True;
        edtNotab1.Enabled := True;
        end;
    opNavegar:
      begin
        edtCodigo.Enabled := False;
        edtNome.Enabled := False;
        edtNotab1.Enabled := True;
        edtNotab1.Enabled := True;
        edtNotab1.Enabled := True;
        edtNotab1.Enabled := True;
      end;
  end;
end;

procedure TNotaAluno.Inserir;
var
  Nota: TAluno;
  NotaController: TNotaController;
  Erro: string;
begin
  Nota := TAluno.Create;
  NotaController := TNotaController.Create;
  try
  begin
    Nota.CodigoAluno := StrToInt(edtCodigo.Text);
    Nota.Notabi1 := edtNotab1.Text;
    Nota.NotaBi2 := edtNotabi2.Text;
    Nota.NotaBi3 := edtNotabi3.Text;
    Nota.NotaBi4 := edtNotabi4.Text;
    end;
    if NotaController.Inserir(Nota, Erro) = true then
      raise Exception.Create(Erro);
  finally
    FreeAndNil(Nota);
    FreeAndNil(NotaController);
  end;
end;

procedure TNotaAluno.LimparCampos;
begin
  edtCodigo.Clear;
  edtNome.Clear;
  edtNotab1.Clear;
  edtNotabi2.Clear;
  edtNotabi3.Clear;
  edtNotabi4.Clear;
end;

procedure TNotaAluno.Listar;
begin
  pgcPrincipal.ActivePage := tbPesq;
end;

end.

