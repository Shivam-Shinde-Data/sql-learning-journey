-- Day 07 Practice – ORDER BY Clause

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
(6,'Neha','Finance',70000,'2020-11-11');

--------------------------------------------------

-- 1 View all employees

SELECT * FROM employees;

--------------------------------------------------

-- 2 Sort employees by salary (ascending)

SELECT name, salary
FROM employees
ORDER BY salary;

--------------------------------------------------

-- 3 Sort employees by salary (descending)

SELECT name, salary
FROM employees
ORDER BY salary DESC;

--------------------------------------------------

-- 4 Sort employees alphabetically

SELECT name
FROM employees
ORDER BY name;

--------------------------------------------------

-- 5 Sort employees by department

SELECT name, department
FROM employees
ORDER BY department;

--------------------------------------------------

-- 6 Sort employees by department and salary

SELECT name, department, salary
FROM employees
ORDER BY department, salary;

--------------------------------------------------

-- 7 Sort employees by department ASC and salary DESC

SELECT name, department, salary
FROM employees
ORDER BY department ASC, salary DESC;

--------------------------------------------------

-- 8 Sort employees by joining date

SELECT name, joining_date
FROM employees
ORDER BY joining_date;

--------------------------------------------------

-- 9 Latest employees first

SELECT name, joining_date
FROM employees
ORDER BY joining_date DESC;

--------------------------------------------------

-- 10 Sort using column number

SELECT name, salary
FROM employees
ORDER BY 2 DESC;
