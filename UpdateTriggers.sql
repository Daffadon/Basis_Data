

--                                             QUERY UNTUK UPDATE

-- TABLE UNTUK CATEGORIES LOG
drop table CategoriesUpdateLog
CREATE TABLE [dbo].[CategoriesUpdateLog](
	[CategoryID] [int],
	[NewCategoryName] [nvarchar](15),
	[OldCategoryName] [nvarchar](15),
	[NewDescription] nvarchar(max) ,
	[OldDescription] nvarchar(max) ,
	[NewPicture] varbinary(max),
	[OldPicture] varbinary(max),
	Waktu_Update datetime)

select * from CategoriesUpdateLog

CREATE TRIGGER CaptureCategoriesUpdate 
ON dbo.Categories 
AFTER UPDATE
AS
BEGIN
	declare @categoryID int
	declare @NewCategoryName nvarchar(15)
	declare @NewDescription nvarchar(max)
	declare @NewPicture varbinary(max)
	declare @OldCategoryName nvarchar(15)
	declare @OldDescription nvarchar(max)
	declare @OldPicture varbinary(max)

	select @categoryID = inserted.CategoryID,
		   @NewCategoryName = inserted.CategoryName,
		   @NewDescription = inserted.Description,
		   @NewPicture = inserted.Picture
	from inserted

	select @OldCategoryName = deleted.CategoryName,
		   @OldDescription = deleted.Description,
		   @OldPicture = deleted.Picture
	from deleted

	insert into CategoriesUpdateLog 
	values(@categoryID, @NewCategoryName,@OldCategoryName,@NewDescription,@OldDescription,@NewPicture,@OldPicture,CURRENT_TIMESTAMP)
END

-- Karena cuman PK, APAKH BISA DIUPDATE????

CREATE TRIGGER CaptureCustomerCustomerDemoUpdate 
ON dbo.CustomerCustomerDemo 
AFTER UPDATE
AS
BEGIN

END

-- TABLE UNTUK CUSTOMER DEMOGRAPHIC UPDATE LOG

CREATE TABLE CustomerDemographicUpdateLog(
	CustomerTypeID nchar(10),
	NewCustomerDesc nvarchar(max),
	OldCustomerDesc nvarchar(max),
	Waktu_Update datetime
)

CREATE TRIGGER CaptureCustomerDemographicsUpdate 
ON dbo.CustomerDemographics 
AFTER UPDATE
AS
BEGIN
	declare @CustomerTypeID nchar(10)
	declare @NewCustomerDesc nvarchar(max)
	declare @OldCustomerDesc nvarchar(max)

	select @CustomerTypeID = inserted.CustomerTypeID,
		   @NewCustomerDesc = inserted.CustomerDesc
	from inserted
	select @OldCustomerDesc = deleted.CustomerDesc
	from deleted

	insert into CustomerDemographicsUpdateLog values(@CustomerTypeID, @NewCustomerDesc,@OldCustomerDesc,CURRENT_TIMESTAMP)
	
END


-- TABLE UNTUK LOG CUSTOMER UPDATE

CREATE TABLE [dbo].[CustomersUpdateLog](
	[CustomerID] [nchar](5) ,
	[NewCompanyName] [nvarchar](40),
	[OldCompanyName] [nvarchar](40),
	[NewContactName] [nvarchar](30),
	[OldContactName] [nvarchar](30),
	[NewContactTitle] [nvarchar](30),
	[OldContactTitle] [nvarchar](30),
	[NewAddress] [nvarchar](60) ,
	[OldAddress] [nvarchar](60), 
	[NewCity] [nvarchar](15) ,
	[OldCity] [nvarchar](15) ,
	[NewRegion] [nvarchar](15) ,
	[OldRegion] [nvarchar](15) ,
	[NewPostalCode] [nvarchar](10) ,
	[OldPostalCode] [nvarchar](10) ,
	[NewCountry] [nvarchar](15),
	[OldCountry] [nvarchar](15),
	[NewPhone] [nvarchar](24),
	[OldPhone] [nvarchar](24),
	[NewFax] [nvarchar](24) ,
	[OldFax] [nvarchar](24) ,
	Waktu_Update datetime
)

CREATE TRIGGER CaptureCustomersUpdate 
ON dbo.Customers 
AFTER UPDATE
AS
BEGIN
	declare @CustomerID [nchar](5)
	declare @NewCompanyName [nvarchar](40)
	declare @OldCompanyName [nvarchar](40)
	declare @NewContactName [nvarchar](30)
	declare @OldContactName [nvarchar](30)
	declare @NewContactTitle [nvarchar](30)
	declare @OldContactTitle [nvarchar](30)
	declare @NewAddress [nvarchar](60)
	declare @OldAddress [nvarchar](60) 
	declare @NewCity [nvarchar](15)
	declare @OldCity [nvarchar](15)
	declare @NewRegion [nvarchar](15)
	declare @OldRegion [nvarchar](15)
	declare @NewPostalCode [nvarchar](10)
	declare @OldPostalCode [nvarchar](10)
	declare @NewCountry [nvarchar](15)
	declare @OldCountry [nvarchar](15)
	declare @NewPhone [nvarchar](24)
	declare @OldPhone [nvarchar](24)
	declare @NewFax [nvarchar](24)
	declare @OldFax [nvarchar](24)

	select @CustomerID = inserted.CustomerID,
		   @NewCompanyName = inserted.CompanyName,
		   @NewContactName = inserted.ContactName,
		   @NewContactTitle = inserted.ContactTitle,
		   @NewAddress = inserted.Address,
		   @NewCity = inserted.City,
		   @NewRegion = inserted.Region,
		   @NewPostalCode = inserted.PostalCode,
		   @NewCountry = inserted.Country,
		   @NewPhone = inserted.Phone,
		   @NewFax = inserted.Fax
	from inserted

	select @CustomerID = d.CustomerID,
		   @OldCompanyName = d.CompanyName,
		   @OldContactName = d.ContactName,
		   @OldContactTitle = d.ContactTitle,
		   @OldAddress= d.Address,
		   @OldCity = d.City,
		   @OldRegion = d.Region,
		   @OldPostalCode = d.PostalCode,
		   @OldCountry = d.Country,
		   @OldPhone = d.Phone,
		   @OldFax = d.Fax
	from deleted d

	insert into CustomerUpdateLog
	values (@CustomerID,@NewCompanyName,@OldCompanyName,@NewContactName,@OldContactName,@NewContactTitle,@OldContactName,@NewAddress,@OldAddress,@NewCity,@OldCity,@NewRegion,@OldRegion,@NewPostalCode,@OldPostalCode,@NewCountry,@OldCountry,@NewPhone,@OldPhone,@NewFax,@OldFax)
END

CREATE TRIGGER CaptureEmployeesUpdate 
ON dbo.Employees 
AFTER UPDATE
AS
BEGIN

END

CREATE TRIGGER CaptureEmployeeTerritoriesUpdate 
ON dbo.EmployeeTerritories 
AFTER UPDATE
AS
BEGIN

END

CREATE TRIGGER CaptureOrder DetailsUpdate 
ON dbo.Order Details 
AFTER UPDATE
AS
BEGIN

END

CREATE TRIGGER CaptureOrdersUpdate 
ON dbo.Orders 
AFTER UPDATE
AS
BEGIN

END

CREATE TRIGGER CaptureProductsUpdate 
ON dbo.Products 
AFTER UPDATE
AS
BEGIN

END

CREATE TRIGGER CaptureRegionUpdate 
ON dbo.Region 
AFTER UPDATE
AS
BEGIN

END

CREATE TRIGGER CaptureShippersUpdate 
ON dbo.Shippers 
AFTER UPDATE
AS
BEGIN

END

CREATE TRIGGER CaptureSuppliersUpdate 
ON dbo.Suppliers 
AFTER UPDATE
AS
BEGIN

END

CREATE TRIGGER CaptureTerritoriesUpdate 
ON dbo.Territories 
AFTER UPDATE
AS
BEGIN

END