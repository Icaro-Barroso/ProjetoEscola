unit uAlunoController;

interface

uses
  uAlunoModel, uDmAluno, uPessoaController;

type
  TAlunoController = class
  public
    constructor Create;
    destructor Destroy; override;
     function Alterar(oAluno: TAluno; var sErro: string): boolean;
    function Inserir(Aluno: TAluno; var sErro: string): boolean;
    procedure CarregarAluno(oAluno: TAluno; iCodigo: Integer);

    //    constructor Create;
    //    destructor Destroy; override;
  end;
implementation

{ TAlunoController }

//function TAlunoController.Inserir(Aluno: TAluno; var sErro: string):
//  boolean;
//begin
//  Result := DataModule1.Inserir(Aluno, sErro);
//end;

{ TAlunoController }

function TAlunoController.Alterar(oAluno: TAluno; var sErro: string): boolean;
begin
 Result := DmAluno.Alterar(oAluno, sErro);
end;

procedure TAlunoController.CarregarAluno(oAluno: TAluno; iCodigo: Integer);
begin
DmAluno.CarregarAluno(oAluno, iCodigo);
end;

constructor TAlunoController.Create;
begin
// DmAluno := TDmAluno.Create(nil);
end;

destructor TAlunoController.Destroy;
begin
inherited;

end;
//FUNCAO CARREGAR PESSOA (DMALUNO.CARREGAR(ALUNO, CODIGODELE)
function TAlunoController.Inserir(Aluno: TAluno; var sErro: string): boolean;
begin
 Result := DmAluno.Inserir(Aluno, sErro);
end;

end.


