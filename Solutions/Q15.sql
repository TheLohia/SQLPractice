SELECT DISTINCT
	e.country,
	e.region,
	e.city
FROM 
	HR.Employees e
LEFT JOIN
	Sales.Customers c
ON
	(e.country = c.country OR (e.country IS NULL AND c.country IS NULL))
	AND
	(e.region = c.region OR (e.region IS NULL AND c.region IS NULL))
	AND
	(e.city = c.city OR (e.city IS NULL AND c.city IS NULL))
WHERE
	c.custid IS NULL
