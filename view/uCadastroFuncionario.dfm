inherited Cadastro1: TCadastro1
  Caption = 'Cadastro1'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited tbPesq: TTabSheet
      inherited DBGridPesquisa: TDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'PESCOD'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESNOM'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESDOC'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESEND'
            Width = 64
            Visible = True
          end>
      end
    end
    inherited tbDados: TTabSheet
      object LabeledEdit1: TLabeledEdit
        Left = 0
        Top = 144
        Width = 121
        Height = 21
        EditLabel.Width = 61
        EditLabel.Height = 13
        EditLabel.Caption = 'LabeledEdit1'
        TabOrder = 7
      end
    end
  end
end
