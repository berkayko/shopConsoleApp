USE [MMTShop]
GO

INSERT INTO [dbo].[Product]
           ([SKU]
           ,[Name]
           ,[Description]
           ,[Price])
     VALUES
           (1000
           ,'Sofa'
           ,'Furniture'
           ,256.20)

		   INSERT INTO [dbo].[Product]
           ([SKU]
           ,[Name]
           ,[Description]
           ,[Price])
     VALUES
           (2000
           ,'Table'
           ,'Garden Table'
           ,458.20)


	INSERT INTO [dbo].[Product]
           ([SKU]
           ,[Name]
           ,[Description]
           ,[Price])
     VALUES
           (3000
           ,'Xbox One'
           ,'Console'
           ,500.00)
		   	INSERT INTO [dbo].[Product]
           ([SKU]
           ,[Name]
           ,[Description]
           ,[Price])
     VALUES
           (4000
           ,'Bicycle'
           ,'Transport'
           ,700.60)
		   	INSERT INTO [dbo].[Product]
           ([SKU]
           ,[Name]
           ,[Description]
           ,[Price])
     VALUES
           (5000
           ,'Barbie'
           ,'Doll'
           ,700.60)
GO
select * from [dbo].[Product]

select * from dbo.Category

