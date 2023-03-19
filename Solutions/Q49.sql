SELECT DISTINCT
	c.country 
FROM 
	Sales.Customers c
LEFT JOIN
	HR.Employees e
ON
	c.country = e.country
WHERE
	e.country IS NULL
ORDER BY
	1
	