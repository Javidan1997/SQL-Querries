select CAST(ExtraParams.query('data(r/vtb_cardNum)') as nvarchar(MAX)) as vtb_cardNum,
CAST(ExtraParams.query('data(r/vtb_accNum)') as nvarchar(MAX)) as vtb_accNum,
PaymentID,
CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar(MAX)) as TransactionId,
Number,
PaySum,
s.ServiceName,
* from gate211.dbo.Payment p join Service s on p.ServiceID=s.ServiceID join Provider pp on s.ProviderID=pp.ProviderID


where serviceid=
