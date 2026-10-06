-- Batch 4: Advanced Business & Interview Query Explanation

-- Q1 — Revenue vs Order Performance
SELECT
    p.category,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT CASE
        WHEN o.status = 'Completed' THEN o.order_id
    END) AS completed_orders,
    SUM(CASE
        WHEN o.status = 'Completed' THEN o.amount
        ELSE 0
    END) AS completed_revenue,
    ROUND(
        SUM(CASE
            WHEN o.status = 'Completed' THEN o.amount
            ELSE 0
        END)
        / NULLIF(
            COUNT(DISTINCT CASE
                WHEN o.status = 'Completed' THEN o.order_id
            END),
            0
        ),
        2
    ) AS completed_aov
FROM products p
LEFT JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.category
HAVING COUNT(DISTINCT o.order_id) >= 5
ORDER BY completed_revenue DESC;

-- Q2 — Detecting a Logical Problem
SELECT
    c.city,
    COUNT(DISTINCT c.customer_id) AS customers,
    SUM(o.amount) AS total_revenue
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.city;

-- Q3 — Query Logic & Business Interpretation
SELECT
    p.category,
    COUNT(DISTINCT o.order_id) AS orders,
    SUM(CASE
        WHEN o.status = 'Completed' THEN o.amount
        ELSE 0
    END) AS completed_revenue,
    ROUND(
        100.0 * SUM(CASE
            WHEN o.status = 'Completed' THEN o.amount
            ELSE 0
        END)
        / NULLIF(
            SUM(SUM(CASE
                WHEN o.status = 'Completed' THEN o.amount
                ELSE 0
            END)) OVER (),
            0
        ),
        2
    ) AS revenue_share
FROM products p
LEFT JOIN orders o
    ON p.product_id = o.product_id
GROUP BY p.category;

-- Q4  business logic trap.
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
ORDER BY revenue DESC;


-- Batch 4 — Q5
SELECT
    p.category,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT CASE
        WHEN o.status = 'Completed' THEN o.order_id
    END) AS completed_orders,
    COUNT(DISTINCT CASE
        WHEN o.status = 'Cancelled' THEN o.order_id
    END) AS cancelled_orders,
    SUM(CASE
        WHEN o.status = 'Completed' THEN o.amount
        ELSE 0
    END) AS completed_revenue,
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
ORDER BY completed_revenue DESC;

-- Q6 — Final Interview Question
/*Consider this business situation:

A company notices that completed revenue increased by 25% this month. The marketing manager says:
“Great! Our marketing strategy is clearly working.”

As the analyst, explain why you would not immediately accept this conclusion.

Cover these points:

Give at least four possible reasons why revenue could increase without marketing actually becoming more effective.
Which SQL/business metrics would you investigate first?
How would you distinguish between more customers, more purchases from existing customers, and higher order value?
Why should cancellation rate be checked?
What role could product mix play?
Give a concise 2–3 sentence response to the marketing manager.*/