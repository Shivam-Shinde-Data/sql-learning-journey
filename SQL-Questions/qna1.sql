-- 📘 SQL Questions – Day 1

WITH orders AS (
    SELECT 1 AS order_id, 101 AS customer_id, 'DELIVERED' AS order_status, 500 AS order_amount, DATE '2023-01-05' AS order_date UNION ALL
    SELECT 2, 102, 'CANCELLED', 300, DATE '2023-01-10' UNION ALL
    SELECT 3, 101, 'DELIVERED', 700, DATE '2023-02-15' UNION ALL
    SELECT 4, 103, 'PENDING', 400, DATE '2023-02-20' UNION ALL
    SELECT 5, 104, 'DELIVERED', 1200, DATE '2023-03-01' UNION ALL
    SELECT 6, 102, 'DELIVERED', 800, DATE '2023-03-05' UNION ALL
    SELECT 7, 101, 'CANCELLED', 200, DATE '2023-03-10' UNION ALL
    SELECT 8, 105, 'DELIVERED', 1500, DATE '2023-03-15' UNION ALL
    SELECT 9, 106, 'PENDING', 600, DATE '2023-03-20' UNION ALL
    SELECT 10, 104, 'DELIVERED', 900, DATE '2023-03-25'
)

    
-- 🟢 Q1: Find total number of orders for each order_status.

SELECT order_status, COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;


-- 🟢 Q2: Find total revenue generated only from DELIVERED orders.

SELECT SUM(order_amount) AS total_revenue
FROM orders
WHERE order_status = 'DELIVERED';


-- 🟢 Q3: Find total number of orders placed after '2023-02-01'.
=
SELECT COUNT(*) AS total_orders
FROM orders
WHERE order_date > DATE '2023-02-01';


-- 🟢 Q4: Find total revenue and total orders for each customer_id.

SELECT customer_id,
       COUNT(order_id) AS total_orders,
       SUM(order_amount) AS total_revenue
FROM orders
GROUP BY customer_id;


-- 🟡 Q5: Find customers who have placed more than 1 order.

SELECT customer_id, COUNT(order_id) AS total_orders
FROM orders
GROUP BY customer_id
HAVING COUNT(order_id) > 1;


-- 🟡 Q6: Find total revenue for each order_status where revenue is greater than 1000.

SELECT order_status,
       SUM(order_amount) AS total_revenue
FROM orders
GROUP BY order_status
HAVING SUM(order_amount) > 1000;


-- 🟡 Q7: Find the average order amount for each customer_id.

SELECT customer_id,
       AVG(order_amount) AS avg_order_amount
FROM orders
GROUP BY customer_id;


-- 🟡 Q8: Find total revenue generated in the month of March 2023.

SELECT SUM(order_amount) AS total_revenue
FROM orders
WHERE order_date BETWEEN DATE '2023-03-01' AND DATE '2023-03-31';


-- 📘 SQL Questions – Day 2


-- 🔴 Q9:Find total revenue from non-cancelled orders

SELECT SUM(order_amount) AS total_revenue
FROM orders
WHERE order_status != 'CANCELLED';


-- 🔴 Q10: Find number of orders and total revenue for customers whose total spending is more than 1500.

SELECT customer_id,
       COUNT(*) AS total_orders,
       SUM(order_amount) AS total_revenue
FROM orders
GROUP BY customer_id
HAVING SUM(order_amount) > 1500;


-- 🔴 Q11: Find total revenue from customers with at least 2 orders

SELECT SUM(order_amount) AS total_revenue
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    GROUP BY customer_id
    HAVING COUNT(*) >= 2
);


-- 🔴 Q12: Find customers whose DELIVERED orders total amount is more than 1000.

SELECT customer_id,
       SUM(order_amount) AS delivered_revenue
FROM orders
WHERE order_status = 'DELIVERED'
GROUP BY customer_id
HAVING SUM(order_amount) > 1000;


-- 🔴 Q13: Find customers who have placed both CANCELLED and DELIVERED orders.

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING 
    SUM(CASE WHEN order_status = 'CANCELLED' THEN 1 ELSE 0 END) > 0
    AND
    SUM(CASE WHEN order_status = 'DELIVERED' THEN 1 ELSE 0 END) > 0;


-- 🔴 Q14: Find total revenue generated only from customers who have placed more than 1 DELIVERED order.

SELECT SUM(order_amount) AS total_revenue
FROM orders
WHERE customer_id IN (
    SELECT customer_id
    FROM orders
    WHERE order_status = 'DELIVERED'
    GROUP BY customer_id
    HAVING COUNT(*) > 1
)
AND order_status = 'DELIVERED';


-- 🔴 Q15: Find customers whose minimum order amount is greater than 500.

SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING MIN(order_amount) > 500;
