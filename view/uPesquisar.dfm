object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPesquisar: TPanel
    Left = 0
    Top = 0
    Width = 635
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    Color = clAppWorkSpace
    ParentBackground = False
    TabOrder = 0
    object edtPesquisar: TLabeledEdit
      Left = 8
      Top = 18
      Width = 121
      Height = 21
      EditLabel.Width = 54
      EditLabel.Height = 13
      EditLabel.Caption = 'Digite o cpf'
      TabOrder = 0
    end
    object btnPesquisar: TButton
      Left = 532
      Top = 9
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
    end
  end
  object pnlBtnPesquisa: TPanel
    Left = 0
    Top = 258
    Width = 635
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    Color = clAppWorkSpace
    ParentBackground = False
    TabOrder = 1
    object btnNovo: TButton
      Left = 471
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 0
    end
    object btnExcluir: TButton
      Left = 552
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excluir'
      TabOrder = 1
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 41
    Width = 635
    Height = 217
    Align = alClient
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
end
