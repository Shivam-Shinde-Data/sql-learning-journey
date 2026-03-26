# Day 16 – Joins Introduction (INNER JOIN)

## 1. What is a JOIN?

A JOIN is used to combine data from two or more tables based on a related column.

---

## 2. Why Use JOIN?

- Data is stored in multiple tables
- To fetch related data together
- Used in almost every real-world database query

---

## 3. Types of Joins

- INNER JOIN (most important)
- LEFT JOIN
- RIGHT JOIN
- FULL JOIN

Today: INNER JOIN

---

## 4. What is INNER JOIN?

INNER JOIN returns only matching rows from both tables.

If there is no match → row is NOT included.

---

## 5. Basic Syntax
```sql
SELECT columns
FROM table1
INNER JOIN table2
ON table1.column = table2.column;
```
---

## 6. Example Tables

### employees

| emp_id | name  | dept_id |
|--------|-------|--------|
| 1      | Amit  | 101    |
| 2      | Neha  | 102    |
| 3      | Rahul | 101    |
| 4      | Priya | 103    |

### departments

| dept_id | dept_name |
|--------|-----------|
| 101    | IT        |
| 102    | HR        |
| 104    | Finance   |

---

## 7. Example 1 – Basic INNER JOIN
```sql
SELECT employees.name, departments.dept_name
FROM employees
INNER JOIN departments
ON employees.dept_id = departments.dept_id;
```
Result:
```sql
Amit → IT  
Neha → HR  
Rahul → IT  
```
(Priya not included because dept_id 103 not in departments)

---

## 8. Using Aliases (Best Practice)
```sql
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;
```
---

## 9. INNER JOIN with WHERE
```sql
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';
```
---

## 10. Important Points

- INNER JOIN returns only matching records
- Non-matching data is ignored
- ON condition is mandatory
- Aliases improve readability

---

## 11. Real-World Use Cases

- Orders + Customers → Get customer details with orders
- Employees + Departments → Get employee department
- Students + Courses → Get enrolled courses

---

## 12. Key Takeaways

- JOIN combines tables
- INNER JOIN returns only matched rows
- Most used join in interviews and real projects
