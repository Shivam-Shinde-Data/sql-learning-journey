-- Day 25 Practice – DELETE vs TRUNCATE vs DROP

-- 1. Create Sample Table
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    salary INT
);

-- 2. Insert Data
INSERT INTO employees VALUES
(1, 'Amit', 25000),
(2, 'Neha', 18000),
(3, 'Raj', 30000),
(4, 'Simran', 15000);

-- 3. View Data
SELECT * FROM employees;

-- =========================
-- 🔴 DELETE Examples
-- =========================

-- 4. Delete specific rows
DELETE FROM employees
WHERE salary < 20000;

-- 5. Delete all rows
DELETE FROM employees;

-- =========================
-- 🔴 TRUNCATE Examples
-- =========================

-- Re-insert data
INSERT INTO employees VALUES
(1, 'Amit', 25000),
(2, 'Neha', 18000);

-- 6. Truncate table
TRUNCATE TABLE employees;

-- =========================
-- 🔴 DROP Examples
-- =========================

-- Recreate table
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    salary INT
);

-- 7. Drop table
DROP TABLE employees;

-- =========================
-- 🔴 Extra Practice
-- =========================

-- 8. Create another table
CREATE TABLE students (
    id INT,
    name VARCHAR(50)
);

-- Insert data
INSERT INTO students VALUES
(1, 'Ravi'),
(2, 'Priya');

-- 9. Delete one record
DELETE FROM students
WHERE id = 1;

-- 10. Truncate table
TRUNCATE TABLE students;
