SELECT 
	c.custid
FROM
	Sales.Customers c
LEFT JOIN
	Sales.Orders o
ON
	c.custid = o.custid
WHERE o.custid IS NULL