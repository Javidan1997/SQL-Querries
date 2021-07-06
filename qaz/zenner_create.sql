select StatusDate as PaymentCreateDate,

   LEFT(CAST([ExtraParams].query('data(r/online_trm_prv_id)') as  nvarchar(max)),10)+RIGHT('0000000000'+cast(AgentTerminalID as varchar(10)),10) trnextra

  ,LEFT(CAST([ExtraParams].query('data(r/trm_prv_id)') as  nvarchar(max)),10)+RIGHT('0000000000'+cast(AgentTerminalID as varchar(10)),10) trn
  ,CAST(ExtraParams.query('data(r/zennernfc_subscriberid)') as nvarchar) zennernfc_subscriberid,
OsmpProviderID,
AgentPaymentID as AzeriQazID, ReceiveDate, Number, PaySum, Status,[ExtraParams],
	ServiceID 
	into Dekabr2020t.dbo.ZennerMrej
	from gate211.dbo.Payment where ServiceID in ( 992,993)

and StatusDate Between '2020-12-01'and'2021-01-01' and Status=3 and PaySum>0
 and
  CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'

------------------

select StatusDate as PaymentCreateDate,
 LEFT(CAST([ExtraParams].query('data(r/trm_prv_id)') as nvarchar ),10)+

	  LEFT(CAST([ExtraParams].query('data(r/online_trm_prv_id)') as nvarchar ),10)+RIGHT('0000000000'+cast(AgentTerminalID as varchar(10)),10)  trm_prv_id 
,OsmpProviderID,
AgentPaymentID as AzeriQazID, ReceiveDate, Number, PaySum, Status
	ServiceID ,[ExtraParams]
	into Yanvar2021.dbo.ZennerM2
	from gate211.dbo.Payment where ServiceID in ( 992,993)

and StatusDate Between '2021-01-01'and'2021-02-01'
 and
  CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
  and status=2
