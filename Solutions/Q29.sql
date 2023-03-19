SELECT
	empid,
	lastname
FROM 
	HR.Employees
WHERE
	CHARINDEX('e', lastname) = 2