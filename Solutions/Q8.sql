SELECT 
	c.custid as CustomerName,
	c.companyname as [Company Name],
	STRING_AGG(o.orderid, ',') WITHIN GROUP (ORDER BY o.orderdate DESC) as Orders
FROM
	Sales.Customers c
LEFT JOIN
	Sales.Orders o
ON
	c.custid = o.custid
GROUP BY
	c.custid,
	c.companyname