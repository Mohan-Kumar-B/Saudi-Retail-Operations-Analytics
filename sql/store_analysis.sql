-- Store ranking
WITH store_perf AS (
    SELECT store_id,
           SUM(revenue) AS revenue,
           SUM(profit) AS profit,
           COUNT(DISTINCT order_id) AS orders
    FROM fact_sales
    GROUP BY store_id
)
SELECT *,
       RANK() OVER (ORDER BY revenue DESC) AS revenue_rank,
       RANK() OVER (ORDER BY profit DESC) AS profit_rank
FROM store_perf
ORDER BY revenue_rank;

-- City performance
SELECT
    s.city,
    SUM(f.revenue) AS revenue,
    SUM(f.profit) AS profit,
    COUNT(DISTINCT f.order_id) AS orders
FROM fact_sales f
JOIN dim_store s ON f.store_id = s.store_id
GROUP BY s.city
ORDER BY revenue DESC;
