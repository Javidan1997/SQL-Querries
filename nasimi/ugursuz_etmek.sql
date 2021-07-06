USE [gate]
GO
begin tran

-- TODO: Set parameter values here.

EXECUTE [dbo].[CSModifyPayment] @CSUserID=1037,@CSRoleID=1,@Status=3,@Code=200,@GateStatus=8,@PaymentID=292069351



GO
commit
/*
select * from Payment where agentID=1 and AgentPaymentID in
(440935389)
*/
