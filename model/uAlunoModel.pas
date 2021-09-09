unit uAlunoModel;

interface

uses
  SysUtils, uClienteModel;

type
  TAluno = class
    FPESCOD: integer;
    FALNCOD: integer;
    FSRICOD: integer;
    FPESNOM: string;
    FPESEND: string;
    FPESIDT: string;
    FPESDOC: string;
  public
    property PESCOD: integer read FPESCOD write FPESCOD;
    property ALNCOD: integer read FALNCOD write FALNCOD;
    property SRICOD: integer read FSRICOD write FSRICOD;
    property PESNOM: string read FPESNOM write FPESNOM;
    property PESEND: string read FPESEND write FPESEND;
    property PESIDT : string read FPESIDT write FPESIDT;
    property PESDOC : string read FPESDOC write FPESDOC;
  end;

implementation

end.

