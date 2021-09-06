inherited DataModule2: TDataModule2
  inherited sqlPesquisar: TSQLDataSet
    CommandText = 
      'Select p.PESCOD,ESCCOD, PESNOM, PESEND, PESIDT,PESDOC,ALNCOD,ALN' +
      'TRM,SRICOD from PESSOA p'#13#10'inner join ALUNO a on p.PESCOD = a.PES' +
      'COD'
  end
end
