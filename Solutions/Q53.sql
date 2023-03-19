WITH RowTable AS (
	SELECT
		*,
		ROW_NUMBER() OVER (ORDER BY orderdate, orderid) as RowNum
	FROM
		Sales.Orders
)
SELECT * FROM RowTable WHERE RowNum > 10 and RowNum < 21