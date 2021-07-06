/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 

[AgentPaymentID],
Number,
status,
PaySum,
StatusDate,
    CAST([ExtraParams].query('data(r/trm_prv_id)') as nvarchar) trm_prv_id,
 [PaymentID]
      ,[OuterPaymentID]
      ,CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) agt_id
      ,[AgentPaymentID]
      ,[ProviderPaymentID],'' rrn
,*
  FROM gate211.[dbo].[Payment] 
where serviceid in (294) and statusdate between '2020-12-01' and '2021-01-01' and status=2 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <>'3'
