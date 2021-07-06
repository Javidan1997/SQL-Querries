SELECT SUM(PaySum) from [May2019].[dbo].[suAll] where
MONTH(RDate)= 4 and YEAR(RDate)=2019;

SELECT [Id]
      ,[RDate]
      ,[Number]
      ,[PaySum]
      ,[AccType]
      ,[PayType]
      ,[ID]
      ,[ServiceName]
  FROM [May2019].[dbo].[suAll]
  order by RDate;
