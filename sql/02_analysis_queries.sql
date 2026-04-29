-- DQL: Consultas de Análisis de Negocio
-- Estas queries responden a las preguntas estratégicas sobre rentabilidad [cite: 10, 40]

-- Q1: Tendencia de ventas mensuales por año 
SELECT
    order_year,
    order_month,
    TO_CHAR(DATE_TRUNC('month', order_date), 'YYYY-MM') AS month_label,
    SUM(sales)            AS total_sales,
    SUM(profit)           AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(AVG(profit_margin) * 100, 2) AS avg_margin_pct
FROM retail_sales
GROUP BY order_year, order_month, DATE_TRUNC('month', order_date)
ORDER BY order_year, order_month;

-- Q2: Rentabilidad por región con ranking 
SELECT
    region,
    ROUND(SUM(sales), 2)          AS total_sales,
    ROUND(SUM(profit), 2)         AS total_profit,
    ROUND(AVG(profit_margin)*100, 2) AS avg_margin_pct,
    COUNT(DISTINCT order_id)      AS total_orders,
    SUM(CASE WHEN is_loss THEN 1 ELSE 0 END) AS loss_orders,
    RANK() OVER (ORDER BY SUM(profit) DESC) AS profit_rank
FROM retail_sales
GROUP BY region
ORDER BY total_profit DESC;

-- Q3: Desempeño por Categoría y Sub-Categoría 
SELECT 
    category, 
    sub_category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit) / SUM(sales)) * 100, 2) AS profit_margin_pct
FROM retail_sales
GROUP BY category, sub_category
ORDER BY category, total_profit DESC;