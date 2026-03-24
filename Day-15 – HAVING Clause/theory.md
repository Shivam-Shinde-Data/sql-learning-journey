# Day 15 – HAVING Clause

## 1. What is HAVING?

HAVING clause is used to filter grouped data after applying GROUP BY.

It works with aggregate functions like:
- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

---

## 2. Why Use HAVING?

- WHERE cannot filter aggregate results
- HAVING is used to filter aggregated/grouped data

---

## 3. Basic Syntax
```sql
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name
HAVING condition;
```
---

## 4. Example Table: employees

| id | name   | department | salary |
|----|--------|------------|--------|
| 1  | Amit   | IT         | 50000  |
| 2  | Neha   | HR         | 40000  |
| 3  | Rahul  | IT         | 60000  |
| 4  | Priya  | HR         | 45000  |
| 5  | Karan  | IT         | 55000  |

---

## 5. Example 1 – Departments with more than 2 employees
```sql
SELECT department, COUNT(*) 
FROM employees
GROUP BY department
HAVING COUNT(*) > 2;
```
---

## 6. Example 2 – Departments with total salary > 100000
```sql
SELECT department, SUM(salary)
FROM employees
GROUP BY department
HAVING SUM(salary) > 100000;
```
---

## 7. HAVING vs WHERE

| Feature | WHERE | HAVING |
|--------|------|--------|
| Filters | Rows | Groups |
| Used before GROUP BY | Yes | No |
| Works with aggregates | No | Yes |

---

## 8. Using WHERE + HAVING Together
```sql
SELECT department, COUNT(*)
FROM employees
WHERE salary > 40000
GROUP BY department
HAVING COUNT(*) > 1;
```
---

## 9. Important Rules

- HAVING is always used after GROUP BY
- It works with aggregate functions
- WHERE cannot replace HAVING for aggregates

---

## 10. Execution Order

1. FROM
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. ORDER BY

---

## 11. Real-World Use Cases

- Find customers who placed more than 5 orders
- Get products with total sales above a threshold
- Departments with average salary above a limit

---

## 12. Key Takeaways

- HAVING filters grouped data
- Used with GROUP BY
- Essential for data analysis queries
