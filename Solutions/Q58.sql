WITH dates AS (SELECT DISTINCT 
	custid,
	empid,
	IIF (100 * YEAR(orderdate) + MONTH(orderdate) = 201601, 1, 0) as [201601],
	IIF (100 * YEAR(orderdate) + MONTH(orderdate) = 201602, 1, 0) as [201602]
	--ROW_NUMBER() OVER (PARTITION BY custid, empid ORDER BY 100 * YEAR(orderdate) + MONTH(orderdate)) AS x
FROM 
	Sales.Orders )
SELECT DISTINCT
	custid,
	empid
FROM 
	dates
GROUP BY
	custid, empid
HAVING SUM([201601]) + SUM([201602]) = 2