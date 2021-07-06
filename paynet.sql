Declare @DateFrom date
Declare @DateTo date
 set @DateFrom = '2019-12-01'
 set @DateTo = '2020-01-01'
SELECT
      s.ServiceName  
      ,CONVERT(VARCHAR,PayDate,101) +' '+CONVERT(VARCHAR,PayDate,108) as 
PayDate       
      ,CAST(PaymentInfo.query('data(r/transaction_code)') as nvarchar(max)) 'paynet_transaction_id'     
      ,LEFT(CAST([ExtraParams].query('data(r/trm_prv_id)') as  nvarchar(max)),10)+RIGHT('0000000000'+cast(AgentTerminalID as varchar(10)),10)  as ModenisTransactionID
 ,[Number]
      ,[PaySum] ,case status when 2 then 'success' else 'rejected' end status  
   INTO [dbo].Paynet
 FROM gate211.dbo.Payment p with(nolock) join gate211.dbo.Service s on p.ServiceID=s.ServiceID where s.[ProviderID]=7
 and  (StatusDate BETWEEN @DateFrom and @DateTo) 
 and Status=2 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
