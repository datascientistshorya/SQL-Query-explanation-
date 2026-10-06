-- Batch 3: Advanced Query Explanation
-- Q1 — LEFT JOIN + Conditional Aggregation
SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT CASE
        WHEN o.status = 'Completed' THEN o.order_id
    END) AS completed_orders,
    SUM(CASE
        WHEN o.status = 'Completed' THEN o.amount
        ELSE 0
    END) AS revenue
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.city;

-- Q2 — Advanced Query Explanation
SELECT
    p.category,
    COUNT(DISTINCT p.product_id) AS products,
    COUNT(DISTINCT o.order_id) AS orders,
    SUM(CASE
        WHEN o.status = 'Completed' THEN o.amount
        ELSE 0
    END) AS completed_revenue
FROM products p
LEFT JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.category
HAVING SUM(CASE
    WHEN o.status = 'Completed' THEN o.amount
    ELSE 0
END) > 5000;

-- Q3 — Advanced Query Explanation
SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT CASE
        WHEN o.status = 'Completed' THEN c.customer_id
    END) AS purchasing_customers,
    SUM(CASE
        WHEN o.status = 'Completed' THEN o.amount
        ELSE 0
    END) AS revenue
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING COUNT(DISTINCT CASE
    WHEN o.status = 'Completed' THEN c.customer_id
END) >= 3;

-- Q4 — Advanced Query Explanation
SELECT
    p.category,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT CASE
        WHEN o.status = 'Completed' THEN o.order_id
    END) AS completed_orders,
    COUNT(DISTINCT CASE
        WHEN o.status = 'Cancelled' THEN o.order_id
    END) AS cancelled_orders,
    ROUND(
        100.0 * COUNT(DISTINCT CASE
            WHEN o.status = 'Cancelled' THEN o.order_id
        END)
        / NULLIF(COUNT(DISTINCT o.order_id), 0),
        2
    ) AS cancellation_rate
FROM products p
LEFT JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.category
HAVING COUNT(DISTINCT o.order_id) >= 5;

-- -- Q4 — Advanced Query Explanation
	
SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT CASE
        WHEN o.status = 'Completed' THEN c.customer_id
    END) AS purchasing_customers,
    ROUND(
        100.0 *
        COUNT(DISTINCT CASE
            WHEN o.status = 'Completed' THEN c.customer_id
        END)
        / NULLIF(COUNT(DISTINCT c.customer_id), 0),
        2
    ) AS purchase_rate,
    SUM(CASE
        WHEN o.status = 'Completed' THEN o.amount
        ELSE 0
    END) AS revenue
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING COUNT(DISTINCT c.customer_id) >= 5;

-- Q5 — Advanced Query Explanation

SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT CASE
        WHEN o.status = 'Completed' THEN c.customer_id
    END) AS purchasing_customers,
    ROUND(
        100.0 *
        COUNT(DISTINCT CASE
            WHEN o.status = 'Completed' THEN c.customer_id
        END)
        / NULLIF(COUNT(DISTINCT c.customer_id), 0),
        2
    ) AS purchase_rate,
    SUM(CASE
        WHEN o.status = 'Completed' THEN o.amount
        ELSE 0
    END) AS revenue
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING COUNT(DISTINCT c.customer_id) >= 5;


--  Q6 — Advanced Query Explanation
SELECT
    p.category,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT CASE
        WHEN o.status = 'Completed' THEN o.order_id
    END) AS completed_orders,
    COUNT(DISTINCT CASE
        WHEN o.status = 'Cancelled' THEN o.order_id
    END) AS cancelled_orders,
    ROUND(
        100.0 *
        COUNT(DISTINCT CASE
            WHEN o.status = 'Cancelled' THEN o.order_id
        END)
        / NULLIF(COUNT(DISTINCT o.order_id), 0),
        2
    ) AS cancellation_rate,
    SUM(CASE
        WHEN o.status = 'Completed' THEN o.amount
        ELSE 0
    END) AS completed_revenue
FROM products p
LEFT JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.category
HAVING COUNT(DISTINCT o.order_id) >= 5
ORDER BY cancellation_rate DESC;