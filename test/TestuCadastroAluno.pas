unit TestuCadastroAluno;
interface

uses
  TestFramework, Windows, uPessoaController, cxLookAndFeels, DB, cxLookAndFeelPainters,
  cxGridTableView, cxDataStorage, Messages, cxClasses, DBCtrls, cxControls, Dialogs, 
  Controls, cxGridCustomTableView, uAlunoController, uAlunoModel, Grids, Classes,
  uCadastro, cxGridCustomView, cxEdit, cxFilter, cxCustomData, cxDBData, 
  cxGridDBTableView, SysUtils, cxData, Forms, ExtCtrls, StdCtrls, cxGrid, Mask, DBGrids, 
  uDmAluno, ComCtrls, cxNavigator, cxGridLevel, uPessoaModel, Graphics, cxStyles, Variants, 
  uCadastroAluno, cxGraphics;

type
  // Test methods for class TCadastroAluno
  
  TestTCadastroAluno = class(TTestCase)
  strict private
    FCadastroAluno: TCadastroAluno;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestFormCreate;
    procedure TestFormDestroy;
    procedure TestFormShow;
    procedure TestGravar;
    procedure TestInserir;
    procedure TestAlterar;
    procedure TestCarregarPessoa;
    procedure TestHabilitarControles;
  end;

implementation

procedure TestTCadastroAluno.SetUp;
begin
  FCadastroAluno := TCadastroAluno.Create(nil);
end;

procedure TestTCadastroAluno.TearDown;
begin
  FCadastroAluno.Free;
  FCadastroAluno := nil;
end;


initialization
  // Register any test cases with the test runner
  RegisterTest(TestTCadastroAluno.Suite);
end.

