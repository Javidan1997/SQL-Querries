SELECT count(*)
  FROM [Oktyabr202010].[dbo].[faberlik_millikart] where [REF_NR] not in (
  
  SELECT [REF_NR]
  FROM [Oktyabr202010].[dbo].[faberlik_millikart_12]
  )
