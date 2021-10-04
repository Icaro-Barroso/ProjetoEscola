unit uFuncionarioModel;

interface

uses
  SysUtils, uPessoaModel;

type
  TFuncionario = class
    FCodigoFuncionario: integer;
    FCodigoPessoa: integer;
    FFuncionarioSalario: string;
    FFuncionarioCargo: string;
    FCodigoEspecialidade: Integer;
    FNomeFuncionario: string;
    FEnderecoFuncionario: string;
    FDocumentoFuncionario: string;
    procedure SetCodigoFuncionario(const Value: integer);
    procedure SetCodigoPessoa(const Value: integer);
    procedure SetFuncionarioSalario(const Value: string);
    procedure SetFuncionarioCargo(const Value: string);
    procedure SetEnderecoFuncionario(const Value: string);
    procedure SetCodigoEspecialidade(const Value: Integer);
    procedure SetNomeFuncionario(const Value: string);
    procedure SetDocumentoFuncionario(const Value: string);
  public
    property CodigoFuncionario: integer read FCodigoFuncionario write
      SetCodigoFuncionario;
    property CodigoPessoa: integer read FCodigoPessoa write SetCodigoPessoa;
    property FuncionarioSalario: string read FFuncionarioSalario write
      SetFuncionarioSalario;
    property FuncionarioCargo: string read FFuncionarioCargo write
      SetFuncionarioCargo;
    property CodigoEspecialidade: integer read FCodigoEspecialidade write
      SetCodigoEspecialidade;
    property NomeFuncionario: string read FNomeFuncionario write
      SetNomeFuncionario;
    property EnderecoFuncionario: string read FEnderecoFuncionario write
      SetEnderecoFuncionario;
    property DocumentoFuncionario: string read FDocumentoFuncionario write
      SetDocumentoFuncionario;

  end;

implementation

{ TFuncionario }



procedure TFuncionario.SetCodigoEspecialidade(const Value: Integer);
begin
  FCodigoEspecialidade := Value;
end;

procedure TFuncionario.SetCodigoFuncionario(const Value: integer);
begin
  FCodigoFuncionario := Value;
end;

procedure TFuncionario.SetCodigoPessoa(const Value: integer);
begin
  FCodigoPessoa := Value;
end;

procedure TFuncionario.SetDocumentoFuncionario(const Value: string);
begin
  FDocumentoFuncionario := Value;
end;

procedure TFuncionario.SetEnderecoFuncionario(const Value: string);
begin
  FEnderecoFuncionario := Value;
end;

procedure TFuncionario.SetFuncionarioCargo(const Value: string);
begin
  FFuncionarioCargo := Value;
end;

procedure TFuncionario.SetFuncionarioSalario(const Value: string);
begin
  FFuncionarioSalario := Value;
end;

procedure TFuncionario.SetNomeFuncionario(const Value: string);
begin
  FNomeFuncionario := Value;
end;

end.

