select p.product_id, coalesce(round(sum(1.0*p.price*us.units)/sum(us.units),2),0) as average_price 
from Prices p left join UnitsSold us 
on p.product_id = us.product_id and us.purchase_date <= p.end_date and us.purchase_date >= p.start_date group by p.product_id
