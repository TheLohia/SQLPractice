WITH OrderSummary AS (
SELECT 
	o.empid as EmployeeID,
	YEAR(o.requireddate) as Year,
	od.unitprice * od.qty /** (1 - discount)*/ as Value
FROM
	Sales.Orders o
LEFT JOIN
	Sales.OrderDetails od
ON
	o.orderid = od.orderid
)

SELECT 
	EmployeeID as EmployeeId,
	[2013], [2014], [2015]
FROM OrderSummary
PIVOT
(
	SUM(Value) 
	FOR Year in ([2013], [2014], [2015])
) AS PivotTable