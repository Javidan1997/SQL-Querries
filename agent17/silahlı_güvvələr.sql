select 
	status
	,statusdate,s.ServiceID
	 ,CAST([ExtraParams].query('data(r/trm_prv_id)') as nvarchar(MAX)) trm_prv_id
	 ,PaySum
	 ,ServiceName,ProviderName,OsmpProviderID
	,* from [dekabr2020m].[dbo].[Payment17] p
	left join gate211.dbo.Service s 
	on s.ServiceID=p.ServiceID
	left join gate211.dbo.Provider pp 
	on s.ProviderID=pp.ProviderID
	
	 where s.ServiceID
in (
1014
)
