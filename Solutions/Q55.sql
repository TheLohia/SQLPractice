SELECT DISTINCT
	e.country,
	e.region,
	e.city
FROM
	HR.Employees e
INNER JOIN
	Sales.Customers c
ON
	e.country = c.country
AND
	((e.region = c.region) OR (e.region IS NULL AND c.region IS NULL))
AND
	e.city = c.city