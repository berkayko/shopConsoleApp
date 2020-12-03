USE [MMTShop]
GO

INSERT INTO [dbo].[Category]
           ([Name]
           ,[SKU])
     VALUES
           ('Garden'
           ,2000)
		   
		   
	INSERT INTO [dbo].[Category]
           ([Name]
           ,[SKU])
     VALUES
           ('Home'
           ,1000)
	INSERT INTO [dbo].[Category]
           ([Name]
           ,[SKU])
     VALUES
           ('Electronics'
           ,3000)
		   
	INSERT INTO [dbo].[Category]
           ([Name]
           ,[SKU])
     VALUES
           ('Fitness'
           ,3000)
	INSERT INTO [dbo].[Category]
           ([Name]
           ,[SKU])
     VALUES
           ('Toys'
           ,3000)
GO

truncate table  dbo.Category

exec GET_PRODUCT_INFO_SP 2000


