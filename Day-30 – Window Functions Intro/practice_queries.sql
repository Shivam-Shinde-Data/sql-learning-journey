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


-- Q1: Running total per customer
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


-- Q2: Total amount per customer (without collapsing rows)
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


-- Q3: Overall total using window function
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


-- Q4: Average per customer
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


-- Q5: Difference from customer total
SELECT id,
       customer,
       amount,
       SUM(amount) OVER (PARTITION BY customer) - amount AS difference
FROM orders;

-- Output:
-- id | customer | amount | difference
-- 1  | A        | 100    | 200
-- 2  | A        | 200    | 100
-- 3  | B        | 150    | 300
-- 4  | B        | 300    | 150


-- Q6: Running average
SELECT id,
       customer,
       amount,
       AVG(amount) OVER (PARTITION BY customer ORDER BY id) AS running_avg
FROM orders;

-- Output:
-- id | customer | amount | running_avg
-- 1  | A        | 100    | 100
-- 2  | A        | 200    | 150
-- 3  | B        | 150    | 150
-- 4  | B        | 300    | 225


-- Q7: Count per customer
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


-- Q8: Max amount per customer
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


-- Q9: Min amount per customer
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


-- Q10: Percentage contribution
SELECT id,
       customer,
       amount,
       amount * 100.0 / SUM(amount) OVER (PARTITION BY customer) AS percentage
FROM orders;

-- Output:
-- id | customer | amount | percentage
-- 1  | A        | 100    | 33.33
-- 2  | A        | 200    | 66.67
-- 3  | B        | 150    | 33.33
-- 4  | B        | 300    | 66.67
