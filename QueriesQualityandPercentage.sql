-- Outer coalesce not needed?
with quality as (
    select query_name, 
    round(avg(1.0*rating/position),2) as quality,
    count(query_name) as total
    from Queries 
    group by query_name),
part as (
    select 
    query_name, 
    count(query_name) as part 
    from Queries 
    where rating <3
    group by query_name
)
(select 
q.query_name, 
q.quality, 
coalesce(round(1.0*coalesce(p.part,0)/q.total*100,2),0) as poor_query_percentage 
from quality 
q left join part p 
on q.query_name=p.query_name 
where q.query_name is not null)
