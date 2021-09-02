unit uClienteController;

interface

uses
  uClienteModel, uDmCliente, SysUtils;

type
  TClienteController = class
  public
  Constructor Create;
  Destructor Destroy; Override;
  Procedure Pesquisar(sNome: String);
    procedure CarregarCliente(oCliente: tCliente; iCodigo: Integer);
    function Inserir(oCliente: TCliente; var sErro: string): boolean;
    function Alterar(oCliente: TCliente; var sErro: string): boolean;
    function Excluir(iCodigo: Integer; var sErro: string): boolean;
  end;
implementation

{ TClienteController }

{ TClienteController }

function TClienteController.Alterar(oCliente: TCliente;
  var sErro: string): boolean;
begin
  Result := DataModule1.Alterar(oCliente, sErro);
end;

procedure TClienteController.CarregarCliente(oCliente: tCliente;
  iCodigo: Integer);
begin
  DataModule1.CarregarCLiente(oCliente, iCodigo);
end;

constructor TClienteController.Create;
begin
//DataModule1 := TDataModule1.Create(nil);
end;

destructor TClienteController.Destroy;
begin
  //FreeAndNil(DataModule1);
  inherited;
end;

function TClienteController.Excluir(iCodigo: Integer;
  var sErro: string): boolean;
begin
  Result := DataModule1.Excluir(iCodigo, sErro);
end;

function TClienteController.Inserir(oCliente: TCliente; var sErro: string):
  boolean;
begin
  Result := DataModule1.Inserir(oCliente, sErro);
end;

procedure TClienteController.Pesquisar(sNome: String);
begin
  DataModule1.Pesquisar(sNome);
end;

end.

