WITH min_date AS (
    SELECT
        player_id,
        MIN(event_date) AS event_date
    FROM
        Activity 
    GROUP BY
        player_id
)
SELECT 
    ROUND(COUNT(a.event_date) * 1.0 / COUNT(m.event_date), 2) AS fraction
FROM 
    min_date m
LEFT JOIN 
    Activity a ON a.player_id = m.player_id AND a.event_date = DATEADD(DAY, 1, m.event_date);
