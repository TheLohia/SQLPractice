SELECT DISTINCT
	cs.orderid,
	cs.orderdate,
	s.custid,
	cs.empid
FROM 
	Sales.Orders s
CROSS APPLY
	(SELECT TOP 1
		orderdate,
		orderid,
		custid,
		empid
	 FROM 
		Sales.Orders
	WHERE 
		custid = s.custid
	ORDER BY orderdate DESC
	) AS cs

ORDER BY 3
