USE [MMTShop]
GO

/****** Object:  StoredProcedure [dbo].[GET_CATEGORY_SP]    Script Date: 3.12.2020 21:48:52 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GET_CATEGORY_SP]
	-- Add the parameters for the stored procedure here
	@SKU INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  * FROM dbo.Category WHERE SKU=@SKU
END
GO


