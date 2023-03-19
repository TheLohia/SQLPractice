SELECT
	empid,
	lastname
FROM 
	HR.Employees
WHERE
	CHARINDEX('d', lastname) = 1