object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 590
  ClientWidth = 1094
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 112
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 99
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 24
        Top = 24
        Width = 198
        Height = 24
        Caption = 'Listagens de Alunos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -20
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDraw1: TRLDraw
        Left = 24
        Top = 54
        Width = 657
        Height = 27
        DrawKind = dkLine
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 137
      Width = 718
      Height = 64
      BandType = btColumnHeader
      object lbCodigoPessoa: TRLLabel
        Left = 48
        Top = 24
        Width = 92
        Height = 16
        Caption = 'Codigo Pessoa'
      end
      object lbNome: TRLLabel
        Left = 192
        Top = 24
        Width = 38
        Height = 16
        Caption = 'Nome'
      end
      object lbDocumento: TRLLabel
        Left = 336
        Top = 24
        Width = 70
        Height = 16
        Caption = 'Documento'
      end
      object lbMedia: TRLLabel
        Left = 488
        Top = 24
        Width = 39
        Height = 16
        Caption = 'Media'
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 201
      Width = 718
      Height = 72
      object RLDBText1: TRLDBText
        Left = 48
        Top = 32
        Width = 59
        Height = 16
        DataField = 'PESCOD'
        DataSource = DataSource1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Holder = lbCodigoPessoa
        ParentFont = False
      end
      object RLDBText2: TRLDBText
        Left = 192
        Top = 32
        Width = 61
        Height = 16
        DataField = 'PESNOM'
        DataSource = DataSource1
        Holder = lbNome
      end
      object RLDBText3: TRLDBText
        Left = 336
        Top = 32
        Width = 59
        Height = 16
        DataField = 'PESDOC'
        DataSource = DataSource1
        Holder = lbDocumento
        BeforePrint = RLDBText3BeforePrint
      end
      object lbResultadoMedia: TRLLabel
        Left = 488
        Top = 32
        Width = 107
        Height = 16
        BeforePrint = Calcularmedia
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 273
      Width = 718
      Height = 40
      BandType = btFooter
      object RLSystemInfo1: TRLSystemInfo
        Left = 3
        Top = 21
        Width = 60
        Height = 16
        Info = itFullDate
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 624
        Top = 21
        Width = 87
        Height = 16
        Info = itPageNumber
      end
      object RLLabel5: TRLLabel
        Left = 663
        Top = 21
        Width = 8
        Height = 16
        Caption = '/'
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 677
        Top = 21
        Width = 112
        Height = 16
        Info = itLastPageNumber
      end
    end
  end
  object ADOQuery1: TADOQuery
    Active = True
    AutoCalcFields = False
    ConnectionString = 
      'Provider=SQLOLEDB;Password=Paracuru123;Persist Security Info=Tru' +
      'e;User ID=sa;Initial Catalog=ProjetoEscola;Data Source=PSDEVD83'
    CursorType = ctStatic
    Parameters = <>
    Prepared = True
    SQL.Strings = (
      'SELECT * FROM V_Aluno'
      '')
    Left = 16
    Top = 136
    object ADOQuery1PESCOD: TIntegerField
      FieldName = 'PESCOD'
    end
    object ADOQuery1ALNCOD: TIntegerField
      FieldName = 'ALNCOD'
    end
    object ADOQuery1PESNOM: TStringField
      FieldName = 'PESNOM'
      Size = 40
    end
    object ADOQuery1PESDOC: TStringField
      FieldName = 'PESDOC'
      Size = 40
    end
    object ADOQuery1SRICOD: TIntegerField
      FieldName = 'SRICOD'
    end
    object ADOQuery1ESCNOM: TWideStringField
      FieldName = 'ESCNOM'
      FixedChar = True
      Size = 100
    end
    object ADOQuery1ALNNOTBI1: TFloatField
      FieldName = 'ALNNOTBI1'
    end
    object ADOQuery1ALNNOTBI2: TFloatField
      FieldName = 'ALNNOTBI2'
    end
    object ADOQuery1ALNNOTBI3: TFloatField
      FieldName = 'ALNNOTBI3'
    end
    object ADOQuery1ALNNOTBI4: TFloatField
      FieldName = 'ALNNOTBI4'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 16
    Top = 88
  end
end
