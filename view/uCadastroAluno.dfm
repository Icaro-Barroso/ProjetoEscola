inherited CadastroAluno: TCadastroAluno
  Caption = 'Cadastro Aluno'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    inherited tbPesq: TTabSheet
      inherited cxGrid1: TcxGrid
        ExplicitLeft = 3
        ExplicitTop = 59
        object cxAlunos: TcxGridDBTableView [0]
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsPesq
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.NoDataToDisplayInfoText = '<Nenhum aluno listado>'
          object cxAlunosCodigo: TcxGridDBColumn
            Caption = 'Codigo'
            DataBinding.FieldName = 'ALNCOD'
            Width = 119
          end
          object cxAlunosNome: TcxGridDBColumn
            Caption = 'Nome'
            DataBinding.FieldName = 'PESNOM'
          end
          object cxAlunosDocumento: TcxGridDBColumn
            Caption = 'Documento'
            DataBinding.FieldName = 'PESDOC'
          end
        end
        inherited cxGrid1Level1: TcxGridLevel
          GridView = cxAlunos
        end
      end
    end
    inherited tbDados: TTabSheet
      inherited edtNome: TLabeledEdit
        Height = 19
        Ctl3D = False
        ParentCtl3D = False
        ExplicitHeight = 19
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
      object edCodigoAluno: TLabeledEdit
        Left = 64
        Top = 16
        Width = 65
        Height = 21
        EditLabel.Width = 63
        EditLabel.Height = 13
        EditLabel.Caption = 'Codigo Aluno'
        TabOrder = 7
      end
      object edSerie: TLabeledEdit
        Left = 3
        Top = 144
        Width = 46
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Serie'
        TabOrder = 8
      end
    end
  end
  inherited dsPesq: TDataSource
    Top = 48
  end
  object teste: TDataSource
    DataSet = DmAluno.sqlPesquisarAluno
    Left = 464
    Top = 48
  end
end
