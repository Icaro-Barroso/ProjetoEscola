object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 159
  ClientWidth = 148
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLNCLI11.1;Persist Security Info=False;User ID=sa;Init' +
      'ial Catalog=ProjetoEscola;Data Source=PSDEVD83;Use Procedure for' +
      ' Prepare=1;Auto Translate=True;Packet Size=4096;Workstation ID=P' +
      'SDEVD83;Initial File Name="";Use Encryption for Data=False;Tag w' +
      'ith column collation when possible=False;MARS Connection=False;D' +
      'ataTypeCompatibility=0;Trust Server Certificate=False;Server SPN' +
      '="";Application Intent=READWRITE'
    DefaultDatabase = 'ProjetoEscola'
    Provider = 'SQLNCLI11.1'
    Left = 56
    Top = 56
  end
end
