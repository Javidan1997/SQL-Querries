Declare @DateFrom date
Declare @DateTo date
 set @DateFrom = '2020-08-01'
 set @DateTo = '2020-09-01'

select   
      CONVERT(VARCHAR,PayDate,101) +' '+CONVERT(VARCHAR,PayDate,108) as 
PayDate          
      ,LEFT(CAST([ExtraParams].query('data(r/trm_prv_id)') as  nvarchar(max)),10)+RIGHT('0000000000'+cast(AgentTerminalID as varchar(10)),10)  as ModenisTransactionID
 ,[Number]
      ,[PaySum] ,case status when 2 then 'success' else 'rejected' end status, 
	  CAST([ExtraParams].query('data(r/nbc_rrn)') as  nvarchar(max)) nbc_rrn,
	  CAST([ExtraParams].query('data(r/nbc_contactnumber)') as  nvarchar(max)) nbc_contactnumber,
	  CAST([ExtraParams].query('data(r/receipt_date)') as  nvarchar(max)) receipt_date,
	  CAST([ExtraParams].query('data(r/receipt_date)') as  nvarchar(max))  +'0000/'+ CAST([ExtraParams].query('data(r/nbc_rrn)') as  nvarchar(max)) rrn,
	  [ExtraParams]   from gate211.dbo.Payment where ServiceID =839

 and  (StatusDate BETWEEN @DateFrom and @DateTo) 
 and Status=2 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
