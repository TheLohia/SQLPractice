SELECT
	orderid,
	orderdate,
	custid,
	empid
FROM Sales.ORders
WHERE
	orderdate = EOMONTH(orderdate)