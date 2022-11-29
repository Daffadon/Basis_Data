-- TRIGGER DELETE UNTUK EMPLOYEE
CREATE TRIGGER CaptureEmployeesDelete
ON dbo.Employees
AFTER DELETE
AS
BEGIN
	
	insert into EmployeesDeleteLog
	select EmployeeID, LastName, FirstName, Title, TitleOfCourtesy, BirthDate, HireDate, Address, City, Region, PostalCode, Country, HomePhone, Extension, Photo, Notes, ReportsTo, PhotoPath,CURRENT_TIMESTAMP 
	from EmployeesInsertLog
	where EmployeeID not in (
			select EmployeeID from Employees e
			where e.EmployeeID=EmployeesInsertLog.EmployeeID)
END

-- TRIGGER DELETE UNTUK ORDER DETAILS
CREATE TRIGGER CaptureOrderDetailsDelete
ON [Order Details]
AFTER DELETE
AS
BEGIN
	insert into OrderDetailsDeleteLog
	select OrderID, ProductID, UnitPrice, Quantity, Discount, CURRENT_TIMESTAMP
	FROM OrderDetailsInsertLog
	where OrderID not in (
			select OrderID from [Order Details] o
			where o.OrderID=OrderDetailsInsertLog.OrderID AND o.ProductID = OrderDetailsInsertLog.ProductID
			)
END