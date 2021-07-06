Declare @DateFrom date
Declare @DateTo date
 set @DateFrom = '2019-02-01'
 set @DateTo = '2020-03-01'

select   
      CONVERT(VARCHAR,PayDate,101) +' '+CONVERT(VARCHAR,PayDate,108) as 
PayDate          
      ,LEFT(CAST([ExtraParams].query('data(r/trm_prv_id)') as  nvarchar(max)),10)+RIGHT('0000000000'+cast(AgentTerminalID as varchar(10)),10)  as ModenisTransactionID
 ,[Number]
      ,[PaySum] ,case status when 2 then 'success' else 'rejected' end status   from gate211.dbo.Payment where ServiceID =839

 and  (StatusDate BETWEEN @DateFrom and @DateTo) 
 and Status=2 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
