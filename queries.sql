-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

SELECT P.ProductName, C.CategoryName 
FROM Product as P
JOIN Category as C ON P.CategoryId = C.Id;

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT o.id
      ,s.CompanyName
FROM [Order] AS o
INNER JOIN Shipper AS s ON o.ShipVia = s.Id
WHERE OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT p.ProductName, p.QuantityPerUnit
FROM Product AS p
INNER JOIN OrderDetail ON p.Id  = OrderDetail.ProductId
WHERE OrderDetail.OrderId = 10251
ORDER BY p.ProductName asc;

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT [Order].Id as OrderId
    , e.LastName
    , c.CompanyName
FROM [Order]
INNER JOIN Employee AS e ON [Order].EmployeeId = e.Id
INNER JOIN Customer AS c ON [Order].CustomerId = c.Id;