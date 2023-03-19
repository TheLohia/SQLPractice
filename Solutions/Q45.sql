SELECT
	* 
FROM 
	Sales.Customers c 
LEFT JOIN 
	Sales.Orders o
ON
	c.custid = o.custid
WHERE
	c.country = 'Spain'
AND
	o.orderid IS NULL