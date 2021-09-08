--What is the undiscounted subtotal for each Order (identified by OrderID).

select ord.OrderID, ROUND(SUM((ord.UnitPrice * ord.Quantity + ord.Freight) - (ord.UnitPrice * ord.Quantity * ord.Discount)), 2) [Price with Discount]
from(
select o.OrderID, o.Freight, od.UnitPrice, od.Quantity, od.Discount
from Orders o
join [Order Details] od
on o.OrderId = od.OrderID
) ord
group by ord.OrderId

