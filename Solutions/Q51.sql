SELECT
	CustID,
	OrderDate,
	DATEDIFF(DAY, LAG(orderdate) OVER (PARTITION BY custid ORDER BY orderdate, orderid), orderdate) as NumDays
FROM
	Sales.Orders