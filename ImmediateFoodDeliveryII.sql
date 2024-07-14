WITH first_orders AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date
    FROM
        Delivery
    GROUP BY
        customer_id
),
immediate_orders AS (
    SELECT
        d.customer_id
    FROM
        Delivery d
        JOIN first_orders f ON d.customer_id = f.customer_id AND d.order_date = f.first_order_date
    WHERE
        d.order_date = d.customer_pref_delivery_date
)
SELECT
    ROUND(COUNT(i.customer_id) * 1.0 / COUNT(f.customer_id) * 100, 2) AS immediate_percentage
FROM
    first_orders f
    LEFT JOIN immediate_orders i ON f.customer_id = i.customer_id;
