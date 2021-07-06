/****** Script for SelectTopNRows command from SSMS  ******/
SELECT sum([AMNT]),count(*)
  FROM [Avqust2020].[dbo].[millikart] where [ABRV_NAME] like 'eman-eManat+ Hesaba medaxil'
