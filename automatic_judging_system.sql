-- An automatic judging system checks a solution for the task on multiple test cases. The outcome of a test case is binary: either the solution succeeds or fails. But not all tests cases are equally important. Each test case is assigned to a group, and every test case in the group is worth the same number of points.
-- PostgreSQL 9.4

select
g.name
count(c.group_name) as all_test_case,
-- sum(case when c.status = 'OK' then 1 else 0 end) as passed_test_case,
count(case when c.status = 'OK' then 1 end) as passed_test_case,
sum(case when c.status = 'OK' then g.test_value else 0 end) as total_value,
from 
test_group g
left join test_cases c on (g.name = c.group_name)
group by 1
order by 4 desc, 1 asc
