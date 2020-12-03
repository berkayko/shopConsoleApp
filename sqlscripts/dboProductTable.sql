USE [MMTShop]
GO

/****** Object:  Table [dbo].[Product]    Script Date: 3.12.2020 21:47:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Product](
	[SKU] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](50) NULL,
	[Price] [decimal](18, 2) NOT NULL
) ON [PRIMARY]
GO


