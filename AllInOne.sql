
-- select
select CustomerID
from Orders

select count(CustomerID)
from Orders

-- unique only
select count(DISTINCT CustomerID)
from Orders


-- where
SELECT *
FROM Customers
WHERE Country='Mexico';

SELECT *
FROM Customers
WHERE CustomerID > 80;


-- sorting
SELECT *
FROM Products
ORDER BY UnitPrice;

SELECT *
FROM Products
ORDER BY UnitPrice DESC;
-- orderby several columns ie (sort with first and sort multiple countries by Contact name)
SELECT *
FROM Customers
ORDER BY Country, ContactName;
-- order by country asc, then sort sort multiple country by contact name decs
SELECT *
FROM Customers
ORDER BY Country ASC, ContactName DESC;


-- and
SELECT *
FROM Customers
WHERE Country = 'Germany'
    AND City = 'Berlin'
    AND PostalCode > 12000;


-- or
SELECT *
FROM Customers
WHERE Country = 'Germany' OR Country = 'Spain';


-- not
SELECT *
FROM Customers
WHERE NOT Country = 'Spain';
-- not between
SELECT *
FROM Customers
WHERE CustomerID NOT BETWEEN 10 AND 60;
-- not in
SELECT *
FROM Customers
WHERE City NOT IN ('Paris', 'London');
-- not > than
SELECT *
FROM Orders
WHERE NOT OrderID > 10500;
-- not < than
SELECT *
FROM Orders
WHERE NOT OrderID < 10500;



-- insert
INSERT INTO Customers
    (Address,City,CompanyName,ContactName,ContactTitle,Country,CustomerID,Fax,Phone,PostalCode,Region)
VALUES
    ('GT Road', 'Lahore', 'Codesprint', 'Wally', 'Marketing Manager', 'Pakistan', 'LKDFW', '09123-01923', '9021-0923019911', 31212, NULL)

INSERT INTO Customers
    (Address,City,CompanyName,ContactName)
VALUES
    ('GT Road1', 'Lahore1', 'Codesprint1')



-- null
SELECT CompanyName, ContactName, Address
FROM Customers
WHERE Region IS NULL;

SELECT CompanyName, ContactName, Address
FROM Customers
WHERE Region IS NOT NULL;



--update
UPDATE Customers
SET ContactName = 'Alfred Schmidt', City= 'Frankfurt'
WHERE CustomerID = 1;
-- ⚠️⚠️ Caution ⚠️⚠️ Whole table will be updated if no where command
UPDATE Customers
SET ContactName='Juan';


-- delete 
DELETE FROM Customers WHERE ContactName='Alfreds Futterkiste';


-- drop
-- DROP TABLE Customers;



-- top
SELECT TOP 3
    *
FROM Customers;

SELECT TOP 3
    *
FROM Customers
ORDER BY CompanyName DESC;

SELECT TOP 50 PERCENT
    *
FROM Customers;


SELECT TOP 3
    *
FROM Customers
WHERE Country='Germany';



-- Min and Max
SELECT MIN(UnitPrice)
FROM Products;

SELECT MAX(UnitPrice)
FROM Products;



-- count
SELECT COUNT(UnitPrice)
FROM Products;

SELECT COUNT(DISTINCT UnitPrice)
FROM Products;

SELECT COUNT(ProductID)
FROM Products
WHERE UnitPrice > 20;


-- sum
SELECT SUM(Quantity)
FROM [Order Details];

SELECT SUM(Quantity)
FROM [Order Details]
WHERE ProductId = 11;


-- avg
SELECT AVG(UnitPrice)
FROM Products;

SELECT AVG(UnitPrice)
FROM Products
WHERE CategoryID = 1



-- Wildcards
-- select where name starts with mi (not case sensitive)
select *
from Customers
WHERE
    ContactName LIKE 'mi%';

-- select where name ends with e (not case sensitive)
select *
from Customers
WHERE
    ContactName LIKE '%a';

-- all that includes mm whether it is in start, end or between
-- select where name has with mm in between (not case sensitive)
select *
from Customers
WHERE
    ContactName LIKE '%mm%';

-- select where name has with a at second last place
select *
from Customers
WHERE
    ContactName LIKE '%a_';

-- select where name has with a at third last place
select *
from Customers
WHERE
    ContactName LIKE '%a__';



-- In
SELECT *
FROM Customers
WHERE Country IN ('Germany', 'France', 'UK');
-- select in array
-- %%%%%%%%%%%%% (IMP) %%%%%%%%%%%%%
SELECT *
FROM Customers
WHERE CustomerID IN (SELECT CustomerID
FROM Orders);

SELECT *
FROM Customers
WHERE CustomerID NOT IN (SELECT CustomerID
FROM Orders);



-- between
SELECT *
FROM Products
WHERE UnitPrice BETWEEN 10 AND 20;


SELECT *
FROM Products
WHERE UnitPrice NOT BETWEEN 10 AND 20;


SELECT *
FROM Products
WHERE UnitPrice BETWEEN 10 AND 20
    AND CategoryID IN (1,2,3);

-- alphabetically between c and m
SELECT *
FROM Products
WHERE ProductName BETWEEN 'Carnarvon Tigers' AND 'Mozzarella di Giovanni'
ORDER BY ProductName;

-- between dates
SELECT *
FROM Orders
WHERE OrderDate BETWEEN '1996-07-01' AND '1996-07-31';



-- Alias
SELECT ProductName AS [My Great Products]
FROM Products;

SELECT o.OrderID, o.OrderDate, c.ContactName
FROM Customers AS c, Orders AS o
WHERE c.ContactName='Around the Horn' AND c.CustomerID=o.CustomerID;



-- Inner Join
--  selects records that have matching values in both tables.
SELECT Products.ProductID, Products.ProductName, Categories.CategoryName
FROM Products
    JOIN Categories ON Products.CategoryID = Categories.CategoryID;

SELECT Orders.OrderID, Customers.ContactName, Shippers.CompanyName
FROM ((Orders
    INNER JOIN Customers ON Orders.CustomerID = Customers.CustomerID)
    INNER JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID);



-- Left join
-- The LEFT JOIN keyword returns all records from the left table (Customers), even if there are no matches in the right table (Orders).
SELECT Customers.ContactName, Orders.OrderID
FROM Customers
    LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY Customers.ContactName;



-- Right Join
-- The RIGHT JOIN keyword returns all records from the right table (Employees), even if there are no matches in the left table (Orders).
SELECT Orders.OrderID, Employees.LastName, Employees.FirstName
FROM Orders
    RIGHT JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
ORDER BY Orders.OrderID;



-- Full Join
SELECT Customers.ContactName, Orders.OrderID
FROM Customers
    FULL OUTER JOIN Orders ON Customers.CustomerID=Orders.CustomerID
ORDER BY Customers.ContactName;



-- self join
SELECT A.ContactName AS CustomerName1, B.ContactName AS CustomerName2, A.City
FROM Customers A, Customers B
WHERE A.CustomerID <> B.CustomerID
    AND A.City = B.City
ORDER BY A.City;
-- <> means select where they are not equal



-- union
    SELECT City
    FROM Customers
UNION
    SELECT City
    FROM Suppliers
ORDER BY City;

    SELECT City, Country
    FROM Customers
    WHERE Country='Germany'
UNION
    SELECT City, Country
    FROM Suppliers
    WHERE Country='Germany'
ORDER BY City;


-- union all
    SELECT City
    FROM Customers
UNION ALL
    SELECT City
    FROM Suppliers
ORDER BY City;

    SELECT City, Country
    FROM Customers
    WHERE Country='Germany'
UNION ALL
    SELECT City, Country
    FROM Suppliers
    WHERE Country='Germany'
ORDER BY City;



-- group by

-- GROUP BY statement groups rows that have the same values into summary rows, like "find the number of customers in each country".
-- The GROUP BY statement is often used with aggregate functions (COUNT(), MAX(), MIN(), SUM(), AVG()) to group the result-set by one or more columns.

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country;


SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
ORDER BY COUNT(CustomerID) DESC;

SELECT Shippers.CompanyName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
    LEFT JOIN Shippers ON Orders.ShipVia = Shippers.ShipperID
GROUP BY CompanyName;



-- having
-- The HAVING clause was added to SQL because the WHERE keyword cannot be used with aggregate functions.

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5;

SELECT COUNT(CustomerID), Country
FROM Customers
GROUP BY Country
HAVING COUNT(CustomerID) > 5
ORDER BY COUNT(CustomerID) DESC;


SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
    INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25;