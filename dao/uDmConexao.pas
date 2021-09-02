unit uDmConexao;

interface

uses
  SysUtils, Classes, WideStrings, DB, SqlExpr;

type
  TDmConexao = class(TDataModule)
    sqlConexao: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmConexao: TDmConexao;

implementation

{$R *.dfm}

end.
