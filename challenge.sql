--TASK 1: Top 5 Customers with highest lifetime spend

SELECT
     c.first_name || ' ' || c.last_name AS customer_name,
     SUM (oi.quantity * oi.unit_price) AS lifetime_spend
FROM
        customers c
        JOIN orders o ON c.id = o.customer_id
        JOIN order_items oi ON o.id = oi.order_id
GROUP BY c.id, c.first_name, c.last_name
ORDER BY lifetime_spend DESC
LIMIT 5;


-- TASK 2: Total Revenue by Product Category

SELECT 
    p.category,
    SUM(oi.quantity * oi.unit_price) AS revenue
FROM products p
JOIN order_items oi 
    ON p.id = oi.product_id
JOIN orders o 
    ON oi.order_id = o.id
GROUP BY p.category
ORDER BY revenue DESC;

