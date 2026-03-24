-- Create table
CREATE TABLE employees (
    id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- Insert data
INSERT INTO employees VALUES
(1, 'Amit', 'IT', 50000),
(2, 'Neha', 'HR', 40000),
(3, 'Rahul', 'IT', 60000),
(4, 'Priya', 'HR', 45000),
(5, 'Karan', 'IT', 55000);

-- 1. Departments with more than 2 employees
SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;

-- 2. Departments with total salary > 100000
SELECT department, SUM(salary)
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;

-- 3. Departments with average salary > 45000
SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) > 45000;

-- 4. Departments with max salary > 55000
SELECT department, MAX(salary)
FROM employees
GROUP BY department
HAVING MAX(salary) > 55000;

-- 5. Departments with min salary < 45000
SELECT department, MIN(salary)
FROM employees
GROUP BY department
HAVING MIN(salary) < 45000;

-- 6. Use WHERE + HAVING together
SELECT department, COUNT(*)
FROM employees
WHERE salary > 40000
GROUP BY department
HAVING COUNT(*) > 1;

-- 7. Departments where total salary between 100000 and 200000
SELECT department, SUM(salary)
FROM employees
GROUP BY department
HAVING SUM(salary) BETWEEN 100000 AND 200000;

-- 8. Departments with exactly 2 employees
SELECT department, COUNT(*)
FROM employees
GROUP BY department
HAVING COUNT(*) = 2;

-- 9. Departments where average salary is less than 50000
SELECT department, AVG(salary)
FROM employees
GROUP BY department
HAVING AVG(salary) < 50000;

-- 10. Departments with total salary not equal to 150000
SELECT department, SUM(salary)
FROM employees
GROUP BY department
HAVING SUM(salary) != 150000;
