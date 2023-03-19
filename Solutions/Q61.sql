SELECT DISTINCT
	o.orderid,
	custid,
	SUM(unitprice * qty * (1 - discount)) OVER (PARTITION BY o.orderid) as val,
	100 * SUM(unitprice * qty * (1 - discount)) OVER (PARTITION BY o.orderid)/SUM(unitprice * qty * (1 - discount)) OVER (PARTITION BY custid) AS custpct,
	100 * SUM(unitprice * qty * (1 - discount)) OVER (PARTITION BY o.orderid)/SUM(unitprice * qty * (1 - discount)) OVER (PARTITION BY 0) AS totalpct
FROM
	Sales.Orders o
LEFT JOIN
	Sales.ORderDetails od
ON
	o.orderid = od.orderid
ORDER BY
	2
