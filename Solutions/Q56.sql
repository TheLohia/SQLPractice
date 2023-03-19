WITH Locations AS (SELECT DISTINCT
	country,
	region,
	city
FROM
	HR.Employees
UNION
	SELECT DISTINCT
		country,
		region,
		city
	FROM Sales.Customers)

SELECT
	country,
	COUNT(*)
FROM Locations
GROUP BY country