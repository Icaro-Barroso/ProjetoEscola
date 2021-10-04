unit uEscolaController;

interface

uses
uEscolaModel, uDmEscola;

type
  TAlunoController = class
  public
    constructor Create;
    destructor Destroy; override;
    function Alterar(oEscola: TEscola; var sErro: string): boolean;
    function Inserir(Escola: TEscola; var sErro: string): boolean;
    procedure CarregarEscola(oEscola: TEscola; iCodigo: Integer);
    function ExcluirEscola(iCodigo: Integer; var sErro: string): boolean;
    procedure PesquisarEscola(sNome: string);
  end;


implementation

{ TAlunoController }



{ TAlunoController }

function TAlunoController.Alterar(oEscola: TEscola; var sErro: string): boolean;
begin
Result := DmEscola.Alterar(oEscola, sErro);
end;

procedure TAlunoController.CarregarEscola(oEscola: TEscola; iCodigo: Integer);
begin
DmEscola.CarregarEscola(oEscola, iCodigo);
end;

constructor TAlunoController.Create;
begin

end;

destructor TAlunoController.Destroy;
begin

  inherited;
end;

function TAlunoController.ExcluirEscola(iCodigo: Integer; var sErro: string): boolean;
begin
Result := DmEscola.ExcluirEscola(iCodigo, sErro);
end;

function TAlunoController.Inserir(Escola: TEscola; var sErro: string): boolean;
begin
 Result := DmEscola.Inserir(Escola, sErro);
end;

procedure TAlunoController.PesquisarEscola(sNome: string);
begin
DmEscola.PesquisarEscola(sNome);
end;

end.
