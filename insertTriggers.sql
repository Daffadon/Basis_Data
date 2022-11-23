
use Northwind

create trigger 
--1. buat trigger untuk merekam semua perubahan dalam setiap database northwind
		-- untuk proses insert, data yang terbaru harus masuk pada table log
		-- untuk proses update, data yang terbaru dan yang lama harus masuk pada table log
		-- untuk proses delete, data yang dihapus harus masuk table log
-- 2. Masukkan data anggota tim kalian pada table customer (diasumsikan sebagi customer)
-- 3. File yang dikumpulkan berupa backup sql server

insert into Customers (CustomerID,CompanyName,ContactName,ContactTitle,Address,City, region,PostalCode,Country,Phone,Fax) 
values ('DAPPA', 'SUBANG JAYA', 'Daffa Putra N','Owner','Kasomalang Kulon No. 1','Subang','Jawab barat','44444','Indonesia','082117525747','0213-12312')

insert into Customers (CustomerID,CompanyName,ContactName,ContactTitle,Address,City, region,PostalCode,Country,Phone,Fax) 
VALUES('FRHNT', 'BANDUNG SEJAHTERA', 'Firhan Imam H','Owner','Suryalaya III No. 10','Bandung','Jawab barat','431412','Indonesia','082131241231','0253-34313')


insert into Categories(CategoryName,Description,Picture)
	values ('software',null,null)
select * from Categories
insert into Categories(CategoryName,Description,Picture)
	values ('sayuran',null,null)

-- TABLE UNTUK LOG INSERT PADA CUSTOMERS
CREATE TABLE CustomersInsertLog (
	[CustomerID] [nchar](5) NOT NULL,
	[CompanyName] [nvarchar](40) NOT NULL,
	[ContactName] [nvarchar](30) NULL,
	[ContactTitle] [nvarchar](30) NULL,
	[Address] [nvarchar](60) NULL,
	[City] [nvarchar](15) NULL,
	[Region] [nvarchar](15) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](15) NULL,
	[Phone] [nvarchar](24) NULL,
	[Fax] [nvarchar](24) NULL,
	Waktu_Insert datetime null
 CONSTRAINT [PK_CustomersInsertLog] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]


-- TABLE UNTUK LOG INSERT PADA CATEGORIES
CREATE TABLE CategoriesInsertLog(
	[CategoryID] [int] NOT NULL,
	[CategoryName] [nvarchar](15) NOT NULL,
	[Description] [ntext] NULL,
	[Picture] [image] NULL,
 CONSTRAINT [PK_CategoriesInsertLog] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

SELECT * FROM CategoriesInsertLog

-- TRIGGER INSERT Categories
CREATE TRIGGER CaptureCategoriesInsert 
ON dbo.Categories 
after INSERT
AS
BEGIN
	declare @CategoryID int
	declare @CategoryName varchar(15)
	declare @Description varchar(max)
	declare @Picture varbinary(max)


	select @CategoryID = inserted.CategoryID,
		   @CategoryName = inserted.CategoryName,
		   @Description = Convert(varchar, inserted.Description),
		   @Picture = Convert(varbinary, inserted.Picture)
	from inserted

	insert into CategoriesInsertLog(CategoryID,CategoryName,Description,Picture)
		values(@CategoryID,@CategoryName,@Description,@Picture)
END


CREATE TRIGGER CaptureCustomerCustomerDemoInsert 
ON dbo.CustomerCustomerDemo 
AFTER INSERT
AS
BEGIN

END

CREATE TRIGGER CaptureCustomerCustomerDemographicsInsert 
ON dbo.CustomerCustomerDemographics 
AFTER INSERT
AS
BEGIN

END

-- TRIGGER UNTUK CUSTOMERS
CREATE TRIGGER CaptureCustomersInsert 
ON dbo.Customers 
AFTER INSERT
AS
BEGIN
	declare @CustomerID char(5)
	declare @CompanyName varchar(40)
	declare @ContactName varchar(30)
	declare @ContactTitle varchar(30)
	declare @Address varchar(60)
	declare @City varchar(15)
	declare @Region varchar(15)
	declare @PostalCode varchar(10)
	declare @Country varchar(15)
	declare @Phone varchar(24)
	declare @Fax varchar(24)
	

	select @CustomerID = inserted.customerID,
		   @CompanyName = inserted.CompanyName,
		   @ContactName = inserted.ContactName,
		   @ContactTitle = inserted.ContactTitle,
		   @Address = inserted.Address,
		   @City=inserted.City,
		   @Region=inserted.Region,
		   @PostalCode=inserted.PostalCode,
		   @Country=inserted.Country,
		   @Phone=inserted.Phone,
		   @Fax=inserted.Fax
	from inserted

	insert into CustomersInsertLog(CustomerID,CompanyName,ContactName,ContactTitle,Address,City,region,PostalCode,Country,Phone,Fax, Waktu_Insert) 
	values (@CustomerID,@CompanyName,@ContactName,@ContactTitle,@Address,@City,@region,@PostalCode,@Country,@Phone,@Fax,CURRENT_TIMESTAMP)

END

CREATE TRIGGER CaptureEmployeesInsert 
ON dbo.Employees 
AFTER INSERT
AS
BEGIN

END

CREATE TRIGGER CaptureEmployeeTerritoriesInsert 
ON dbo.EmployeeTerritories 
AFTER INSERT
AS
BEGIN

END

CREATE TRIGGER CaptureOrder DetailsInsert 
ON dbo.Order Details 
AFTER INSERT
AS
BEGIN

END

CREATE TRIGGER CaptureOrdersInsert 
ON dbo.Orders 
AFTER INSERT
AS
BEGIN

END

CREATE TRIGGER CaptureProductsInsert 
ON dbo.Products 
AFTER INSERT
AS
BEGIN

END

CREATE TRIGGER CaptureRegionInsert 
ON dbo.Region 
AFTER INSERT
AS
BEGIN

END

CREATE TRIGGER CaptureShippersInsert 
ON dbo.Shippers 
AFTER INSERT
AS
BEGIN

END

CREATE TRIGGER CaptureSuppliersInsert 
ON dbo.Suppliers 
AFTER INSERT
AS
BEGIN

END

CREATE TRIGGER CaptureTerritoriesInsert 
ON dbo.Territories 
AFTER INSERT
AS
BEGIN

END