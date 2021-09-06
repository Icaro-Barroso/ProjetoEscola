unit uDmAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uDmCliente, FMTBcd, DB, DBClient, Provider, SqlExpr, uDmconexao,
    uAlunoModel;

type
  TDataModule2 = class(TDataModule)
    (* sqlPesquisarAluno: TSQLDataSet;
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
   *)
  private
    { Private declarations }
  public
    function GerarIdAluno: Integer;
    procedure PesquisarAluno(sNome: string);
    procedure CarregarAluno(oAluno: TAluno; iCodigo: Integer);
    function InserirAluno(oAluno: TAluno; out sErro: string): boolean;
    function AlterarAluno(oAluno: TAluno; out sErro: string): boolean;
    function ExcluirAluno(iAluno: Integer; out sErro: string): boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModuleAluno: TDataModule2;

implementation

{$R *.dfm}

{ TDataModuleAluno }

function TDataModule2.AlterarAluno(oAluno: TAluno;
  out sErro: string): boolean;
begin

end;

procedure TDataModule2.CarregarAluno(oAluno: TAluno; iCodigo: Integer);
begin

end;

function TDataModule2.ExcluirAluno(iAluno: Integer;
  out sErro: string): boolean;
begin

end;

function TDataModule2.GerarIdAluno: Integer;
begin

end;

function TDataModule2.InserirAluno(oAluno: TAluno;
  out sErro: string): boolean;
begin

end;

procedure TDataModule2.PesquisarAluno(sNome: string);
begin

end;

end.

