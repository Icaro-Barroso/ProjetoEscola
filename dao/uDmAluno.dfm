object DmAluno: TDmAluno
  OldCreateOrder = False
  Height = 353
  Width = 553
  object sqlPesquisarAluno: TSQLDataSet
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
    Left = 160
    Top = 80
  end
  object sqlAlterarAluno: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 240
    Top = 80
  end
  object sqlExcluirAluno: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 328
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
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'dspPesquisarAluno'
    StoreDefs = True
    Left = 72
    Top = 240
  end
end
