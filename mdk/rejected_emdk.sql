SELECT TOP 1000 PaymentID	,TransactionID,	CreateTime,	Number,	PayValue,	RevokeValue,
ServiceID,*
FROM [Main].[dbo].[Payment] with (nolock)
Where ServiceID in (1069,1070,1090,1091 ,1094 ,1095 ,1099 ,1100 ,1107 ,1108 )
and (StatusTime between '2020-11-01' and '2020-12-01') and CreateTime  between '2020-11-01' and '2020-12-01'
and RevokeStatus in (4,5);
