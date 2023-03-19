SELECT DISTINCT 
	o.custid,
	c.companyname
FROM 
	Sales.Orders o
LEFT JOIN
	Sales.Customers c
ON
	o.custid = c.custid