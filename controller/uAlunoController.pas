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
    function ExcluirAluno(iCodigo: Integer; var sErro: string): boolean;
    procedure PesquisarAluno(sNome: string);

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
end;

destructor TAlunoController.Destroy;
begin
inherited;
end;

function TAlunoController.ExcluirAluno(iCodigo: Integer; var sErro: string): boolean;
begin
Result := DmAluno.ExcluirAluno(iCodigo, sErro);
end;

function TAlunoController.Inserir(Aluno: TAluno; var sErro: string): boolean;
begin
 Result := DmAluno.Inserir(Aluno, sErro);
end;

procedure TAlunoController.PesquisarAluno(sNome: string);
begin
DmAluno.PesquisarAluno(sNome);
end;

end.


