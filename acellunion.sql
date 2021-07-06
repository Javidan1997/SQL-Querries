SELECT * INTO Aprel2019.dbo.All FROM (
SELECT  [F1]
    ,[F2]
    ,[F3]
FROM [Aprel2019].[dbo].[All1]
union all
SELECT  [Current Telephone Number]
    ,[Payment Date]
    ,[Pay Amount]
FROM [Aprel2019].[dbo].[All2]
union all
SELECT  [F1]
    ,[F2]
    ,[F3]
FROM [Aprel2019].[dbo].[All3]
union all
SELECT  [Current Telephone Number]
    ,[Payment Date]
    ,[Pay Amount]
FROM [Aprel2019].[dbo].[All4])
A
