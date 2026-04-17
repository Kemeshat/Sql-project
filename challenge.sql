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


-- TASK 3: Employees Earning Above Department Average

SELECT 
    e.first_name,
    e.last_name,
    d.name AS department_name,
    e.salary,
    (
        SELECT AVG(e2.salary)
        FROM employees e2
        WHERE e2.department_id = e.department_id
    ) AS department_avg
FROM employees e
JOIN departments d 
    ON e.department_id = d.id
WHERE e.salary > (
    SELECT AVG(e3.salary)
    FROM employees e3
    WHERE e3.department_id = e.department_id
)
ORDER BY d.name, e.salary DESC;


-- TASK 4: Cities with the Most Gold Customers


SELECT 
    city,
    SUM(CASE WHEN loyalty_level = 'Gold' THEN 1 ELSE 0 END) AS gold_count,
    SUM(CASE WHEN loyalty_level = 'Silver' THEN 1 ELSE 0 END) AS silver_count,
    SUM(CASE WHEN loyalty_level = 'Bronze' THEN 1 ELSE 0 END) AS bronze_count
FROM customers
GROUP BY city
ORDER BY gold_count DESC;


