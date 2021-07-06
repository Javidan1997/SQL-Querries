SELECT nm.*,n.*
  FROM [yanvarsms2021].[dbo].[azercellm] nm
  full Join yanvarsms2021.dbo.[azercellall] n
  on n.[kodu ]= nm.number1 and insertdate between DATEADD(minute,-10,CONVERT(DATETIME, n.d, 103) )  and DATEADD(minute,10,CONVERT(DATETIME, n.d, 103) )
  where nm.[number1] is null or n.[kodu ] is null
order by 1
