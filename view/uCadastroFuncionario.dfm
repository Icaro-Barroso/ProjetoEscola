inherited CadastroFuncionario: TCadastroFuncionario
  Caption = 'Cadastro Funcionario'
  ExplicitWidth = 694
  ExplicitHeight = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = tbDados
    inherited tbPesq: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 670
      ExplicitHeight = 364
      inherited pnlFiltro: TPanel
        inherited edtPesquisar: TLabeledEdit
          Height = 19
          Ctl3D = False
          ParentCtl3D = False
          ExplicitHeight = 19
        end
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
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          object cxGridFuncionarioFNCCOD: TcxGridDBColumn
            Caption = 'Codigo'
            DataBinding.FieldName = 'FNCCOD'
            MinWidth = 64
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringAddValueItems = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.FilteringWithFindPanel = False
            Options.Focusing = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.GroupFooters = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
          end
          object cxGridFuncionarioPESNOM: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'PESNOM'
            MinWidth = 244
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringAddValueItems = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.FilteringWithFindPanel = False
            Options.Focusing = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
          end
          object cxGridFuncionarioFNCSLR: TcxGridDBColumn
            Caption = 'Salario'
            DataBinding.FieldName = 'FNCSLR'
            MinWidth = 64
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringAddValueItems = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.FilteringWithFindPanel = False
            Options.Focusing = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
          end
          object cxGridFuncionarioFNCCRG: TcxGridDBColumn
            Caption = 'Cargo'
            DataBinding.FieldName = 'FNCCRG'
            MinWidth = 244
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringAddValueItems = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.FilteringWithFindPanel = False
            Options.Focusing = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
          end
          object cxGridFuncionarioPESEND: TcxGridDBColumn
            Caption = 'Endere'#231'o'
            DataBinding.FieldName = 'PESEND'
            MinWidth = 244
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringAddValueItems = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.FilteringWithFindPanel = False
            Options.Focusing = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
          end
          object cxGridFuncionarioPESDOC: TcxGridDBColumn
            Caption = 'Documento'
            DataBinding.FieldName = 'PESDOC'
            MinWidth = 244
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringAddValueItems = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringPopupMultiSelect = False
            Options.FilteringWithFindPanel = False
            Options.Focusing = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
          end
        end
        inherited cxGrid1Level1: TcxGridLevel
          GridView = cxGridFuncionario
        end
      end
    end
    inherited tbDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 670
      ExplicitHeight = 364
      inherited edtCodigo: TLabeledEdit
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        ExplicitHeight = 19
      end
      inherited edtNome: TLabeledEdit
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 2
        ExplicitHeight = 19
      end
      inherited edtDocumento: TLabeledEdit
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
        ExplicitHeight = 19
      end
      inherited cbxTipo: TComboBox
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 3
      end
      inherited edtEndereco: TLabeledEdit
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        ExplicitHeight = 19
      end
      inherited pnlBtnsCad: TPanel
        TabOrder = 9
      end
      inherited edtCodigoEscola: TLabeledEdit
        Left = 676
        Top = 128
        Width = 92
        EditLabel.ExplicitLeft = 676
        EditLabel.ExplicitTop = 112
        EditLabel.ExplicitWidth = 30
        TabOrder = 10
        ExplicitLeft = 676
        ExplicitTop = 128
        ExplicitWidth = 92
      end
      object edCodigoFuncionario: TLabeledEdit
        Left = 55
        Top = 16
        Width = 98
        Height = 19
        Ctl3D = False
        EditLabel.Width = 91
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo Funcionario'
        ParentCtl3D = False
        TabOrder = 1
      end
      object edSalario: TLabeledEdit
        Left = 0
        Top = 136
        Width = 76
        Height = 19
        Ctl3D = False
        EditLabel.Width = 32
        EditLabel.Height = 13
        EditLabel.Caption = 'Salario'
        ParentCtl3D = False
        TabOrder = 6
      end
      object edCargo: TLabeledEdit
        Left = 96
        Top = 136
        Width = 81
        Height = 19
        Ctl3D = False
        EditLabel.Width = 29
        EditLabel.Height = 13
        EditLabel.Caption = 'Cargo'
        ParentCtl3D = False
        TabOrder = 7
      end
      object edEspecialidade: TLabeledEdit
        Left = 200
        Top = 136
        Width = 153
        Height = 19
        Ctl3D = False
        EditLabel.Width = 64
        EditLabel.Height = 13
        EditLabel.Caption = 'Especialidade'
        ParentCtl3D = False
        TabOrder = 8
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
