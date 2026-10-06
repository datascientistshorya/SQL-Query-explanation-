-- Q1
SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS customers,
    SUM(o.amount) AS revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.city
ORDER BY revenue DESC;

-- Q2 HAVING vs WHERE
SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.amount) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id, c.customer_name
HAVING SUM(o.amount) > 50000
ORDER BY total_spent DESC;

-- Q3 HAVING vs WHERE
SELECT
    p.category,
    COUNT(o.order_id) AS total_orders,
    SUM(
        CASE
            WHEN o.status = 'Completed' THEN o.amount
            ELSE 0
        END
    ) AS completed_revenue
FROM products p
LEFT JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.category
ORDER BY completed_revenue DESC;

-- Q4 — Subquery + Comparison
SELECT
    customer_id,
    customer_name,
    city
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE status = 'Completed'
);

-- Q5 — CTE + Business Metric
WITH customer_revenue AS (
    SELECT
        customer_id,
        SUM(amount) AS total_revenue
    FROM orders
    WHERE status = 'Completed'
    GROUP BY customer_id
)
SELECT
    AVG(total_revenue) AS average_customer_revenue
FROM customer_revenue;

-- Q6 — Full Query Logic / Execution Reasoning
SELECT
    p.product_name,
    COUNT(o.order_id) AS total_orders,
    SUM(o.amount) AS revenue
FROM products p
JOIN orders o
    ON p.product_id = o.product_id
WHERE o.status = 'Completed'
GROUP BY p.product_id, p.product_name
HAVING COUNT(o.order_id) >= 2
ORDER BY revenue DESC
LIMIT 3;