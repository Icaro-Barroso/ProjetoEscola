unit uCadastroAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastro, DB, StdCtrls, Grids, DBGrids, ExtCtrls, ComCtrls,
  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridCustomView,
  cxClasses, cxGridLevel, cxGrid, uAlunoModel, uAlunoController, uDmCliente;

type
  TCadastroAluno = class(TCadastro)
    LabeledEdit1: TLabeledEdit;
    LabeledEdit2: TLabeledEdit;
    LabeledEdit3: TLabeledEdit;
    cxAlunos: TcxGridDBTableView;
    cxAlunosCodigo: TcxGridDBColumn;
    cxAlunosNome: TcxGridDBColumn;
    cxAlunosDocumento: TcxGridDBColumn;
    teste: TDataSource;
  private
  protected
    procedure Gravar; override;
    //procedure CarregarAluno;
  public
    { Public declarations }
  end;


implementation

{$R *.dfm}

{ TCadastroAluno }



{ TCadastroAluno }

procedure TCadastroAluno.Gravar;
begin
  inherited;

end;

end.

