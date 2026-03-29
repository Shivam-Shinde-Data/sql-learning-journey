-- Create Employees Table
CREATE TABLE Employees (
    emp_id INT,
    name VARCHAR(50),
    dept_id INT,
    salary INT
);

-- Insert Data
INSERT INTO Employees VALUES
(1, 'A', 10, 50000),
(2, 'B', 20, 40000),
(3, 'C', 10, 60000),
(4, 'D', 30, 30000),
(5, 'E', 20, 45000);

-- 1. Create Simple View
CREATE VIEW high_salary_employees AS
SELECT name, salary
FROM Employees
WHERE salary > 40000;

-- 2. Select from View
SELECT * FROM high_salary_employees;

-- 3. Create View with condition
CREATE VIEW dept_10_employees AS
SELECT name, dept_id
FROM Employees
WHERE dept_id = 10;

-- 4. Create Complex View (using GROUP BY)
CREATE VIEW avg_salary_by_dept AS
SELECT dept_id, AVG(salary) AS avg_salary
FROM Employees
GROUP BY dept_id;

-- 5. Select from complex view
SELECT * FROM avg_salary_by_dept;

-- 6. Update View (simple view only)
UPDATE high_salary_employees
SET salary = 55000
WHERE name = 'A';

-- 7. Insert using View
INSERT INTO high_salary_employees (name, salary)
VALUES ('F', 70000);

-- 8. Delete using View
DELETE FROM high_salary_employees
WHERE name = 'E';

-- 9. Drop View
DROP VIEW dept_10_employees;

-- 10. View with JOIN
CREATE VIEW employee_department AS
SELECT e.name, e.salary, e.dept_id
FROM Employees e;
