-- Monthly revenue growth
WITH monthly AS (
    SELECT DATE_TRUNC('month', order_date) AS month,
           SUM(revenue) AS revenue
    FROM fact_sales
    GROUP BY 1
)
SELECT month,
       revenue,
       LAG(revenue) OVER (ORDER BY month) AS previous_month_revenue,
       (revenue - LAG(revenue) OVER (ORDER BY month))
         / NULLIF(LAG(revenue) OVER (ORDER BY month),0) AS mom_growth
FROM monthly
ORDER BY month;

-- Pareto-style customer contribution
WITH customer_revenue AS (
    SELECT customer_id, SUM(revenue) AS revenue
    FROM fact_sales
    GROUP BY customer_id
),
ranked AS (
    SELECT *,
           SUM(revenue) OVER () AS total_revenue,
           SUM(revenue) OVER (ORDER BY revenue DESC
                              ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS cumulative_revenue
    FROM customer_revenue
)
SELECT customer_id, revenue,
       cumulative_revenue / NULLIF(total_revenue,0) AS cumulative_revenue_pct
FROM ranked
ORDER BY revenue DESC;
