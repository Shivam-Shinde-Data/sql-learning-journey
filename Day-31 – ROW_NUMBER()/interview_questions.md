# Day 31 – ROW_NUMBER() Interview Questions

## 1. What is ROW_NUMBER()?
Assigns a unique sequential number to rows.

---

## 2. Does ROW_NUMBER() allow duplicates?
No, always unique.

---

## 3. What is required in ROW_NUMBER()?
ORDER BY clause.

---

## 4. What is PARTITION BY used for?
To reset numbering for each group.

---

## 5. Difference between ROW_NUMBER and RANK?
ROW_NUMBER → unique, RANK → same values can share rank.

---

## 6. Can ROW_NUMBER be used to remove duplicates?
Yes.

---

## 7. How to get top 1 per group?
Use ROW_NUMBER with PARTITION BY and filter rn = 1.

---

## 8. Is ROW_NUMBER deterministic?
Only if ORDER BY is deterministic.

---

## 9. Real-world use?
Pagination, ranking, deduplication.

---

## 10. What happens if ORDER BY is not used?
Error (mandatory).
