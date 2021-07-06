Select  Paydate Paymentdate,
CAST(PaymentInfo.query('data(r/sessionid)') as nvarchar) RRN,
CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar) TRN_id,Number Num,PaySum Amount,
* into Avqust2019.dbo.Starex3 from gate211.dbo.Payment where StatusDate between '2018-08-01' and '2018-09-01' And ServiceID = 147 and Status=2
