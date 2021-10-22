inherited CadastroAluno: TCadastroAluno
  Caption = 'Cadastro Aluno'
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
        object cxAlunos: TcxGridDBTableView [0]
          Navigator.Buttons.CustomButtons = <>
          DataController.DataModeController.SmartRefresh = True
          DataController.DataSource = dsCxgridAluno
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsView.NoDataToDisplayInfoText = '<Nenhum aluno listado>'
          OptionsView.GroupByBox = False
          object cxAlunosALNCOD: TcxGridDBColumn
            Caption = 'Codigo'
            DataBinding.FieldName = 'ALNCOD'
            MinWidth = 57
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
            Width = 57
          end
          object cxAlunosPESNOM: TcxGridDBColumn
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
          object cxAlunosPESDOC: TcxGridDBColumn
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
          object cxAlunosPESEND: TcxGridDBColumn
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
        end
        inherited cxGrid1Level1: TcxGridLevel
          GridView = cxAlunos
        end
      end
    end
    inherited tbDados: TTabSheet
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
        TabOrder = 3
        ExplicitHeight = 19
      end
      inherited edtDocumento: TLabeledEdit
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        ExplicitHeight = 19
      end
      inherited cbxTipo: TComboBox
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 4
      end
      inherited edtEndereco: TLabeledEdit
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 6
        ExplicitHeight = 19
      end
      inherited pnlBtnsCad: TPanel
        TabOrder = 8
      end
      inherited edtCodigoEscola: TLabeledEdit
        Left = 152
        Width = 201
        Height = 19
        Ctl3D = False
        EditLabel.ExplicitLeft = 152
        EditLabel.ExplicitTop = 0
        EditLabel.ExplicitWidth = 30
        ParentCtl3D = False
        TabOrder = 2
        ExplicitLeft = 152
        ExplicitWidth = 201
        ExplicitHeight = 19
      end
      object edCodigoAluno: TLabeledEdit
        Left = 64
        Top = 16
        Width = 65
        Height = 19
        Ctl3D = False
        EditLabel.Width = 63
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo Aluno'
        ParentCtl3D = False
        TabOrder = 1
      end
      object edSerie: TLabeledEdit
        Left = 3
        Top = 144
        Width = 46
        Height = 19
        Ctl3D = False
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Serie'
        ParentCtl3D = False
        TabOrder = 7
      end
    end
  end
  inherited dsPesq: TDataSource
    Top = 48
  end
  object dsCxgridAluno: TDataSource
    DataSet = DmAluno.cdsAluno
    Left = 464
    Top = 48
  end
  object DataSource2: TDataSource
    DataSet = DmAluno.cdsAluno
    Left = 464
    Top = 104
  end
  object DataSource1: TDataSource
    DataSet = DataModulePessoa.cdsPesquisar
    Left = 520
    Top = 48
  end
end
