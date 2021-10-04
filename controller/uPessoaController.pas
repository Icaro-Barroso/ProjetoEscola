unit uPessoaController;

interface

uses
  uPessoaModel, uDmPessoa, SysUtils;

type
  TPessoaController = class
  public
    constructor Create;
    destructor Destroy; override;
    procedure Pesquisar(sNome: string); Virtual;
    procedure CarregarPessoa(oPessoa: TPessoa; iCodigo: Integer);
    function Inserir(oPessoa: TPessoa; var sErro: string): boolean; Virtual;
    function Alterar(oPessoa: TPessoa; var sErro: string): boolean;
    function Excluir(iCodigo: Integer; var sErro: string): boolean;
    function GerarCodigo: Integer;
  end;
implementation

{ TClienteController }

{ TClienteController }

function TPessoaController.Alterar(oPessoa: TPessoa;
  var sErro: string): boolean;
begin
  Result := DataModulePessoa.Alterar(oPessoa, sErro);
end;

procedure TPessoaController.CarregarPessoa(oPessoa: TPessoa;
  iCodigo: Integer);
begin
  DataModulePessoa.CarregarPessoa(oPessoa, iCodigo);
end;

constructor TPessoaController.Create;
begin
  //DataModulePessoa := TDataModule1.Create(nil);
end;

destructor TPessoaController.Destroy;
begin
  //FreeAndNil(DataModulePessoa);
  inherited;
end;

function TPessoaController.Excluir(iCodigo: Integer;
  var sErro: string): boolean;
begin
  Result := DataModulePessoa.Excluir(iCodigo, sErro);
end;

function TPessoaController.GerarCodigo: Integer;
begin
  Result := DataModulePessoa.GerarId('PESSOA');
end;

function TPessoaController.Inserir(oPessoa: TPessoa; var sErro: string): boolean;
begin
  Result := DataModulePessoa.Inserir(oPessoa, sErro)
end;

procedure TPessoaController.Pesquisar(sNome: string);
begin
  DataModulePessoa.Pesquisar(sNome);
end;

end.

