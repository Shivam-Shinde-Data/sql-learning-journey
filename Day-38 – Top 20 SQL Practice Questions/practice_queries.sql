-- Create employees table
CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    salary INT,
    hire_date DATE
);

--------------------------------------------------

-- Insert sample data
INSERT INTO employees (name, email, department, salary, hire_date) VALUES
('Amit', 'amit@gmail.com', 'IT', 60000, '2023-01-10'),
('Rohit', 'rohit@gmail.com', 'HR', 40000, '2022-03-15'),
('Sneha', 'sneha@gmail.com', 'Finance', 70000, '2021-07-20'),
('Priya', NULL, 'IT', 50000, '2024-02-01'),
('Ankit', 'ankit@gmail.com', 'IT', 60000, '2023-06-25'),
('Neha', 'neha@gmail.com', 'HR', 45000, '2022-11-05'),
('Karan', 'karan@gmail.com', 'Finance', 80000, '2020-09-12'),
('Pooja', NULL, 'Marketing', 35000, '2023-08-18'),
('Rahul', 'rahul@gmail.com', 'IT', 30000, '2024-01-05'),
('Simran', 'simran@gmail.com', 'Marketing', 42000, '2022-05-30'),
('Amit', 'amit2@gmail.com', 'IT', 60000, '2023-03-12'),  -- duplicate name
('Vikas', 'vikas@gmail.com', 'HR', 20000, '2021-12-22'),
('Deepak', 'deepak@gmail.com', 'Finance', 55000, '2023-04-14'),
('Nitin', NULL, 'IT', 48000, '2022-09-09'),
('Arjun', 'arjun@gmail.com', 'Marketing', 39000, '2023-07-01');

--------------------------------------------------

-- Q1. Find total number of employees
SELECT COUNT(*) FROM employees;

--------------------------------------------------

-- Q2. Find average salary by department
SELECT department, AVG(salary)
FROM employees
GROUP BY department;

--------------------------------------------------

-- Q3. Find highest salary in each department
SELECT department, MAX(salary)
FROM employees
GROUP BY department;

--------------------------------------------------

-- Q4. Find employees whose name starts with 'A'
SELECT * 
FROM employees
WHERE name LIKE 'A%';

--------------------------------------------------

-- Q5. Count employees in each department
SELECT department, COUNT(*) 
FROM employees
GROUP BY department;

--------------------------------------------------

-- Q6. Find employees with salary between 30000 and 60000
SELECT *
FROM employees
WHERE salary BETWEEN 30000 AND 60000;

--------------------------------------------------

-- Q7. Find employees not in 'HR' department
SELECT *
FROM employees
WHERE department <> 'HR';

--------------------------------------------------

-- Q8. Find total salary paid by each department
SELECT department, SUM(salary)
FROM employees
GROUP BY department;

--------------------------------------------------

-- Q9. Find employees with NULL values in email
SELECT *
FROM employees
WHERE email IS NULL;

--------------------------------------------------

-- Q10. Update salary by 10% for IT department
UPDATE employees
SET salary = salary * 1.10
WHERE department = 'IT';

--------------------------------------------------

-- Q11. Delete employees with salary less than 20000
DELETE FROM employees
WHERE salary < 20000;

--------------------------------------------------

-- Q12. Find distinct departments
SELECT DISTINCT department
FROM employees;

--------------------------------------------------

-- Q13. Find employees ordered by salary descending
SELECT *
FROM employees
ORDER BY salary DESC;

--------------------------------------------------

-- Q14. Find employees hired after 2022
SELECT *
FROM employees
WHERE hire_date > '2022-01-01';

--------------------------------------------------

-- Q15. Find count of employees with salary > 50000
SELECT COUNT(*)
FROM employees
WHERE salary > 50000;

--------------------------------------------------

-- Q16. Find employees whose name ends with 'n'
SELECT *
FROM employees
WHERE name LIKE '%n';

--------------------------------------------------

-- Q17. Find minimum salary
SELECT MIN(salary)
FROM employees;

--------------------------------------------------

-- Q18. Find employees working in multiple conditions
SELECT *
FROM employees
WHERE department = 'IT' AND salary > 40000;

--------------------------------------------------

-- Q19. Find employees sorted by department then salary
SELECT *
FROM employees
ORDER BY department, salary DESC;

--------------------------------------------------

-- Q20. Rename column in output
SELECT name AS employee_name, salary AS income
FROM employees;
