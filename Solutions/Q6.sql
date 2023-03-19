SELECT
	YEAR(orderdate) as OrderYear,
	COUNT(DISTINCT custid) as NumCustomers
FROM
	Sales.Orders
GROUP BY 
	YEAR(orderdate)
HAVING
	COUNT(DISTINCT custid) > 70