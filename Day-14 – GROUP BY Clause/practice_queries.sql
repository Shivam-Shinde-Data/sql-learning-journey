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

-- 1. Count employees in each department
SELECT department, COUNT(*) 
FROM employees
GROUP BY department;

-- 2. Total salary per department
SELECT department, SUM(salary) 
FROM employees
GROUP BY department;

-- 3. Average salary per department
SELECT department, AVG(salary) 
FROM employees
GROUP BY department;

-- 4. Maximum salary per department
SELECT department, MAX(salary) 
FROM employees
GROUP BY department;

-- 5. Minimum salary per department
SELECT department, MIN(salary) 
FROM employees
GROUP BY department;

-- 6. Count employees with salary > 45000 per department
SELECT department, COUNT(*) 
FROM employees
WHERE salary > 45000
GROUP BY department;

-- 7. Group by multiple columns
SELECT department, salary, COUNT(*) 
FROM employees
GROUP BY department, salary;

-- 8. Total salary only for IT department
SELECT department, SUM(salary)
FROM employees
WHERE department = 'IT'
GROUP BY department;

-- 9. Count employees in each department where salary >= 50000
SELECT department, COUNT(*)
FROM employees
WHERE salary >= 50000
GROUP BY department;

-- 10. Average salary for each department with salary > 40000
SELECT department, AVG(salary)
FROM employees
WHERE salary > 40000
GROUP BY department;
