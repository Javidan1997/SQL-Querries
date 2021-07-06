SELECT [ProviderDate] as PaymentCreateDate,
  CAST([PayFields].query('data(fields/field3)') as nvarchar) CardNumber,
    [AgentPaymentID] as AzerqazId, --CAST([PayFields].query('data(fields/field2)') as nvarchar) AzerqazId,--AgentPaymentID etdik cunki AzerqazID null olanlari var idi
    Number as GPG,
    [Status],
    [PaySum] as PayValue,
	ServiceID
    INTO May_2019.[dbo].AzerqazItronMWService
FROM [gate211].[dbo].[Payment] with (nolock)
where ServiceID = 175 and YEAR(StatusDate) = 2019 and MONTH(StatusDate) = 5 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'


SELECT [ProviderDate] as PaymentCreateDate,
  CAST([PayFields].query('data(fields/field3)') as nvarchar) CardNumber,
    [AgentPaymentID] as AzerqazId, --CAST([PayFields].query('data(fields/field2)') as nvarchar) AzerqazId,--AgentPaymentID etdik cunki AzerqazID null olanlari var idi
    Number as GPG,
    [Status],
    [PaySum] as PayValue,
	ServiceID
    INTO May_2019.[dbo].AzerqazItronMS
FROM [gate211].[dbo].[Payment] with (nolock)
where ServiceID in( 175 ,745 ) and YEAR(StatusDate) = 2019 and MONTH(StatusDate) = 5 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'

---------------- last ------------------
SELECT [ProviderDate] as PaymentCreateDate,
  CAST([PayFields].query('data(fields/field3)') as nvarchar) CardNumber,
    [AgentPaymentID] as AzerqazId, --CAST([PayFields].query('data(fields/field2)') as nvarchar) AzerqazId,--AgentPaymentID etdik cunki AzerqazID null olanlari var idi
    Number as GPG,
    [Status],
    [PaySum] as PayValue,
	ServiceID
    INTO iyul_2019.[dbo].AzerqazItron
FROM [gate211].[dbo].[Payment] with (nolock)
where ServiceID in( 175 ,745 ) 
and StatusDate Between '2019-07-01'and'2019-08-01'
 and
  CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'
