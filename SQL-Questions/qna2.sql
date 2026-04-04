
-- DAY 3: JOINS – PRACTICE QUERIES

WITH customers AS (
    SELECT 101 AS customer_id, 'Alice' AS customer_name, 'India' AS country UNION ALL
    SELECT 102, 'Bob', 'India' UNION ALL
    SELECT 103, 'Charlie', 'USA' UNION ALL
    SELECT 104, 'David', 'UK' UNION ALL
    SELECT 105, 'Eva', 'India' UNION ALL
    SELECT 106, 'Frank', 'Germany'
),

orders AS (
    SELECT 1 AS order_id, 101 AS customer_id, 500 AS order_amount, 'DELIVERED' AS order_status UNION ALL
    SELECT 2, 102, 300, 'CANCELLED' UNION ALL
    SELECT 3, 101, 700, 'DELIVERED' UNION ALL
    SELECT 4, 103, 400, 'PENDING' UNION ALL
    SELECT 5, 104, 1200, 'DELIVERED' UNION ALL
    SELECT 6, 102, 800, 'DELIVERED' UNION ALL
    SELECT 7, 101, 200, 'CANCELLED' UNION ALL
    SELECT 8, 105, 1500, 'DELIVERED'
)

-- 🟢 Q1: Basic Join
-- Get all orders with corresponding customer_name
    
SELECT o.order_id, o.customer_id, c.customer_name, o.order_amount, o.order_status
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id;


-- 🟢 Q2: Orders Count per Customer
--Find total number of orders for each customer.
--👉 Include customer name
    
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS total_orders
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY customer_id, customer_name;


--🟡 Q3: Customers with No Orders
--Find customers who have never placed any order.
--👉 Real-world: inactive users

SELECT c.customer_id, c.customer_name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;


--🟡 Q4: Total Revenue per Customer
--Find total order amount for each customer.
--👉 Include customers with zero revenue
    
SELECT c.customer_id, c.customer_name,
       COALESCE(SUM(o.order_amount), 0) AS total_revenue
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


--🟡 Q5: Delivered Revenue per Customer
--Find total revenue from DELIVERED orders for each customer.
--👉 Include customers with zero delivered revenue
    
SELECT c.customer_id, c.customer_name,
       COALESCE(SUM(CASE WHEN o.order_status = 'DELIVERED' THEN o.order_amount END), 0) AS delivered_revenue
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;


--🔴 Q6: Customers with Only Cancelled Orders
--Find customers who have placed orders but all of them are CANCELLED.
    
SELECT c.customer_id, c.customer_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(*) = COUNT(CASE WHEN o.order_status = 'CANCELLED' THEN 1 END);


--🔴 Q7: Top Spending Customer
--Find customer with highest total order amount.
    
SELECT c.customer_id, c.customer_name,
       SUM(o.order_amount) AS total_spent
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 1;


--🔴 Q8: Country-wise Revenue
--Find total revenue grouped by country.
    
SELECT c.country,
       SUM(o.order_amount) AS total_revenue
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.country;


--🔴 Q9: Customers with At Least 1 Delivered Order
--Find customers who have at least one DELIVERED order.
--👉 Avoid duplicates
    
SELECT EXISTS c.customer_id, c.customer_name
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
WHERE o.order_status = 'DELIVERED';


--🔴 Q10: Mismatch Detection 
--Find orders where customer_id does NOT exist in customers table.
--👉 Real-world: data quality check
    
SELECT o.*
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
