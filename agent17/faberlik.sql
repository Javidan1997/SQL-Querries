SELECT
[OsmpProviderID]
,s.ServiceName
,AMNT
,[PaySum]
,rrn,StatusDate,card,payment_id
,*,rrn


,pp.ProviderName
FROM [dekabr2020m].[dbo].[Payment17] pa17
inner join [dekabr2020t].[dbo].[_processed_purchase_via_card] ppvc
on ppvc.[payment_id]=pa17.[AgentReceipteNumber]

join Service s on pa17.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where AMNT>0 and pp.ProviderID=55 and Status=2
--group by [OsmpProviderID]
--,ABRV_NAME,s.ServiceName,pp.ProviderName
