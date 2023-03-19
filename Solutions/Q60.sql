SELECT DISTINCT
	empid,
	100* YEAR(orderdate) + MONTH(orderdate) as OrderMonth,
	SUM(unitprice * qty * (1 - discount)) OVER (PARTITION BY empid, 100* YEAR(orderdate) + MONTH(orderdate)) AS val,
	SUM(unitprice * qty * (1 - discount)) OVER (PARTITION BY empid order by 100* YEAR(orderdate) + MONTH(orderdate)) AS runval
FROM
	Sales.Orders o
LEFT JOIN
	Sales.ORderDetails od
ON
	o.orderid = od.orderid
