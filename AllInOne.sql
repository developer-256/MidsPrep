select CustomerID from Orders

select count(CustomerID) from Orders

-- unique only
select count(DISTINCT CustomerID) from Orders


-- where
SELECT * FROM Customers
WHERE Country='Mexico';

SELECT * FROM Customers
WHERE CustomerID > 80;


-- sorting
SELECT * FROM Products
ORDER BY UnitPrice;

SELECT * FROM Products
ORDER BY UnitPrice DESC;
-- orderby several columns ie (sort with first and sort multiple countries by Contact name)
SELECT * FROM Customers
ORDER BY Country, ContactName;
-- order by country asc, then sort sort multiple country by contact name decs
SELECT * FROM Customers
ORDER BY Country ASC, ContactName DESC;


-- and
SELECT * FROM Customers
WHERE Country = 'Germany'
AND City = 'Berlin'
AND PostalCode > 12000;


-- or
SELECT *
FROM Customers
WHERE Country = 'Germany' OR Country = 'Spain';


-- not
SELECT * FROM Customers
WHERE NOT Country = 'Spain';
-- not between
SELECT * FROM Customers
WHERE CustomerID NOT BETWEEN 10 AND 60;
-- not in
SELECT * FROM Customers
WHERE City NOT IN ('Paris', 'London');
-- not > than
SELECT * FROM Orders
WHERE NOT OrderID > 10500;
-- not < than
SELECT * FROM Orders
WHERE NOT OrderID < 10500;


