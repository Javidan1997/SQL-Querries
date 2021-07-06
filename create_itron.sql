SELECT [ProviderDate] as PaymentCreateDate,
  CAST([PayFields].query('data(fields/field3)') as nvarchar) CardNumber,
    [AgentPaymentID] as AzerqazId, --CAST([PayFields].query('data(fields/field2)') as nvarchar) AzerqazId,--AgentPaymentID etdik cunki AzerqazID null olanlari var idi
    Number as GPG,
    [Status],
    [PaySum] as PayValue
    INTO Aprel2019.[dbo].AzerqazItronM
FROM [gate211].[dbo].[Payment] with (nolock)
where ServiceID = 175 and YEAR(StatusDate) = 2019 and MONTH(StatusDate) = 4 and CAST([ExtraParams].query('data(r/agt_id)') as nvarchar) <> '3'





SELECT sum(payvalue)
  FROM [Aprel2019].[dbo].[AzerqazItronM] where status =2;


select * from [AzerqazItronM] where [AzerqazId]='323480433' 


SELECT top 10 *
  FROM [Aprel2019].[dbo].itronall ;

select sum (try_convert(numeric(38, 12), [odeme_meblegi]) ) from itronall ;
