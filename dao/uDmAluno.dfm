object DmAluno: TDmAluno
  OldCreateOrder = False
  Height = 353
  Width = 553
  object sqlPesquisarAluno: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'SELECT * FROM V_ALUNO'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 72
    Top = 80
  end
  object sqlInserirAluno: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 184
    Top = 80
  end
  object sqlAlterarAluno: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 272
    Top = 80
  end
  object sqlExcluirAluno: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 360
    Top = 80
  end
  object dspPesquisarAluno: TDataSetProvider
    DataSet = sqlPesquisarAluno
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText, poUseQuoteChar]
    Left = 72
    Top = 160
  end
  object cdsPesquisarAluno: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PESCOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ALNCOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PESNOM'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'PESDOC'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end
      item
        Name = 'SRICOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ESCNOM'
        Attributes = [faRequired]
        DataType = ftWideString
        Size = 200
      end
      item
        Name = 'ALNNOTBI1'
        DataType = ftFloat
      end
      item
        Name = 'ALNNOTBI2'
        DataType = ftFloat
      end
      item
        Name = 'ALNNOTBI3'
        DataType = ftFloat
      end
      item
        Name = 'ALNNOTBI4'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspPesquisarAluno'
    StoreDefs = True
    Left = 72
    Top = 240
    object cdsPesquisarAlunoPESCOD: TIntegerField
      FieldName = 'PESCOD'
      Required = True
    end
    object cdsPesquisarAlunoALNCOD: TIntegerField
      FieldName = 'ALNCOD'
      Required = True
    end
    object cdsPesquisarAlunoPESNOM: TStringField
      FieldName = 'PESNOM'
      Size = 40
    end
    object cdsPesquisarAlunoPESDOC: TStringField
      FieldName = 'PESDOC'
      Required = True
      Size = 40
    end
    object cdsPesquisarAlunoSRICOD: TIntegerField
      FieldName = 'SRICOD'
      Required = True
    end
    object cdsPesquisarAlunoESCNOM: TWideStringField
      FieldName = 'ESCNOM'
      Required = True
      Size = 200
    end
  end
  object SQLDataSet2: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'select * from aluno where 1=0'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 240
    Top = 152
  end
  object DataSetProvider2: TDataSetProvider
    DataSet = SQLDataSet2
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText, poUseQuoteChar]
    Left = 240
    Top = 208
  end
  object ClientDataSet2: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ALNCOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PESCOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ALNNOTBI1'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'ALNNOTBI2'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'ALNNOTBI3'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'ALNNOTBI4'
        Attributes = [faRequired]
        DataType = ftFloat
      end
      item
        Name = 'SRICOD'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider2'
    StoreDefs = True
    Left = 240
    Top = 256
  end
end
