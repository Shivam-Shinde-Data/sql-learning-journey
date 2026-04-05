# Day 27 – Interview Questions

## 1. What is UNION in SQL?
UNION combines results of two queries and removes duplicates.

---

## 2. Difference between UNION and UNION ALL?
UNION removes duplicates.
UNION ALL keeps duplicates and is faster.

---

## 3. What does INTERSECT do?
Returns common rows between two queries.

---

## 4. What does EXCEPT do?
Returns rows from first query not present in second.

---

## 5. Which operator is fastest?
UNION ALL (because no duplicate removal).

---

## 6. What are the rules for using UNION?
Same number of columns, same order, compatible data types.

---

## 7. Can UNION work with different column names?
Yes, but positions and data types must match.

---

## 8. Is INTERSECT supported in all databases?
No, some databases like MySQL do not support it directly.

---

## 9. Alternative for EXCEPT in MySQL?
Use NOT EXISTS or LEFT JOIN.

---

## 10. Real-world use of INTERSECT?
Finding common users across platforms.
