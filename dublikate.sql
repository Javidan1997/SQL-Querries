WITH CTE AS(
   SELECT *,
       RN = ROW_NUMBER() OVER(PARTITION BY Number ORDER BY Number)
   FROM  [Iyul_2019].[dbo].[AzercellAllYoxla] where Number = '994508450266' and [Pay Amount] = 1 and [Payment Date]='2019-07-31 09:54:20.000'
)
select * from CTE
