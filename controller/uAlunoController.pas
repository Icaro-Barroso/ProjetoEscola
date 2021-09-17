unit uAlunoController;

interface

uses
  uAlunoModel, uDmAluno, uPessoaController;

type
  TAlunoController = class
  public
    constructor Create;
    destructor Destroy; override;
    //function Inserir(Aluno: TAluno; var sErro: string): boolean; override;

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

constructor TAlunoController.Create;
begin
// DmAluno := TDmAluno.Create(nil);
end;

destructor TAlunoController.Destroy;
begin
inherited;

end;

end.


