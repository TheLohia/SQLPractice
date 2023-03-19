SELECT
	empid,
	lastname,
	LEN(lastname) - LEN(REPLACE(lastname, 'e', ''))
FROM
	HR.Employees