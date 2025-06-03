with not_banned as (select users_id from users where banned<>'Yes')
select request_at as Day, round(sum(case when status like 'cancelled%' 
    then 1.0 else 0 end)/count(*),2) as "Cancellation Rate"
    from Trips
    where
        client_id in (SELECT users_id FROM not_banned)
        and driver_id in (SELECT users_id FROM not_banned)
        and request_at between '2013-10-01' and '2013-10-03'
    group by request_at
