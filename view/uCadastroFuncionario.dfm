inherited CadastroFuncionario: TCadastroFuncionario
  Caption = 'Cadastro Funcionario'
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESEND'
            Visible = True
          end>
      end
      inherited cxGrid1: TcxGrid
        object cxGrid1DBTableView2: TcxGridDBTableView [0]
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsPesq
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGridFuncionario: TcxGridDBTableView [1]
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsPesqFuncionario
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          object cxGridFuncionarioFNCCOD: TcxGridDBColumn
            DataBinding.FieldName = 'FNCCOD'
          end
          object cxGridFuncionarioPESNOM: TcxGridDBColumn
            DataBinding.FieldName = 'PESNOM'
          end
          object cxGridFuncionarioPESCOD: TcxGridDBColumn
            DataBinding.FieldName = 'PESCOD'
          end
          object cxGridFuncionarioFNCSLR: TcxGridDBColumn
            DataBinding.FieldName = 'FNCSLR'
          end
          object cxGridFuncionarioFNCCRG: TcxGridDBColumn
            DataBinding.FieldName = 'FNCCRG'
          end
          object cxGridFuncionarioPESEND: TcxGridDBColumn
            DataBinding.FieldName = 'PESEND'
          end
          object cxGridFuncionarioPESDOC: TcxGridDBColumn
            DataBinding.FieldName = 'PESDOC'
          end
          object cxGridFuncionarioESCNOM: TcxGridDBColumn
            DataBinding.FieldName = 'ESCNOM'
          end
          object cxGridFuncionarioPESIDT: TcxGridDBColumn
            DataBinding.FieldName = 'PESIDT'
          end
          object cxGridFuncionarioESPTIP: TcxGridDBColumn
            DataBinding.FieldName = 'ESPTIP'
          end
          object cxGridFuncionarioESCCOD: TcxGridDBColumn
            DataBinding.FieldName = 'ESCCOD'
          end
        end
        inherited cxGrid1Level1: TcxGridLevel
          GridView = cxGridFuncionario
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
