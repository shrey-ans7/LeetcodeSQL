select e1.name from Employee e1 where e1.id in (select e.managerId from Employee e group by e.managerId having count(e.managerId) > 4)
