inherited CadastroAluno: TCadastroAluno
  Caption = 'Cadastro Aluno'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited tbDados: TTabSheet
      inherited pnlBtnsCad: TPanel
        inherited btnGravar: TButton
          Top = 10
          ExplicitTop = 10
        end
      end
      inherited edtCodigoEscola: TLabeledEdit
        Left = 152
        Width = 201
        EditLabel.ExplicitLeft = 152
        EditLabel.ExplicitTop = 0
        EditLabel.ExplicitWidth = 30
        ExplicitLeft = 152
        ExplicitWidth = 201
      end
      object LabeledEdit1: TLabeledEdit
        Left = 64
        Top = 16
        Width = 65
        Height = 21
        EditLabel.Width = 63
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo Aluno'
        TabOrder = 7
      end
      object LabeledEdit2: TLabeledEdit
        Left = 3
        Top = 144
        Width = 46
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Serie'
        TabOrder = 8
      end
      object LabeledEdit3: TLabeledEdit
        Left = 64
        Top = 144
        Width = 49
        Height = 21
        EditLabel.Width = 30
        EditLabel.Height = 13
        EditLabel.Caption = 'Turma'
        TabOrder = 9
      end
    end
  end
end
