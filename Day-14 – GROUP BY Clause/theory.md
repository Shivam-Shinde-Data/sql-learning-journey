# Day 14 – GROUP BY Clause

## 1. What is GROUP BY?

The GROUP BY clause is used to group rows that have the same values in specified columns into summary rows.

It is mainly used with aggregate functions like:
- COUNT()
- SUM()
- AVG()
- MAX()
- MIN()

---

## 2. Why Use GROUP BY?

- To summarize data
- To perform calculations on groups of rows
- To generate reports (like total sales per city, number of users per department)

---

## 3. Basic Syntax
```sql
SELECT column_name, aggregate_function(column_name)
FROM table_name
GROUP BY column_name;
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

## 5. Example 1 – Count employees in each department
```sql
SELECT department, COUNT(*) 
FROM employees
GROUP BY department;
```
Result:
IT → 3  
HR → 2  

---

## 6. Example 2 – Total salary per department
```sql
SELECT department, SUM(salary) 
FROM employees
GROUP BY department;
```
---

## 7. Example 3 – Average salary per department
```sql
SELECT department, AVG(salary) 
FROM employees
GROUP BY department;
```
---

## 8. Important Rules

- Every column in SELECT must be:
  - Either in GROUP BY
  - Or inside an aggregate function

❌ Wrong:
```sql
SELECT department, name FROM employees GROUP BY department;
```
✔ Correct:
```sql
SELECT department, COUNT(name) FROM employees GROUP BY department;
```
---

## 9. GROUP BY with Multiple Columns
```sql
SELECT department, salary, COUNT(*) 
FROM employees
GROUP BY department, salary;
```
---

## 10. GROUP BY vs WHERE

- WHERE filters rows BEFORE grouping
- GROUP BY groups the filtered rows

Example:
```sql
SELECT department, COUNT(*) 
FROM employees
WHERE salary > 45000
GROUP BY department;
```
---

## 11. Real-World Use Cases

- Sales report (total revenue per product)
- User analytics (users per country)
- Banking (total balance per branch)
- E-commerce (orders per category)

---

## 12. Key Takeaways

- GROUP BY is used for grouping data
- Always used with aggregate functions
- Helps in reporting and analysis
- Works after WHERE clause
