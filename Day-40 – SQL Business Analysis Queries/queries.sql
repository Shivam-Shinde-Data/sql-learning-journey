-- Day 40: SQL Business Analysis Queries

--------------------------------------------------
-- Q1. Total salary expense (company cost)
SELECT SUM(salary) AS total_salary
FROM employees;

--------------------------------------------------
-- Q2. Average salary by department (performance insight)
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

--------------------------------------------------
-- Q3. Department with highest total salary expense
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC
LIMIT 1;

--------------------------------------------------
-- Q4. Top 3 highest paid employees
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

--------------------------------------------------
-- Q5. Employee distribution across departments
SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

--------------------------------------------------
-- Q6. Salary growth analysis (recent hires vs old hires)
SELECT 
    CASE 
        WHEN hire_date >= CURRENT_DATE - INTERVAL '1 year' THEN 'Recent Hires'
        ELSE 'Old Employees'
    END AS category,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY category;

--------------------------------------------------
-- Q7. Find departments with more than 3 employees
SELECT department, COUNT(*) 
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;

--------------------------------------------------
-- Q8. Salary range classification
SELECT name, salary,
       CASE 
           WHEN salary < 40000 THEN 'Low'
           WHEN salary BETWEEN 40000 AND 70000 THEN 'Medium'
           ELSE 'High'
       END AS salary_category
FROM employees;

--------------------------------------------------
-- Q9. Monthly hiring trend
SELECT DATE_TRUNC('month', hire_date) AS month,
       COUNT(*) AS hires
FROM employees
GROUP BY month
ORDER BY month;

--------------------------------------------------
-- Q10. Find employees earning above department average
SELECT *
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

--------------------------------------------------
-- Q11. Identify highest paid employee in each department
SELECT DISTINCT ON (department)
       department, name, salary
FROM employees
ORDER BY department, salary DESC;

--------------------------------------------------
-- Q12. Department-wise salary contribution percentage
SELECT 
    department,
    ROUND(100.0 * SUM(salary) / (SELECT SUM(salary) FROM employees), 2) AS percentage
FROM employees
GROUP BY department;

--------------------------------------------------
-- Q13. Employee retention analysis (tenure)
SELECT name,
       AGE(CURRENT_DATE, hire_date) AS tenure
FROM employees;

--------------------------------------------------
-- Q14. Find departments with declining hiring (example logic)
SELECT DATE_TRUNC('year', hire_date) AS year,
       COUNT(*) AS hires
FROM employees
GROUP BY year
ORDER BY year;

--------------------------------------------------
-- Q15. Detect salary gaps within departments
SELECT department,
       MAX(salary) - MIN(salary) AS salary_gap
FROM employees
GROUP BY department;

--------------------------------------------------
-- Q16. Top earning department (by avg salary)
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY avg_salary DESC
LIMIT 1;

--------------------------------------------------
-- Q17. Identify employees with longest tenure
SELECT name, hire_date
FROM employees
ORDER BY hire_date ASC
LIMIT 3;

--------------------------------------------------
-- Q18. Hiring count per year
SELECT EXTRACT(YEAR FROM hire_date) AS year,
       COUNT(*) AS hires
FROM employees
GROUP BY year
ORDER BY year;

--------------------------------------------------
-- Q19. Salary distribution buckets
SELECT 
    WIDTH_BUCKET(salary, 20000, 80000, 4) AS bucket,
    COUNT(*) 
FROM employees
GROUP BY bucket
ORDER BY bucket;

--------------------------------------------------
-- Q20. Detect potential underpaid employees
SELECT *
FROM employees
WHERE salary < (
    SELECT AVG(salary) * 0.8 FROM employees
);
