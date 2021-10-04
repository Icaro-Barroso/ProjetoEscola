unit uDmEscola;

interface

uses
  SysUtils, Classes, uDmConexao, FMTBcd, DBClient, Provider, DB, SqlExpr, uEscolaModel;

type
  TDmEscola = class(TDataModule)
    sqlEscola: TSQLDataSet;
    dspEscola: TDataSetProvider;
    cdsEscola: TClientDataSet;
    cdsEscolaESCCOD: TIntegerField;
    cdsEscolaESCNOM: TWideStringField;
    cdsEscolaESCEND: TWideStringField;
    cdsEscolaESCCNJ: TWideStringField;
    sqlPesquisarEscola: TSQLDataSet;
    dspPesquisarEscola: TDataSetProvider;
    cdsPesquisarEscola: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PesquisarEscola(sNome: string);
    procedure CarregarEscola(Escola: TEscola; iCodigo: integer);
    procedure CarregarTodosEscola;
    function Alterar(oEscola: TEscola; out sErro: string): boolean;
    function Inserir(oEscola: TEscola; out sErro: string): boolean;
    function GerarIdEscola: Integer;
    function ExcluirEscola(iEscola: Integer; out sErro: string): boolean;
  end;

var
  DmEscola: TDmEscola;

implementation

{$R *.dfm}

{ TDmEscola }

function TDmEscola.Alterar(oEscola: TEscola; out sErro: string): boolean;
begin
sqlPesquisarEscola.CommandText := format('select * from escola where pescod = %d',
    [oEscola.EscolaCodigo]);
  cdsPesquisarEscola.Open;
  cdsPesquisarEscola.Edit;
  cdsPesquisarEscola.FieldByName('ESCCOD').AsInteger := oEscola.EscolaCodigo;
  cdsPesquisarEscola.FieldByName('ESCNOM').AsString := oEscola.EscolaNome;
  cdsPesquisarEscola.FieldByName('ESCEND').AsString := oEscola.EscolaEndereco;
  cdsPesquisarEscola.FieldByName('ESCCNJ').AsString := oEscola.EscolaCnpj;
  cdsPesquisarEscola.Post;
  Result := cdsPesquisarEscola.ApplyUpdates(0) <> 0;
end;

procedure TDmEscola.CarregarEscola(Escola: TEscola; iCodigo: integer);
var
  sqlEscola: TSQLDataSet;
begin

  sqlEscola := TSQLDataSet.create(nil);
  try
    begin
      sqlEscola.SQLConnection := DmConexao.sqlConexao;
      sqlEscola.CommandText := format('select * from Escola where pescod = %d',
    [iCodigo]);
      sqlEscola.Open;
      begin
        Escola.EscolaCodigo := sqlEscola.FieldByName('ESCCOD').AsInteger;
        Escola.EscolaNome := sqlEscola.FieldByName('ESCNOM').AsString;
        Escola.EscolaEndereco := sqlEscola.FieldByName('ESCEND').AsString;
        Escola.EscolaCnpj := sqlEscola.FieldByName('ESCCNJ').AsString;
      end;
    end;
  finally
    FreeAndNil(sqlEscola);
  end;
end;

procedure TDmEscola.CarregarTodosEscola;
begin
 sqlEscola.CommandText := 'SELECT * FROM ESCOLA';
end;

function TDmEscola.ExcluirEscola(iEscola: Integer; out sErro: string): boolean;
begin
sqlPesquisarEscola.CommandText := format('select * from pessoa where pescod = %d', [iEscola]);
  cdsPesquisarEscola.Open;
  cdsPesquisarEscola.delete;

  Result := cdsPesquisarEscola.ApplyUpdates(0) <> 0;
end;

function TDmEscola.GerarIdEscola: Integer;
var
  sqlSequencia: TSQLDataSet;
begin
  try
    sqlSequencia := TSQLDataSet.Create(nil);
    sqlSequencia.SQLConnection := DmConexao.sqlConexao;
    sqlSequencia.CommandText := 'select coalesce(max(ESCCOD),0)+1 as seq from ESCOLA' ;
   sqlSequencia.Open;
    Result := sqlSequencia.FieldByName('seq').AsInteger;
  finally
    FreeAndNil(sqlSequencia);
  end;
end;

function TDmEscola.Inserir(oEscola: TEscola; out sErro: string): boolean;
VAR
 IDEscola: INTEGER;
begin
  IDEscola := GerarIdEscola;
  sqlPesquisarEscola.CommandText := ('select * from pessoa where 1=0');
  cdsPesquisarEscola.Open;
  cdsPesquisarEscola.Append;
  cdsPesquisarEscola.FieldByName('ESCCOD').AsInteger := IDEscola;
  cdsPesquisarEscola.FieldByName('ESCNOM').AsString := oEscola.EscolaNome;
  cdsPesquisarEscola.FieldByName('ESCEND').AsString := oEscola.EscolaEndereco;
  cdsPesquisarEscola.FieldByName('ESCCNJ').AsString := oEscola.EscolaCnpj;

  cdsPesquisarEscola.Post;
  cdsPesquisarEscola.ApplyUpdates(0);
  cdsPesquisarEscola.Close;
end;

procedure TDmEscola.PesquisarEscola(sNome: string);
begin
 if sqlEscola.Active then
    sqlEscola.close;
  sqlEscola.CommandText :=
    Format('select * from Escola where ESCNOM like %s', ['%' + sNome + '%']);
  sqlEscola.Open;
  sqlEscola.First;
end;

end.
