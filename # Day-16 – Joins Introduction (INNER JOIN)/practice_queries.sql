-- Create employees table
CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    dept_id INT
);

-- Create departments table
CREATE TABLE departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

-- Insert data into employees
INSERT INTO employees VALUES
(1, 'Amit', 101),
(2, 'Neha', 102),
(3, 'Rahul', 101),
(4, 'Priya', 103);

-- Insert data into departments
INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(104, 'Finance');

-- 1. Basic INNER JOIN
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- 2. INNER JOIN with WHERE
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';

-- 3. Get employee IDs and department names
SELECT e.emp_id, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- 4. Count employees per department
SELECT d.dept_name, COUNT(*) 
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- 5. Get employees only from HR
SELECT e.name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'HR';

-- 6. Join with condition on emp_id
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.emp_id > 1;

-- 7. Get department names with more than 1 employee
SELECT d.dept_name, COUNT(*)
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
GROUP BY d.dept_name
HAVING COUNT(*) > 1;

-- 8. Join and order result
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
ORDER BY d.dept_name;

-- 9. Multiple column selection
SELECT e.emp_id, e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- 10. Count total matched records
SELECT COUNT(*)
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
