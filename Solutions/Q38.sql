SELECT DISTINCT
	c.custid,
	COUNT(DISTINCT o.orderid) AS numorders,
	SUM(od.qty) as Quantity
FROM
	Sales.Customers c
LEFT JOIN
	Sales.Orders o
ON
	c.custid = o.custid
LEFT JOIN
	Sales.OrderDetails od
ON
	o.orderid = od.orderid
WHERE
	c.country = 'USA'
GROUP BY
	c.custid
ORDER BY 1