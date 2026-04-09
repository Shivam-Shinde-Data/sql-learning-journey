SQL - CASE WHEN / HAVING: 

WITH customers AS (
    SELECT 101 AS customer_id, 'Alice' AS customer_name, 'India' AS country UNION ALL
    SELECT 102, 'Bob', 'India' UNION ALL
    SELECT 103, 'Charlie', 'USA' UNION ALL
    SELECT 104, 'David', 'UK' UNION ALL
    SELECT 105, 'Eva', 'India' UNION ALL
    SELECT 106, 'Frank', 'Germany'
),

orders AS (
    SELECT 1 AS order_id, 101 AS customer_id, 500 AS order_amount, 'DELIVERED' AS order_status, DATE '2023-01-05' AS order_date UNION ALL
    SELECT 2, 102, 300, 'CANCELLED', DATE '2023-01-10' UNION ALL
    SELECT 3, 101, 700, 'DELIVERED', DATE '2023-02-15' UNION ALL
    SELECT 4, 103, 400, 'PENDING', DATE '2023-02-20' UNION ALL
    SELECT 5, 104, 1200, 'DELIVERED', DATE '2023-03-01' UNION ALL
    SELECT 6, 102, 800, 'DELIVERED', DATE '2023-03-05' UNION ALL
    SELECT 7, 101, 200, 'CANCELLED', DATE '2023-03-10' UNION ALL
    SELECT 8, 105, 1500, 'DELIVERED', DATE '2023-03-15' UNION ALL
    SELECT 9, 106, 600, 'PENDING', DATE '2023-03-20'
)

--🧠 Concept (Short)
--CASE WHEN → conditional logic inside SQL
--HAVING → filter after aggregation

--🟢🟡🔴 Practice Questions
--🟢 Q1: Order Status Count (Pivot Style)

--Find count of orders for each status (DELIVERED, CANCELLED, PENDING) in separate columns.

SELECT
SUM(CASE WHEN order_status = 'DELIVERED' THEN 1 ELSE 0 END) AS delivered_count,
SUM(CASE WHEN order_status = 'CANCELLED' THEN 1 ELSE 0 END) AS cancelled_count,
SUM(CASE WHEN order_status = 'PENDING' THEN 1 ELSE 0 END) AS pending_count
FROM orders;

--🟢 Q2: Customer Segmentation by Spend

--Classify customers:

--HIGH → total spend > 1500
--MEDIUM → 800–1500
--LOW → < 800

SELECT
c.customer_id,
c.customer_name,
SUM(o.order_amount) AS total_spend,
CASE
WHEN SUM(o.order_amount) > 1500 THEN 'HIGH'
WHEN SUM(o.order_amount) BETWEEN 800 AND 1500 THEN 'MEDIUM'
ELSE 'LOW'
END AS category
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name;

--🟡 Q3: Delivered vs Cancelled Revenue

--Find total DELIVERED revenue and CANCELLED revenue in same row.

SELECT
SUM(CASE WHEN order_status = 'DELIVERED' THEN order_amount ELSE 0 END) AS delivered_revenue,
SUM(CASE WHEN order_status = 'CANCELLED' THEN order_amount ELSE 0 END) AS cancelled_revenue
FROM orders;

--🟡 Q4: Active vs Inactive Customers
--Active → at least 1 order
--Inactive → no orders

SELECT
SUM(CASE WHEN o.customer_id IS NOT NULL THEN 1 ELSE 0 END) AS active_customers,
SUM(CASE WHEN o.customer_id IS NULL THEN 1 ELSE 0 END) AS inactive_customers
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id;

--🟡 Q5: Customers with More Delivered than Cancelled Orders

--Find customers where:
--👉 delivered_count > cancelled_count

SELECT
customer_id
FROM orders
GROUP BY customer_id
HAVING
SUM(CASE WHEN order_status = 'DELIVERED' THEN 1 ELSE 0 END) >
SUM(CASE WHEN order_status = 'CANCELLED' THEN 1 ELSE 0 END);

--🔴 Q6: Percentage of Delivered Orders per Customer

--For each customer:
--👉 % of delivered orders = delivered_orders / total_orders

SELECT
customer_id,
COUNT() AS total_orders,
SUM(CASE WHEN order_status = 'DELIVERED' THEN 1 ELSE 0 END) * 100.0 / COUNT() AS delivered_percentage
FROM orders
GROUP BY customer_id;

--🔴 Q7: High-Value Months

--Find months where total revenue > 2000

SELECT
DATE_TRUNC('month', order_date) AS month,
SUM(order_amount) AS total_revenue
FROM orders
GROUP BY DATE_TRUNC('month', order_date)
HAVING SUM(order_amount) > 2000;


--🔴 Q8: Customers with Only One Order Type

--Find customers who have orders of only one type (only delivered OR only cancelled OR only pending)

SELECT
customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(DISTINCT order_status) = 1;

--🔴 Q9: Revenue Contribution Category

--Classify each customer:

--TOP → contributes > 40% of total revenue
--MEDIUM → 10–40%
--LOW → < 10%

--👉 Requires multi-step thinking

WITH total_rev AS (
SELECT SUM(order_amount) AS total_revenue FROM orders
),
customer_rev AS (
SELECT customer_id, SUM(order_amount) AS cust_revenue
FROM orders
GROUP BY customer_id
)
SELECT
cr.customer_id,
cr.cust_revenue,
CASE
WHEN cr.cust_revenue * 100.0 / tr.total_revenue > 40 THEN 'TOP'
WHEN cr.cust_revenue * 100.0 / tr.total_revenue BETWEEN 10 AND 40 THEN 'MEDIUM'
ELSE 'LOW'
END AS category
FROM customer_rev cr
CROSS JOIN total_rev tr;

--🔴 Q10: Conditional Aggregation + HAVING (Important 🔥)

--Find customers whose:
--👉 delivered revenue > cancelled revenue
--👉 AND total orders > 1

SELECT
customer_id
FROM orders
GROUP BY customer_id
HAVING
SUM(CASE WHEN order_status = 'DELIVERED' THEN order_amount ELSE 0 END) >
SUM(CASE WHEN order_status = 'CANCELLED' THEN order_amount ELSE 0 END)
AND COUNT(*) > 1;
