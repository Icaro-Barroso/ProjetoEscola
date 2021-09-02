unit uPesquisar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids, DBGrids;

type
  TForm2 = class(TForm)
    pnlPesquisar: TPanel;
    edtPesquisar: TLabeledEdit;
    pnlBtnPesquisa: TPanel;
    btnNovo: TButton;
    btnExcluir: TButton;
    DBGrid1: TDBGrid;
    btnPesquisar: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

end.
