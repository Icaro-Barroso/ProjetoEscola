unit uNotaController;

interface


uses
uAlunoModel, uDmAluno;

type
  TNotaController = class
  Public
   function Inserir(Nota: TAluno; var sErro: string): boolean;
  end;


implementation

{ TNotaController }

function TNotaController.Inserir(Nota: TAluno; var sErro: string): boolean;
begin
Result := DmAluno.InserirNota(Nota, sErro);
end;

end.
