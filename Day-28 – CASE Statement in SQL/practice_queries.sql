-- Day 28 Practice – CASE Statement

-- 1. Create Table
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    salary INT
);

-- 2. Insert Data
INSERT INTO employees VALUES
(1, 'Amit', 18000),
(2, 'Neha', 25000),
(3, 'Raj', 32000),
(4, 'Simran', 15000);

-- 3. View Data
SELECT * FROM employees;

-- =========================
-- 🔴 CASE Examples
-- =========================

-- 4. Salary Category
SELECT name, salary,
CASE
    WHEN salary < 20000 THEN 'Low'
    WHEN salary BETWEEN 20000 AND 30000 THEN 'Medium'
    ELSE 'High'
END AS salary_category
FROM employees;

-- 5. Bonus Calculation
SELECT name, salary,
CASE
    WHEN salary < 20000 THEN salary * 0.10
    WHEN salary BETWEEN 20000 AND 30000 THEN salary * 0.15
    ELSE salary * 0.20
END AS bonus
FROM employees;

-- =========================
-- 🔴 CASE with UPDATE
-- =========================

-- 6. Update salary based on condition
UPDATE employees
SET salary = CASE
    WHEN salary < 20000 THEN salary + 2000
    WHEN salary BETWEEN 20000 AND 30000 THEN salary + 3000
    ELSE salary + 5000
END;

-- =========================
-- 🔴 CASE with Aggregation
-- =========================

-- 7. Count high salary employees
SELECT
COUNT(CASE WHEN salary > 25000 THEN 1 END) AS high_salary_count
FROM employees;

-- =========================
-- 🔴 Extra Practice
-- =========================

-- 8. Create Students Table
CREATE TABLE students (
    name VARCHAR(50),
    marks INT
);

INSERT INTO students VALUES
('Ravi', 85),
('Priya', 92),
('Karan', 45);

-- 9. Grade System
SELECT name, marks,
CASE
    WHEN marks >= 90 THEN 'A'
    WHEN marks >= 75 THEN 'B'
    WHEN marks >= 50 THEN 'C'
    ELSE 'Fail'
END AS grade
FROM students;

-- 10. Order by CASE
SELECT name, salary
FROM employees
ORDER BY
CASE
    WHEN salary > 30000 THEN 1
    WHEN salary BETWEEN 20000 AND 30000 THEN 2
    ELSE 3
END;
