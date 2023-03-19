SELECT
	empid,
	lastname
FROM 
	HR.Employees
WHERE
	SUBSTRING(lastname,1,1) NOT IN ('A','B','C','D','E')