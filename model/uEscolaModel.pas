unit uEscolaModel;

interface
uses
  SysUtils;

type
  TEscola = class
    FESCCOD: integer;
    FESCNOM: string;
    FESCEND: string;
    FESCCNJ: string;
  public
    property ESCCOD: integer read FESCCOD write FESCCOD;
    property ESCNOM: string read FESCNOM write FESCNOM;
    property ESCEND: string read FESCEND write FESCEND;
    property ESCCNJ: string read FESCCNJ write FESCCNJ;
  end;
implementation

end.
