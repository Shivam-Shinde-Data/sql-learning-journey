# Day 10 – Interview Questions (IN Operator)

## 1. What is the IN operator in SQL?
The IN operator is used to filter records that match any value from a list of values.

---

## 2. How is IN different from OR?
IN is a shorter and cleaner version of multiple OR conditions.

---

## 3. Write a query using IN.
```sql
SELECT * FROM students
WHERE city IN ('Pune', 'Mumbai');
```
---

## 4. What is NOT IN?
NOT IN is used to exclude records that match values in a given list.

---

## 5. Write a query using NOT IN.
```sql
SELECT * FROM students
WHERE city NOT IN ('Delhi');
```
---

## 6. Can IN be used with numbers?
Yes, IN works with numbers, strings, and dates.

Example:
```sql
SELECT * FROM students WHERE marks IN (80, 90);
```
---

## 7. Can IN be used with subqueries?
Yes, IN can be used with subqueries.

Example:
```sql
SELECT * FROM students
WHERE city IN (SELECT city FROM colleges);
```
---

## 8. What happens if NULL is used inside IN?
If NULL is present, results may be unexpected because NULL cannot be compared directly.

---

## 9. Is IN faster than OR?
Generally, IN is more readable and can be optimized better by the database.

---

## 10. Where can IN be used?
IN can be used with SELECT, UPDATE, DELETE statements.

---

## 🔹 Pro Tip

Use IN when:
- You have multiple values to match
- You want clean and readable queries
- Avoid long OR conditions
