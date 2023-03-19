SELECT
	orderid
FROM
	Sales.Orders
WHERE
	orderdate = (SELECT MAX(orderdate) FROM Sales.Orders)