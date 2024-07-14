select 
    e.employee_id 
from 
    Employees e left join Employees e1 
on e.manager_id=e1.employee_id
where 
    e.salary<30000 and e1.employee_id is null and e.manager_id is not null
order by
    e.employee_id

--Sub-Query Soln:
-- select 
--     e.employee_id 
-- from 
--     Employees e
-- where 
--     e.manager_id not in (select employee_id from Employees)
--     and e.salary<30000
-- order by
--     e.employee_id
