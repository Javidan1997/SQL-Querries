/****** Script for SelectTopNRows command from SSMS  ******/
SELECT 
	  month(statusdate) month
	  ,datename(dw,StatusDate) weekday
	  ,count(datename(dw,StatusDate)) count into [Iyul2020].[dbo].stat
  FROM [Iyul2020].[dbo].[statistika] 
  group by
	  month(statusdate) 
	  ,datename(dw,StatusDate) 
    
    
    
    /****** Script for SelectTopNRows command from SSMS  ******/
SELECT s.[StatusDate]
	  ,[hour]
	  ,s.[count]
	  ,st.month
	  ,st.weekday
	  ,st.[count]
  FROM [Iyul2020].[dbo].[houranalitics] s join
  [Iyul2020].[dbo].stat st on month(s.StatusDate)= st.[month]
      and datename(dw,StatusDate)=st.[weekday]
	  order by 1,2
  
  
  
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [StatusDate]
      ,[hour]
	  ,datename(dw,StatusDate) weekday
      ,[count]
  FROM [Iyul2020].[dbo].[houranalitics]
  order by 1,2
  
  
  /****** Script for SelectTopNRows command from SSMS  ******/
SELECT  convert(varchar(10),StatusDate,101) StatusDate,count(*)
  FROM [gate211].[dbo].[Payment] --where PayDate
  group by convert(varchar(10),StatusDate,101)
  order by 1
