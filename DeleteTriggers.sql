-- QUERY UNTUK UPDATE
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
	values (@CustomerID,@NewCompanyName,@OldCompanyName,@NewContactName,@OldContactName,@NewContactTitle,@OldContactName,@NewAddress,@OldAddress,@NewCity,@OldCity,@NewRegion,@OldRegion,@NewPostalCode,@OldPostalCode,@NewCountry,@OldCountry,@NewPhone,@OldPhone,@NewFax,@OldFax,CURRENT_TIMESTAMP)
END

--TABLE LOG UNTUK EMPLOYEES UPDATE
CREATE TABLE [dbo].[EmployeesUpdateLog](
	EmployeeID int,
	NewLastName nvarchar(20),
	OldLastName nvarchar(20),
	NewFirstName nvarchar(10),
	OldFirstName nvarchar(10),
	NewTitle nvarchar(30),
	OldTitle nvarchar(30),
	NewTitleOfCourtesy nvarchar(25),
	OldTitleOfCourtesy nvarchar(25),
	NewBirthDate datetime,
	OldBirthDate datetime,
	NewHireDate datetime,
	OldHireDate datetime,
	NewAddress nvarchar(60),
	OldAddress nvarchar(60),
	NewCity nvarchar(15),
	OldCity nvarchar(15),
	NewRegion nvarchar(15),
	OldRegion nvarchar(15),
	NewPostalCode nvarchar(10),
	OldPostalCode nvarchar(10),
	NewCountry nvarchar(15),
	OldCountry nvarchar(15),
	NewHomePhone nvarchar(24),
	OldHomePhone nvarchar(24),
	NewExtension nvarchar(4),
	OldExtension nvarchar(4),
	NewPhoto varbinary(max),
	OldPhoto varbinary(max),
	NewNotes nvarchar(max),
	OldNotes nvarchar(max),
	NewReportsTo int,
	OldReportsTo int,
	NewPhotoPath nvarchar(255),
	OldPhotoPath nvarchar(255),
	Waktu_Update datetime
)

CREATE TRIGGER CaptureEmployeesUpdate
ON dbo.Employees
AFTER UPDATE
AS
BEGIN
	declare @EmployeeID int
	declare @OldLastName nvarchar(20)
	declare @NewLastName nvarchar(20)
	declare @OldFirstName nvarchar(10)
	declare @NewFirstName nvarchar(10)
	declare @OldTitle nvarchar(30)
	declare @NewTitle nvarchar(30)
	declare @OldTitleOfCourtesy nvarchar(25)
	declare @NewTitleOfCourtesy nvarchar(25)
	declare @OldBirthDate datetime
	declare @NewBirthDate datetime
	declare @OldHireDate datetime
	declare @NewHireDate datetime
	declare @OldAddress nvarchar(60)
	declare @NewAddress nvarchar(60)
	declare @OldCity nvarchar(15)
	declare @NewCity nvarchar(15)
	declare @OldRegion nvarchar(15)
	declare @NewRegion nvarchar(15)
	declare @OldPostalCode nvarchar(10)
	declare @NewPostalCode nvarchar(10)
	declare @OldCountry nvarchar(15)
	declare @NewCountry nvarchar(15)
	declare @OldHomePhone nvarchar(24)
	declare @NewHomePhone nvarchar(24)
	declare @OldExtension nvarchar(4)
	declare @NewExtension nvarchar(4)
	declare @OldPhoto varbinary(max)
	declare @NewPhoto varbinary(max)
	declare @OldNotes nvarchar(max)
	declare @NewNotes nvarchar(max)
	declare @OldReportsTo int
	declare @NewReportsTo int
	declare @OldPhotoPath nvarchar(255)
	declare @NewPhotoPath nvarchar(255)

	select	@EmployeeID = inserted.EmployeeID,
			@NewLastName = inserted.LastName,
			@NewFirstName = inserted.FirstName,
			@NewTitle = inserted.Title,
			@NewTitleOfCourtesy = inserted.TitleOfCourtesy,
			@NewBirthDate = inserted.BirthDate,
			@NewHireDate = inserted.HireDate,
			@NewAddress = inserted.Address,
			@NewCity = inserted.City,
			@NewRegion = inserted.Region,
			@NewPostalCode = inserted.PostalCode,
			@NewCountry = inserted.Country,
			@NewHomePhone = inserted.HomePhone,
			@NewExtension = inserted.Extension,
			@NewPhoto = inserted.Photo,
			@NewNotes = inserted.Notes,
			@NewReportsTo = inserted.ReportsTo,
			@NewPhotoPath = inserted.PhotoPath
	 from inserted

	select	@EmployeeID = d.EmployeeID,
			@OldLastName = d.LastName,
			@OldFirstName = d.FirstName,
			@OldTitle = d.Title,
			@OldTitleOfCourtesy = d.TitleOfCourtesy,
			@OldBirthDate = d.BirthDate,
			@OldHireDate = d.HireDate,
			@OldAddress = d.Address,
			@OldCity = d.City,
			@OldRegion = d.Region,
			@OldPostalCode = d.PostalCode,
			@OldCountry = d.Country,
			@OldHomePhone = d.HomePhone,
			@OldExtension = d.Extension,
			@OldPhoto = d.Photo,
			@OldNotes = d.Notes,
			@OldReportsTo = d.ReportsTo,
			@OldPhotoPath = d.PhotoPath
	 from deleted d

	insert into EmployeesUpdateLog
	values(@EmployeeID,@NewLastName,@OldLastName,@NewFirstName,@OldFirstName,@NewTitle,@OldTitle,@NewTitleOfCourtesy,@OldTitleOfCourtesy,@NewBirthDate,@OldBirthDate,@NewHireDate,@OldHireDate,@NewAddress,@OldAddress,@NewCity,@OldCity,@NewRegion,@OldRegion,@NewPostalCode,@OldPostalCode,@NewCountry,@OldCountry,@NewHomePhone,@OldHomePhone,@NewExtension,@OldExtension,@NewPhoto,@OldPhoto,@NewNotes,@OldNotes,@NewReportsTo,@OldReportsTo,@NewPhotoPath,@OldPhotoPath,CURRENT_TIMESTAMP)
END

CREATE TRIGGER CaptureEmployeeTerritoriesUpdate
ON dbo.EmployeeTerritories
AFTER UPDATE
AS
BEGIN
	declare @OldEmployeeID int
	declare @NewEmployeeID int
	declare @OldTerritoryID nvarchar(20)
	declare @NewTerritoryID nvarchar(20)
	declare @Waktu_Update datetime

	select	@NewEmployeeID = inserted.EmployeeID,
			@NewTerritoryID = inserted.TerritoryID
	from inserted

	select	@OldEmployeeID = d.EmployeeID,
			@OldTerritoryID = d.TerritoryID
	from deleted d

	insert into EmployeeTerriroriesUpdateLog
	values(@NewEmployeeID,@OldEmployeeID,@NewTerritoryID,@OldTerritoryID,CURRENT_TIMESTAMP)

CREATE TRIGGER CaptureOrderDetailsUpdate
ON dbo.[Order Details]
AFTER UPDATE
AS
BEGIN
	declare @OrderID int
	declare @ProductID int
	declare @OldUnitPrice money
	declare @NewUnitPrice money
	declare @OldQuantity smallint
	declare @NewQuantity smallint
	declare @OldDiscount real
	declare @NewDiscount real

	select	@OrderID = inserted.OrderID,
			@ProductID = inserted.ProductID,
			@NewUnitPrice = inserted.UnitPrice,
			@NewQuantity = inserted.Quantity,
			@NewDiscount = inserted.Discount
	 from inserted
		
	select	@OrderID = d.OrderID,
			@ProductID = d.ProductID,
			@OldUnitPrice = d.UnitPrice,
			@OldQuantity = d.Quantity,
			@OldDiscount = d.Discount
	 from deleted d

	insert into OrderDetailsUpdateLog
	values(@OrderID,@ProductID,@NewUnitPrice,@OldUnitPrice,@NewQuantity,@OldQuantity,@NewDiscount,@OldDiscount,CURRENT_TIMESTAMP)
END

CREATE TRIGGER CaptureOrdersUpdate
ON dbo.Orders
AFTER UPDATE
AS
BEGIN
	declare OrderID int
	declare @OldCustomerID nchar(5)
	declare @NewCustomerID nchar(5)
	declare @OldEmployeeID int
	declare @NewEmployeeID int
	declare @OldOrderDate datetime
	declare @NewOrderDate datetime
	declare @OldRequiredDate datetime
	declare @NewRequiredDate datetime
	declare @OldShippedDate datetime
	declare @NewShippedDate datetime
	declare @OldShipVia int
	declare @NewShipVia int
	declare @OldFreight money
	declare @NewFreight money
	declare @OldShipName nvarchar(40)
	declare @NewShipName nvarchar(40)
	declare @OldShipAddress nvarchar(60)
	declare @NewShipAddress nvarchar(60)
	declare @OldShipCity nvarchar(15)
	declare @NewShipCity nvarchar(15)
	declare @OldShipRegion nvarchar(15)
	declare @NewShipRegion nvarchar(15)
	declare @OldShipPostalCode nvarchar(10)
	declare @NewShipPostalCode nvarchar(10)
	declare @OldShipCountry nvarchar(15)
	declare @NewShipCountry nvarchar(15)
	declare @Waktu_Update datetime
		
	select	@OrderID = inserted.OrderID,
			@NewCustomerID = inserted.CustomerID,
			@NewEmployeeID = inserted.EmployeeID,
			@NewOrderDate = inserted.OrderDate,
			@NewRequiredDate = inserted.RequiredDate,
			@NewShippedDate = inserted.ShippedDate,
			@NewShipVia = inserted.ShipVia,
			@NewFreight = inserted.Freight,
			@NewShipName = inserted.ShipName,
			@NewShipAddress = inserted.ShipAddress,
			@NewShipCity = inserted.ShipCity,
			@NewShipRegion = inserted.ShipRegion,
			@NewShipPostalCode = inserted.ShipPostalCode,
			@NewShipCountry = inserted.ShipCountry
	 from inserted

	select	@OrderID = d.OrderID
			@OldCustomerID = d.CustomerID,
			@OldEmployeeID = d.EmployeeID,
			@OldOrderDate = d.OrderDate,
			@OldRequiredDate = d.RequiredDate,
			@OldShippedDate = d.ShippedDate,
			@OldShipVia = d.ShipVia,
			@OldFreight = d.Freight,
			@OldShipName = d.ShipName,
			@OldShipAddress = d.ShipAddress,
			@OldShipCity = d.ShipCity,
			@OldShipRegion = d.ShipRegion,
			@OldShipPostalCode = d.ShipPostalCode,
			@OldShipCountry = d.ShipCountry
	 from deleted d

	insert into OrdersUpdateLog
	values(OrderID,@NewCustomerID,@OldCustomerID,@NewEmployeeID,@OldEmployeeID,@NewOrderDate,@OldOrderDate,@NewRequiredDate,@OldRequiredDate,@NewShippedDate,@OldShippedDate,@NewShipVia,@OldShipVia,@NewFreight,@OldFreight,@NewShipName,@OldShipName,@NewShipAddress,@OldShipAddress,@NewShipCity,@OldShipCity,@NewShipRegion,@OldShipRegion,@NewShipPostalCode,@OldShipPostalCode,@NewShipCountry,@OldShipCountry,CURRENT_TIMESTAMP)


CREATE TRIGGER CaptureProductsUpdate
ON dbo.Products
AFTER UPDATE
AS
BEGIN
	declare @ProductID int
	declare @OldProductName nvarchar(40)
	declare @NewProductName nvarchar(40)
	declare @OldSupplierID int
	declare @NewSupplierID int
	declare @OldCategoryID int
	declare @NewCategoryID int
	declare @OldQuantityPerUnit nvarchar(20)
	declare @NewQuantityPerUnit nvarchar(20)
	declare @OldUnitPrice money
	declare @NewUnitPrice money
	declare @OldUnitsInStock smallint
	declare @NewUnitsInStock smallint
	declare @OldUnitsOnOrder smallint
	declare @NewUnitsOnOrder smallint
	declare @OldReorderLevel smallint
	declare @NewReorderLevel smallint
	declare @OldDiscontinued bit
	declare @NewDiscontinued bit

	select	@ProductID = inserted.ProductID
			@NewProductName = inserted.ProductName,
			@NewSupplierID = inserted.SupplierID,
			@NewCategoryID = inserted.CategoryID,
			@NewQuantityPerUnit = inserted.QuantityPerUnit,
			@NewUnitPrice = inserted.UnitPrice,
			@NewUnitsInStock = inserted.UnitsInStock,
			@NewUnitsOnOrder = inserted.UnitsOnOrder,
			@NewReorderLevel = inserted.ReorderLevel,
			@NewDiscontinued = inserted.Discontinued
	 from inserted

	select	@ProductID = d.ProductID
			@OldProductName = d.ProductName,
			@OldSupplierID = d.SupplierID,
			@OldCategoryID = d.CategoryID,
			@OldQuantityPerUnit = d.QuantityPerUnit,
			@OldUnitPrice = d.UnitPrice,
			@OldUnitsInStock = d.UnitsInStock,
			@OldUnitsOnOrder = d.UnitsOnOrder,
			@OldReorderLevel = d.ReorderLevel,
			@OldDiscontinued = d.Discontinued
	 from deleted d

	insert into ProductsUpdateLog
	values(@ProductID,@NewProductName,@OldProductName,@NewSupplierID,@OldSupplierID,@NewCategoryID,@OldCategoryID,@NewQuantityPerUnit,@OldQuantityPerUnit,@NewUnitPrice,@OldUnitPrice,@NewUnitsInStock,@OldUnitsInStock,@NewUnitsOnOrder,@OldUnitsOnOrder,@NewReorderLevel,@OldReorderLevel,@NewDiscontinued,@OldDiscontinued,CURRENT_TIMESTAMP)
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
