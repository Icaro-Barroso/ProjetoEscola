object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 287
  Width = 120
  object sqlFuncionario: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'SELECT * FROM FUNCIONARIO WHERE 1=0'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 32
    Top = 64
  end
  object dsFuncionario: TDataSetProvider
    DataSet = sqlFuncionario
    Left = 32
    Top = 120
  end
  object cdsFuncionario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsFuncionario'
    Left = 32
    Top = 176
  end
end
