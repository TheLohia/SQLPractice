WITH Details AS
	(
		SELECT
			o.orderdate,
			od.qty
		FROM
			Sales.Orders o
		LEFT JOIN
			Sales.OrderDetails od
		ON
			o.orderid = od.orderid
	)
SELECT DISTINCT
	YEAR(orderdate),
	dc.value as cumulativeqty
	
FROM 
	Details d
CROSS APPLY
	(SELECT
		SUM(qty) as value
	FROM
		Details di
	WHERE
		YEAR(di.orderdate) <= YEAR(d.orderdate)
	) as dc
ORDER BY 
	1,2