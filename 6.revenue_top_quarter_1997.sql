-- In which quarter in 1997 did we have the most revenue?

select TOP(1) revQ.Quarter, SUM(revQ.Total) [1997 Quarter Revenue Total]
from
(
	select rev.OrderDate, SUM(rev.[Price with Discount]) [Total],
	case
		when rev.OrderDate >= '1997-01-01' and rev.OrderDate < '1997-04-01' then 'Q1'
		when rev.OrderDate >= '1997-04-01' and rev.OrderDate < '1997-07-01' then 'Q2'
		when rev.OrderDate >= '1997-07-01' and rev.OrderDate < '1997-10-01' then 'Q3'
		when rev.OrderDate >= '1997-10-01' and rev.OrderDate < '1998-01-01' then 'Q4'
	end Quarter
	from 
	(
		select ord.OrderDate, ord.OrderID, ROUND(SUM((ord.UnitPrice * ord.Quantity + ord.Freight) - (ord.UnitPrice * ord.Quantity * ord.Discount)), 2) [Price with Discount]
		from(
		select o.OrderID, o.Freight, od.UnitPrice, od.Quantity, od.Discount, o.OrderDate
		from Orders o
		join [Order Details] od
		on o.OrderId = od.OrderID
		) ord
		where ord.OrderDate LIKE '%1997%'
		group by ord.OrderId, ord.OrderDate
	) rev
	group by OrderDate
) revQ
group by revQ.Quarter
order by [1997 Quarter Revenue Total] desc