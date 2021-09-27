unit uCadastroFuncionario;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uCadastro, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, DB, StdCtrls, cxClasses,
  cxGridLevel, cxGrid, Grids, DBGrids, ExtCtrls, ComCtrls;

type
  TCadastro1 = class(TCadastro)
    LabeledEdit1: TLabeledEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Cadastro1: TCadastro1;

implementation

{$R *.dfm}

end.
