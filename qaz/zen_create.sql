select StatusDate as PaymentCreateDate,

OsmpProviderID,
AgentPaymentID as AzeriQazID, ReceiveDate, Number, PaySum, Status
	ServiceID 
	into Noyabr2020.dbo.ZennerM
	from gate211.dbo.Payment where ServiceID in ( 992,993)

and StatusDate Between '2020-11-01'and'2020-12-01'
 and
  CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
