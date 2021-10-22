unit uEscolaController;

interface

uses
uEscolaModel, uDmEscola;

type
  TEscolaController = class
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

{ TEscolaController }



{ TEscolaController }

function TEscolaController.Alterar(oEscola: TEscola; var sErro: string): boolean;
begin
Result := DmEscola.Alterar(oEscola, sErro);
end;

procedure TEscolaController.CarregarEscola(oEscola: TEscola; iCodigo: Integer);
begin
DmEscola.CarregarEscola(oEscola, iCodigo);
end;

constructor TEscolaController.Create;
begin

end;

destructor TEscolaController.Destroy;
begin

  inherited;
end;

function TEscolaController.ExcluirEscola(iCodigo: Integer; var sErro: string): boolean;
begin
Result := DmEscola.ExcluirEscola(iCodigo, sErro);
end;

function TEscolaController.Inserir(Escola: TEscola; var sErro: string): boolean;
begin
 Result := DmEscola.Inserir(Escola, sErro);
end;

procedure TEscolaController.PesquisarEscola(sNome: string);
begin
DmEscola.PesquisarEscola(sNome);
end;

end.
