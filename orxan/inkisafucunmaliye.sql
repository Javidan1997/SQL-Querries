/****** Script for SelectTopNRows command from SSMS  ******/
SELECT CAST(ExtraParams.query('data(r/trm_prv_id)') as varchar) rrn,
AgentPaymentID,Number,PaySum,StatusDate,ServiceName,pp.ProviderName,case status when 2 then 'success' else 'rejected' end status ,ExtraParams
  FROM [gate211].[dbo].[Payment] 
  p join gate211.dbo.Service s on p.ServiceID=s.ServiceID join gate211.dbo.Provider pp on pp.ProviderID=s.ProviderID
  
  
  where p.StatusDate between  '2020-08-01' and '2020-09-01' and p.ServiceID = 440
