USE [MMTShop]
GO

/****** Object:  StoredProcedure [dbo].[UPDATE_PRODUCT_SP]    Script Date: 3.12.2020 21:49:38 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UPDATE_PRODUCT_SP]
	-- Add the parameters for the stored procedure here
	@SKU INT,
	@NAME VARCHAR(50),
	@DESCRIPTION VARCHAR(50),
	@PRICE DECIMAL (18,6),
	@CATEGORY_NAME VARCHAR(50),
	@SKU_EX INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
UPDATE [dbo].[Product]
   SET [SKU] = @SKU
      ,[Name] = @NAME
      ,[Description] = @DESCRIPTION
      ,[Price] = @PRICE
 WHERE SKU=@SKU_EX

IF @SKU<>@SKU_EX
BEGIN
 DELETE FROM dbo.Category WHERE SKU=@SKU_EX
 INSERT INTO [dbo].[Category]
           ([Name]
           ,[SKU])
     VALUES
           (@CATEGORY_NAME
           ,@SKU)
END
END
GO


