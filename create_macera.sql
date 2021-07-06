Declare @DateFrom date
Declare @DateTo date
 set @DateFrom = '2019-06-01'
 set @DateTo = '2019-07-01' 
 
 SELECT
 
 [PaymentID]
,[AgentPaymentID]
,[ServiceID]
,[GateServiceID]
,[PayDate]
,[StatusDate]
,[Number]
,[PaymentInfo]
,[AgentTerminalID]
,[PaySum]
,[Status]
,CAST(ExtraParams.query('data(r/customer_code)') as nvarchar) customer_code
,CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar) trm_prv_id
,[OsmpProviderID]
,[ExtraParams]
   INTO Iyun_2109.[dbo].MaceraM
 FROM gate211.dbo.Payment p with(nolock) where p.ServiceID=744
 and  (StatusDate BETWEEN @DateFrom and @DateTo) 
and Status=2 
