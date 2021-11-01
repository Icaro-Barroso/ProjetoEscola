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
    lbMedia: TRLLabel;
    lbResultadoMedia: TRLLabel;
    procedure RLDBText3BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
    procedure CalcularMedia(Sender: TObject; var Text: string; var PrintIt: Boolean);
  private
    { Private declarations }
    Function CalculaMedia: extended;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


function TForm1.CalculaMedia: extended;
begin

   Result:= (adoquery1.FieldByName('ALNNOTBI1').AsFloat + adoquery1.FieldByName('ALNNOTBI2').AsFloat +
   adoquery1.FieldByName('ALNNOTBI3').AsFloat + adoquery1.FieldByName('ALNNOTBI4').AsFloat ) / 4  ;

end;

procedure TForm1.CalcularMedia(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
  if (adoquery1.FieldByName('ALNNOTBI1').AsString <> '') and
   (adoquery1.FieldByName('ALNNOTBI2').AsString <> '') and
   (adoquery1.FieldByName('ALNNOTBI3').AsString <> '') and
   (adoquery1.FieldByName('ALNNOTBI4').AsString <> '') then
   begin
   Text := FloatToStr(CalculaMedia);
   PrintIt:= true;
   end;
end;
procedure TForm1.RLDBText3BeforePrint(Sender: TObject; var Text: string; var PrintIt: Boolean);
begin
//  if adoquery1.FieldByName('ALUNONOTA1') <> '' AND  then
//    CalculaMedia,
//    if Media  > 5 Aprovad then


end;

end.
