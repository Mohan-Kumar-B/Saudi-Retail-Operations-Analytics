-- Customer ranking
WITH customer_value AS (
    SELECT customer_id,
           SUM(revenue) AS revenue,
           COUNT(DISTINCT order_id) AS orders,
           AVG(revenue) AS avg_order_value
    FROM fact_sales
    GROUP BY customer_id
)
SELECT *,
       RANK() OVER (ORDER BY revenue DESC) AS revenue_rank
FROM customer_value
ORDER BY revenue_rank;

-- Repeat customer rate
WITH customer_orders AS (
    SELECT customer_id, COUNT(DISTINCT order_id) AS orders
    FROM fact_sales
    GROUP BY customer_id
)
SELECT
    COUNT(*) AS customers,
    SUM(CASE WHEN orders > 1 THEN 1 ELSE 0 END) AS repeat_customers,
    100.0 * SUM(CASE WHEN orders > 1 THEN 1 ELSE 0 END) / COUNT(*) AS repeat_customer_pct
FROM customer_orders;
