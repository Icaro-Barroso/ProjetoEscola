unit uDmPessoa;

interface

uses
  SysUtils, Classes, FMTBcd, DB, DBClient, Provider, SqlExpr, uPessoaModel, uDmConexao;

type
  TDataModulePessoa = class(TDataModule)
    sqlPesquisar: TSQLDataSet;
    sqlInserir: TSQLDataSet;
    sqlAlterar: TSQLDataSet;
    sqlExcluir: TSQLDataSet;
    dspPesquisar: TDataSetProvider;
    cdsPesquisar: TClientDataSet;
    cdsPesquisarPESCOD: TIntegerField;
    cdsPesquisarPESDOC: TStringField;
    cdsPesquisarESCCOD: TIntegerField;
    cdsPesquisarPESIDT: TStringField;
    cdsPesquisarPESNOM: TStringField;
    cdsPesquisarPESEND: TStringField;
    sqlPesquisarAluno: TSQLDataSet;
    SQLDataSet1: TSQLDataSet;
    DataSetProvider1: TDataSetProvider;
    ClientDataSet1: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
  private
    { Private declarations }
  public
    function GerarId(ANomeTabela: string): Integer;
    procedure Pesquisar(sNome: string);
    procedure CarregarPessoa(oPessoa: TPessoa; iCodigo: Integer);
    function Inserir(oPessoa: TPessoa; out sErro: string): boolean;
    function Alterar(oPessoa: TPessoa; out sErro: string): boolean;
    function Excluir(iPessoa: Integer; out sErro: string): boolean;
  end;

var
  DataModulePessoa: TDataModulePessoa;

implementation


{$R *.dfm}

{ TDataModule1 }

function TDataModulePessoa.Alterar(Opessoa: TPessoa; out sErro: string): boolean;
begin
  SQLDataSet1.CommandText := format('select * from pessoa where pescod = %d', [Opessoa.ID]);
  ClientDataSet1.Open;
  ClientDataSet1.Edit;
  ClientDataSet1.FieldByName('ESCCOD').AsInteger := oPessoa.CodigoEscola;
  ClientDataSet1.FieldByName('PESNOM').AsString := oPessoa.Nome;
  ClientDataSet1.FieldByName('PESEND').AsString := oPessoa.Endereco;
  ClientDataSet1.FieldByName('PESIDT').AsString := oPessoa.Tipo;
  ClientDataSet1.FieldByName('PESDOC').AsString := oPessoa.Tipo;
  ClientDataSet1.Post;
  Result := ClientDataSet1.ApplyUpdates(0) <> 0;



//  with sqlAlterar, Opessoa do
//  begin
//    Params[0].AsString := NOME;
//    Params[1].AsInteger := ID;
////    Params[2].AsString := Tipo;
////    Params[3].AsString := Documento;
////    Params[4].AsString := Endereco;
//    try
//      ExecSQL();
//      Result := True;
//
//    except on E: Exception do
//      begin
//        sErro := 'Ocorreu um erro ao alterar: ' + sLineBreak + E.Message;
//        Result := False;
//
//      end;
//    end;
//  end;
end;

procedure TDataModulePessoa.CarregarPessoa(oPessoa: TPessoa; iCodigo: Integer);
var
  sqlPessoa: TSQLDataSet;
begin
  sqlPessoa := TSQLDataSet.create(nil);
  try
    with sqlPessoa do
    begin
      SQLConnection := DmConexao.sqlConexao;
     CommandText := 'Select * from Pessoa where PESCOD = ' + IntToStr(iCodigo);
      Open;
      with oPessoa do
      begin
        ID := FieldByName('PESCOD').AsInteger;
        CodigoEscola := FieldByName('ESCCOD').AsInteger;
        Nome := sqlPessoa.FieldByName('PESNOM').AsString;
        Tipo := FieldByName('PESIDT').AsString;
        Documento := FieldByName('PESDOC').AsString;
        Endereco := sqlPessoa.FieldByName('PESEND').AsString;
      end;
    end;
  finally
    FreeAndNil(sqlPessoa);
  end;
end;

function TDataModulePessoa.Excluir(iPessoa: Integer; out sErro: string): boolean;
begin
  SQLDataSet1.CommandText := format('select * from pessoa where pescod = %d', [iPessoa]);
  ClientDataSet1.Open;
  ClientDataSet1.delete;

  Result := ClientDataSet1.ApplyUpdates(0) <> 0;

//sqlExcluir.Params[0].AsInteger := iPessoa;
//  with sqlExcluir do
//  begin
//    try
//      sqlExcluir.ExecSQL();
//      Result := true;
//    except on E: Exception do
//      begin
//        sErro := 'Ocorreu um erro ao excluir: ' + sLineBreak + E.Message;
//        Result := False;
//      end;
//    end;
//  end;
end;

function TDataModulePessoa.GerarId(ANomeTabela: string): Integer;
//var
//  sqlSequencia: TSQLDataSet;
begin
//  try
//    sqlSequencia := TSQLDataSet.Create(nil);
//    sqlSequencia.SQLConnection := DmConexao.sqlConexao;
//    sqlSequencia.CommandText :=
//      Format('SELECT COALESCE(ProximoCodigo,1) FROM CodigoAuxiliar WHERE TABELA = ''%s''',[ANomeTabela]);
//    sqlSequencia.Open;
//    result := sqlSequencia.Fields[0].AsInteger;
//    sqlSequencia.CommandText := Format('UPDATE CODIGOAUXILIAR SET PROXIMOCODIGO = COALESCE(ProximoCodigo,1) + 1' +
//    'WHERE TABELA = ''%s''',[ANomeTabela]);
//    //sqlSequencia.ExecSQL();                                                                                                       1
//
//  finally
//
//    FreeAndNil(sqlSequencia);
//  end;
Result := 6;
end;

function TDataModulePessoa.Inserir(oPessoa: TPessoa; out sErro: string): boolean;
begin
  SQLDataSet1.CommandText := format('select * from pessoa p where 1=0', [Opessoa.ID]);
  ClientDataSet1.Open;
  ClientDataSet1.Append;
  ClientDataSet1.FieldByName('PESCOD').AsInteger := GerarId('PESSOA');
  ClientDataSet1.FieldByName('ESCCOD').AsInteger := oPessoa.CodigoEscola;
  ClientDataSet1.FieldByName('PESNOM').AsString := oPessoa.Nome;
  ClientDataSet1.FieldByName('PESEND').AsString := oPessoa.Endereco;
  ClientDataSet1.FieldByName('PESIDT').AsString := oPessoa.Tipo;
  ClientDataSet1.FieldByName('PESDOC').AsString := oPessoa.Documento;
  ClientDataSet1.Post;

  Result := ClientDataSet1.ApplyUpdates(0) <> 0;


//  with sqlInserir, oPessoa do
//  begin
//    Params[0].AsInteger := GerarId('PESSOA');
//    Params[1].AsInteger := CodigoEscola;
//    Params[2].AsString := Nome;
//    Params[3].AsString := Endereco;
//    Params[4].AsString := Tipo;
//    Params[5].AsString := Tipo;
//    try
//      ExecSQL();
//      Result := True;
//    except on E: Exception do
//      begin
//        sErro := 'Ocorreu um erro ao inserir: ' + sLineBreak + E.Message;
//        Result := False;
//      end;
//    end;
//  end;
end;

procedure TDataModulePessoa.Pesquisar(sNome: string);
begin
 if cdsPesquisar.Active then
    cdsPesquisar.close;
  cdsPesquisar.CommandText := Format('select * from PESSOA where PESNOM like %s',[ QuotedStr('%' + sNome + '%') ]);
  //cdsPesquisar.Params[0].AsString := '%' + sNome + '%';
  cdsPesquisar.Open;
  cdsPesquisar.First;

end;

end.

