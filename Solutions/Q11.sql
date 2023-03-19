SELECT 
	e.empid,
	e.firstname, 
	e.lastname,
	m.empid,
	m.firstname, 
	m.lastname
FROM 
	HR.Employees e
INNER JOIN
	HR.Employees m
ON
	e.empid < m.empid