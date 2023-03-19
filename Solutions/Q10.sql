SELECT 
	CONCAT_WS(' ', e.firstname, e.lastname) AS Employee,
	CONCAT_WS(' ', m.firstname, m.lastname) AS Manager
FROM 
	HR.Employees e
LEFT JOIN
	HR.Employees m
ON
	e.mgrid = m.empid