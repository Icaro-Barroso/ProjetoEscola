unit uEscola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, DB, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
 TOperacao = (opNovo, opAlterar, opNavegar);

  TEscola = class(TForm)
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
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    Panel3: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    LabeledEdit4: TLabeledEdit;
    LabeledEdit5: TLabeledEdit;
   //
//    procedure FormCreate(Sender: TObject);
//    procedure FormDestroy(Sender: TObject);
//    procedure FormShow(Sender: TObject);
//    procedure btnExcluirClick(Sender: TObject);
//  protected
//    procedure Gravar;
//    procedure Inserir;
//    procedure Alterar;
//    procedure CarregarEscola;
//    procedure HabilitarControles(aOperacao: TOperacao);
//    procedure ExcluirAluno;
//  private
//    { Private declarations }
//     FOperacao: TOperacao;
//    procedure Novo;
//    procedure Detalhar;
//    procedure Configuracao;
//    procedure Pesquisar;
  public
    { Public declarations }
  end;

var
  Escola: TEscola;

implementation

{$R *.dfm}



end.
