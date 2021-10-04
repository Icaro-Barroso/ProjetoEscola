unit uEscolaModel;

interface
uses
  SysUtils;

type
  TEscola = class
    FEscolaCodigo: integer;
    FEscolaNome: string;
    FEscolaEndereco: string;
    FEscolaCNPJ: string;
    procedure SetCodigoEscola(const Value: integer);
    procedure SetEscolaNome(const Value: string);
    procedure SetEscolaEndereco(const Value: string);
    procedure SetEscolaCNPJ(const Value: string);
  public
    property EscolaCodigo: integer read FEscolaCodigo write FEscolaCodigo;
    property EscolaNome: string read FEscolaNome write FEscolaNome;
    property EscolaEndereco: string read FEscolaEndereco write FEscolaEndereco;
    property EscolaCnpj: string read FEscolaCNPJ write FEscolaCNPJ;
  end;
implementation

{ TEscola }

procedure TEscola.SetCodigoEscola(const Value: integer);
begin
FEscolaCodigo := Value;
end;

procedure TEscola.SetEscolaCNPJ(const Value: string);
begin
FEscolaCNPJ := Value;
end;

procedure TEscola.SetEscolaEndereco(const Value: string);
begin
FEscolaEndereco := Value;
end;

procedure TEscola.SetEscolaNome(const Value: string);
begin
FEscolaNome := Value;
end;

end.
