SELECT DISTINCT
	custid,
	CASE orderdate
		WHEN CONVERT(DATE, '02-12-2016') THEN 'Yes'
		ELSE 'No'
	END AS HasOrderOn20160212

FROM
	Sales.Orders
ORDER BY 2