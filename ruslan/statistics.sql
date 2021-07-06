SELECT  OsmpProviderID,count(*) count,day(StatusDate) day,servicename,ProviderName
  FROM gate.[dbo].[Payment] p with (nolock)
  left join gate.dbo.Service s
  on s.ServiceID=p.ServiceID
  left join gate.dbo.Provider pp
  on pp.ProviderID=s.ProviderID
   where StatusDate between '2021-02-01' and '2021-03-01' and
  p.serviceid in (746,993,176,561,564,567,604,721,746)
   --and PaySum=0
  group by OsmpProviderID,day(StatusDate),servicename,ProviderName
  order by 2
