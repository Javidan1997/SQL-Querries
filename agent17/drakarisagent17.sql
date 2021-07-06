SELECT
 CAST(pa17.[ExtraParams].query('data(r/agt_id)') as nvarchar) agt_id,
 pa17.Number,
 pa17.AgentPaymentID,
 pa17.PaySum,*


,pp.ProviderName
FROM [dekabr2020m].[dbo].[Payment17] pa17
inner join [dekabr2020m].[dbo].[processed_purchase_via_card] ppvc
on ppvc.[payment_id]= pa17.[AgentReceipteNumber] 

join Service s on pa17.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID

where AMNT>0 and pa17.status=2  and pp.ProviderID =101
