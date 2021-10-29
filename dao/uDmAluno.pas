unit uDmAluno;

interface

uses
  SysUtils, Classes, uDmConexao, FMTBcd, DBClient, Provider, DB, SqlExpr,
    uAlunoModel;

type
  TDmAluno = class(TDataModule)
    sqlPesquisarAluno: TSQLDataSet;
    sqlInserirAluno: TSQLDataSet;
    sqlAlterarAluno: TSQLDataSet;
    sqlExcluirAluno: TSQLDataSet;
    dspPesquisarAluno: TDataSetProvider;
    cdsPesquisarAluno: TClientDataSet;
    sqlAluno: TSQLDataSet;
    dsAluno: TDataSetProvider;
    cdsAluno: TClientDataSet;
    cdsAlunoALNCOD: TIntegerField;
    cdsAlunoPESCOD: TIntegerField;
    cdsAlunoSRICOD: TIntegerField;
    cdsAlunoESCCOD: TIntegerField;
    cdsAlunoPESNOM: TStringField;
    cdsAlunoPESEND: TStringField;
    cdsAlunoPESIDT: TStringField;
    cdsAlunoPESDOC: TStringField;
    sqlNota: TSQLDataSet;
    dsNota: TDataSetProvider;
    cdsNota: TClientDataSet;
    cdsAlunoALNNOTBI1: TFloatField;
    cdsAlunoALNNOTBI2: TFloatField;
    cdsAlunoALNNOTBI3: TFloatField;
    cdsAlunoALNNOTBI4: TFloatField;
    sqlEscola: TSQLDataSet;
    dsEscola: TDataSetProvider;
    cdsEscola: TClientDataSet;
    cdsEscolaesccod: TIntegerField;
    cdsEscolaescnom: TWideStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PesquisarAluno(sNome: string);
    procedure CarregarAluno(Aluno: TAluno; iCodigo: integer);
    procedure CarregarTodosAlunos;
    function Alterar(oAluno: TAluno; out sErro: string): boolean;
    function Inserir(oAluno: TAluno; out sErro: string): boolean;
    function InserirNota(oAluno: TAluno; out sErro: string): boolean;
    function GerarIdAluno(ANomeTabela: string): Integer;
    function GerarId: Integer;
    function ExcluirAluno(iAluno: Integer; out sErro: string): boolean;

  end;

var
  DmAluno: TDmAluno;

implementation

{$R *.dfm}

{ TDmAluno }

function TDmAluno.Alterar(oAluno: TAluno; out sErro: string): boolean;
begin
  sqlAluno.CommandText := format('select * from pessoa where pescod = %d',
    [oAluno.CodigoPessoa]);
  cdsAluno.Open;
  cdsAluno.Edit;
  cdsAluno.FieldByName('ESCCOD').AsInteger := oAluno.CodigoEscola;
  cdsAluno.FieldByName('PESNOM').AsString := oAluno.NomeAluno;
  cdsAluno.FieldByName('PESEND').AsString := oAluno.EnderecoAluno;
  //  cdsAluno.FieldByName('PESIDT').AsString := oAluno.DocumentoAluno;
  cdsAluno.FieldByName('PESDOC').AsString := oAluno.DocumentoAluno;
  cdsAluno.Post;
  Result := cdsAluno.ApplyUpdates(0) <> 0;
end;

procedure TDmAluno.CarregarAluno(Aluno: TAluno; iCodigo: integer);
var
  sqlAluno: TSQLDataSet;
begin

  sqlAluno := TSQLDataSet.create(nil);
  try
    begin
      sqlAluno.SQLConnection := DmConexao.sqlConexao;
      sqlAluno.CommandText := format('select * from v_Aluno where pescod = %d',
    [iCodigo]);
      sqlAluno.Open;
      begin
        Aluno.CodigoAluno := sqlAluno.FieldByName('ALNCOD').AsInteger;
        Aluno.CodigoPessoa := sqlAluno.FieldByName('PESCOD').AsInteger;
        Aluno.NomeAluno := sqlAluno.FieldByName('PESNOM').AsString;
        Aluno.CodigoSerie := sqlAluno.FieldByName('SRICOD').AsInteger;
        Aluno.DocumentoAluno := sqlAluno.FieldByName('PESDOC').AsString;
        Aluno.EnderecoAluno := sqlAluno.FieldByName('PESEND').AsString;
        Aluno.Notabi1 := sqlAluno.FieldByName('ALNNOTBI1').AsString;
        Aluno.NotaBi2 := sqlAluno.FieldByName('ALNNOTBI2').AsString;
        Aluno.Notabi3 := sqlAluno.FieldByName('ALNNOTBI3').AsString;
        Aluno.Notabi4 := sqlAluno.FieldByName('ALNNOTBI4').AsString;

       //funcao carregaaluno (oaluno, codigodele ) select * from aluno wherre pescod = CODIGODELE
      end;
    end;
  finally
    FreeAndNil(sqlAluno);
  end;
end;

procedure TDmAluno.CarregarTodosAlunos;
begin
  sqlPesquisarAluno.CommandText := 'SELECT * FROM V_ALUNO';
end;


function TDmAluno.ExcluirAluno(iAluno: Integer; out sErro: string): boolean;
begin
  sqlPesquisarAluno.CommandText := format('select * from pessoa where pescod = %d', [iAluno]);
  cdsPesquisarAluno.Open;
  cdsPesquisarAluno.Delete;

  Result := cdsPesquisarAluno.ApplyUpdates(0) <> 0;
end;

function TDmAluno.GerarId: Integer;
var
  sqlSequencia: TSQLDataSet;
begin
  try
    sqlSequencia := TSQLDataSet.Create(nil);
    sqlSequencia.SQLConnection := DmConexao.sqlConexao;
    sqlSequencia.CommandText := 'select coalesce(max(PESCOD),0)+1 as seq from PESSOA' ;
    sqlSequencia.Open;
    //sqlSequencia.ExecSQL();
    Result := sqlSequencia.FieldByName('seq').AsInteger;
//    sqlSequencia.CommandText := Format('UPDATE CODIGOAUXILIAR SET PROXIMOCODIGO = COALESCE(ProximoCodigo,1) + 1' +
//    'WHERE TABELA = ''%s''',[ANomeTabela]);
//                                                                                                      1

  finally
    FreeAndNil(sqlSequencia);
  end;
//Result := 6;
end;

function TDmAluno.GerarIdAluno(ANomeTabela: string): Integer;
  var
  sqlSequencia: TSQLDataSet;
begin
  try
    sqlSequencia := TSQLDataSet.Create(nil);
    sqlSequencia.SQLConnection := DmConexao.sqlConexao;
    sqlSequencia.CommandText := 'select coalesce(max(ALNCOD),0)+1 as seq from ALUNO' ;
   sqlSequencia.Open;
    Result := sqlSequencia.FieldByName('seq').AsInteger;
  finally
    FreeAndNil(sqlSequencia);
  end;
end;



function TDmAluno.Inserir(oAluno: TAluno; out sErro: string): boolean;
VAR
 IDPESSOA: INTEGER;
begin
  IDPESSOA := GerarId;
  sqlPesquisarAluno.CommandText := ('select p.* from pessoa p  where 1=0');
  cdsPesquisarAluno.Open;
  cdsPesquisarAluno.Append;
  cdsPesquisarAluno.FieldByName('PESCOD').AsInteger := IDPESSOA;
  cdsPesquisarAluno.FieldByName('ESCCOD').AsInteger := oAluno.CodigoEscola;
  cdsPesquisarAluno.FieldByName('PESNOM').AsString := oAluno.NomeAluno;
  cdsPesquisarAluno.FieldByName('PESEND').AsString := oAluno.EnderecoAluno;
  cdsPesquisarAluno.FieldByName('PESIDT').AsString := 'F';
  cdsPesquisarAluno.FieldByName('PESDOC').AsString := oAluno.DocumentoAluno;

  cdsPesquisarAluno.Post;
  cdsPesquisarAluno.ApplyUpdates(0);
  cdsPesquisarAluno.Close;
  sqlPesquisarAluno.CommandText := 'select * from Aluno where 1=0';
  cdsPesquisarAluno.Open;
  cdsPesquisarAluno.Append;
  cdsPesquisarAluno.FieldByName('PESCOD').AsInteger := IDPESSOA;
  cdsPesquisarAluno.FieldByName('ALNCOD').AsInteger := GerarIdAluno('ALUNO');
  cdsPesquisarAluno.FieldByName('SRICOD').AsInteger := oAluno.CodigoSerie;
  cdsPesquisarAluno.Post;
  Result := cdsPesquisarAluno.ApplyUpdates(0) <> 0;
end;

function TDmAluno.InserirNota(oAluno: TAluno; out sErro: string): boolean;
begin
   cdsNota.Close;
 sqlNota.CommandText := format('select * from Aluno where ALNCOD = %d',
    [oAluno.CodigoAluno]);
  cdsNota.Open;
  cdsNota.Edit;
  cdsNota.FieldByName('ALNNOTBI1').AsString := oAluno.Notabi1;
  cdsNota.FieldByName('ALNNOTBI2').AsString := oAluno.NotaBi2;
  cdsNota.FieldByName('ALNNOTBI3').AsString := oAluno.NotaBi3;
  cdsNota.FieldByName('ALNNOTBI4').AsString := oAluno.NotaBi4;
  cdsNota.Post;
  Result := cdsNota.ApplyUpdates(0) <> 0;
end;

procedure TDmAluno.PesquisarAluno(sNome: string);
begin
  if cdsPesquisarAluno.Active then
    cdsPesquisarAluno.close;
  cdsPesquisarAluno.CommandText :=
    format('select * from V_aluno where PESNOM = ''%s''', [sNome]);
  //cdsPesquisar.Params[0].AsString := '%' + sNome + '%';
  cdsPesquisarAluno.Open;
  cdsPesquisarAluno.First;
end;

end.

