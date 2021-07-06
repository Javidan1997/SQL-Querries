SELECT
*
FROM [dekabr2020t].[dbo].[PaymentAgnt17] pa17
inner join [dekabr2020m].[dbo].[processed_purchase_via_card] ppvc
on ppvc.[payment_id]=pa17.trm_prv_id

join Service s on pa17.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID
where AMNT>0 and status=2
and s.ServiceName like '%aSAN%'
