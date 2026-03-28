# Day 19 – Subqueries

## 1. What is a Subquery?

A subquery is a query inside another SQL query.

- Inner query executes first
- Output is used by outer query

### Syntax:
```sql
SELECT column_name
FROM table
WHERE column_name OPERATOR (SELECT column_name FROM table);
```
---

## 2. Types of Subqueries

### a) Single Row Subquery
Returns only one value

Example:
```sql
SELECT name
FROM Employees
WHERE dept_id = (SELECT dept_id FROM Departments WHERE dept_name = 'HR');
```
---

### b) Multiple Row Subquery
Returns multiple values

Uses operators like IN, ANY, ALL

Example:
```sql
SELECT name
FROM Employees
WHERE dept_id IN (SELECT dept_id FROM Departments);
```
---

### c) Correlated Subquery
Depends on outer query

- Executes once for each row

Example:
```sql
SELECT name
FROM Employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM Employees
    WHERE dept_id = e.dept_id
);
```
---

## 3. Subquery with SELECT

Example:
```sql
SELECT name,
       (SELECT AVG(salary) FROM Employees) AS avg_salary
FROM Employees;
```
---

## 4. Subquery with FROM (Derived Table)

Example:
```sql
SELECT dept_id, AVG(salary)
FROM (
    SELECT * FROM Employees WHERE salary > 30000
) AS temp
GROUP BY dept_id;
```
---

## 5. Operators Used with Subqueries

| Operator | Use Case |
|----------|---------|
| IN       | Multiple values |
| =        | Single value |
| ANY      | Compare with any value |
| ALL      | Compare with all values |
| EXISTS   | Checks if subquery returns rows |

---

## 6. EXISTS vs IN

### EXISTS:
- Faster for large data
- Checks existence

### IN:
- Compares values list

---

## 7. Key Points

- Subquery runs first
- Can be nested multiple levels
- Used in SELECT, WHERE, FROM
- Improves query flexibility

---

## Real-World Use Cases

- Find employees above average salary
- Filter based on another table
- Data analysis & reporting
