SELECT
	*,
	LAG(orderid, 1) OVER (ORDER BY orderid) as prevorderid
FROM
	Sales.Orders