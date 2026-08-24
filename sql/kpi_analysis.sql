-- Executive KPIs
SELECT
    SUM(revenue) AS total_revenue,
    SUM(profit) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS active_customers,
    SUM(profit) / NULLIF(SUM(revenue),0) AS profit_margin
FROM fact_sales;

-- Monthly performance
SELECT
    DATE_TRUNC('month', order_date) AS month,
    SUM(revenue) AS revenue,
    SUM(profit) AS profit,
    COUNT(DISTINCT order_id) AS orders
FROM fact_sales
GROUP BY 1
ORDER BY 1;
