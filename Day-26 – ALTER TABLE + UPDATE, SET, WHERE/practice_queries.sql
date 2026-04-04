-- Day 26 Practice – ALTER TABLE + UPDATE

-- 1. Create Table
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    salary INT
);

-- 2. Insert Data
INSERT INTO employees VALUES
(1, 'Amit', 25000),
(2, 'Neha', 18000),
(3, 'Raj', 30000);

-- 3. View Data
SELECT * FROM employees;

-- =========================
-- 🔴 ALTER TABLE Examples
-- =========================

-- 4. Add column
ALTER TABLE employees
ADD age INT;

-- 5. Modify column
ALTER TABLE employees
MODIFY salary DECIMAL(10,2);

-- 6. Rename column
ALTER TABLE employees
RENAME COLUMN name TO emp_name;

-- 7. Drop column
ALTER TABLE employees
DROP COLUMN age;

-- =========================
-- 🔴 UPDATE Examples
-- =========================

-- 8. Update single row
UPDATE employees
SET salary = 35000
WHERE emp_id = 1;

-- 9. Update multiple columns
UPDATE employees
SET salary = 20000, emp_name = 'Neha Sharma'
WHERE emp_id = 2;

-- 10. Update all rows (be careful!)
UPDATE employees
SET salary = salary + 5000;

-- =========================
-- 🔴 Extra Practice
-- =========================

-- 11. Add new column
ALTER TABLE employees
ADD department VARCHAR(50);

-- 12. Update based on condition
UPDATE employees
SET department = 'IT'
WHERE salary > 25000;
