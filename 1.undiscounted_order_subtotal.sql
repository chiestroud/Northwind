--What is the undiscounted subtotal for each Order (identified by OrderID).

select ord.OrderID, SUM(ord.UnitPrice * ord.Quantity + ord.Freight) [Undiscounted Price With Freight]
from(
select o.OrderID, o.Freight, od.UnitPrice, od.Quantity
from Orders o
join [Order Details] od
on o.OrderId = od.OrderID
) ord
group by ord.OrderId
