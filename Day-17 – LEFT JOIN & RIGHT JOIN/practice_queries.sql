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

-- 1. LEFT JOIN basic
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- 2. RIGHT JOIN basic
SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- 3. Employees without department
SELECT e.name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- 4. Departments without employees
SELECT d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;

-- 5. LEFT JOIN with condition
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.emp_id > 2;

-- 6. Count employees per department (including NULL)
SELECT d.dept_name, COUNT(e.emp_id)
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

-- 7. List all departments even if no employees
SELECT d.dept_name, e.name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id;

-- 8. Order LEFT JOIN result
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
ORDER BY e.name;

-- 9. Multiple column selection
SELECT e.emp_id, e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- 10. Count total rows in RIGHT JOIN
SELECT COUNT(*)
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
