USE [MMTShop]
GO

/****** Object:  StoredProcedure [dbo].[GET_PRODUCT_INFO_SP]    Script Date: 3.12.2020 21:49:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GET_PRODUCT_INFO_SP]
	-- Add the parameters for the stored procedure here
	 @SKU INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  [SKU]
      ,[Name]
      ,[Description]
      ,[Price]
  FROM [dbo].[Product] WHERE SKU<@SKU
END
GO


