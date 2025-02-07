-- cau 2
SELECT MIN(Price) AS MinPrice, MAX(Price) AS MaxPrice
FROM Orders;
-- cau 3
SELECT CustomerName, COUNT(*) AS OrderCount
FROM Orders
GROUP BY CustomerName;
-- cau 4
SELECT MIN(OrderDate) AS EarliestDate, MAX(OrderDate) AS LatestDate
FROM Orders;