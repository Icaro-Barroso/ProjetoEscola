object Escola: TEscola
  Left = 0
  Top = 0
  Caption = 'Escola'
  ClientHeight = 435
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
    Height = 394
    ActivePage = TbDados
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 160
    ExplicitTop = 216
    ExplicitWidth = 678
    ExplicitHeight = 321
    object TbPesquisar: TTabSheet
      Caption = 'tbPesquisar'
      ExplicitLeft = 8
      ExplicitTop = 22
      ExplicitWidth = 670
      ExplicitHeight = 252
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 740
        Height = 60
        Align = alTop
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 670
        object LabeledEdit1: TLabeledEdit
          Left = 8
          Top = 24
          Width = 281
          Height = 21
          EditLabel.Width = 101
          EditLabel.Height = 13
          EditLabel.Caption = 'Digite Para Pesquisar'
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
        Top = 325
        Width = 740
        Height = 41
        Align = alBottom
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        ExplicitLeft = 336
        ExplicitTop = 184
        ExplicitWidth = 185
        object btnNovo: TButton
          Left = 495
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
        end
        object btnExcluir: TButton
          Left = 657
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 1
        end
        object btnDetalhar: TButton
          Left = 576
          Top = 9
          Width = 75
          Height = 25
          Caption = 'Detalhar'
          TabOrder = 2
        end
      end
      object cxGrid1: TcxGrid
        Left = 0
        Top = 60
        Width = 740
        Height = 265
        Align = alClient
        TabOrder = 2
        ExplicitLeft = 216
        ExplicitTop = 240
        ExplicitWidth = 250
        ExplicitHeight = 200
        object cxGrid1DBTableView1: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
        end
        object cxGrid1Level1: TcxGridLevel
          GridView = cxGrid1DBTableView1
        end
      end
    end
    object TbDados: TTabSheet
      Caption = 'tbDados'
      ImageIndex = 1
      ExplicitWidth = 670
      ExplicitHeight = 293
      object Panel3: TPanel
        Left = 0
        Top = 325
        Width = 740
        Height = 41
        Align = alBottom
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        ExplicitLeft = 256
        ExplicitTop = 224
        ExplicitWidth = 185
        object Button2: TButton
          Left = 494
          Top = 11
          Width = 77
          Height = 25
          Caption = 'Alterar'
          TabOrder = 0
        end
        object Button4: TButton
          Left = 656
          Top = 11
          Width = 77
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 1
        end
        object Button3: TButton
          Left = 575
          Top = 11
          Width = 77
          Height = 25
          Caption = 'Gravar'
          TabOrder = 2
        end
        object Button1: TButton
          Left = 413
          Top = 11
          Width = 77
          Height = 25
          Caption = 'Listar'
          TabOrder = 3
        end
      end
      object LabeledEdit2: TLabeledEdit
        Left = 3
        Top = 32
        Width = 62
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo'
        TabOrder = 1
      end
      object LabeledEdit3: TLabeledEdit
        Left = 71
        Top = 32
        Width = 180
        Height = 21
        EditLabel.Width = 60
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome Escola'
        TabOrder = 2
      end
      object LabeledEdit4: TLabeledEdit
        Left = 3
        Top = 80
        Width = 121
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endereco'
        TabOrder = 3
      end
      object LabeledEdit5: TLabeledEdit
        Left = 130
        Top = 80
        Width = 121
        Height = 21
        EditLabel.Width = 22
        EditLabel.Height = 13
        EditLabel.Caption = 'Cnpj'
        TabOrder = 4
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 394
    Width = 748
    Height = 41
    Align = alBottom
    ParentBackground = False
    TabOrder = 1
    ExplicitLeft = 184
    ExplicitTop = 232
    ExplicitWidth = 185
    object btnFechar: TButton
      Left = 664
      Top = 6
      Width = 73
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
    end
  end
end
