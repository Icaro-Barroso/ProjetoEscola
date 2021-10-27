object NotaAluno: TNotaAluno
  Left = 0
  Top = 0
  Caption = 'Notas Aluno'
  ClientHeight = 238
  ClientWidth = 292
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 292
    Height = 238
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitTop = -24
    ExplicitWidth = 678
    ExplicitHeight = 321
    object edtCodigoAluno: TLabeledEdit
      Left = 24
      Top = 36
      Width = 49
      Height = 21
      EditLabel.Width = 33
      EditLabel.Height = 13
      EditLabel.Caption = 'Codigo'
      TabOrder = 0
    end
    object edtNomeAluno: TLabeledEdit
      Left = 104
      Top = 36
      Width = 113
      Height = 21
      EditLabel.Width = 27
      EditLabel.Height = 13
      EditLabel.Caption = 'Nome'
      TabOrder = 1
    end
    object edtNotaBi1: TLabeledEdit
      Left = 24
      Top = 92
      Width = 81
      Height = 21
      EditLabel.Width = 76
      EditLabel.Height = 13
      EditLabel.Caption = 'Nota Bimestre 1'
      TabOrder = 2
      OnChange = edtNotaBi1Change
    end
    object edtNotabi2: TLabeledEdit
      Left = 128
      Top = 92
      Width = 89
      Height = 21
      EditLabel.Width = 76
      EditLabel.Height = 13
      EditLabel.Caption = 'Nota Bimestre 2'
      TabOrder = 3
    end
    object edtNotaBi3: TLabeledEdit
      Left = 24
      Top = 140
      Width = 81
      Height = 21
      EditLabel.Width = 76
      EditLabel.Height = 13
      EditLabel.Caption = 'Nota Bimestre 3'
      TabOrder = 4
    end
    object edtNotaBi4: TLabeledEdit
      Left = 128
      Top = 140
      Width = 89
      Height = 21
      EditLabel.Width = 76
      EditLabel.Height = 13
      EditLabel.Caption = 'Nota Bimestre 4'
      TabOrder = 5
    end
  end
end
