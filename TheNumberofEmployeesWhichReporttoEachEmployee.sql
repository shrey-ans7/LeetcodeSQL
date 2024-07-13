select 
e.employee_id, 
e.name, count(e.employee_id) as reports_count, 
round(avg(e1.age)) as average_age 
from 
Employees e join Employees e1 
on e.employee_id=e1.reports_to 
group by e.employee_id, e.name 
order by e.employee_id
