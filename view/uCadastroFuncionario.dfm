inherited CadastroFuncionario: TCadastroFuncionario
  Caption = 'Cadastro Funcionario'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited tbPesq: TTabSheet
      inherited cxGrid1: TcxGrid
        object cxGrid1DBTableView2: TcxGridDBTableView [0]
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsPesq
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid1DBTableView1: TcxGridDBTableView [1]
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsPesqFuncionario
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxGrid1DBTableView1FNCCOD: TcxGridDBColumn
            DataBinding.FieldName = 'FNCCOD'
          end
          object cxGrid1DBTableView1PESNOM: TcxGridDBColumn
            DataBinding.FieldName = 'PESNOM'
          end
          object cxGrid1DBTableView1PESCOD: TcxGridDBColumn
            DataBinding.FieldName = 'PESCOD'
          end
          object cxGrid1DBTableView1FNCSLR: TcxGridDBColumn
            DataBinding.FieldName = 'FNCSLR'
          end
          object cxGrid1DBTableView1FNCCRG: TcxGridDBColumn
            DataBinding.FieldName = 'FNCCRG'
          end
          object cxGrid1DBTableView1PESEND: TcxGridDBColumn
            DataBinding.FieldName = 'PESEND'
          end
          object cxGrid1DBTableView1PESDOC: TcxGridDBColumn
            DataBinding.FieldName = 'PESDOC'
          end
          object cxGrid1DBTableView1ESCNOM: TcxGridDBColumn
            DataBinding.FieldName = 'ESCNOM'
          end
          object cxGrid1DBTableView1PESIDT: TcxGridDBColumn
            DataBinding.FieldName = 'PESIDT'
          end
          object cxGrid1DBTableView1ESPTIP: TcxGridDBColumn
            DataBinding.FieldName = 'ESPTIP'
          end
          object cxGrid1DBTableView1ESCCOD: TcxGridDBColumn
            DataBinding.FieldName = 'ESCCOD'
          end
        end
        inherited cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    inherited tbDados: TTabSheet
      inherited edtCodigoEscola: TLabeledEdit
        Left = 676
        Top = 128
        Width = 92
        EditLabel.ExplicitLeft = 676
        EditLabel.ExplicitTop = 112
        EditLabel.ExplicitWidth = 30
        ExplicitLeft = 676
        ExplicitTop = 128
        ExplicitWidth = 92
      end
      object edCodigoFuncionario: TLabeledEdit
        Left = 55
        Top = 16
        Width = 98
        Height = 21
        EditLabel.Width = 91
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo Funcionario'
        TabOrder = 7
      end
      object edSalario: TLabeledEdit
        Left = 0
        Top = 136
        Width = 76
        Height = 21
        EditLabel.Width = 32
        EditLabel.Height = 13
        EditLabel.Caption = 'Salario'
        TabOrder = 8
      end
      object edCargo: TLabeledEdit
        Left = 96
        Top = 136
        Width = 81
        Height = 21
        EditLabel.Width = 29
        EditLabel.Height = 13
        EditLabel.Caption = 'Cargo'
        TabOrder = 9
      end
      object edEspecialidade: TLabeledEdit
        Left = 200
        Top = 136
        Width = 153
        Height = 21
        EditLabel.Width = 64
        EditLabel.Height = 13
        EditLabel.Caption = 'Especialidade'
        TabOrder = 10
      end
    end
  end
  inherited dsPesq: TDataSource
    DataSet = DmFuncionario.cdsFuncionario
  end
  object dsPesqFuncionario: TDataSource
    DataSet = DmFuncionario.cdsFuncionario
    Left = 472
    Top = 40
  end
end
