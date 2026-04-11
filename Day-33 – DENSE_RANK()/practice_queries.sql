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


-- Q1: Basic DENSE_RANK
SELECT id,
       amount,
       DENSE_RANK() OVER (ORDER BY amount DESC) AS dense_rank
FROM orders;

-- Output:
-- id | amount | dense_rank
-- 2  | 200    | 1
-- 3  | 150    | 2
-- 4  | 150    | 2
-- 1  | 100    | 3


-- Q2: With PARTITION
SELECT id,
       customer,
       amount,
       DENSE_RANK() OVER (PARTITION BY customer ORDER BY amount DESC) AS dense_rank
FROM orders;

-- Output:
-- id | customer | amount | dense_rank
-- 2  | A        | 200    | 1
-- 1  | A        | 100    | 2
-- 3  | B        | 150    | 1
-- 4  | B        | 150    | 1


-- Q3: Ascending order
SELECT id,
       amount,
       DENSE_RANK() OVER (ORDER BY amount ASC) AS dense_rank
FROM orders;

-- Output:
-- id | amount | dense_rank
-- 1  | 100    | 1
-- 3  | 150    | 2
-- 4  | 150    | 2
-- 2  | 200    | 3


-- Q4: Compare all three
SELECT id,
       amount,
       ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_num,
       RANK() OVER (ORDER BY amount DESC) AS rank_num,
       DENSE_RANK() OVER (ORDER BY amount DESC) AS dense_rank
FROM orders;

-- Output:
-- id | amount | row_num | rank_num | dense_rank
-- 2  | 200    | 1       | 1        | 1
-- 3  | 150    | 2       | 2        | 2
-- 4  | 150    | 3       | 2        | 2
-- 1  | 100    | 4       | 4        | 3


-- Q5: Top rank per customer
SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY customer ORDER BY amount DESC) AS rnk
    FROM orders
) t
WHERE rnk = 1;

-- Output:
-- id | customer | amount | rnk
-- 2  | A        | 200    | 1
-- 3  | B        | 150    | 1
-- 4  | B        | 150    | 1


-- Q6: Second rank per customer
SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER (PARTITION BY customer ORDER BY amount DESC) AS rnk
    FROM orders
) t
WHERE rnk = 2;

-- Output:
-- id | customer | amount | rnk
-- 1  | A        | 100    | 2


-- Q7: Dense rank with multiple columns
SELECT id,
       customer,
       amount,
       DENSE_RANK() OVER (ORDER BY amount DESC, id ASC) AS rnk
FROM orders;

-- Output:
-- id | customer | amount | rnk
-- 2  | A        | 200    | 1
-- 3  | B        | 150    | 2
-- 4  | B        | 150    | 3
-- 1  | A        | 100    | 4


-- Q8: Dense rank per customer ascending
SELECT customer,
       amount,
       DENSE_RANK() OVER (PARTITION BY customer ORDER BY amount ASC) AS rnk
FROM orders;

-- Output:
-- customer | amount | rnk
-- A        | 100    | 1
-- A        | 200    | 2
-- B        | 150    | 1
-- B        | 150    | 1


-- Q9: Find lowest dense rank
SELECT *
FROM (
    SELECT *,
           DENSE_RANK() OVER (ORDER BY amount DESC) AS rnk
    FROM orders
) t
WHERE rnk = (SELECT MAX(rnk) FROM (
                SELECT DENSE_RANK() OVER (ORDER BY amount DESC) AS rnk
                FROM orders
             ) x);

-- Output:
-- id | customer | amount | rnk
-- 1  | A        | 100    | 3


-- Q10: Rank distribution
SELECT id,
       amount,
       DENSE_RANK() OVER (ORDER BY amount DESC) AS rnk
FROM orders;

-- Output:
-- id | amount | rnk
-- 2  | 200    | 1
-- 3  | 150    | 2
-- 4  | 150    | 2
-- 1  | 100    | 3
