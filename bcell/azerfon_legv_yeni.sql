SELECT TOP 1000 PaymentID	,TransactionID,	CreateTime,	Number,	PayValue,	RevokeValue

FROM [Main].[dbo].[Payment] with (nolock)
Where ServiceID in (1083,1084,1007,1119)
and (RevokeStatusTime between '2020-11-01' and '2020-12-01') and CreateTime not between '2020-11-01' and '2020-12-01'
and RevokeStatus in (4,5)
