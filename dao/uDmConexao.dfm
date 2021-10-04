object DmConexao: TDmConexao
  OldCreateOrder = False
  Height = 150
  Width = 215
  object sqlConexao: TSQLConnection
    DriverName = 'MSSQL'
    GetDriverFunc = 'getSQLDriverMSSQL'
    LibraryName = 'dbxmss30.dll'
    LoginPrompt = False
    Params.Strings = (
      'SchemaOverride=%.dbo'
      'DriverUnit=DBXDynalink'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXDynalinkDriver10' +
        '0.bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxDynalinkDriver,Version=11.0.5000.0,Culture=neutral,Pu' +
        'blicKeyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxReadOnl' +
        'yMetaData100.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxReadOnlyMetaData,Version=11.0.5000.0,Culture' +
        '=neutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'HostName=PSDEVD83'
      'DataBase=ProjetoEscola'
      'User_Name=sa'
      'Password=Paracuru123'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'MSSQL TransIsolation=ReadCommited'
      'OS Authentication=False'
      'Prepare SQL=False')
    VendorLib = 'oledb'
    Connected = True
    Left = 80
    Top = 48
  end
end
