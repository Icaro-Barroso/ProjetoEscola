object DmEscola: TDmEscola
  OldCreateOrder = False
  Height = 298
  Width = 351
  object sqlEscola: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'SELECT * FROM ESCOLA'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 72
    Top = 32
  end
  object dspEscola: TDataSetProvider
    DataSet = sqlEscola
    Left = 72
    Top = 96
  end
  object cdsEscola: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEscola'
    Left = 72
    Top = 152
    object cdsEscolaESCCOD: TIntegerField
      FieldName = 'ESCCOD'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsEscolaESCNOM: TWideStringField
      FieldName = 'ESCNOM'
      Required = True
      Size = 200
    end
    object cdsEscolaESCEND: TWideStringField
      FieldName = 'ESCEND'
      Required = True
      Size = 200
    end
    object cdsEscolaESCCNJ: TWideStringField
      FieldName = 'ESCCNJ'
      Required = True
      Size = 80
    end
  end
  object sqlPesquisarEscola: TSQLDataSet
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 216
    Top = 32
  end
  object dspPesquisarEscola: TDataSetProvider
    DataSet = sqlPesquisarEscola
    Left = 216
    Top = 88
  end
  object cdsPesquisarEscola: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPesquisarEscola'
    Left = 216
    Top = 144
  end
end
