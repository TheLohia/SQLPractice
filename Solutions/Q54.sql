WITH  Recur AS 
	(
		SELECT 
			empid,
			mgrid,
			firstname,
			lastname,
			0 AS hierarchy_level
		FROM 
			HR.Employees a WHERE empid = 9
		UNION ALL
			SELECT 
			e.empid,
			e.mgrid,
			e.firstname,
			e.lastname,
			r.hierarchy_level + 1
			FROM 
				HR.Employees e, Recur r
			WHERE
				r.mgrid = e.empid

	)
SELECT * FROM Recur 

SELECT * FROM HR.Employees