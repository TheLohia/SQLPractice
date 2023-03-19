SELECT DISTINCT
	s.custid,
	cs.empid,
	cs.ordercount
FROM 
	Sales.Orders s
CROSS APPLY
	(SELECT TOP 1 
		custid, 
		empid, 
		count(*) AS ordercount
	FROM Sales.Orders 
	WHERE custid = s.custid
	GROUP BY custid, empid
	ORDER BY 3 DESC, 2 DESC) AS cs
ORDER BY 1