WITH tabl AS (SELECT DISTINCT
	empid,
	100* YEAR(orderdate) + MONTH(orderdate) as OrderMonth,
	SUM(qty) OVER (PARTITION BY empid, 100* YEAR(orderdate) + MONTH(orderdate)) as qty
FROM
	Sales.Orders o
LEFT JOIN
	Sales.ORderDetails od
ON
	o.orderid = od.orderid
)
SELECT 
	*,
	qty - AVG(qty) OVER (PARTITION BY empid  ORDER BY empid, OrderMonth ROWS BETWEEN 3 PRECEDING and 1 PRECEDING) as avg_qty
FROM tabl
