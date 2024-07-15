SELECT 
    sell_date,
    COUNT(DISTINCT product) AS num_sold,
    STRING_AGG(distinct product, ',' ORDER BY product) AS products
FROM 
    Activities
GROUP BY 
    sell_date
ORDER BY 
    sell_date;


-- SELECT 
--     sell_date,
--     COUNT(DISTINCT product) AS num_sold,
--     STRING_AGG(product, ',' ORDER BY product) AS products
-- FROM 
--     (SELECT DISTINCT sell_date, product FROM Activities) AS distinct_activities
-- GROUP BY 
--     sell_date
-- ORDER BY 
--     sell_date;
