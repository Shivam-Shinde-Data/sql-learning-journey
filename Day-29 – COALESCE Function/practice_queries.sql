-- Sample Table: customers
CREATE TABLE customers (
    id INT,
    name VARCHAR(50),
    email VARCHAR(50),
    phone VARCHAR(15)
);

INSERT INTO customers VALUES
(1, 'Amit', 'amit@gmail.com', NULL),
(2, 'Riya', NULL, '9876543210'),
(3, 'John', NULL, NULL);


-- Q1: Basic COALESCE
SELECT COALESCE(NULL, NULL, 5, 10) AS result;

-- Output:
-- result
-- 5


-- Q2: Replace NULL phone
SELECT name,
       COALESCE(phone, 'Not Available') AS phone
FROM customers;

-- Output:
-- name  | phone
-- Amit  | Not Available
-- Riya  | 9876543210
-- John  | Not Available


-- Q3: Get first available contact
SELECT name,
       COALESCE(email, phone, 'No Contact') AS contact
FROM customers;

-- Output:
-- name  | contact
-- Amit  | amit@gmail.com
-- Riya  | 9876543210
-- John  | No Contact


-- Q4: COALESCE with numbers
SELECT COALESCE(NULL, 100, 200) AS result;

-- Output:
-- result
-- 100


-- Q5: COALESCE in calculations

CREATE TABLE products (
    id INT,
    name VARCHAR(50),
    price INT,
    discount INT
);

INSERT INTO products VALUES
(1, 'Laptop', 50000, NULL),
(2, 'Phone', 20000, 2000);

SELECT name,
       price,
       COALESCE(discount, 0) AS discount,
       price - COALESCE(discount, 0) AS final_price
FROM products;

-- Output:
-- name   | price | discount | final_price
-- Laptop | 50000 | 0        | 50000
-- Phone  | 20000 | 2000     | 18000


-- Q6: COALESCE with aggregates
SELECT COALESCE(SUM(price), 0) AS total_price
FROM products;

-- Output:
-- total_price
-- 70000


-- Q7: Multiple NULL handling
SELECT name,
       COALESCE(email, phone, 'No Info') AS contact
FROM customers;

-- Output:
-- name  | contact
-- Amit  | amit@gmail.com
-- Riya  | 9876543210
-- John  | No Info


-- Q8: COALESCE with strings
SELECT COALESCE(NULL, 'Hello', 'World') AS result;

-- Output:
-- result
-- Hello


-- Q9: COALESCE with mixed priority
SELECT name,
       COALESCE(phone, email, 'Missing') AS contact
FROM customers;

-- Output:
-- name  | contact
-- Amit  | amit@gmail.com
-- Riya  | 9876543210
-- John  | Missing


-- Q10: All NULL case
SELECT COALESCE(NULL, NULL, NULL) AS result;

-- Output:
-- result
-- NULL
