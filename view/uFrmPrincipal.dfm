object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lbProjetoEscola: TRLLabel
    Left = 192
    Top = 88
    Width = 224
    Height = 40
    Align = faClient
    Alignment = taCenter
    Caption = 'Projeto Escola'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -32
    Font.Name = 'Trebuchet MS'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = False
  end
  object btEntrar: TButton
    Left = 272
    Top = 208
    Width = 75
    Height = 25
    Caption = 'Entrar'
    TabOrder = 1
    OnClick = btEntrarClick
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 32
    object Cadastrar1: TMenuItem
      Caption = 'Inicio'
      object Cadastrar2: TMenuItem
        Caption = 'Cadastrar'
        object Funcionario: TMenuItem
          Caption = 'Funcionario'
          OnClick = FuncionarioClick
        end
        object Escola1: TMenuItem
          Caption = 'Escola'
          OnClick = Escola1Click
        end
        object Aluno1: TMenuItem
          Caption = 'Aluno'
          OnClick = Aluno1Click
        end
      end
    end
  end
end
