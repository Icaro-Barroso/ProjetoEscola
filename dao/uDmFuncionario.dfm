object DmFuncionario: TDmFuncionario
  OldCreateOrder = False
  Height = 287
  Width = 595
  object sqlFuncionario: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'SELECT * FROM V_FUNCIONARIO'
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
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dsFuncionario'
    Left = 32
    Top = 176
    object cdsFuncionarioFNCCOD: TIntegerField
      FieldName = 'FNCCOD'
      Required = True
    end
    object cdsFuncionarioPESCOD: TIntegerField
      FieldName = 'PESCOD'
      Required = True
    end
    object cdsFuncionarioFNCSLR: TFloatField
      FieldName = 'FNCSLR'
      Required = True
    end
    object cdsFuncionarioPESNOM: TStringField
      FieldName = 'PESNOM'
      Size = 40
    end
    object cdsFuncionarioFNCCRG: TStringField
      FieldName = 'FNCCRG'
      Required = True
      Size = 40
    end
    object cdsFuncionarioPESEND: TStringField
      FieldName = 'PESEND'
      Size = 40
    end
    object cdsFuncionarioPESDOC: TStringField
      FieldName = 'PESDOC'
      Required = True
      Size = 40
    end
    object cdsFuncionarioPESIDT: TStringField
      FieldName = 'PESIDT'
      Size = 1
    end
    object cdsFuncionarioESPTIP: TWideStringField
      FieldName = 'ESPTIP'
      Size = 50
    end
    object cdsFuncionarioESPCOD: TIntegerField
      FieldName = 'ESPCOD'
    end
  end
  object sqlPesquisarFuncionario: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'SELECT * FROM FUNCIONARIO WHERE 1=0'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 160
    Top = 64
  end
  object dsPesquisarFuncionario: TDataSetProvider
    DataSet = sqlPesquisarFuncionario
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText, poUseQuoteChar]
    Left = 168
    Top = 136
  end
  object cdsPesquisarFuncionario: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsPesquisarFuncionario'
    Left = 168
    Top = 200
  end
end
