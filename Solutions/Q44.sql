WITH temp AS (SELECT
	custid,
	MAX(orderid) as orderid
FROM
	Sales.Orders
GROUP BY custid) 

SELECT
	t.*,
	o.orderdate
FROM
	temp t
LEFT JOIN
	Sales.Orders o
ON
	t.orderid = o.orderid
ORDER BY t.custid DESC