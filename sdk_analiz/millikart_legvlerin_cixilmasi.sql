/****** Script for SelectTopNRows command from SSMS  ******/
SELECT ma.[ID]
      ,ma.[ServiceName]
      ,ma.[Amount]-mu.Amount-ISNULL(muk.Amount,0)
      ,ma.[ProviderAmount]- mu.[ProviderAmount]-ISNULL(muk.[ProviderAmount],0)
      ,ma.[CommissionAmount]
      ,ma.[Count]-mu.[Count]-ISNULL(muk.[Count],0)
      ,ma.[Agent]
      ,ma.[ProviderName]

  FROM [Noyabr2020].[dbo].[millikartallprovidersum] ma
  left join Noyabr2020.dbo.[millikartallprvugursuz] mu
  on mu.[ID]=ma.[ID]
  left join Noyabr2020.dbo.[millikart_legv_2] muk
  on muk.[ID]=ma.[ID]
