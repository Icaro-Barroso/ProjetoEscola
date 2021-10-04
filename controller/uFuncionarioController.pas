unit uFuncionarioController;
interface

uses
  uFuncionarioModel, uDmFuncionario, uPessoaController;

type
  TFuncionarioController = class
  public
    constructor Create;
    destructor Destroy; override;
    function Alterar(aFuncionario: TFuncionario; var sErro: string): boolean;
    function Inserir(Funcionario: TFuncionario; var sErro: string): boolean;
    procedure CarregarFuncionario(aFuncionario: TFuncionario; iCodigo: Integer);
    function ExcluirFuncionario(iCodigo: Integer; var sErro: string): boolean;
    procedure PesquisarFuncionario(sNome: string);
  end;
implementation

{ TFuncionarioController }

{ TFuncionarioController }

function TFuncionarioController.Alterar(aFuncionario: TFuncionario; var sErro:
  string): boolean;
begin
  Result := DmFuncionario.Alterar(aFuncionario, sErro);
end;

procedure TFuncionarioController.CarregarFuncionario(aFuncionario: TFuncionario;
  iCodigo: Integer);
begin
  DmFuncionario.CarregarFuncionario(aFuncionario, iCodigo);
end;

constructor TFuncionarioController.Create;
begin

end;

destructor TFuncionarioController.Destroy;
begin

  inherited;
end;

function TFuncionarioController.ExcluirFuncionario(iCodigo: Integer; var sErro: string): boolean;
begin
Result := DmFuncionario.ExcluirFuncionario(iCodigo, sErro);
end;

function TFuncionarioController.Inserir(Funcionario: TFuncionario; var sErro: string):
  boolean;
begin
  Result := DmFuncionario.Inserir(Funcionario, sErro);
end;

procedure TFuncionarioController.PesquisarFuncionario(sNome: string);
begin
DmFuncionario.PesquisarFuncionario(sNome);
end;

end.

