--ALTER CATEGORIES
ALTER TABLE Categories
ALTER COLUMN Picture VARBINARY(MAX)

ALTER TABLE Categories
ALTER COLUMN Description NVARCHAR(MAX)

ALTER TABLE CategoriesDeleteLog
ALTER COLUMN Picture VARBINARY(MAX)

ALTER TABLE CategoriesDeleteLog
ALTER COLUMN Description NVARCHAR(MAX)

ALTER TABLE CategoriesInsertLog
ALTER COLUMN Picture VARBINARY(MAX)

ALTER TABLE CategoriesInsertLog
ALTER COLUMN Description NVARCHAR(MAX)

--ALTER EMPLOYEES
ALTER TABLE Employees
ALTER COLUMN Photo VARBINARY(MAX)

ALTER TABLE Employees
ALTER COLUMN Notes NVARCHAR(MAX)

ALTER TABLE EmployeesInsertLog
ALTER COLUMN Photo VARBINARY(MAX)

ALTER TABLE EmployeesInsertLog
ALTER COLUMN Notes NVARCHAR(MAX)

ALTER TABLE EmployeesDeleteLog
ALTER COLUMN Photo VARBINARY(MAX)

ALTER TABLE EmployeesDeleteLog
ALTER COLUMN Notes NVARCHAR(MAX)

--ALTER SUPPLIERS

ALTER TABLE Suppliers
ALTER COLUMN HomePage NVARCHAR(MAX)

ALTER TABLE SuppliersInsertLog
ALTER COLUMN HomePage NVARCHAR(MAX)

ALTER TABLE SuppliersDeleteLog
ALTER COLUMN HomePage NVARCHAR(MAX)