object NotaAluno: TNotaAluno
  Left = 0
  Top = 0
  Caption = 'Notas Aluno'
  ClientHeight = 375
  ClientWidth = 614
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 614
    Height = 375
    ActivePage = tbPesq
    Align = alClient
    TabOrder = 0
    ExplicitTop = -8
    object tbPesq: TTabSheet
      Caption = 'tbPesq'
      ExplicitWidth = 284
      ExplicitHeight = 210
      object Panel2: TPanel
        Left = 0
        Top = 296
        Width = 606
        Height = 51
        Align = alBottom
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object btnSelecionar: TButton
          Left = 464
          Top = 12
          Width = 99
          Height = 31
          Caption = 'Selecionar'
          TabOrder = 0
          OnClick = btnSelecionarClick
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 606
        Height = 73
        Align = alTop
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object edtPesquisar: TLabeledEdit
          Left = 16
          Top = 27
          Width = 265
          Height = 21
          EditLabel.Width = 101
          EditLabel.Height = 13
          EditLabel.Caption = 'Digite para Pesquisar'
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 464
          Top = 23
          Width = 99
          Height = 30
          Caption = 'Pesquisar'
          TabOrder = 1
        end
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 73
        Width = 606
        Height = 223
        Align = alClient
        TabOrder = 2
        ExplicitLeft = 128
        ExplicitTop = 90
        ExplicitWidth = 250
        ExplicitHeight = 200
        object cxNotas: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dscxgridNota
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsBehavior.ColumnHeaderHints = False
          OptionsCustomize.ColumnMoving = False
          OptionsView.GroupByBox = False
          object cxNotasALNCOD: TcxGridDBColumn
            DataBinding.FieldName = 'ALNCOD'
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
          object cxNotasPESNOM: TcxGridDBColumn
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
          object cxNotasALNNOTBI1: TcxGridDBColumn
            DataBinding.FieldName = 'ALNNOTBI1'
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
          object cxNotasALNNOTBI2: TcxGridDBColumn
            DataBinding.FieldName = 'ALNNOTBI2'
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
          object cxNotasALNNOTBI3: TcxGridDBColumn
            DataBinding.FieldName = 'ALNNOTBI3'
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
          object cxNotasALNNOTBI4: TcxGridDBColumn
            DataBinding.FieldName = 'ALNNOTBI4'
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
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxNotas
        end
      end
    end
    object tbDados: TTabSheet
      Caption = 'tbDados'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 28
      ExplicitWidth = 475
      ExplicitHeight = 264
      object edtCodigo: TLabeledEdit
        Left = 16
        Top = 32
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo'
        TabOrder = 0
      end
      object edtNotab1: TLabeledEdit
        Left = 16
        Top = 80
        Width = 121
        Height = 21
        EditLabel.Width = 76
        EditLabel.Height = 13
        EditLabel.Caption = 'Nota Bimestre 1'
        TabOrder = 1
      end
      object edtNome: TLabeledEdit
        Left = 152
        Top = 32
        Width = 121
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        TabOrder = 2
      end
      object edtNotabi2: TLabeledEdit
        Left = 152
        Top = 80
        Width = 121
        Height = 21
        EditLabel.Width = 76
        EditLabel.Height = 13
        EditLabel.Caption = 'Nota Bimestre 2'
        TabOrder = 3
      end
      object edtNotabi3: TLabeledEdit
        Left = 16
        Top = 120
        Width = 121
        Height = 21
        EditLabel.Width = 76
        EditLabel.Height = 13
        EditLabel.Caption = 'Nota Bimestre 3'
        TabOrder = 4
      end
      object edtNotabi4: TLabeledEdit
        Left = 152
        Top = 120
        Width = 121
        Height = 21
        EditLabel.Width = 76
        EditLabel.Height = 13
        EditLabel.Caption = 'Nota Bimestre 4'
        TabOrder = 5
      end
      object Panel3: TPanel
        Left = 0
        Top = 296
        Width = 606
        Height = 51
        Align = alBottom
        Color = clSilver
        ParentBackground = False
        TabOrder = 6
        object btnGravar: TButton
          Left = 512
          Top = 16
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 0
          OnClick = btnGravarClick
        end
      end
      object btnListar: TButton
        Left = 416
        Top = 312
        Width = 75
        Height = 25
        Caption = 'Listar'
        TabOrder = 7
        OnClick = btnListarClick
      end
    end
  end
  object dscxgridNota: TDataSource
    DataSet = DmAluno.cdsAluno
    Left = 344
    Top = 48
  end
end
