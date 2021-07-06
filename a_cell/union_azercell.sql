/****** Script for SelectTopNRows command from SSMS  ******/
select * into [Noyabr2020].[dbo].[AzercellAll] from (SELECT [Current Telephone Number] Number
      ,[Payment Entry Date]
      ,[Payment Date]
      ,[Pay Amount]
  FROM [Noyabr2020].[dbo].[azercell1]

union all

SELECT [F1]
      ,[F2]
      ,[F3]
      ,[F4]
  FROM [Noyabr2020].[dbo].[azercell2]
union all
SELECT [F1]
      ,[F2]
      ,[F3]
      ,[F4]
  FROM [Noyabr2020].[dbo].[azercell3]

union all

SELECT [F1]
      ,[F2]
      ,[F3]
      ,[F4]
  FROM [Noyabr2020].[dbo].[azercell4]
union all

SELECT [F1]
      ,[F2]
      ,[F3]
      ,[F4]
  FROM [Noyabr2020].[dbo].[azercell5]

union all

SELECT [F1]
      ,[F2]
      ,[F3]
      ,[F4]
  FROM [Noyabr2020].[dbo].[azercell6]
union all
SELECT [F1]
      ,[F2]
      ,[F3]
      ,[F4]
  FROM [Noyabr2020].[dbo].[azercell7]

union all

SELECT [F1]
      ,[F2]
      ,[F3]
      ,[F4]
  FROM [Noyabr2020].[dbo].[azercell8]
union all

SELECT [F1]
      ,[F2]
      ,[F3]
      ,[F4]
  FROM [Noyabr2020].[dbo].[azercell9]) a order by 3
