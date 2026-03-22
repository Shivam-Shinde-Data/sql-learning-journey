# Day 14 – GROUP BY Interview Questions

## 1. What is GROUP BY in SQL?
GROUP BY is used to group rows with the same values and apply aggregate functions on them.

---

## 2. Why do we use GROUP BY?
To summarize data like total, count, or average for grouped records.

---

## 3. Can we use GROUP BY without aggregate functions?
Yes, but it behaves like DISTINCT.

Example:
```sql
SELECT department FROM employees GROUP BY department;
```
---

## 4. What is the difference between GROUP BY and WHERE?
WHERE filters rows before grouping, GROUP BY groups rows after filtering.

---

## 5. What is the correct order of execution?
FROM → WHERE → GROUP BY → SELECT → ORDER BY

---

## 6. What happens if a column is not in GROUP BY?
It will cause an error unless it is inside an aggregate function.

---

## 7. Can we group by multiple columns?
Yes.

Example:
```sql
SELECT department, salary, COUNT(*)
FROM employees
GROUP BY department, salary;
```
---

## 8. Difference between GROUP BY and DISTINCT?
- GROUP BY is used with aggregate functions
- DISTINCT removes duplicate rows

---

## 9. What is a real-world example of GROUP BY?
Finding total sales per product in an e-commerce system.

---

## 10. Can GROUP BY be used with WHERE?
Yes.

Example:
```sql
SELECT department, COUNT(*)
FROM employees
WHERE salary > 50000
GROUP BY department;
```
