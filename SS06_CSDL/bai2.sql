-- cau 2
SELECT CustomerName, ProductName, SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY CustomerName, ProductName
HAVING SUM(Quantity) > 1;
-- cau 3
SELECT CustomerName, OrderDate, Quantity
FROM Orders
WHERE OrderDate IN (
    SELECT OrderDate
    FROM Orders
    GROUP BY OrderDate
    HAVING SUM(Quantity) > 2
);
-- cau 4
SELECT CustomerName, OrderDate, SUM(Quantity * Price) AS TotalSpent
FROM Orders
GROUP BY CustomerName, OrderDate
HAVING SUM(Quantity * Price) > 20000000;