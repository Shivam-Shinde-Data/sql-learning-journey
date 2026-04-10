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


-- Q1: Basic RANK
SELECT id,
       amount,
       RANK() OVER (ORDER BY amount DESC) AS rank_num
FROM orders;

-- Output:
-- id | amount | rank_num
-- 2  | 200    | 1
-- 3  | 150    | 2
-- 4  | 150    | 2
-- 1  | 100    | 4


-- Q2: RANK with PARTITION
SELECT id,
       customer,
       amount,
       RANK() OVER (PARTITION BY customer ORDER BY amount DESC) AS rank_num
FROM orders;

-- Output:
-- id | customer | amount | rank_num
-- 2  | A        | 200    | 1
-- 1  | A        | 100    | 2
-- 3  | B        | 150    | 1
-- 4  | B        | 150    | 1


-- Q3: Ascending rank
SELECT id,
       amount,
       RANK() OVER (ORDER BY amount ASC) AS rank_num
FROM orders;

-- Output:
-- id | amount | rank_num
-- 1  | 100    | 1
-- 3  | 150    | 2
-- 4  | 150    | 2
-- 2  | 200    | 4


-- Q4: Top rank per customer
SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY customer ORDER BY amount DESC) AS rnk
    FROM orders
) t
WHERE rnk = 1;

-- Output:
-- id | customer | amount | rnk
-- 2  | A        | 200    | 1
-- 3  | B        | 150    | 1
-- 4  | B        | 150    | 1


-- Q5: Second rank per customer
SELECT *
FROM (
    SELECT *,
           RANK() OVER (PARTITION BY customer ORDER BY amount DESC) AS rnk
    FROM orders
) t
WHERE rnk = 2;

-- Output:
-- id | customer | amount | rnk
-- 1  | A        | 100    | 2


-- Q6: Compare ROW_NUMBER vs RANK
SELECT id,
       amount,
       ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_num,
       RANK() OVER (ORDER BY amount DESC) AS rank_num
FROM orders;

-- Output:
-- id | amount | row_num | rank_num
-- 2  | 200    | 1       | 1
-- 3  | 150    | 2       | 2
-- 4  | 150    | 3       | 2
-- 1  | 100    | 4       | 4


-- Q7: Rank with multiple columns
SELECT id,
       customer,
       amount,
       RANK() OVER (ORDER BY amount DESC, id ASC) AS rnk
FROM orders;

-- Output:
-- id | customer | amount | rnk
-- 2  | A        | 200    | 1
-- 3  | B        | 150    | 2
-- 4  | B        | 150    | 3
-- 1  | A        | 100    | 4


-- Q8: Rank per customer ascending
SELECT customer,
       amount,
       RANK() OVER (PARTITION BY customer ORDER BY amount ASC) AS rnk
FROM orders;

-- Output:
-- customer | amount | rnk
-- A        | 100    | 1
-- A        | 200    | 2
-- B        | 150    | 1
-- B        | 150    | 1


-- Q9: Find lowest ranked values
SELECT *
FROM (
    SELECT *,
           RANK() OVER (ORDER BY amount DESC) AS rnk
    FROM orders
) t
WHERE rnk = (SELECT MAX(rnk) FROM (
                SELECT RANK() OVER (ORDER BY amount DESC) AS rnk
                FROM orders
             ) x);

-- Output:
-- id | customer | amount | rnk
-- 1  | A        | 100    | 4


-- Q10: Rank distribution
SELECT id,
       amount,
       RANK() OVER (ORDER BY amount DESC) AS rnk
FROM orders;

-- Output:
-- id | amount | rnk
-- 2  | 200    | 1
-- 3  | 150    | 2
-- 4  | 150    | 2
-- 1  | 100    | 4
