SELECT 
	o.orderid,
	o.orderdate
FROM
	Sales.Orders o
LEFT JOIN
(
SELECT DISTINCT
	orderdate as OrderDate,
	RANK() OVER (PARTITION BY (YEAR(orderdate) * 100 + MONTH(orderdate))
					ORDER BY OrderDate DESC) AS date_rank
FROM Sales.Orders
) as a
ON 
	o.orderdate = a.OrderDate

WHERE 
a.date_rank = 1	
ORDER BY 1