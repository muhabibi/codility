with cte as (
select 
t.team_id,
t.team_name,
sum(case when m.host_goals > m.guest_goals then 3
        when m.host_goals = m.guest_goals then 1
        else 0 end) as num_points
from matches m 
right outer join teams t on (m.host_team = t.team_id)
group by 1,2
union all
select 
t.team_id,
t.team_name,
sum(case when m.guest_goals > m.host_goals then 3
        when m.host_goals = m.guest_goals then 1
        else 0 end) as num_points
from matches m 
right outer join teams t on (m.guest_team = t.team_id)
where t.team_id is null or t.team_id is not null
group by 1,2
) 
select 
team_id, team_name, sum(num_points) as num_points
from cte
group by 1,2
order by 3 desc, 1 asc
