SELECT 
	empid,
	YEAR(orderdate) AS orderyear,
	COUNT(orderid) AS numorders
FROM 
	Sales.Orders
WHERE custid = 71
GROUP BY
	empid,
	YEAR(orderdate)
HAVING 
	COUNT(orderid) > 1
ORDER BY empid

