-- Sample Table
CREATE TABLE orders (
    id INT,
    customer VARCHAR(10),
    amount INT
);

INSERT INTO orders VALUES
(1, 'A', 100),
(2, 'A', 200),
(3, 'B', 150),
(4, 'B', 300);


-- Q1: Without PARTITION BY
SELECT id,
       customer,
       amount,
       SUM(amount) OVER () AS total_amount
FROM orders;

-- Output:
-- id | customer | amount | total_amount
-- 1  | A        | 100    | 750
-- 2  | A        | 200    | 750
-- 3  | B        | 150    | 750
-- 4  | B        | 300    | 750


-- Q2: With PARTITION BY
SELECT id,
       customer,
       amount,
       SUM(amount) OVER (PARTITION BY customer) AS total_per_customer
FROM orders;

-- Output:
-- id | customer | amount | total_per_customer
-- 1  | A        | 100    | 300
-- 2  | A        | 200    | 300
-- 3  | B        | 150    | 450
-- 4  | B        | 300    | 450


-- Q3: Running total
SELECT id,
       customer,
       amount,
       SUM(amount) OVER (PARTITION BY customer ORDER BY id) AS running_total
FROM orders;

-- Output:
-- id | customer | amount | running_total
-- 1  | A        | 100    | 100
-- 2  | A        | 200    | 300
-- 3  | B        | 150    | 150
-- 4  | B        | 300    | 450


-- Q4: Count per group
SELECT id,
       customer,
       COUNT(*) OVER (PARTITION BY customer) AS total_orders
FROM orders;

-- Output:
-- id | customer | total_orders
-- 1  | A        | 2
-- 2  | A        | 2
-- 3  | B        | 2
-- 4  | B        | 2


-- Q5: Max per customer
SELECT id,
       customer,
       amount,
       MAX(amount) OVER (PARTITION BY customer) AS max_amount
FROM orders;

-- Output:
-- id | customer | amount | max_amount
-- 1  | A        | 100    | 200
-- 2  | A        | 200    | 200
-- 3  | B        | 150    | 300
-- 4  | B        | 300    | 300


-- Q6: Min per customer
SELECT id,
       customer,
       amount,
       MIN(amount) OVER (PARTITION BY customer) AS min_amount
FROM orders;

-- Output:
-- id | customer | amount | min_amount
-- 1  | A        | 100    | 100
-- 2  | A        | 200    | 100
-- 3  | B        | 150    | 150
-- 4  | B        | 300    | 150


-- Q7: Average per group
SELECT id,
       customer,
       amount,
       AVG(amount) OVER (PARTITION BY customer) AS avg_amount
FROM orders;

-- Output:
-- id | customer | amount | avg_amount
-- 1  | A        | 100    | 150
-- 2  | A        | 200    | 150
-- 3  | B        | 150    | 225
-- 4  | B        | 300    | 225


-- Q8: Multiple partition columns
SELECT id,
       customer,
       amount,
       COUNT(*) OVER (PARTITION BY customer, amount) AS count_same
FROM orders;

-- Output:
-- id | customer | amount | count_same
-- 1  | A        | 100    | 1
-- 2  | A        | 200    | 1
-- 3  | B        | 150    | 1
-- 4  | B        | 300    | 1


-- Q9: Partition with ROW_NUMBER
SELECT id,
       customer,
       amount,
       ROW_NUMBER() OVER (PARTITION BY customer ORDER BY amount DESC) AS rn
FROM orders;

-- Output:
-- id | customer | amount | rn
-- 2  | A        | 200    | 1
-- 1  | A        | 100    | 2
-- 4  | B        | 300    | 1
-- 3  | B        | 150    | 2


-- Q10: Partition with RANK
SELECT id,
       customer,
       amount,
       RANK() OVER (PARTITION BY customer ORDER BY amount DESC) AS rnk
FROM orders;

-- Output:
-- id | customer | amount | rnk
-- 2  | A        | 200    | 1
-- 1  | A        | 100    | 2
-- 4  | B        | 300    | 1
-- 3  | B        | 150    | 2
