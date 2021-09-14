unit uAlunoModel;

interface

uses
  SysUtils, uClienteModel;

type

  TAluno = class
  private
    FCodigoAluno: integer;
    FCodigoPessoa: integer;
    FCodigoSerie: integer;
    FNomeAluno: string;
    FNomeEscola: string;
    FTipoAluno: string;
    FDocumentoAluno: string;
    FEnderecoAluno: string;
    FNotaBi1: string;
    FNotaBi2: string;
    FNotaBi3: string;
    FNotaBi4: string;
    procedure SetCodigoAluno(const Value: integer);
    procedure SetCodigoPessoa(const Value: integer);
    procedure SetCodigoSerie(const Value: integer);
    procedure SetNomeAluno(const Value: string);
    procedure SetNomeEscola(const Value: string);
    procedure SetTipoAluno(const Value: string);
    procedure SetDocumentoAluno(const Value: string);
    procedure SetEnderecoAluno(const Value: string);
    procedure SetNotaBi1(const Value: string);
    procedure SetNotaBi2(const Value: string);
    procedure SetNotaBi3(const Value: string);
    procedure SetNotaBi4(const Value: string);
  public
    property CodigoAluno: integer read FCodigoAluno write SetCodigoAluno;
    property CodigoPessoa: integer read FCodigoPessoa write SetCodigoPessoa;
    property CodigoSerie: integer read FCodigoSerie write SetCodigoSerie;
    property NomeAluno: string read FNomeAluno write SetNomeAluno;
    property NomeEscola: string read FNomeEscola write SetNomeEscola;
    property TipoAluno: string read FTipoAluno write SetTipoAluno;
    property DocumentoAluno: string read FDocumentoAluno write SetDocumentoAluno;
    property EnderecoAluno: string read FEnderecoAluno write SetEnderecoAluno;
    property Notabi1: string read FNotaBi1 write SetNotaBi1;
    property NotaBi2: string read FNotaBi2 write SetNotaBi2;
    property NotaBi3: string read FNotaBi3 write SetNotaBi3;
    property NotaBi4: string read FNotaBi4 write SetNotaBi4;
  end;

implementation

{ TAluno }

procedure TAluno.SetCodigoAluno(const Value: integer);
begin
  FCodigoAluno := Value;
end;

procedure TAluno.SetCodigoPessoa(const Value: integer);
begin
  FCodigoPessoa := Value;
end;

procedure TAluno.SetCodigoSerie(const Value: integer);
begin
  FCodigoSerie := Value;
end;

procedure TAluno.SetDocumentoAluno(const Value: string);
begin
  FDocumentoAluno := Value;
end;

procedure TAluno.SetEnderecoAluno(const Value: string);
begin
  FEnderecoAluno := Value;
end;

procedure TAluno.SetNomeAluno(const Value: string);
begin
  FNomeAluno := Value;
end;

procedure TAluno.SetNomeEscola(const Value: string);
begin
  FNomeEscola := Value;
end;

procedure TAluno.SetNotaBi1(const Value: string);
begin
  FNotaBi1 := Value;
end;

procedure TAluno.SetNotaBi2(const Value: string);
begin
  FNotaBi2 := Value;
end;

procedure TAluno.SetNotaBi3(const Value: string);
begin
  FNotaBi3 := Value;
end;

procedure TAluno.SetNotaBi4(const Value: string);
begin
  FNotaBi4 := Value;
end;

procedure TAluno.SetTipoAluno(const Value: string);
begin
   FTipoAluno := Value;
end;

end.

