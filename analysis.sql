-- =====================================================
-- PROBLEM 1
-- Top 5 cities by delivered revenue
-- =====================================================

SELECT 
c.city,
SUM(OI.quantity * oi.sale_price) AS total_revenue
FROM customers c
JOIN orders o 
ON c.customer_id = o.customer_id
JOIN order_items oi
ON o.order_id = oi.order_id 
WHERE o.status = 'delivered' 
GROUP BY c.city 
ORDER BY total_revenue DESC
LIMIT 5;



-- =====================================================
-- PROBLEM 2
-- Customers signed up in 2023 with no orders
-- =====================================================

SELECT
    c.customer_id,
    c.name,
    c.signup_date
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE EXTRACT(YEAR FROM c.signup_date) = 2023
AND o.order_id IS NULL;



-- =====================================================
-- PROBLEM 3
-- Revenue, units sold, average sale price by category
-- =====================================================

SELECT 
  p.category,
    SUM(oi.quantity * oi.sale_price) AS total_revenue,
    SUM(oi.quantity) AS total_units_sold,
    ROUND(AVG(oi.sale_price),2) AS avg_sale_price
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.status = 'delivered'
GROUP BY p.category
ORDER BY total_revenue DESC;




-- =====================================================
-- PROBLEM 4
-- Top 3 best-selling products by revenue in each category
-- =====================================================
WITH product_revenue AS (
    SELECT
        p.category,
        p.product_name,
        SUM(oi.quantity * oi.sale_price) AS revenue
    FROM products p
    JOIN order_items oi
        ON p.product_id = oi.product_id
    JOIN orders o
        ON oi.order_id = o.order_id
    WHERE o.status = 'delivered'
    GROUP BY p.category, p.product_name
),

ranked_products AS (
    SELECT *,
           RANK() OVER (
               PARTITION BY category
               ORDER BY revenue DESC
           ) AS product_rank
    FROM product_revenue
)

SELECT *
FROM ranked_products
WHERE product_rank <= 3;




-- =====================================================
-- PROBLEM 5
-- Customer segmentation by revenue
-- =====================================================
SELECT
    c.customer_id,
    c.name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COALESCE(SUM(oi.quantity * oi.sale_price),0) AS total_revenue,

    CASE
        WHEN SUM(oi.quantity * oi.sale_price) > 10000
            THEN 'High Value'

        WHEN SUM(oi.quantity * oi.sale_price)
            BETWEEN 3000 AND 10000
            THEN 'Mid Value'

        ELSE 'Low Value'
    END AS customer_segment
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LEFT JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.status = 'delivered'
GROUP BY c.customer_id, c.name
ORDER BY total_revenue DESC;




-- =====================================================
-- PROBLEM 6
-- Customers active in Jan 2024 but not Feb 2024
-- Potential churn customers
-- =====================================================

SELECT DISTINCT
    c.customer_id,
    c.name
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE DATE_TRUNC('month', o.order_date) = '2024-01-01'

AND c.customer_id NOT IN (
    SELECT customer_id
    FROM orders
    WHERE DATE_TRUNC('month', order_date) = '2024-02-01'
);



-- =====================================================
-- PROBLEM 7
-- Month-over-month revenue growth
-- =====================================================

WITH monthly_revenue AS (

    SELECT
        DATE_TRUNC('month', o.order_date) AS month,
        SUM(oi.quantity * oi.sale_price) AS revenue

    FROM orders o
    JOIN order_items oi
        ON o.order_id = oi.order_id

    WHERE o.status = 'delivered'

    GROUP BY month
)

SELECT
    month,
    revenue,

    LAG(revenue) OVER (
        ORDER BY month
    ) AS previous_month_revenue,

    ROUND(
        (
            (revenue - LAG(revenue) OVER (ORDER BY month))
            /
            LAG(revenue) OVER (ORDER BY month)
        ) * 100,
        2
    ) AS percentage_change

FROM monthly_revenue;



-- =====================================================
-- PROBLEM 8
-- Days between first and second order
-- =====================================================

WITH customer_orders AS (

    SELECT
        customer_id,
        order_date,

        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY order_date
        ) AS order_rank

    FROM orders
),

first_second_orders AS (

    SELECT
        customer_id,

        MAX(
            CASE WHEN order_rank = 1
            THEN order_date END
        ) AS first_order,

        MAX(
            CASE WHEN order_rank = 2
            THEN order_date END
        ) AS second_order

    FROM customer_orders
    GROUP BY customer_id
)
SELECT
    customer_id,
    first_order,
    second_order,

    (second_order - first_order) AS days_between_orders,

    CASE
        WHEN (second_order - first_order) <= 30
            THEN 'Quick Return'

        ELSE 'Slow Return'
    END AS customer_type

FROM first_second_orders
WHERE second_order IS NOT NULL;
