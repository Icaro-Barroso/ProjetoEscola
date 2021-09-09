inherited CadastroAluno: TCadastroAluno
  Caption = 'Cadastro Aluno'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    ActivePage = tbDados
    inherited tbPesq: TTabSheet
      inherited pnlFiltro: TPanel
        ExplicitTop = -3
      end
      inherited DBGridPesquisa: TDBGrid
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
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PESEND'
            Visible = True
          end>
      end
      inherited cxGrid1: TcxGrid
        ExplicitLeft = 0
        ExplicitTop = 67
        ExplicitWidth = 670
        ExplicitHeight = 258
        object cxAlunos: TcxGridDBTableView [0]
          Navigator.Buttons.CustomButtons = <>
          DataController.DataSource = dsPesq
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          OptionsView.NoDataToDisplayInfoText = '<Nenhum aluno listado>'
          object cxAlunosCodigo: TcxGridDBColumn
            Caption = 'Codigo'
            Width = 119
          end
          object cxAlunosNome: TcxGridDBColumn
            Caption = 'Nome'
          end
          object cxAlunosDocumento: TcxGridDBColumn
            Caption = 'Documento'
          end
        end
        inherited cxGrid1Level1: TcxGridLevel
          GridView = cxAlunos
        end
      end
    end
    inherited tbDados: TTabSheet
      ExplicitLeft = 8
      ExplicitTop = 28
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
  inherited dsPesq: TDataSource
    DataSet = DataModule1.sqlPesquisarAluno
    Left = 416
    Top = 48
  end
  object teste: TDataSource
    DataSet = DataModule1.sqlPesquisarAluno
    Left = 464
    Top = 48
  end
end
