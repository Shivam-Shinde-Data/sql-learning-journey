-- Day 09 Practice – BETWEEN Operator

-- Create Table

CREATE TABLE employees (
    emp_id INT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    joining_date DATE
);

-- Insert Data

INSERT INTO employees VALUES
(1,'Amit','IT',60000,'2023-02-10'),
(2,'Rahul','HR',45000,'2022-05-12'),
(3,'Sneha','IT',75000,'2021-09-01'),
(4,'Priya','Finance',65000,'2023-01-15'),
(5,'Karan','HR',50000,'2022-08-20'),
(6,'Neha','Finance',70000,'2020-11-11'),
(7,'Rohit','IT',72000,'2022-04-01'),
(8,'Pooja','Finance',68000,'2023-03-05');

--------------------------------------------------

-- 1 View all employees

SELECT *
FROM employees;

--------------------------------------------------

-- 2 Employees with salary between 50000 and 70000

SELECT name, salary
FROM employees
WHERE salary BETWEEN 50000 AND 70000;

--------------------------------------------------

-- 3 Employees with salary between 45000 and 65000

SELECT name, salary
FROM employees
WHERE salary BETWEEN 45000 AND 65000;

--------------------------------------------------

-- 4 Employees who joined between two dates

SELECT name, joining_date
FROM employees
WHERE joining_date BETWEEN '2022-01-01' AND '2023-12-31';

--------------------------------------------------

-- 5 Employees whose names fall alphabetically between A and M

SELECT name
FROM employees
WHERE name BETWEEN 'A' AND 'M';

--------------------------------------------------

-- 6 Employees whose salary is NOT between 50000 and 70000

SELECT name, salary
FROM employees
WHERE salary NOT BETWEEN 50000 AND 70000;

--------------------------------------------------

-- 7 IT employees with salary between 60000 and 80000

SELECT name, department, salary
FROM employees
WHERE department = 'IT'
AND salary BETWEEN 60000 AND 80000;

--------------------------------------------------

-- 8 Employees who joined between 2021 and 2023

SELECT name, joining_date
FROM employees
WHERE joining_date BETWEEN '2021-01-01' AND '2023-12-31';

--------------------------------------------------

-- 9 Employees with salary between 60000 and 75000

SELECT name, salary
FROM employees
WHERE salary BETWEEN 60000 AND 75000;

--------------------------------------------------

-- 10 Employees with salary outside 45000 to 65000

SELECT name, salary
FROM employees
WHERE salary NOT BETWEEN 45000 AND 65000;
