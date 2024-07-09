select v.customer_id, count(1) as count_no_trans from Visits v where v.visit_id not in (select visit_id from Transactions) group by v.customer_id
