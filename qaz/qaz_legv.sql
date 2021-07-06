select * from Main.dbo.Payment where ServiceID in (
2037,
1110,
1
)
and (RevokeStatusTime between '2020-12-01' and '2021-01-01') and CreateTime  between  '2020-12-01' and '2021-01-01'
and RevokeStatus in (4,5)
