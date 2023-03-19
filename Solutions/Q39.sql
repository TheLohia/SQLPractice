SELECT 
 c.custid,
 STRING_AGG(o.orderid, ', ') WITHIN GROUP (ORDER BY orderdate ASC) AS Orders
FROM
	Sales.Customers c
LEFT JOIN
	Sales.Orders o
ON
	c.custid = o.custid
GROUP BY
	c.custid