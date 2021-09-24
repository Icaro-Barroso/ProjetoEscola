object Cadastro: TCadastro
  Left = 0
  Top = 0
  Caption = 'Cadastro'
  ClientHeight = 433
  ClientWidth = 678
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 678
    Height = 392
    ActivePage = tbDados
    Align = alClient
    TabOrder = 0
    object tbPesq: TTabSheet
      Caption = 'tbPesq'
      object pnlFiltro: TPanel
        Left = 0
        Top = 0
        Width = 670
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 0
        object edtPesquisar: TLabeledEdit
          Left = 8
          Top = 24
          Width = 281
          Height = 21
          EditLabel.Width = 101
          EditLabel.Height = 13
          EditLabel.Caption = 'Digite para pesquisar'
          TabOrder = 0
        end
        object btnPesquisar: TButton
          Left = 540
          Top = 21
          Width = 75
          Height = 25
          Caption = 'Pesquisar'
          TabOrder = 1
          OnClick = btnPesquisarClick
        end
      end
      object pnlBtnsPesq: TPanel
        Left = 0
        Top = 323
        Width = 670
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 1
        object btnNovo: TButton
          Left = 378
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Novo'
          TabOrder = 0
          OnClick = btnNovoClick
        end
        object btnDetalhar: TButton
          Left = 459
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Detalhar'
          TabOrder = 1
          OnClick = btnDetalharClick
        end
        object btnExcluir: TButton
          Left = 540
          Top = 8
          Width = 75
          Height = 25
          Caption = 'Excluir'
          TabOrder = 2
          OnClick = btnExcluirClick
        end
      end
      object DBGridPesquisa: TDBGrid
        AlignWithMargins = True
        Left = 3
        Top = 68
        Width = 664
        Height = 252
        Align = alClient
        DataSource = dsPesq
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = DBGridPesquisaDblClick
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
      object cxGrid1: TcxGrid
        Left = 0
        Top = 65
        Width = 670
        Height = 258
        Align = alClient
        TabOrder = 3
        ExplicitTop = 67
        object cxGrid1Level1: TcxGridLevel
        end
      end
    end
    object tbDados: TTabSheet
      Caption = 'tbDados'
      ImageIndex = 1
      object Label1: TLabel
        Left = 5
        Top = 80
        Width = 46
        Height = 13
        Caption = 'Tipo (F/J)'
      end
      object edtCodigo: TLabeledEdit
        Left = 3
        Top = 16
        Width = 46
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo'
        Enabled = False
        TabOrder = 0
      end
      object edtNome: TLabeledEdit
        Left = 3
        Top = 56
        Width = 350
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        TabOrder = 1
      end
      object edtDocumento: TLabeledEdit
        Left = 96
        Top = 96
        Width = 113
        Height = 21
        EditLabel.Width = 113
        EditLabel.Height = 13
        EditLabel.Caption = 'Documento (CPF/CNPJ)'
        MaxLength = 15
        TabOrder = 3
      end
      object cbxTipo: TComboBox
        Left = 3
        Top = 96
        Width = 73
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = 'cbxTipo'
        Items.Strings = (
          'Fisico'
          'Juridico')
      end
      object edtEndereco: TLabeledEdit
        Left = 232
        Top = 96
        Width = 121
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 10
        TabOrder = 4
      end
      object pnlBtnsCad: TPanel
        Left = 0
        Top = 323
        Width = 670
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Color = clSilver
        ParentBackground = False
        TabOrder = 5
        object btnGravar: TButton
          Left = 511
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Gravar'
          TabOrder = 2
          OnClick = btnGravarClick
        end
        object btnAlterar: TButton
          Left = 430
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Alterar'
          TabOrder = 1
          OnClick = btnAlterarClick
        end
        object btnCancelar: TButton
          Left = 592
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 3
          OnClick = btnCancelarClick
        end
        object btnListar: TButton
          Left = 349
          Top = 10
          Width = 75
          Height = 25
          Caption = 'Listar'
          TabOrder = 0
          OnClick = btnListarClick
        end
      end
      object edtCodigoEscola: TLabeledEdit
        Left = 72
        Top = 16
        Width = 121
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Escola'
        TabOrder = 6
      end
    end
  end
  object pnlRodape: TPanel
    Left = 0
    Top = 392
    Width = 678
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnFechar: TButton
      Left = 544
      Top = 6
      Width = 75
      Height = 25
      Caption = 'Fechar'
      TabOrder = 0
      OnClick = btnFecharClick
    end
  end
  object dsPesq: TDataSource
    DataSet = DataModulePessoa.cdsPesquisar
    Left = 416
    Top = 40
  end
end
