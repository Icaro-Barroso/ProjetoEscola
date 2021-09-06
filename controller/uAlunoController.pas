unit uAlunoController;

interface

uses
  uAlunoModel, uDmCliente, SysUtils;

type
  TAlunoController = class
  public
  Constructor Create;
  Destructor Destroy; Override;
  Procedure Pesquisar(sNome: String);
    procedure CarregarAluno(oAluno: TAluno; iCodigo: Integer);
    function Inserir(oAluno: TAluno; var sErro: string): boolean;
    function Alterar(oAluno: TAluno; var sErro: string): boolean;
    function Excluir(iCodigo: Integer; var sErro: string): boolean;
  end;
implementation

{ TClienteController }

{ TClienteController }

function TAlunoController.Alterar(oAluno: TAluno;
  var sErro: string): boolean;
begin
  Result := DataModule1.Alterar(oAluno, sErro);
end;

procedure TAlunoController.CarregarAluno(oCliente: TAluno;
  iCodigo: Integer);
begin
  DataModule1.CarregarAluno(oAluno, iCodigo);
end;

constructor TAlunoController.Create;
begin
//DataModule1 := TDataModule1.Create(nil);
end;

destructor TAlunoController.Destroy;
begin
  //FreeAndNil(DataModule1);
  inherited;
end;

function TAlunoController.Excluir(iCodigo: Integer;
  var sErro: string): boolean;
begin
  Result := DataModule1.Excluir(iCodigo, sErro);
end;

function TAlunoController.Inserir(oAluno: TAluno; var sErro: string):
  boolean;
begin
  Result := DataModule1.Inserir(oAluno, sErro);
end;

procedure TAlunoController.Pesquisar(sNome: String);
begin
  DataModule1.Pesquisar(sNome);
end;

end.

