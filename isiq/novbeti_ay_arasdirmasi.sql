select 

status, CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar) + FORMAT(AgentTerminalID, '0000000000')  TRN_id,

 CAST(ExtraParams.query('data(r/ai_subscriber_type)') as nvarchar) ai_subscriber_type
	   ,CAST(ExtraParams.query('data(r/abon_type)') as nvarchar) abon_type,
 AgentPaymentID  trn_id,serviceid
,[StatusDate]
,[Number]
,[PaySum]
 from gate.dbo.payment with (nolock) where Agentid=1 and agentpaymentid in (
469942534,
469943135,
469944305,
469947239,
469948840,
469958544,
469951182,
469955296,
469958401,
469959613,
469948973,
469956322
)


--------------------------------------

select top 2000 status, CAST(ExtraParams.query('data(r/trm_prv_id)') as nvarchar) + FORMAT(AgentTerminalID, '0000000000')  TRN_id,

 CAST(ExtraParams.query('data(r/ai_subscriber_type)') as nvarchar) ai_subscriber_type
	   ,CAST(ExtraParams.query('data(r/abon_type)') as nvarchar) abon_type,
 AgentPaymentID  trn_id
,[StatusDate]
,[Number]
,[PaySum]
 from gate.dbo.Payment with (nolock) where  StatusDate between '2020-12-01' and '2020-12-02' and ServiceID in (  990,991,998,999)
 and 
 len(CAST(ExtraParams.query('data(r/ai_subscriber_type)') as nvarchar)) <7
