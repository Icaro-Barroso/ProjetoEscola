object DataModule1: TDataModule1
  OldCreateOrder = False
  Height = 320
  Width = 409
  object sqlPesquisar: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'select * from PESSOA'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DmConexao.sqlConexao
    Left = 24
    Top = 88
  end
  object sqlInserir: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 
      'INSERT INTO PESSOA (PESCOD,ESCCOD,PESNOM,PESEND,PESIDD,PESDOC)'#13#10 +
      'VALUES (:ID, :IDESCOLA, :NOME, :ENDERECO, :INDENTIFICACAO, :INDE' +
      'TIFICACAO, :DOCUMENTO)'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDESCOLA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ENDERECO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INDENTIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'INDETIFICACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DOCUMENTO'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.sqlConexao
    Left = 104
    Top = 88
  end
  object sqlAlterar: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'UPDATE PESSOA SET'#13#10'       PESNOM = :NOME'#13#10' WHERE (PESCOD = :ID)'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Name = 'NOME'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.sqlConexao
    Left = 184
    Top = 88
  end
  object sqlExcluir: TSQLDataSet
    SchemaName = 'sa'
    CommandText = 'DELETE FROM PESSOA'#13#10' WHERE (PESCOD = :PESCOD)'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftUnknown
        Name = 'PESCOD'
        ParamType = ptInput
      end>
    SQLConnection = DmConexao.sqlConexao
    Left = 248
    Top = 88
  end
  object dspPesquisar: TDataSetProvider
    DataSet = sqlPesquisar
    Options = [poCascadeDeletes, poCascadeUpdates, poAllowCommandText, poUseQuoteChar]
    Left = 32
    Top = 176
  end
  object cdsPesquisar: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'PESCOD'
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
    ProviderName = 'dspPesquisar'
    StoreDefs = True
    Left = 32
    Top = 256
    object cdsPesquisarPESCOD: TIntegerField
      FieldName = 'PESCOD'
      Required = True
    end
    object cdsPesquisarPESDOC: TStringField
      FieldName = 'PESDOC'
      Required = True
      Size = 40
    end
    object cdsPesquisarESCCOD: TIntegerField
      FieldName = 'ESCCOD'
      Required = True
    end
    object cdsPesquisarPESIDT: TStringField
      FieldName = 'PESIDT'
      Size = 1
    end
    object cdsPesquisarPESNOM: TStringField
      FieldName = 'PESNOM'
      Size = 40
    end
    object cdsPesquisarPESEND: TStringField
      FieldName = 'PESEND'
      Size = 40
    end
  end
end
