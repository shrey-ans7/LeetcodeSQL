WITH users AS (
    SELECT 
        user_id, activity_date 
    FROM
        Activity
    GROUP BY 
        user_id, activity_date
)
SELECT 
    activity_date AS day, 
    COUNT(user_id) AS active_users 
FROM 
    users 
WHERE 
    activity_date > ('2019-07-27'::date - INTERVAL '30 days') AND activity_date<='2019-07-27'::date
GROUP BY
    activity_date
ORDER BY
    activity_date;
