---allprovidersum millikart
SELECT
id
,ABRV_NAME,s.ServiceName
,sum(AMNT) millikartamont
,sum([PaySum]) paysum

,-sum([PaySum])+sum( AMNT)
,count(*)


,pp.ProviderName
FROM [dekabr2020t].[dbo].[PaymentAgnt17] pa17
inner join [dekabr2020t].[dbo].[_processed_purchase_via_card] ppvc
on ppvc.[payment_id]=pa17.trm_prv_id

join Service s on pa17.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where AMNT>0
group by id
,ABRV_NAME,s.ServiceName,pp.ProviderName
