/****** Script for SelectTopNRows command from SSMS  ******/
SELECT COUNT([REF_NR]) ,[ID платежа],[REF_NR],CONVERT(DATETIME, [TR_DATE], 103),[AMNT], CONVERT(DATETIME, fmp.[Дата], 103) ,[Принято] 
  FROM [Oktyabr202010].[dbo].[faberlik_millikart] fm
  left join [Oktyabr202010].[dbo].[faberlik_portal_millikart] fmp
  on fm.[AMNT] between fmp.[Принято] and fmp.[Принято]*1.1---(fmp.[Принято]+ ceiling(fmp.[Принято]*1000*5/10000)/100)
 -- and CONVERT(DATE, [REG_DATE], 103)  between  DATEADD(minute,-20,CONVERT(DATETIME, fmp.[Дата], 103) )
   --and DATEADD(minute,20,CONVERT(DATETIME, fmp.[Дата], 103) )

     and CONVERT(DATETIME, fmp.[Дата], 103)  between  DATEADD(minute,-5,CONVERT(DATETIME, [TR_DATE], 103) )
   and DATEADD(minute,5,CONVERT(DATETIME, [TR_DATE], 103) )
   where fmp.[Дата] is not null
   group by CONVERT(DATETIME, [TR_DATE], 103),[AMNT],[ID платежа], CONVERT(DATETIME, fmp.[Дата], 103) ,[Принято],[REF_NR]
   order by CONVERT(DATETIME, [TR_DATE], 103) 
