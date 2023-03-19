SELECT TOP 3
	shipcountry,
	AVG(freight)
FROM
	Sales.Orders
WHERE
	YEAR(orderdate) = 2015
GROUP BY
	shipcountry
ORDER BY 2 DESC