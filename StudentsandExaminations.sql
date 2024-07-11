select s.student_id, s.student_name, su.subject_name, coalesce(count(e.subject_name),0) as attended_exams 
from Students s 
cross join 
Subjects su 
left join 
Examinations e 
on s.student_id = e.student_id and su.subject_name = e.subject_name 
group by 
su.subject_name,  s.student_id, s.student_name
order by
    s.student_id,
    su.subject_name;
