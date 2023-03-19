SELECT
	custid,
	orderid,
	orderdate
FROM
	Sales.Orders
WHERE
	orderdate = '2016-02-12' --CONVERT(DATE, '02-12-2016')