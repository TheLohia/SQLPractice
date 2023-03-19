SELECT
	dt.*,
	o.orderid
FROM
	(SELECT
		empid,
		MAX(orderdate) as maxorderdate
	FROM
		Sales.Orders
	GROUP BY 
		empid) dt
LEFT JOIN
	Sales.Orders o
ON
	dt.empid = o.empid
AND
	dt.maxorderdate = o.orderdate
ORDER BY dt.empid desc