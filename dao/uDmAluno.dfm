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
    Aggregates = <>
    Params = <>
    ProviderName = 'dsNota'
    Left = 264
    Top = 240
  end
  object sqlEscola: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'select esccod, escnom from escola'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 348
    Top = 80
  end
  object dsEscola: TDataSetProvider
    DataSet = sqlEscola
    Left = 352
    Top = 168
  end
  object cdsEscola: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dsEscola'
    Left = 352
    Top = 240
    object cdsEscolaesccod: TIntegerField
      FieldName = 'esccod'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEscolaescnom: TWideStringField
      FieldName = 'escnom'
      Required = True
      Size = 200
    end
  end
end
