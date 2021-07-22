-- The company you work for has been organizing an annual programming competition for 50 years...
-- PostgreSQL 9.4

select 
distinct(p.name)
from participation p
left join participation q on (p.name = q.name)
left join participation r on (q.name - r.name)
where q.year - p.year = 1 and r.year - q.year = 1
order by 1
