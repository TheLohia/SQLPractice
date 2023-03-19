WITH AnnualOrders as (SELECT
	YEAR(orderdate) as OrderYear,
	COUNT(*) as NumOrders
FROM
	Sales.Orders
GROUP BY
	Year(orderdate))

SELECT DISTINCT
	OrderYear,
	NumOrders,
	NumOrders - LAG(NumOrders,1) OVER (ORDER BY OrderYear) AS Diff
FROM AnnualOrders as _