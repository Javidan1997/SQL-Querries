/****** Script for SelectTopNRows command from SSMS  ******/
SELECT len( [ai_subscriber_type])
      ,ServiceID
	  ,agent

      ,sum([PaySum]),count(*) from
  (select *,CAST(ExtraParams.query('data(r/agt_id)') as nvarchar) agent FROM [Avqust2020].[dbo].[Azerisiq]) a where status=2 and serviceid=991
 group by len( [ai_subscriber_type]),[ServiceID],agent
 order by 2,1
