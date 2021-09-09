-- I need a list of sales figures broken down by category name.  Include the total $ amount sold over all time and the total number of items sold.

select summary.CategoryID, summary.CategoryName, SUM(summary.Quantity) [Total Qty Sold], SUM(summary.UnitPrice * summary.Quantity) [Total $ Amount Sold]
from
(
select c.CategoryID, c.CategoryName, p.ProductName, od.UnitPrice, od.Quantity
from Orders o
	join [Order Details] od
	on o.OrderID = od.OrderID
	join Products p
	on od.ProductID = p.ProductID
		join Categories c
		on p.CategoryID = c.CategoryID
) summary
group by summary.CategoryID, summary.CategoryName
order by summary.CategoryID
