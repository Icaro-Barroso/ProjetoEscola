unit untestetetetetetete;

interface
uses
  uAlunoModel;
type
  TAuxiliarAluno = class
  private
    class procedure Gravar(var ACodigo: string; const );
  public
    class function Novo(const ANome = 'ICARO'; const ACodigoEscola, ACodigoPessoa, ACodigoSerie, AEndereco, ADocumento, ATipo: string): string;
  end;
implementation

end.
