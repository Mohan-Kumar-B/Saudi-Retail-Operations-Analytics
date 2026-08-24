-- Product profitability
SELECT
    p.category,
    p.product_name,
    SUM(f.quantity) AS units_sold,
    SUM(f.revenue) AS revenue,
    SUM(f.profit) AS profit,
    SUM(f.profit) / NULLIF(SUM(f.revenue),0) AS margin
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.category, p.product_name
ORDER BY profit DESC;

-- High revenue / low margin products
SELECT
    p.product_name,
    SUM(f.revenue) AS revenue,
    SUM(f.profit) AS profit,
    SUM(f.profit)/NULLIF(SUM(f.revenue),0) AS margin
FROM fact_sales f
JOIN dim_product p ON f.product_id = p.product_id
GROUP BY p.product_name
HAVING SUM(f.revenue) > 50000
   AND SUM(f.profit)/NULLIF(SUM(f.revenue),0) < 0.15
ORDER BY revenue DESC;
