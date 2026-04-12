--April 11: Window Functions: 

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
    SELECT 2, 101, 700, 'DELIVERED', DATE '2023-02-15' UNION ALL
    SELECT 3, 101, 200, 'CANCELLED', DATE '2023-03-10' UNION ALL
    SELECT 4, 102, 300, 'CANCELLED', DATE '2023-01-10' UNION ALL
    SELECT 5, 102, 800, 'DELIVERED', DATE '2023-03-05' UNION ALL
    SELECT 6, 102, 800, 'DELIVERED', DATE '2023-03-05' UNION ALL  -- duplicate case
    SELECT 7, 103, 400, 'PENDING', DATE '2023-02-20' UNION ALL
    SELECT 8, 104, 1200, 'DELIVERED', DATE '2023-03-01' UNION ALL
    SELECT 9, 104, 1500, 'DELIVERED', DATE '2023-03-10' UNION ALL
    SELECT 10, 105, 1500, 'DELIVERED', DATE '2023-03-15' UNION ALL
    SELECT 11, 106, 600, 'PENDING', DATE '2023-03-20' UNION ALL
    SELECT 12, 106, 900, 'DELIVERED', DATE '2023-03-25'
)

--🧠 Concept Reminder: 
--Window functions = row-level calculation with group awareness
--Key:
--PARTITION BY → group
--ORDER BY → sequence

--🟢🟡🔴 Practice Questions 

--🟢 Q1: Row Number per Customer
--👉 For each customer, assign a sequence number to their orders based on order_date (earliest = 1).

SELECT 
    customer_id,
    order_id,
    order_date,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
    ) AS row_number
FROM orders;

--🟢 Q2: Latest Order per Customer
--👉 Find the most recent order for each customer.
--👉 Important:
	--Use window function (NOT GROUP BY)
	--Return full row (not just date)

SELECT *
FROM (
    SELECT 
        *,
        ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY order_date DESC
        ) AS rn
    FROM orders
) t
WHERE rn = 1;

--🟡 Q3: Rank Customers by Total Spend
--👉 Step 1: Calculate total spend per customer
--👉 Step 2: Rank customers (highest spend = rank 1)
--👉 Output:
	--customer_id
	--total_spend
	--rank

total_spend AS (
    SELECT 
        customer_id,
        SUM(order_amount) AS total_spend
    FROM orders
    GROUP BY customer_id
)
SELECT 
    customer_id,
    total_spend,
    RANK() OVER (ORDER BY total_spend DESC) AS rank
FROM total_spend;

--🟡 Q4: Compare RANK vs DENSE_RANK
--👉 Using same total spend data:
	--Apply RANK()
	--Apply DENSE_RANK()
--👉 Observe: What happens when 2 customers have same spend?

total_spend AS (
    SELECT 
        customer_id,
        SUM(order_amount) AS total_spend
    FROM orders
    GROUP BY customer_id
)
SELECT 
    customer_id,
    total_spend,
    RANK() OVER (ORDER BY total_spend DESC) AS rank,
    DENSE_RANK() OVER (ORDER BY total_spend DESC) AS dense_rank
FROM total_spend;

--🟡 Q5: Top 2 Orders per Customer
--👉 For each customer: Find their top 2 highest order_amount
--👉 Output:
	--customer_id
	--order_id
	--order_amount

SELECT 
    customer_id,
    order_id,
    order_date,
    ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_number
FROM orders;

--🔴 Q6: Running Total per Customer
--👉 For each customer: Sort orders by date and Calculate cumulative sum of order_amount
--👉 Output:
	--customer_id
	--order_id
	--order_date
	--running_total

SELECT 
    customer_id,
    order_id,
    order_date,
    SUM(order_amount) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS running_total
FROM orders;

/*🔴 Q7: Previous Order Amount (LAG)
👉 For each order: Show previous order amount of same customer
👉 Output:
	customer_id
	order_id
	order_amount
	previous_order_amount
👉 If no previous → NULL */

SELECT 
    customer_id,
    order_id,
    order_amount,
    LAG(order_amount) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date) AS previous_order_amount
FROM orders;

/* 🔴 Q8: Order Difference
👉 For each order: Calculate difference between current and previous order
👉 Formula:current_order - previous_order */

SELECT 
    customer_id,
    order_id,
    order_amount,
    order_amount - LAG(order_amount) OVER (
        PARTITION BY customer_id 
        ORDER BY order_date) AS order_difference
FROM orders;

/*
🔴 Q9: First Order Flag
👉 Mark orders:
	1 → if it is first order of customer
	0 → otherwise
👉 Based on order_date */

SELECT 
    customer_id,
    order_id,
    order_date,
    CASE 
        WHEN ROW_NUMBER() OVER (
            PARTITION BY customer_id 
            ORDER BY order_date) = 1 THEN 1
        ELSE 0
    END AS first_order_flag
FROM orders;

/* 🔴 Q10: Deduplicate Orders 
👉 In dataset: Customer 102 has duplicate orders (same date & amount)
👉 Task:
	Keep only ONE record per:
	(customer_id, order_date, order_amount)
	Prefer latest (use order_id for tie-breaking)
👉 Output: Cleaned dataset  */

SELECT 
    order_id,
    customer_id,
    order_amount,
    order_status,
    order_date
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY customer_id, order_date, order_amount
               ORDER BY order_id DESC
           ) AS rn
    FROM orders
) t
WHERE rn = 1;
