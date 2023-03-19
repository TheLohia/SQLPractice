SELECT 
	c.custid,
	c.companyname,
	o.orderid,
	od.productid,
	od.qty
FROM
	Sales.Customers c
INNER JOIN
	Sales.Orders o
ON
	c.custid = o.custid
INNER JOIN
	Sales.OrderDetails od
ON
	o.orderid = od.orderid