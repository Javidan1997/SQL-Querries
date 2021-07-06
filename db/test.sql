USE [gate211]
GO

/****** Object:  StoredProcedure [dbo].[test]    Script Date: 6/1/2019 9:38:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE  PROCEDURE [dbo].[test] ( @PaymentID VARCHAR(100))

AS 

--update Aprel2019.dbo.Azerfon set status = 3 where PaymentID=@PaymentID;

print @PaymentID;


GO
