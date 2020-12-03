USE [MMTShop]
GO

/****** Object:  StoredProcedure [dbo].[INSERT_PRODUCT_SP]    Script Date: 3.12.2020 21:49:28 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[INSERT_PRODUCT_SP]
	-- Add the parameters for the stored procedure here
	@SKU INT,
	@NAME VARCHAR(50),
	@DESCRIPTION VARCHAR(50),
	@PRICE DECIMAL (18,6),
	@CATEGORY_NAME VARCHAR(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
INSERT INTO [dbo].[Product]
           ([SKU]
           ,[Name]
           ,[Description]
           ,[Price])
     VALUES
           (@SKU
           ,@NAME
           ,@DESCRIPTION
           ,@PRICE)

INSERT INTO [dbo].[Category]
           ([Name]
           ,[SKU])
     VALUES
           (@CATEGORY_NAME
           ,@SKU)
END
GO


