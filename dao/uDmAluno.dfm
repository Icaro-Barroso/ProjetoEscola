object DmAluno: TDmAluno
  OldCreateOrder = False
  Height = 353
  Width = 553
  object sqlPesquisarAluno: TSQLDataSet
    SchemaName = 'sa'
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
    Left = 328
    Top = 16
  end
  object sqlAlterarAluno: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 416
    Top = 16
  end
  object sqlExcluirAluno: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 504
    Top = 16
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
      end
      item
        Name = 'SRICOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspPesquisarAluno'
    StoreDefs = True
    Left = 72
    Top = 240
  end
  object sqlAluno: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 
      'select * from aluno a '#13#10'inner join pessoa p on a.pescod = p.pesc' +
      'od'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 168
    Top = 80
  end
  object dsAluno: TDataSetProvider
    DataSet = sqlAluno
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText, poUseQuoteChar]
    Left = 168
    Top = 160
  end
  object cdsAluno: TClientDataSet
    Active = True
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
      end
      item
        Name = 'SRICOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PESCOD_1'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'ESCCOD'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PESNOM'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'PESEND'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'PESIDT'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'PESDOC'
        Attributes = [faRequired]
        DataType = ftString
        Size = 40
      end>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dsAluno'
    StoreDefs = True
    Left = 168
    Top = 240
    object cdsAlunoALNCOD: TIntegerField
      FieldName = 'ALNCOD'
      Required = True
    end
    object cdsAlunoPESCOD: TIntegerField
      FieldName = 'PESCOD'
      Required = True
    end
    object cdsAlunoSRICOD: TIntegerField
      FieldName = 'SRICOD'
      Required = True
    end
    object cdsAlunoESCCOD: TIntegerField
      FieldName = 'ESCCOD'
      Required = True
    end
    object cdsAlunoPESNOM: TStringField
      FieldName = 'PESNOM'
      Size = 40
    end
    object cdsAlunoPESEND: TStringField
      FieldName = 'PESEND'
      Size = 40
    end
    object cdsAlunoPESIDT: TStringField
      FieldName = 'PESIDT'
      Size = 1
    end
    object cdsAlunoPESDOC: TStringField
      FieldName = 'PESDOC'
      Required = True
      Size = 40
    end
    object cdsAlunoALNNOTBI1: TFloatField
      FieldName = 'ALNNOTBI1'
    end
    object cdsAlunoALNNOTBI2: TFloatField
      FieldName = 'ALNNOTBI2'
    end
    object cdsAlunoALNNOTBI3: TFloatField
      FieldName = 'ALNNOTBI3'
    end
    object cdsAlunoALNNOTBI4: TFloatField
      FieldName = 'ALNNOTBI4'
    end
  end
  object sqlNota: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'SELECT * from aluno'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 260
    Top = 80
  end
  object dsNota: TDataSetProvider
    DataSet = sqlNota
    Left = 264
    Top = 168
  end
  object cdsNota: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dsNota'
    Left = 264
    Top = 240
  end
end
