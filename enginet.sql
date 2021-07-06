select [ExtraParams].query('data(r/enginet_transactionid)') en_trn_id,[ExtraParams].query('data(r/trm_prv_id)') modenis_trn_id ,
Number,PaySum,AgentPaymentID,PaymentID

      ,[PaymentID]
      ,[AgentPaymentID]
      ,[ProviderPaymentIDString]
      ,[PayDate]
      ,[StatusDate]
	  ,Status,*

into Oktyabr2019.dbo.EnginetM

from Payment where ServiceID in (

299,
300,
693
)
and
 StatusDate Between '2019-01-01'and'2019-11-01'
   and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
