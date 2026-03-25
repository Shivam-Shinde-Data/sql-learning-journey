# Day 16 – INNER JOIN Interview Questions

## 1. What is a JOIN in SQL?
JOIN is used to combine data from multiple tables based on a related column.

---

## 2. What is INNER JOIN?
INNER JOIN returns only the matching rows from both tables.

---

## 3. What happens to non-matching rows in INNER JOIN?
They are excluded from the result.

---

## 4. What is the difference between JOIN and INNER JOIN?
They are the same. JOIN by default means INNER JOIN.

---

## 5. What is ON clause?
It specifies the condition for matching rows between tables.

---

## 6. Can we use WHERE with INNER JOIN?
Yes.

Example:
```sql
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name = 'IT';
```
---

## 7. Why use table aliases?
To make queries shorter and more readable.

---

## 8. Can INNER JOIN be used on multiple tables?
Yes.

---

## 9. Real-world example of INNER JOIN?
Combining orders table with customers table to get customer order details.

---

## 10. What is the execution order in JOIN?
FROM → JOIN → ON → WHERE → GROUP BY → HAVING → SELECT → ORDER BY
