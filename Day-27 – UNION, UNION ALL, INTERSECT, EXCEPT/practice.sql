-- Day 27 Practice – UNION, UNION ALL, INTERSECT, EXCEPT

-- 1. Create Tables
CREATE TABLE employees (
    name VARCHAR(50)
);

CREATE TABLE customers (
    name VARCHAR(50)
);

-- 2. Insert Data
INSERT INTO employees VALUES
('Amit'),
('Neha'),
('Raj'),
('Simran');

INSERT INTO customers VALUES
('Neha'),
('Raj'),
('Priya'),
('Karan');

-- 3. View Data
SELECT * FROM employees;
SELECT * FROM customers;

-- =========================
-- 🔴 UNION
-- =========================

-- 4. Combine unique names
SELECT name FROM employees
UNION
SELECT name FROM customers;

-- =========================
-- 🔴 UNION ALL
-- =========================

-- 5. Combine all names (including duplicates)
SELECT name FROM employees
UNION ALL
SELECT name FROM customers;

-- =========================
-- 🔴 INTERSECT
-- =========================

-- 6. Common names
SELECT name FROM employees
INTERSECT
SELECT name FROM customers;

-- =========================
-- 🔴 EXCEPT
-- =========================

-- 7. Names in employees but not in customers
SELECT name FROM employees
EXCEPT
SELECT name FROM customers;

-- =========================
-- 🔴 Extra Practice
-- =========================

-- 8. Reverse EXCEPT
SELECT name FROM customers
EXCEPT
SELECT name FROM employees;

-- 9. UNION with multiple columns
CREATE TABLE dept1 (
    id INT,
    name VARCHAR(50)
);

CREATE TABLE dept2 (
    id INT,
    name VARCHAR(50)
);

INSERT INTO dept1 VALUES (1, 'Amit'), (2, 'Neha');
INSERT INTO dept2 VALUES (2, 'Neha'), (3, 'Raj');

SELECT * FROM dept1
UNION
SELECT * FROM dept2;

-- 10. INTERSECT with IDs
SELECT * FROM dept1
INTERSECT
SELECT * FROM dept2;
