-- Day 08 Practice – LIMIT Clause

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

-- 2 Return first 3 employees

SELECT *
FROM employees
LIMIT 3;

--------------------------------------------------

-- 3 Return first 5 employees

SELECT *
FROM employees
LIMIT 5;

--------------------------------------------------

-- 4 Show top 3 highest salary employees

SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

--------------------------------------------------

-- 5 Show lowest 2 salary employees

SELECT name, salary
FROM employees
ORDER BY salary ASC
LIMIT 2;

--------------------------------------------------

-- 6 Show first 4 employees from IT department

SELECT name, department
FROM employees
WHERE department = 'IT'
LIMIT 4;

--------------------------------------------------

-- 7 Skip first 2 rows and return next 3 rows

SELECT *
FROM employees
LIMIT 3 OFFSET 2;

--------------------------------------------------

-- 8 Show latest 3 employees

SELECT name, joining_date
FROM employees
ORDER BY joining_date DESC
LIMIT 3;

--------------------------------------------------

-- 9 Show 2 employees after skipping first 3

SELECT *
FROM employees
LIMIT 2 OFFSET 3;

--------------------------------------------------

-- 10 Show top 5 highest salary employees

SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 5;
