-- TABLE UNTUK LOG DELETE PADA CATEGORIES
CREATE TABLE CategoriesDeleteLog(
	[CategoryID] [int],
	[CategoryName] [nvarchar](15),
	[Description] NVARCHAR(MAX),
	[Picture] VARBINARY(MAX),
	WAKTU_DELETE datetime
)

DROP TABLE CategoriesDeleteLog

-- TRIGGER DELETE UNTUK CATEGORIES
CREATE TRIGGER CaptureCategoriesDelete
ON dbo.Categories
AFTER DELETE
AS
BEGIN
	declare @CategoryID int
	declare @CategoryName nvarchar(15)
	declare @Description nvarchar(max)
	declare @Picture VARBINARY(MAX)
	declare @WAKTU_DELETE datetime

	SELECT	@CategoryID = deleted.CategoryID,
			@CategoryName = deleted.CategoryName,
			@Description = deleted.Description,
			@Picture = deleted.Picture
	FROM deleted

	insert into CategoriesDeleteLog(CategoryID,CategoryName,Description,Picture,WAKTU_DELETE)
	values(@CategoryID,@CategoryName,@Description,@Picture,CURRENT_TIMESTAMP)
END

-- TABLE UNTUK LOG DELETE PADA EMPLOYEE
CREATE TABLE EmployeesDeleteLog(
	EmployeeID int,
	LastName nvarchar(20),
	FirstName nvarchar(10),
	Title nvarchar(30),
	TitleOfCourtesy nvarchar(25),
	BirthDate datetime,
	HireDate datetime,
	Address nvarchar(60),
	City nvarchar(15),
	Region nvarchar(15),
	PostalCode nvarchar(10),
	Country nvarchar(15),
	HomePhone nvarchar(24),
	Extension nvarchar(4),
	Photo VARBINARY(MAX),
	Notes NVARCHAR(MAX),
	ReportsTo int,
	PhotoPath nvarchar(255),
	Waktu_delete datetime
)


-- TRIGGER DELETE UNTUK EMPLOYEE
CREATE TRIGGER CaptureEmployeesDelete
ON dbo.Employees
AFTER DELETE
AS
BEGIN
	declare @EmployeeID int
	declare @LastName nvarchar(20)
	declare @FirstName nvarchar(10)
	declare @Title nvarchar(30)
	declare @TitleOfCourtesy nvarchar(25)
	declare @BirthDate datetime
	declare @HireDate datetime
	declare @Address nvarchar(60)
	declare @City nvarchar(15)
	declare @Region nvarchar(15)
	declare @PostalCode nvarchar(10)
	declare @Country nvarchar(15)
	declare @HomePhone nvarchar(24)
	declare @Extension nvarchar(4)
	declare @Photo VARBINARY(MAX)
	declare @Notes NVARCHAR(MAX)
	declare @ReportsTo int
	declare @PhotoPath nvarchar(255)
	declare @Waktu_delete datetime


	SELECT	@EmployeeID = deleted.EmployeeID,
			@LastName = deleted.LastName,
			@FirstName = deleted.FirstName,
			@Title = deleted.Title,
			@TitleOfCourtesy = deleted.TitleOfCourtesy,
			@BirthDate = deleted.BirthDate,
			@HireDate = deleted.HireDate,
			@Address = deleted.Address,
			@City = deleted.City,
			@Region = deleted.Region,
			@PostalCode = deleted.PostalCode,
			@Country = deleted.Country,
			@HomePhone = deleted.HomePhone,
			@Extension = deleted.Extension,
			@Photo = deleted.Photo,
			@Notes = deleted.Notes,
			@ReportsTo = deleted.ReportsTo,
			@PhotoPath = deleted.PhotoPath

	FROM deleted

	insert into EmployeesDeleteLog(EmployeeID,LastName,FirstName,Title,TitleOfCourtesy,BirthDate,HireDate,Address,City,Region,PostalCode,Country,HomePhone,Extension,Photo,Notes,ReportsTo,PhotoPath,Waktu_delete)
	values (@EmployeeID,@LastName,@FirstName,@Title,@TitleOfCourtesy,@BirthDate,@HireDate,@Address,@City,@Region,@PostalCode,@Country,@HomePhone,@Extension,@Photo,@Notes,@ReportsTo,@PhotoPath,CURRENT_TIMESTAMP)
END


-- TABLE UNTUK LOG DELETE PADA ORDER DETAILS
CREATE TABLE OrderDetailsDeleteLog(
	[OrderID] [int],
	[ProductID] [int],
	[UnitPrice] [money],
	[Quantity] [smallint],
	[Discount] [real],
	WAKTU_DELETE datetime
)

-- TRIGGER DELETE UNTUK ORDER DETAILS
CREATE TRIGGER CaptureOrderDetailsDelete
ON [Order Details]
AFTER DELETE
AS
BEGIN
	declare @OrderID int
	declare @ProductID int
	declare @UnitPrice money
	declare @Quantity smallint
	declare @Discount real
	declare @WAKTU_DELETE datetime

	SELECT	@OrderID = deleted.OrderID,
			@ProductID = deleted.ProductID,
			@UnitPrice = deleted.UnitPrice,
			@Quantity = deleted.Quantity,
			@Discount = deleted.Discount
	FROM deleted

	insert into OrderDetailsDeleteLog(OrderID,ProductID,UnitPrice,Quantity,Discount,WAKTU_DELETE)
	values(@OrderID,@ProductID,@UnitPrice,@Quantity,@Discount,CURRENT_TIMESTAMP)
END

-- TABLE UNTUK LOG PADA ORDERS
CREATE TABLE OrdersDeleteLog(
	[OrderID] [int],
	[CustomerID] [nchar](5),
	[EmployeeID] [int],
	[OrderDate] [datetime],
	[RequiredDate] [datetime],
	[ShippedDate] [datetime],
	[ShipVia] [int],
	[Freight] [money],
	[ShipName] [nvarchar](40),
	[ShipAddress] [nvarchar](60),
	[ShipCity] [nvarchar](15),
	[ShipRegion] [nvarchar](15),
	[ShipPostalCode] [nvarchar](10),
	[ShipCountry] [nvarchar](15),
	WAKTU_DELETE datetime
)

CREATE TRIGGER CaptureOrdersDelete
ON Orders
AFTER DELETE
AS
BEGIN
	declare @OrderID int
	declare @CustomerID nchar(5)
	declare @EmployeeID int
	declare @OrderDate datetime
	declare @RequiredDate datetime
	declare @ShippedDate datetime
	declare @ShipVia int
	declare @Freight money
	declare @ShipName nvarchar(40)
	declare @ShipAddress nvarchar(60)
	declare @ShipCity nvarchar(15)
	declare @ShipRegion nvarchar(15)
	declare @ShipPostalCode nvarchar(10)
	declare @ShipCountry nvarchar(15)
	declare @WAKTU_DELETE datetime

	SELECT	@OrderID = deleted.OrderID,
			@CustomerID = deleted.CustomerID,
			@EmployeeID = deleted.EmployeeID,
			@OrderDate = deleted.OrderDate,
			@RequiredDate = deleted.RequiredDate,
			@ShippedDate = deleted.ShippedDate,
			@ShipVia = deleted.ShipVia,
			@Freight = deleted.Freight,
			@ShipName = deleted.ShipName,
			@ShipAddress = deleted.ShipAddress,
			@ShipCity = deleted.ShipCity,
			@ShipRegion = deleted.ShipRegion,
			@ShipPostalCode = deleted.ShipPostalCode,
			@ShipCountry = deleted.ShipCountry
	FROM deleted

	insert into OrdersDeleteLog(OrderID,CustomerID,EmployeeID,OrderDate,RequiredDate,ShippedDate,ShipVia,Freight,ShipName,ShipAddress,ShipCity,ShipRegion,ShipPostalCode,ShipCountry,WAKTU_DELETE)
	values(@OrderID,@CustomerID,@EmployeeID,@OrderDate,@RequiredDate,@ShippedDate,@ShipVia,@Freight,@ShipName,@ShipAddress,@ShipCity,@ShipRegion,@ShipPostalCode,@ShipCountry,CURRENT_TIMESTAMP)

END

-- TABLE DELETE UNTUK PRODUCTS
CREATE TABLE ProductsDeleteLog(
	[ProductID] [int],
	[ProductName] [nvarchar](40),
	[SupplierID] [int],
	[CategoryID] [int],
	[QuantityPerUnit] [nvarchar](20),
	[UnitPrice] [money],
	[UnitsInStock] [smallint],
	[UnitsOnOrder] [smallint],
	[ReorderLevel] [smallint],
	[Discontinued] [bit],
	WAKTU_DELETE datetime
)

--TRIGGER DELETE UNTUK PRODUCTS
CREATE TRIGGER CaptureProductsDelete
ON Products
AFTER DELETE
AS
BEGIN
	declare @ProductID int
	declare @ProductName nvarchar(40)
	declare @SupplierID int
	declare @CategoryID int
	declare @QuantityPerUnit nvarchar(20)
	declare @UnitPrice money
	declare @UnitsInStock smallint
	declare @UnitsOnOrder smallint
	declare @ReorderLevel smallint
	declare @Discontinued bit
	declare @WAKTU_DELETE datetime

	SELECT	@ProductID = deleted.ProductID,
			@ProductName = deleted.ProductName,
			@SupplierID = deleted.SupplierID,
			@CategoryID = deleted.CategoryID,
			@QuantityPerUnit = deleted.QuantityPerUnit,
			@UnitPrice = deleted.UnitPrice,
			@UnitsInStock = deleted.UnitsInStock,
			@UnitsOnOrder = deleted.UnitsOnOrder,
			@ReorderLevel = deleted.ReorderLevel,
			@Discontinued = deleted.Discontinued
	FROM deleted

	insert into ProductsDeleteLog(ProductID,ProductName,SupplierID,CategoryID,QuantityPerUnit,UnitPrice,UnitsInStock,UnitsOnOrder,ReorderLevel,Discontinued, WAKTU_DELETE)
	values(@ProductID,@ProductName,@SupplierID,@CategoryID,@QuantityPerUnit,@UnitPrice,@UnitsInStock,@UnitsOnOrder,@ReorderLevel,@Discontinued,CURRENT_TIMESTAMP)

END

--TABLE DELETE UNTUK REGION
CREATE TABLE RegionDeleteLog(
	RegionID int,
	RegionDescription NCHAR(50),
	WAKTU_DELETE datetime
)

-- TRIGGER DELETE UNTUK REGION
CREATE TRIGGER CaptureRegionDelete
ON Region
AFTER DELETE
AS
BEGIN
	declare @RegionID int
	declare @RegionDescription NCHAR(50)
	declare @WAKTU_DELETE datetime

	SELECT	@RegionID = deleted.RegionID,
			@RegionDescription = deleted.RegionDescription
	FROM deleted

	insert into RegionDeleteLog(RegionID, RegionDescription, WAKTU_DELETE)
	values(@RegionID, @RegionDescription, CURRENT_TIMESTAMP)
END

-- TABLE DELETE UNTUK SHIPPERS
CREATE TABLE ShippersDeleteLog(
	[ShipperID] [int],
	[CompanyName] [nvarchar](40),
	[Phone] [nvarchar](24),
	WAKTU_DELETE datetime
)

-- TRIGGER DELETE UNTUK SHIPPERS
CREATE TRIGGER CaptureShippersDelete
ON Shippers
AFTER DELETE
AS
BEGIN
	declare @ShipperID int
	declare @CompanyName nvarchar(40)
	declare @Phone nvarchar(24)
	declare @WAKTU_DELETE datetime

	SELECT	@ShipperID = deleted.ShipperID,
			@CompanyName = deleted.CompanyName,
			@Phone = deleted.Phone
	FROM deleted

	insert into ShippersDeleteLog(ShipperID,CompanyName,Phone,WAKTU_DELETE)
	values(@ShipperID,@CompanyName,@Phone,CURRENT_TIMESTAMP)
END

--TABLE DELETE UNTUK TERRITORIES
CREATE TABLE TerritoriesDeleteLog(
	[TerritoryID] [nvarchar](20),
	[TerritoryDescription] [nchar](50),
	[RegionID] [int],
	WAKTU_DELETE datetime
)

CREATE TRIGGER CaptureTerritoriesDelete
ON Territories
AFTER DELETE
AS
BEGIN
	declare @TerritoryID nvarchar(20)
	declare @TerritoryDescription nchar(50)
	declare @RegionID int
	declare @WAKTU_DELETE datetime

	SELECT	@TerritoryID = deleted.TerritoryID,
			@TerritoryDescription = deleted.TerritoryDescription,
			@RegionID = deleted.RegionID
	FROM deleted

	insert into TerritoriesDeleteLog(TerritoryID,TerritoryDescription,RegionID,WAKTU_DELETE)
	values(@TerritoryID,@TerritoryDescription,@RegionID, CURRENT_TIMESTAMP)
END

-- TABEL DELETE UNTUK SUPPLIERS
CREATE TABLE [dbo].[SuppliersDeleteLog](
	[SupplierID] [int] ,
	[CompanyName] [nvarchar](40) ,
	[ContactName] [nvarchar](30) ,
	[ContactTitle] [nvarchar](30) ,
	[Address] [nvarchar](60),
	[City] [nvarchar](15),
	[Region] [nvarchar](15),
	[PostalCode] [nvarchar](10),
	[Country] [nvarchar](15),
	[Phone] [nvarchar](24),
	[Fax] [nvarchar](24),
	[HomePage] [ntext] ,
	WAKTU_DELETE datetime
)

--TRIGGER DELETE UNTUK SUPPLIERS
CREATE TRIGGER CaptureSuppliersDelete
ON Suppliers
AFTER DELETE
AS
BEGIN
declare @SupplierID int
	declare @CompanyName nvarchar(40)
	declare @ContactName nvarchar(30)
	declare @ContactTitle nvarchar(30)
	declare @Address nvarchar(60)
	declare @City nvarchar(15)
	declare @Region nvarchar(15)
	declare @PostalCode nvarchar(10)
	declare @Country nvarchar(15)
	declare @Phone nvarchar(24)
	declare @Fax nvarchar(24)
	declare @HomePage NVARCHAR(MAX)
	declare @WAKTU_DELETE datetime

	SELECT	@SupplierID = deleted.SupplierID,
			@CompanyName = deleted.CompanyName,
			@ContactName = deleted.ContactName,
			@ContactTitle = deleted.ContactTitle,
			@Address = deleted.Address,
			@City = deleted.City,
			@Region = deleted.Region,
			@PostalCode = deleted.PostalCode,
			@Country = deleted.Country,
			@Phone = deleted.Phone,
			@Fax = deleted.Fax,
			@HomePage = deleted.HomePage
	FROM deleted

	insert into SuppliersDeleteLog(SupplierID,CompanyName,ContactName,ContactTitle,Address,City,Region,PostalCode,Country,Phone,Fax,HomePage,WAKTU_DELETE)
	values(@SupplierID,@CompanyName,@ContactName,@ContactTitle,@Address,@City,@Region,@PostalCode,@Country,@Phone,@Fax,@HomePage,CURRENT_TIMESTAMP)
END