SELECT nm.*,n.*
  FROM [yanvarsms2021].[dbo].bakcellm nm
  full Join yanvarsms2021.dbo.bakcell n
  on n.[number]= nm.number1 and insertdate between DATEADD(minute,-10,CONVERT(DATETIME, n.[Done Date ], 103) )  and DATEADD(minute,10,CONVERT(DATETIME, n.[Done Date ], 103) )
  where nm.[number1] is null or n.number is null
  order by 1
  
