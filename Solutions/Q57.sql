SELECT TOP 2
	empid,
	orderid,
	orderdate
FROM
	Sales.Orders
WHERE
	empid = 3
UNION 
SELECT TOP 2
	empid,
	orderid,
	orderdate
FROM
	Sales.Orders
WHERE
	empid = 5
ORDER BY 
	orderdate DESC
	