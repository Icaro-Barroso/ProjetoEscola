unit uFrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Menus, StdCtrls,
  cxButtons, RLReport, uCadastro;

type
  TfrmPrincipal = class(TForm)
    lbProjetoEscola: TRLLabel;
    btEntrar: TButton;
    MainMenu1: TMainMenu;
    Cadastrar1: TMenuItem;
    Cadastrar2: TMenuItem;
    Pessoa1: TMenuItem;
    Escola1: TMenuItem;
    procedure btEntrarClick(Sender: TObject);
  private
    procedure AbrirCliente;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AbrirCliente;
begin
  Cadastro := TCadastro.Create(nil);
  try
    Cadastro.ShowModal;
  finally
    FreeAndNil(Cadastro);
  end;
end;

procedure TfrmPrincipal.btEntrarClick(Sender: TObject);
begin
  AbrirCliente;
end;

end.

