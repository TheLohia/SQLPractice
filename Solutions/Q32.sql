SELECT
	custid,
	orderid,
	orderdate,
	ROW_NUMBER() OVER (PARTITION BY custid ORDER BY orderdate, orderid) AS rownum
FROM
	Sales.Orders