-- Create Employees Table
CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    dept_id INT,
    manager_id INT
);

-- Create Departments Table
CREATE TABLE Departments (
    dept_id INT,
    dept_name VARCHAR(50)
);

-- Insert Data
INSERT INTO Employees VALUES
(1, 'A', 10, NULL),
(2, 'B', 20, 1),
(3, 'C', NULL, 1),
(4, 'D', 30, 2),
(5, 'E', 40, NULL);

INSERT INTO Departments VALUES
(10, 'HR'),
(30, 'IT'),
(40, 'Finance'),
(50, 'Marketing');

-- 1. FULL JOIN Example
SELECT e.name, d.dept_name
FROM Employees e
FULL JOIN Departments d
ON e.dept_id = d.dept_id;

-- 2. FULL JOIN with NULL filtering (missing records)
SELECT e.name, d.dept_name
FROM Employees e
FULL JOIN Departments d
ON e.dept_id = d.dept_id
WHERE e.dept_id IS NULL OR d.dept_id IS NULL;

-- 3. FULL JOIN with ORDER BY
SELECT e.name, d.dept_name
FROM Employees e
FULL JOIN Departments d
ON e.dept_id = d.dept_id
ORDER BY e.name;

-- 4. FULL JOIN using alias and conditions
SELECT e.emp_id, e.name, d.dept_name
FROM Employees e
FULL JOIN Departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name IS NOT NULL;

-- 5. FULL JOIN counting records
SELECT COUNT(*) AS total_records
FROM Employees e
FULL JOIN Departments d
ON e.dept_id = d.dept_id;

-- 6. SELF JOIN (Employee - Manager)
SELECT e.name AS Employee, m.name AS Manager
FROM Employees e
JOIN Employees m
ON e.manager_id = m.emp_id;

-- 7. SELF JOIN (LEFT JOIN for employees without manager)
SELECT e.name AS Employee, m.name AS Manager
FROM Employees e
LEFT JOIN Employees m
ON e.manager_id = m.emp_id;

-- 8. SELF JOIN (Employees in same department)
SELECT a.name AS Employee1, b.name AS Employee2, a.dept_id
FROM Employees a
JOIN Employees b
ON a.dept_id = b.dept_id
WHERE a.emp_id <> b.emp_id;

-- 9. SELF JOIN (Find employees with same manager)
SELECT e1.name, e2.name, e1.manager_id
FROM Employees e1
JOIN Employees e2
ON e1.manager_id = e2.manager_id
WHERE e1.emp_id <> e2.emp_id;

-- 10. SELF JOIN (Find manager who manages multiple employees)
SELECT m.name AS Manager, COUNT(e.emp_id) AS team_size
FROM Employees e
JOIN Employees m
ON e.manager_id = m.emp_id
GROUP BY m.name
HAVING COUNT(e.emp_id) > 1;
