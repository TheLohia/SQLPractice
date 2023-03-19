-- This is an implemntation using sub query which is not recommended
-- Better to use CTE for this

SELECT 
	CustomerID
FROM (
	SELECT 
		custid as CustomerID,
		COUNT(DISTINCT empid) as NumEmployees
	FROM
		Sales.Orders
	GROUP BY
		custid
	) AS _
WHERE
	NumEmployees = (SELECT COUNT(empid) FROM HR.Employees)
