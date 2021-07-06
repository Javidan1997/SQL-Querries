Use Main
go
DECLARE @RollBack Bit SET @RollBack = 0
DECLARE @SendPointMessages BIT SET @SendPointMessages = 0
DECLARE @Pid BigInt
DECLARE @UserID Int SELECT @UserID = COALESCE((SELECT UserID FROM [User] WHERE Login = 'nseyidov'),39)
DECLARE @CorrectionTransferID BigInt
SELECT @CorrectionTransferID = COALESCE(MAX(TransactionID),0) + 1 FROM Transfer WHERE TransferType = 4
DECLARE PayUpdCur CURSOR FAST_FORWARD READ_ONLY FOR
SELECT PaymentID
From Payment where PaymentID in (
466939214
)
OPEN PayUpdCur
FETCH NEXT FROM PayUpdCur INTO @Pid
WHILE @@FETCH_STATUS = 0
BEGIN
BEGIN TRAN
DECLARE @TransactionID Decimal(20,0), @TransferType Int,
@FromContractorType TinyInt, @FromContractorID Int, @FromAccountType TinyInt,
@ToContractorType TinyInt, @ToContractorID Int, @ToAccountType TinyInt,
@ChangeAccountTypeDealerID Int, @BaseOnPaymentDealerID Int, @PaymentDealerValueType TINYINT,
@Amount Decimal(18,6), @Comment NVarChar(MAX)
DECLARE Cur CURSOR FOR

-- Отмена отмены платежей...
SELECT NULL AS TransactionID, 4 AS TransferType,
MAX(CASE WHEN ToIsTransit = 0 THEN ToContractorType ELSE NULL END) AS FromContractorType,
MAX(CASE WHEN ToIsTransit = 0 THEN ToContractorID ELSE NULL END) AS FromContractorID,
MAX(CASE WHEN ToIsTransit = 0 THEN ToAccountType ELSE NULL END) AS FromAccountType,
MAX(CASE WHEN FromIsTransit = 0 THEN FromContractorType ELSE NULL END) AS ToContractorType,
MAX(CASE WHEN FromIsTransit = 0 THEN FromContractorID ELSE NULL END) AS ToContractorID,
MAX(CASE WHEN FromIsTransit = 0 THEN FromAccountType ELSE NULL END) AS ToAccountType,
MAX(CASE WHEN FromContractorType = ToContractorType AND FromContractorID = ToContractorID AND FromAccountType <> ToAccountType THEN FromContractorID ELSE NULL END) AS ChangeAccountTypeDealerID,
MAX(CASE WHEN Transfer.TransferType IN (112,122,130) THEN TransactionID ELSE NULL END) AS BaseOnPaymentDealerID,
MAX(CASE WHEN Transfer.TransferType IN (112,122) THEN 1 WHEN Transfer.TransferType IN (130) THEN 2 ELSE NULL END) AS PaymentDealerValueType,
MAX(CASE WHEN Transfer.TransferType NOT IN (112,122,130) THEN Amount ELSE NULL END) AS Amount,
'Платеж ' + CAST(TransactionID AS NVarChar(MAX)) + ' (' + CAST(TransferType AS NVARCHAR(10)) + ')' AS Comment
FROM Transfer
INNER JOIN TransferType ON Transfer.TransferType = TransferType.TransferTypeID
WHERE TransactionID IN (@Pid)
AND Transfer.TransferType NOT IN (10,11,5,15,19,30)
AND TransferType.TranIDIsPayID = 1
GROUP BY TransactionID, TransferType

UPDATE Payment SET Status = 2, StatusTime = GETDATE(), Code = 0, RevokeStatus = 3, RevokeStatusTime = GETDATE() WHERE PaymentID = @Pid

OPEN Cur
FETCH NEXT FROM Cur INTO @TransactionID, @TransferType,
@FromContractorType, @FromContractorID, @FromAccountType,
@ToContractorType, @ToContractorID, @ToAccountType,
@ChangeAccountTypeDealerID, @BaseOnPaymentDealerID, @PaymentDealerValueType,
@Amount, @Comment

DECLARE @TransferTable TABLE (TransactionID Decimal(20,0), TransferType Int)
WHILE @@FETCH_STATUS = 0
BEGIN
DECLARE @iReturn int

IF @TransactionID IS NULL
SET @TransactionID = @CorrectionTransferID
EXEC @iReturn = [dbo].[SysCreateTransfer]
@TransactionID = @TransactionID,
@TryNr = 1,
@TransferType = @TransferType,
@FromContractorType = @FromContractorType,
@FromContractorID = @FromContractorID,
@FromAccountType = @FromAccountType,
@ToContractorType = @ToContractorType,
@ToContractorID = @ToContractorID,
@ToAccountType = @ToAccountType,
@Amount = @Amount,
@BaseOnPaymentDealerID = @BaseOnPaymentDealerID,
@PaymentDealerValueType = @PaymentDealerValueType,
--@PaymentDealerValueType = NULL,
@ChangeAccountTypeDealerID = @ChangeAccountTypeDealerID,
@UserID = @UserID, --10973962(RU)
@LinkedID = NULL,
@Comment = @Comment,
@Debug = 0
IF @iReturn <> 0 SELECT @iReturn AS iReturn, @Amount AS Amount, @Comment AS Comment
ELSE
INSERT INTO @TransferTable (TransactionID, TransferType) VALUES (@TransactionID, @TransferType)

IF @TransactionID = @CorrectionTransferID
SET @CorrectionTransferID = @CorrectionTransferID + 1

FETCH NEXT FROM Cur INTO @TransactionID, @TransferType,
@FromContractorType, @FromContractorID, @FromAccountType,
@ToContractorType, @ToContractorID, @ToAccountType,
@ChangeAccountTypeDealerID, @BaseOnPaymentDealerID, @PaymentDealerValueType,
@Amount, @Comment
END
CLOSE Cur
DEALLOCATE Cur
--SELECT TransactionID, MAX(Amount),
-- MAX(CASE WHEN FromIsShare = 1 THEN FromContractorID ELSE NULL END),
-- MAX(CASE WHEN ToIsShare = 1 THEN ToContractorID ELSE NULL END)
--FROM Transfer
--WHERE FromContractorID IN (SELECT DealerID FROM dbo.DealerChilds_All() WHERE BaseID IN (13,14))
-- AND TransferType IN (13,113)
--GROUP BY TransactionID
--HAVING MIN(TransferType) = MAX(TransferType)
IF @SendPointMessages = 1
BEGIN
DECLARE @pmLogin NVARCHAR(250) SET @pmLogin = 'DragonMaster'
DECLARE @pmPasswordMD5 NVARCHAR(250) SELECT @pmPasswordMD5 = PasswordMD5 FROM [User] WHERE Login = @pmLogin
DECLARE @pmDealerID INT, @pmAmount DECIMAL(18,6), @pmAccountType TINYINT, @pmComment NVARCHAR(MAX)

DECLARE PointMessageCur CURSOR FAST_FORWARD READ_ONLY FOR
SELECT DealerID, AccountType, SUM(Amount) AS Amount, MAX(Comment)
FROM (
SELECT TransactionID, TransferType, FromContractorID AS DealerID, FromAccountType AS AccountType, -1*Amount AS Amount, Comment
FROM Transfer
WHERE FromContractorType = 1
UNION ALL
SELECT TransactionID, TransferType, ToContractorID AS DealerID, ToAccountType AS AccountType, Amount, Comment
FROM Transfer
WHERE ToContractorType = 1
) AS Transfer
INNER JOIN @TransferTable AS TransferTable ON Transfer.TransactionID = TransferTable.TransactionID
AND Transfer.TransferType = TransferTable.TransferType
GROUP BY Transfer.TransactionID, Transfer.TransferType, Transfer.DealerID, Transfer.AccountType
HAVING SUM(Amount) <> 0

OPEN PointMessageCur

FETCH NEXT FROM PointMessageCur INTO @pmDealerID, @pmAccountType, @pmAmount, @pmComment

WHILE @@FETCH_STATUS = 0
BEGIN
IF COALESCE(CAST(dbo.GetEffectiveAttributeValue_Dealer(@pmDealerID,'PointMessage_SendDealerPointMessages') AS BIT),0) = 1
BEGIN
DECLARE @PointMessageID INT, @PointMessageName NVARCHAR(250)
SELECT @PointMessageName = CASE WHEN @pmAccountType = 1 THEN 'Корректировка баланса' WHEN @pmAccountType = 2 THEN 'Корректировка депозита' END +
'. Сумма: ' + CAST(@pmAmount AS NVARCHAR(50)) + '. Комментарий: ' + @pmComment
EXEC @iReturn = [dbo].[CreatePointMessage]
@Login = @pmLogin,
@PasswordMD5 = @pmPasswordMD5,
@PointMessageType = 1,
@PointMessageName = @PointMessageName,
@PointMessageID = @PointMessageID OUTPUT,
@Enabled = 1
IF @iReturn <> 0
SELECT 'ошибка CreatePointMessage' + CAST(@iReturn AS NVARCHAR(50))

EXEC @iReturn = [dbo].[AssignPointMessage]
@Login = @pmLogin,
@PasswordMD5 = @pmPasswordMD5,
@PointMessageID = @PointMessageID,
@DealerID = @pmDealerID,
@IsDealerPointMessage = 1
IF @iReturn <> 0
SELECT 'ошибка AssignPointMessage' + CAST(@iReturn AS NVARCHAR(50))
END
FETCH NEXT FROM PointMessageCur INTO @pmDealerID, @pmAccountType, @pmAmount, @pmComment
END

CLOSE PointMessageCur
DEALLOCATE PointMessageCur
END
IF @RollBack = 1
BEGIN
ROLLBACK TRAN
SELECT 'ROLLBACKED'
END
ELSE
BEGIN
COMMIT TRAN
SELECT 'COMMITED!!!'
END

FETCH NEXT FROM PayUpdCur INTO @Pid
END
CLOSE PayUpdCur
DEALLOCATE PayUpdCur
