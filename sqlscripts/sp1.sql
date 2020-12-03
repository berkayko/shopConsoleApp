USE [MMTShop]
GO

/****** Object:  StoredProcedure [dbo].[DELETE_PRODUCT_SP]    Script Date: 3.12.2020 21:48:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DELETE_PRODUCT_SP]
	-- Add the parameters for the stored procedure here
@SKU INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

DELETE FROM  dbo.Product where sku=@SKU
DELETE FROM  dbo.Category where sku=@SKU
END
GO


