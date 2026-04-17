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
