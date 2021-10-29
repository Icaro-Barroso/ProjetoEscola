unit RelatorioAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDmConexao, DB, ADODB, RLReport, ConexaoRelatorios;

type
  TForm1 = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLLabel1: TRLLabel;
    RLDraw1: TRLDraw;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    lbCodigoPessoa: TRLLabel;
    lbNome: TRLLabel;
    lbDocumento: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLSystemInfo3: TRLSystemInfo;
    RLLabel5: TRLLabel;
    ADOQuery1PESCOD: TIntegerField;
    ADOQuery1ALNCOD: TIntegerField;
    ADOQuery1PESNOM: TStringField;
    ADOQuery1PESDOC: TStringField;
    ADOQuery1SRICOD: TIntegerField;
    ADOQuery1ESCNOM: TWideStringField;
    ADOQuery1ALNNOTBI1: TFloatField;
    ADOQuery1ALNNOTBI2: TFloatField;
    ADOQuery1ALNNOTBI3: TFloatField;
    ADOQuery1ALNNOTBI4: TFloatField;
    procedure RLDBText3BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}




procedure TForm1.RLDBText3BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
//  if adoquery1.FieldByName('ALUNONOTA1') <> '' AND  then
//    CalculaMedia,
//    if Media  > 5 Aprovad then


end;

end.
