SELECT 
	empid,
	CONCAT_WS(' ', firstname, lastname) as fullname
FROM HR.Employees