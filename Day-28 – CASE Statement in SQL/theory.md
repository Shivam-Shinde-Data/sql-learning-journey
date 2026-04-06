# Day 28 – CASE Statement in SQL

## 1. What is CASE?

CASE is used to apply conditional logic in SQL (similar to IF-ELSE in programming).

---

## 2. Types of CASE

### 🔹 1. Simple CASE
Compares a column to specific values.

### Syntax:
```sql
SELECT column,
CASE column
    WHEN value1 THEN result1
    WHEN value2 THEN result2
    ELSE default_result
END
FROM table;
```
---

### 🔹 2. Searched CASE
Uses conditions (more flexible).

### Syntax:
```sql
SELECT column,
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE default_result
END
FROM table;
```
---

## 3. Examples

### Example 1: Categorize Salary
```sql
SELECT name, salary,
CASE
    WHEN salary < 20000 THEN 'Low'
    WHEN salary BETWEEN 20000 AND 30000 THEN 'Medium'
    ELSE 'High'
END AS salary_category
FROM employees;
```
---

### Example 2: Grade System
```sql
SELECT student_name, marks,
CASE
    WHEN marks >= 90 THEN 'A'
    WHEN marks >= 75 THEN 'B'
    WHEN marks >= 50 THEN 'C'
    ELSE 'Fail'
END AS grade
FROM students;
```
---

## 4. Key Points

- Works inside SELECT, ORDER BY, GROUP BY
- Always ends with END
- ELSE is optional (default = NULL)

---

## 5. Use Cases

### 🔸 Data Transformation
Convert raw values into meaningful labels

### 🔸 Data Analysis
Create categories (low, medium, high)

### 🔸 Conditional Aggregation
COUNT or SUM based on conditions

---

## 6. CASE with Aggregation

### Example:
```sql
SELECT
    COUNT(CASE WHEN salary > 25000 THEN 1 END) AS high_salary_count
FROM employees;
```
---

## 7. Common Mistakes

❌ Missing END  
❌ Incorrect condition order  
❌ Forgetting ELSE (can return NULL)

---

## 8. Summary

- CASE = IF-ELSE in SQL
- Simple CASE → value matching
- Searched CASE → condition-based
- Used for transformation and logic
