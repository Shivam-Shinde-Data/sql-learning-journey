-- Day 53: SQL Data Cleaning Queries

-- Q1. Find NULL values in email column
SELECT *
FROM employees
WHERE email IS NULL;

--------------------------------------------------

-- Q2. Replace NULL emails with default value
UPDATE employees
SET email = 'not_provided@gmail.com'
WHERE email IS NULL;

--------------------------------------------------

-- Q3. Remove leading and trailing spaces in names
UPDATE employees
SET name = TRIM(name);

--------------------------------------------------

-- Q4. Convert names to uppercase
SELECT UPPER(name) AS cleaned_name
FROM employees;

--------------------------------------------------

-- Q5. Convert names to lowercase
SELECT LOWER(name) AS cleaned_name
FROM employees;

--------------------------------------------------

-- Q6. Remove duplicate records (based on name + department)
DELETE FROM employees
WHERE id NOT IN (
    SELECT MIN(id)
    FROM employees
    GROUP BY name, department
);

--------------------------------------------------

-- Q7. Find duplicate records
SELECT name, department, COUNT(*) 
FROM employees
GROUP BY name, department
HAVING COUNT(*) > 1;

--------------------------------------------------

-- Q8. Standardize department names (e.g., 'it' → 'IT')
UPDATE employees
SET department = UPPER(department);

--------------------------------------------------

-- Q9. Replace specific values (example: HR → Human Resources)
UPDATE employees
SET department = 'Human Resources'
WHERE department = 'HR';

--------------------------------------------------

-- Q10. Remove rows with very low salary (invalid data)
DELETE FROM employees
WHERE salary < 25000;

--------------------------------------------------

-- Q11. Fix incorrect email format (basic check)
SELECT *
FROM employees
WHERE email NOT LIKE '%@%.%';

--------------------------------------------------

-- Q12. Extract domain from email
SELECT email,
       SUBSTRING(email FROM POSITION('@' IN email) + 1) AS domain
FROM employees
WHERE email IS NOT NULL;

--------------------------------------------------

-- Q13. Fill missing salary with average salary
UPDATE employees
SET salary = (SELECT AVG(salary) FROM employees)
WHERE salary IS NULL;

--------------------------------------------------

-- Q14. Remove special characters from name (basic example)
SELECT name,
       REGEXP_REPLACE(name, '[^a-zA-Z]', '', 'g') AS cleaned_name
FROM employees;

--------------------------------------------------

-- Q15. Ensure unique emails
SELECT email, COUNT(*)
FROM employees
GROUP BY email
HAVING COUNT(*) > 1;
