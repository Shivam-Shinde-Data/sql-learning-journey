# Day 15 – HAVING Clause Interview Questions

## 1. What is HAVING in SQL?
HAVING is used to filter grouped data after applying GROUP BY.

---

## 2. Why can't we use WHERE with aggregate functions?
Because WHERE filters rows before aggregation, so aggregate results are not available yet.

---

## 3. Difference between WHERE and HAVING?
- WHERE filters rows
- HAVING filters groups

---

## 4. Can HAVING be used without GROUP BY?
Yes, but it is rarely used and acts like WHERE with aggregates.

---

## 5. What is execution order of SQL clauses?
FROM → WHERE → GROUP BY → HAVING → SELECT → ORDER BY

---

## 6. Can we use WHERE and HAVING together?
Yes.

Example:
```sql
SELECT department, COUNT(*)
FROM employees
WHERE salary > 40000
GROUP BY department
HAVING COUNT(*) > 1;
```
---

## 7. Which clause is faster WHERE or HAVING?
WHERE is faster because it filters data before grouping.

---

## 8. Can HAVING work without aggregate functions?
Yes, but it is not recommended; WHERE should be used instead.

---

## 9. Real-world use of HAVING?
Finding customers who made more than 10 purchases.

---

## 10. What happens if we use HAVING without GROUP BY?
It treats the whole table as one group.
