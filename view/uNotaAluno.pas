unit uNotaAluno;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TNotaAluno = class(TForm)
    edtCodigoAluno: TLabeledEdit;
    edtNomeAluno: TLabeledEdit;
    edtNotaBi1: TLabeledEdit;
    edtNotabi2: TLabeledEdit;
    edtNotaBi3: TLabeledEdit;
    edtNotaBi4: TLabeledEdit;
    Panel1: TPanel;
    procedure edtNotaBi1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  NotaAluno: TNotaAluno;

implementation

{$R *.dfm}


end.
