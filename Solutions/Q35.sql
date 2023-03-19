SELECT 
	c.custid,
	o.orderid
FROM
	Sales.Customers c
INNER JOIN
	Sales.Orders o
ON
	c.custid = o.custid
