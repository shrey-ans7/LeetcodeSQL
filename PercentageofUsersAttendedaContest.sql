with particips as 
(select contest_id, count(user_id) as part from Register group by contest_id),
user_count as
(select count(distinct user_id) as user_count from Users)
(select 
    distinct p.contest_id, 
    coalesce(round(p.part*1.0/user_count.user_count*100,2),0) as percentage 
from particips p, user_count 
order by percentage desc, p.contest_id)
