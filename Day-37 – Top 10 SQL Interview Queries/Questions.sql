-- Day 51: Top 10 SQL Interview Queries

-- Q1. Find the 2nd highest salary
SELECT MAX(salary) AS second_highest
FROM employees
WHERE salary < (SELECT MAX(salary) FROM employees);

--------------------------------------------------

-- Q2. Find duplicate records
SELECT name, COUNT(*) 
FROM employees
GROUP BY name
HAVING COUNT(*) > 1;

--------------------------------------------------

-- Q3. Remove duplicate records (keep one)
DELETE FROM employees
WHERE id NOT IN (
    SELECT MIN(id)
    FROM employees
    GROUP BY name
);

--------------------------------------------------

-- Q4. Find employees who earn more than average salary
SELECT * 
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

--------------------------------------------------

-- Q5. Find nth highest salary (example: 3rd)
SELECT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

--------------------------------------------------

-- Q6. Find departments with highest average salary
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC;

--------------------------------------------------

-- Q7. Get last record from table
SELECT *
FROM employees
ORDER BY id DESC
LIMIT 1;

--------------------------------------------------

-- Q8. Find employees with same salary
SELECT e1.name, e2.name, e1.salary
FROM employees e1
JOIN employees e2 
ON e1.salary = e2.salary AND e1.id <> e2.id;

--------------------------------------------------

-- Q9. Find top 3 highest salaries
SELECT salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

--------------------------------------------------

-- Q10. Find employees hired in last 30 days
SELECT *
FROM employees
WHERE hire_date >= CURRENT_DATE - INTERVAL '30 days';
