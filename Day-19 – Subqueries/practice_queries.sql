-- Create Employees Table
CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    dept_id INT,
    salary INT
);

-- Create Departments Table
CREATE TABLE Departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

-- Insert Data
INSERT INTO Employees VALUES
(1, 'A', 10, 50000),
(2, 'B', 20, 40000),
(3, 'C', 10, 60000),
(4, 'D', 30, 30000),
(5, 'E', 20, 45000);

INSERT INTO Departments VALUES
(10, 'HR'),
(20, 'Sales'),
(30, 'IT');

-- 1. Single Row Subquery
SELECT name
FROM Employees
WHERE dept_id = (
    SELECT dept_id FROM Departments WHERE dept_name = 'HR'
);

-- 2. Multiple Row Subquery (IN)
SELECT name
FROM Employees
WHERE dept_id IN (
    SELECT dept_id FROM Departments
);

-- 3. Subquery with AVG
SELECT name
FROM Employees
WHERE salary > (
    SELECT AVG(salary) FROM Employees
);

-- 4. Correlated Subquery
SELECT name
FROM Employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);

-- 5. Subquery in SELECT
SELECT name,
       (SELECT MAX(salary) FROM Employees) AS max_salary
FROM Employees;

-- 6. Subquery in FROM
SELECT dept_id, AVG(salary)
FROM (
    SELECT * FROM Employees WHERE salary > 40000
) AS temp
GROUP BY dept_id;

-- 7. EXISTS Example
SELECT name
FROM Employees e
WHERE EXISTS (
    SELECT 1
    FROM Departments d
    WHERE e.dept_id = d.dept_id
);

-- 8. NOT EXISTS Example
SELECT name
FROM Employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM Departments d
    WHERE e.dept_id = d.dept_id
);

-- 9. ANY Operator
SELECT name
FROM Employees
WHERE salary > ANY (
    SELECT salary FROM Employees WHERE dept_id = 20
);

-- 10. ALL Operator
SELECT name
FROM Employees
WHERE salary > ALL (
    SELECT salary FROM Employees WHERE dept_id = 20
); 
