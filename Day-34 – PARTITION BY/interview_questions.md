# Day 34 – PARTITION BY Interview Questions

## 1. What is PARTITION BY?
Divides rows into groups for window functions.

---

## 2. Difference between GROUP BY and PARTITION BY?
GROUP BY reduces rows, PARTITION BY does not.

---

## 3. Can PARTITION BY be used without window functions?
No.

---

## 4. Does PARTITION BY require ORDER BY?
No, but often used together.

---

## 5. What happens if PARTITION BY is not used?
Entire dataset is treated as one partition.

---

## 6. Can we use multiple columns in PARTITION BY?
Yes.

---

## 7. Use case?
Customer-wise analysis, ranking.

---

## 8. Does PARTITION BY affect performance?
Yes, depends on data size.

---

## 9. Can we combine PARTITION BY with ROW_NUMBER?
Yes.

---

## 10. Real-world example?
Sales per region without losing row-level data.
