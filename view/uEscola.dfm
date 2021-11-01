object CadastroEscola: TCadastroEscola
  Left = 0
  Top = 0
  Caption = 'Cadastro Escola'
  ClientHeight = 441
  ClientWidth = 748
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
    Width = 748
    Height = 400
    ActivePage = TbPesquisar
    Align = alClient
    TabOrder = 0
    object TbPesquisar: TTabSheet
      Caption = 'tbPesquisar'
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 24
      ExplicitWidth = 0
      ExplicitHeight = 366
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 740
        Height = 60
        Align = alTop
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object LabeledEdit1: TLabeledEdit
          Left = 8
          Top = 33
          Width = 281
          Height = 19
          Ctl3D = False
          EditLabel.Width = 101
          EditLabel.Height = 13
          EditLabel.Caption = 'Digite Para Pesquisar'
          ParentCtl3D = False
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 610
          Top = 22
          Width = 81
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 349
        Width = 740
        Height = 41
        Align = alBottom
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 96
        ExplicitTop = 329
        object btnNovo: TButton
          Left = 495
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnExcluir: TButton
          Left = 657
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 1
          OnClick = btnExcluirClick
        end
        object btnDetalhar: TButton
          Left = 576
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Detalhar'
          TabOrder = 2
          OnClick = btnDetalharClick
        end
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 60
        Width = 740
        Height = 289
        Align = alClient
        TabOrder = 2
        ExplicitHeight = 265
        object cxEscola: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = DsCxgridEscola
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnGrouping = False
          OptionsCustomize.ColumnMoving = False
          OptionsView.GroupByBox = False
          object cxEscolaESCCOD: TcxGridDBColumn
            Caption = 'Codigo'
            DataBinding.FieldName = 'ESCCOD'
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
          object cxEscolaESCNOM: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'ESCNOM'
            MinWidth = 205
            Options.Editing = False
            Options.Filtering = False
            Options.FilteringAddValueItems = False
            Options.FilteringFilteredItemsList = False
            Options.FilteringMRUItemsList = False
            Options.FilteringPopup = False
            Options.FilteringWithFindPanel = False
            Options.Focusing = False
            Options.IgnoreTimeForFiltering = False
            Options.IncSearch = False
            Options.GroupFooters = False
            Options.Grouping = False
            Options.HorzSizing = False
            Options.Moving = False
            Options.Sorting = False
            Width = 205
          end
          object cxEscolaESCEND: TcxGridDBColumn
            Caption = 'Endere'#231'o'
            DataBinding.FieldName = 'ESCEND'
            MinWidth = 257
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
            Width = 257
          end
          object cxEscolaESCCNJ: TcxGridDBColumn
            Caption = 'Cnpj'
            DataBinding.FieldName = 'ESCCNJ'
            MinWidth = 168
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
            Width = 168
          end
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxEscola
        end
      end
    end
    object TbDados: TTabSheet
      Caption = 'tbDados'
      ImageIndex = 1
      TabVisible = False
      ExplicitLeft = 0
      ExplicitTop = 24
      ExplicitWidth = 0
      ExplicitHeight = 366
      object Panel3: TPanel
        Left = 0
        Top = 349
        Width = 740
        Height = 41
        Align = alBottom
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        ExplicitTop = 323
        object btnAlterar: TButton
          Left = 494
          Top = 11
          Width = 77
          Height = 25
          Caption = 'Alterar'
          TabOrder = 0
          OnClick = btnAlterarClick
        end
        object btnCancelar: TButton
          Left = 658
          Top = 11
          Width = 77
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = btnCancelarClick
        end
        object btnGravar: TButton
          Left = 575
          Top = 11
          Width = 77
          Height = 25
          Caption = 'Gravar'
          TabOrder = 2
          OnClick = btnGravarClick
        end
        object btnListar: TButton
          Left = 413
          Top = 11
          Width = 77
          Height = 25
          Caption = 'Listar'
          TabOrder = 3
          OnClick = btnListarClick
        end
      end
      object edtCodigoEscola: TLabeledEdit
        Left = 3
        Top = 32
        Width = 62
        Height = 19
        Ctl3D = False
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo'
        ParentCtl3D = False
        TabOrder = 1
      end
      object edtNomeEscola: TLabeledEdit
        Left = 71
        Top = 32
        Width = 180
        Height = 19
        Ctl3D = False
        EditLabel.Width = 60
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome Escola'
        ParentCtl3D = False
        TabOrder = 2
      end
      object edtEndereco: TLabeledEdit
        Left = 3
        Top = 80
        Width = 121
        Height = 19
        Ctl3D = False
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endereco'
        ParentCtl3D = False
        TabOrder = 3
      end
      object edtCnpj: TLabeledEdit
        Left = 130
        Top = 80
        Width = 121
        Height = 19
        Ctl3D = False
        EditLabel.Width = 22
        EditLabel.Height = 13
        EditLabel.Caption = 'Cnpj'
        ParentCtl3D = False
        TabOrder = 4
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 400
    Width = 748
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    ExplicitTop = 394
    object btnFechar: TButton
      Left = 663
      Top = 6
      Width = 73
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object DsCxgridEscola: TDataSource
    DataSet = DmEscola.cdsEscola
    Left = 456
    Top = 48
  end
end
