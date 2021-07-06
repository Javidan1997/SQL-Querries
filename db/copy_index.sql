USE [gate211]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[spCloneTableStructure]
		@SourceSchema = N'dbo',
		@SourceTable = N'Payment',
		@DestinationSchema = N'dbo',
		@DestinationTable = N'Paymentyeni',
		@RecreateIfExists = 1

SELECT	'Return Value' = @return_value

GO
