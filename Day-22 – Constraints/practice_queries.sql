-- Day 22 – Practice: Constraints

-- Create Department Table
CREATE TABLE Department (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

-- Create Employees Table with Constraints
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary INT CHECK (salary > 0),
    status VARCHAR(20) DEFAULT 'Active',
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(id)
);

--------------------------------------------------
-- Insert Data into Department
INSERT INTO Department VALUES
(1, 'IT'),
(2, 'HR'),
(3, 'Finance');

--------------------------------------------------
-- 1. Insert Valid Data
INSERT INTO Employees VALUES
(1, 'Amit', 'amit@gmail.com', 50000, 'Active', 1);

--------------------------------------------------
-- 2. NOT NULL Constraint (will fail)
INSERT INTO Employees (id, email, salary, dept_id)
VALUES (2, 'neha@gmail.com', 30000, 2);

--------------------------------------------------
-- 3. UNIQUE Constraint (will fail)
INSERT INTO Employees VALUES
(3, 'Raj', 'amit@gmail.com', 60000, 'Active', 1);

--------------------------------------------------
-- 4. CHECK Constraint (will fail)
INSERT INTO Employees VALUES
(4, 'Simran', 'simran@gmail.com', -1000, 'Active', 2);

--------------------------------------------------
-- 5. DEFAULT Constraint
INSERT INTO Employees (id, name, email, salary, dept_id)
VALUES (5, 'Karan', 'karan@gmail.com', 45000, 1);

--------------------------------------------------
-- 6. FOREIGN KEY Constraint (will fail)
INSERT INTO Employees VALUES
(6, 'Pooja', 'pooja@gmail.com', 35000, 'Active', 10);

--------------------------------------------------
-- 7. View Data
SELECT * FROM Employees;

--------------------------------------------------
-- 8. Add UNIQUE Constraint after creation
ALTER TABLE Employees
ADD CONSTRAINT unique_email UNIQUE (email);

--------------------------------------------------
-- 9. Add CHECK Constraint after creation
ALTER TABLE Employees
ADD CONSTRAINT check_salary CHECK (salary > 0);

--------------------------------------------------
-- 10. Drop PRIMARY KEY (syntax may vary)
ALTER TABLE Employees
DROP PRIMARY KEY;
