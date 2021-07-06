/****** Script for SelectTopNRows command from SSMS  ******/
update [Main].[dbo].[Payment]
set status=3 , code = 300

  where PaymentID=459598125

---ugurlu etmek
update [Main].[dbo].[Payment]
set status=2 , code = 0

  where PaymentID=459598125
