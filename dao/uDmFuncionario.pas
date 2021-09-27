unit uDmFuncionario;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr;

type
  TDataModule1 = class(TDataModule)
    sqlFuncionario: TSQLDataSet;
    dsFuncionario: TDataSetProvider;
    cdsFuncionario: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{$R *.dfm}

end.
