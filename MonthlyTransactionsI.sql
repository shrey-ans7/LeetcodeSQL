select 
    to_char(trans_date, 'YYYY-MM') as month,
    country,
    count(id) as trans_count,
    count(case when state = 'approved' then id end) as approved_count,
    sum(amount) as trans_total_amount,
    coalesce(sum(case when state = 'approved' then amount end),0) as approved_total_amount
from 
    Transactions
group by 
    to_char(trans_date, 'YYYY-MM'),
    country
