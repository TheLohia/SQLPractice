SELECT DISTINCT
	STRING_AGG(o.orderid, '; '),
	e.lastname
FROM
	Sales.Orders o
LEFT JOIN
	HR.Employees e
ON
	o.empid = e.empid
WHERE
	CHARINDEX('d',e.lastname) = 1
GROUP BY
	e.lastname