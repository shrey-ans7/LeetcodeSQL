-- No need to use second coalesce?
with total as 
(select user_id, count(*) as total from Confirmations group by user_id),
confs as 
(select user_id, count(*) as confs from Confirmations  where action = 'confirmed' group by user_id),
users as 
(select user_id from Signups)
select 
u.user_id, coalesce(round(confs.confs * 1.0/coalesce(total.total,1),2),0) as confirmation_rate 
from users u left join confs 
on confs.user_id = u.user_id
left join total on total.user_id=u.user_id
