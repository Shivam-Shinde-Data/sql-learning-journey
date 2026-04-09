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
(4, 'B', 150);


-- Q1: ROW_NUMBER without partition
SELECT id,
       customer,
       amount,
       ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_num
FROM orders;

-- Output:
-- id | customer | amount | row_num
-- 2  | A        | 200    | 1
-- 3  | B        | 150    | 2
-- 4  | B        | 150    | 3
-- 1  | A        | 100    | 4


-- Q2: ROW_NUMBER with partition
SELECT id,
       customer,
       amount,
       ROW_NUMBER() OVER (PARTITION BY customer ORDER BY amount DESC) AS row_num
FROM orders;

-- Output:
-- id | customer | amount | row_num
-- 2  | A        | 200    | 1
-- 1  | A        | 100    | 2
-- 3  | B        | 150    | 1
-- 4  | B        | 150    | 2


-- Q3: Assign row numbers ascending
SELECT id,
       customer,
       amount,
       ROW_NUMBER() OVER (ORDER BY amount ASC) AS row_num
FROM orders;

-- Output:
-- id | customer | amount | row_num
-- 1  | A        | 100    | 1
-- 3  | B        | 150    | 2
-- 4  | B        | 150    | 3
-- 2  | A        | 200    | 4


-- Q4: Top 1 per customer
SELECT *
FROM (
    SELECT id,
           customer,
           amount,
           ROW_NUMBER() OVER (PARTITION BY customer ORDER BY amount DESC) AS rn
    FROM orders
) t
WHERE rn = 1;

-- Output:
-- id | customer | amount | rn
-- 2  | A        | 200    | 1
-- 3  | B        | 150    | 1


-- Q5: Remove duplicates (keep one)
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer, amount ORDER BY id) AS rn
    FROM orders
) t
WHERE rn = 1;

-- Output:
-- id | customer | amount | rn
-- 1  | A        | 100    | 1
-- 2  | A        | 200    | 1
-- 3  | B        | 150    | 1


-- Q6: Row number with multiple columns
SELECT id,
       customer,
       amount,
       ROW_NUMBER() OVER (PARTITION BY customer ORDER BY amount DESC, id ASC) AS rn
FROM orders;

-- Output:
-- id | customer | amount | rn
-- 2  | A        | 200    | 1
-- 1  | A        | 100    | 2
-- 3  | B        | 150    | 1
-- 4  | B        | 150    | 2


-- Q7: Get second highest per customer
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY customer ORDER BY amount DESC) AS rn
    FROM orders
) t
WHERE rn = 2;

-- Output:
-- id | customer | amount | rn
-- 1  | A        | 100    | 2
-- 4  | B        | 150    | 2


-- Q8: Global ranking order
SELECT id,
       amount,
       ROW_NUMBER() OVER (ORDER BY amount DESC, id ASC) AS rn
FROM orders;

-- Output:
-- id | amount | rn
-- 2  | 200    | 1
-- 3  | 150    | 2
-- 4  | 150    | 3
-- 1  | 100    | 4


-- Q9: Row numbers reset per group
SELECT customer,
       amount,
       ROW_NUMBER() OVER (PARTITION BY customer ORDER BY amount) AS rn
FROM orders;

-- Output:
-- customer | amount | rn
-- A        | 100    | 1
-- A        | 200    | 2
-- B        | 150    | 1
-- B        | 150    | 2


-- Q10: Pagination example (first 2 rows)
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY id) AS rn
    FROM orders
) t
WHERE rn <= 2;

-- Output:
-- id | customer | amount | rn
-- 1  | A        | 100    | 1
-- 2  | A        | 200    | 2
