SELECT TOP 3
	orderid,
	orderdate,
	custid,
	empid
FROM
	Sales.Orders
ORDER BY 2 DESC
	