SELECT
	custid,
	count(orderid)
FROM
	Sales.Orders
GROUP BY
	custid