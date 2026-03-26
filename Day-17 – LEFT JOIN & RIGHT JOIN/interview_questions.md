# Day 17 – LEFT JOIN & RIGHT JOIN Interview Questions

## 1. What is LEFT JOIN?
LEFT JOIN returns all rows from the left table and matching rows from the right table.

---

## 2. What is RIGHT JOIN?
RIGHT JOIN returns all rows from the right table and matching rows from the left table.

---

## 3. What happens when there is no match?
NULL values are returned for the missing side.

---

## 4. Difference between INNER JOIN and LEFT JOIN?
- INNER JOIN → only matching rows
- LEFT JOIN → all left rows + matching right rows

---

## 5. Which JOIN is used more in real-world?
LEFT JOIN is used more frequently.

---

## 6. Can RIGHT JOIN be replaced?
Yes, by swapping tables and using LEFT JOIN.

---

## 7. How to find unmatched rows using LEFT JOIN?
Use IS NULL.

Example:
```sql
SELECT e.name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;
```
---

## 8. Real-world example of LEFT JOIN?
Find customers who did not place any orders.

---

## 9. What is NULL in JOIN?
It represents missing or unmatched data.

---

## 10. Execution order in JOIN?
FROM → JOIN → ON → WHERE → GROUP BY → HAVING → SELECT → ORDER BY
