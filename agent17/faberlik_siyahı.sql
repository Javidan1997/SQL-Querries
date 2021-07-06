SELECT
[OsmpProviderID]
,s.ServiceName
,AMNT
,[PaySum]
,rrn,StatusDate,card,payment_id
,*,rrn


,pp.ProviderName
FROM [dekabr2020t].[dbo].[PaymentAgent17] pa17
inner join [dekabr2020m].[dbo].[processed_purchase_via_card] ppvc
on ppvc.[payment_id]=pa17.[AgentReceipteNumber]

join Service s on pa17.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where AMNT>0 and Status=2 and s.ServiceName like '%faberli%'
