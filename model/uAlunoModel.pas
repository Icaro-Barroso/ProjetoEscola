unit uAlunoModel;

interface

uses
  SysUtils;

type
  TAluno = class
    FPESCOD: integer;
    FALNCOD: integer;
    FALNTRM: string;
    FSRICOD: integer;
  public
    property PESCOD: integer read FPESCOD write FPESCOD;
    property ALNCOD: integer read FALNCOD write FALNCOD;
    property ALNTRM: string read FALNTRM write FALNTRM;
    property SRICOD: string read FSRICOD write FSRICOD;

  end;

implementation

end.

