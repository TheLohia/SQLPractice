SELECT
	c.companyname as Customer,
	s.companyname as Supplier
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
INNER JOIN
	Production.Products p
ON
	od.productid = p.productid
INNER JOIN
	Production.Suppliers s
ON
	p.supplierid = s.supplierid
ORDER BY 1