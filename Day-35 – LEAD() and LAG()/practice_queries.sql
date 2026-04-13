-- Sample Table
CREATE TABLE orders (
    id INT,
    customer VARCHAR(10),
    amount INT
);

INSERT INTO orders VALUES
(1, 'A', 100),
(2, 'A', 200),
(3, 'A', 300),
(4, 'B', 150),
(5, 'B', 250);


-- Q1: Basic LAG
SELECT id,
       amount,
       LAG(amount) OVER (ORDER BY id) AS prev_amount
FROM orders;

-- Output:
-- id | amount | prev_amount
-- 1  | 100    | NULL
-- 2  | 200    | 100
-- 3  | 300    | 200
-- 4  | 150    | 300
-- 5  | 250    | 150


-- Q2: LAG with PARTITION
SELECT id,
       customer,
       amount,
       LAG(amount) OVER (PARTITION BY customer ORDER BY id) AS prev_amount
FROM orders;

-- Output:
-- id | customer | amount | prev_amount
-- 1  | A        | 100    | NULL
-- 2  | A        | 200    | 100
-- 3  | A        | 300    | 200
-- 4  | B        | 150    | NULL
-- 5  | B        | 250    | 150


-- Q3: Basic LEAD
SELECT id,
       amount,
       LEAD(amount) OVER (ORDER BY id) AS next_amount
FROM orders;

-- Output:
-- id | amount | next_amount
-- 1  | 100    | 200
-- 2  | 200    | 300
-- 3  | 300    | 150
-- 4  | 150    | 250
-- 5  | 250    | NULL


-- Q4: LEAD with PARTITION
SELECT id,
       customer,
       amount,
       LEAD(amount) OVER (PARTITION BY customer ORDER BY id) AS next_amount
FROM orders;

-- Output:
-- id | customer | amount | next_amount
-- 1  | A        | 100    | 200
-- 2  | A        | 200    | 300
-- 3  | A        | 300    | NULL
-- 4  | B        | 150    | 250
-- 5  | B        | 250    | NULL


-- Q5: Difference using LAG
SELECT id,
       amount,
       amount - LAG(amount) OVER (ORDER BY id) AS diff
FROM orders;

-- Output:
-- id | amount | diff
-- 1  | 100    | NULL
-- 2  | 200    | 100
-- 3  | 300    | 100
-- 4  | 150    | -150
-- 5  | 250    | 100


-- Q6: Difference using LEAD
SELECT id,
       amount,
       LEAD(amount) OVER (ORDER BY id) - amount AS diff
FROM orders;

-- Output:
-- id | amount | diff
-- 1  | 100    | 100
-- 2  | 200    | 100
-- 3  | 300    | -150
-- 4  | 150    | 100
-- 5  | 250    | NULL


-- Q7: Offset 2 with LAG
SELECT id,
       amount,
       LAG(amount, 2) OVER (ORDER BY id) AS lag_2
FROM orders;

-- Output:
-- id | amount | lag_2
-- 1  | 100    | NULL
-- 2  | 200    | NULL
-- 3  | 300    | 100
-- 4  | 150    | 200
-- 5  | 250    | 300


-- Q8: Offset 2 with LEAD
SELECT id,
       amount,
       LEAD(amount, 2) OVER (ORDER BY id) AS lead_2
FROM orders;

-- Output:
-- id | amount | lead_2
-- 1  | 100    | 300
-- 2  | 200    | 150
-- 3  | 300    | 250
-- 4  | 150    | NULL
-- 5  | 250    | NULL


-- Q9: With default value
SELECT id,
       amount,
       LAG(amount, 1, 0) OVER (ORDER BY id) AS prev_amount
FROM orders;

-- Output:
-- id | amount | prev_amount
-- 1  | 100    | 0
-- 2  | 200    | 100
-- 3  | 300    | 200
-- 4  | 150    | 300
-- 5  | 250    | 150


-- Q10: Partition + difference
SELECT id,
       customer,
       amount,
       amount - LAG(amount) OVER (PARTITION BY customer ORDER BY id) AS diff
FROM orders;

-- Output:
-- id | customer | amount | diff
-- 1  | A        | 100    | NULL
-- 2  | A        | 200    | 100
-- 3  | A        | 300    | 100
-- 4  | B        | 150    | NULL
-- 5  | B        | 250    | 100
