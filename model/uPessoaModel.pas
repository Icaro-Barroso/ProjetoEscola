unit uPessoaModel;

interface

Uses
 SysUtils;


type
  TPessoa = class
  private
    FDocumento: string;
    FID: integer;
    FEscolaCodigo: integer;
    FNome: string;
    FTipo: string;
    FEndereco: string;
    procedure SetNome(const Value: string);
   Public
    property ID: integer read FID write FID;
    property CodigoEscola: integer read FEscolaCodigo write FEscolaCodigo;
    property Nome: string read FNome write SetNome;
    property Tipo : string read FTipo write FTipo;
    property Documento : string read FDocumento write FDocumento;
    property Endereco : string read FEndereco write FEndereco;

  end;

implementation

{ TCliente }

{ TCliente }

procedure TPessoa.SetNome(const Value: string);
begin
  //if Value = EmptyStr then
  //Raise Exception.Create('Erro');
  FNome := Value;
end;

end.

