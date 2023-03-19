SELECT 
	empid,
	year(orderdate) as orderyear,
	SUM(freight) as totalfreight,
	COUNT(orderid) as ordercount,
	COUNT(DISTINCT orderid) as ordercountd
FROM Sales.Orders
GROUP BY empid, YEAR(orderdate)