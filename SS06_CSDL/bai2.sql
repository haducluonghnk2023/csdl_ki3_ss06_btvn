-- cau 2
SELECT CustomerName, ProductName, SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY CustomerName, ProductName
HAVING SUM(Quantity) > 1;
-- cau 3
select customername, orderdate, quantity from orders where quantity > 2;
-- cau 4
SELECT CustomerName, OrderDate, SUM(Quantity * Price) AS TotalSpent
FROM Orders
GROUP BY CustomerName, OrderDate
HAVING SUM(Quantity * Price) > 20000000;
