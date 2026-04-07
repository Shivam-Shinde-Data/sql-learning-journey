# Day 29 – COALESCE Interview Questions

## 1. What is COALESCE in SQL?
COALESCE returns the first non-NULL value from a list of expressions.

---

## 2. How does COALESCE work?
It evaluates expressions from left to right and returns the first non-NULL value.

---

## 3. What happens if all values are NULL?
COALESCE returns NULL.

---

## 4. Difference between COALESCE and ISNULL?
- COALESCE → standard, multiple arguments
- ISNULL → DB-specific, only 2 arguments

---

## 5. Why is COALESCE important?
- Handles missing data
- Prevents NULL errors
- Improves query reliability

---

## 6. Can COALESCE be used in calculations?
Yes, it is commonly used to replace NULL with 0 in calculations.

---

## 7. Can COALESCE be used with aggregate functions?
Yes, e.g. COALESCE(SUM(column), 0)

---

## 8. Is COALESCE portable across databases?
Yes, it is part of SQL standard.

---

## 9. What is the evaluation order in COALESCE?
Left to right.

---

## 10. Real-world example of COALESCE?
Replacing NULL phone numbers with 'Not Available' in customer reports.
