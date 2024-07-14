with tot_subjs as (
    select 
        teacher_id, 
        subject_id
    from
        Teacher
    group by
        teacher_id, 
        subject_id
)
select
    teacher_id,
    count(subject_id) as cnt
from
    tot_subjs
group by
    teacher_id
    
