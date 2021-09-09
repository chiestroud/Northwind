-- Which products have a price that is higher than average?

select *
from Products p
where p.UnitPrice > 
	(select AVG(p.UnitPrice)
		from Products p)