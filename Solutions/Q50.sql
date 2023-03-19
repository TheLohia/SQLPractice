WITH Summary AS (
	SELECT
		o.custid,
		100 * YEAR(o.orderdate) + MONTH(o.orderdate) as OrderMonth,
		od.qty
	FROM
		Sales.Orders o
	LEFT JOIN
		Sales.OrderDetails od
	ON
		o.orderid = od.orderid
	)
SELECT DISTINCT
	s.custid,
	s.Ordermonth,
	cs.runqty
FROM
	Summary s
CROSS APPLY
	(
	SELECT 
		SUM(cs.qty) as runqty
	FROM
		Summary cs
	WHERE
		s.custid = cs.custid
	AND
		cs.OrderMonth <= s.OrderMonth
	) as cs
