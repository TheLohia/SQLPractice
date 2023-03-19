DROP TABLE IF EXISTS
	#LastDayofActivity

SELECT DISTINCT
	custid as CustomerId,
	orderid as OrderId,
	RANK() OVER (PARTITION BY (custid)
					ORDER BY OrderDate DESC) AS date_rank
INTO
	#LastDayOfActivity
FROM 
	Sales.Orders

SELECT 
	o.orderid,
	o.orderdate,
	o.custid,
	a.date_rank
FROM
	Sales.Orders o
INNER JOIN
	#LastDayOfActivity as a
ON 
	o.orderid= a.OrderId
AND
a.date_rank = 1	
ORDER BY 3