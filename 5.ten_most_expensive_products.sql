-- What are our 10 most expensive products?

select TOP 10 *
from Products p
order by p.UnitPrice desc