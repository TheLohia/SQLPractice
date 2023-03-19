SELECT 
	o.orderid,
	c.custid
FROM
	Sales.Orders o
INNER JOIN
	Sales.Customers c
ON
	o.custid = c.custid
WHERE
	c.country = 'USA'
ORDER by 1