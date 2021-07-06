select 
statusdate,
CAST(ExtraParams.query('data(r/falcon_account)') as nvarchar(MAX)) as falcon_account, 
CAST(ExtraParams.query('data(r/falcon_contactnumber)') as nvarchar(MAX)) as falcon_contactnumber,
AgentPaymentid,
CAST(ExtraParams.query('data(r/falcon_rrn)') as nvarchar(MAX)) as falcon_rrn,
CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar(MAX)) as trm_prv_id,

CAST(ExtraParams.query('data(r/receipt_num)') as nvarchar(MAX)) as receipt_num,

CAST(ExtraParams.query('data(r/falcon_customer)') as nvarchar(MAX)) as falcon_customer,

Number,
	PaySum,ProviderSum,CommissionSum,status
 from gate211.dbo.Payment where
ServiceID=888 and  statusdate  between '2020-11-01' and '2020-12-01'
