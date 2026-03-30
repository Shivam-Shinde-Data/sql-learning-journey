-- Day 21 – Practice: Indexes

-- Create Table
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    email VARCHAR(100)
);

-- Insert Data
INSERT INTO Employees VALUES
(1, 'Amit', 'IT', 50000, 'amit@gmail.com'),
(2, 'Neha', 'HR', 30000, 'neha@gmail.com'),
(3, 'Raj', 'IT', 60000, 'raj@gmail.com'),
(4, 'Simran', 'Finance', 45000, 'simran@gmail.com'),
(5, 'Karan', 'IT', 70000, 'karan@gmail.com'),
(6, 'Pooja', 'HR', 35000, 'pooja@gmail.com'),
(7, 'Ravi', 'Finance', 48000, 'ravi@gmail.com'),
(8, 'Sneha', 'IT', 52000, 'sneha@gmail.com'),
(9, 'Vikas', 'HR', 31000, 'vikas@gmail.com'),
(10, 'Anjali', 'Finance', 46000, 'anjali@gmail.com');

--------------------------------------------------
-- 1. Create Index on salary
CREATE INDEX idx_salary
ON Employees(salary);

--------------------------------------------------
-- 2. Query using indexed column
SELECT * FROM Employees
WHERE salary > 40000;

--------------------------------------------------
-- 3. Create Index on name
CREATE INDEX idx_name
ON Employees(name);

--------------------------------------------------
-- 4. Search using name
SELECT * FROM Employees
WHERE name = 'Amit';

--------------------------------------------------
-- 5. Create Composite Index
CREATE INDEX idx_name_dept
ON Employees(name, department);

--------------------------------------------------
-- 6. Query using composite index
SELECT * FROM Employees
WHERE name = 'Raj' AND department = 'IT';

--------------------------------------------------
-- 7. Create Unique Index
CREATE UNIQUE INDEX idx_email
ON Employees(email);

--------------------------------------------------
-- 8. Query using email
SELECT * FROM Employees
WHERE email = 'neha@gmail.com';

--------------------------------------------------
-- 9. Drop an Index
DROP INDEX idx_name;

--------------------------------------------------
-- 10. Check performance scenario (conceptual)
SELECT * FROM Employees
WHERE department = 'IT';
