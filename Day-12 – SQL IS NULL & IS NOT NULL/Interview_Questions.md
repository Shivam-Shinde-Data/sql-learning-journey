# Day 12 – Interview Questions (IS NULL & IS NOT NULL)

## 1. What is NULL in SQL?
NULL represents a missing or unknown value in a database.

---

## 2. Can we compare NULL using = ?
No, NULL cannot be compared using = or !=.

---

## 3. How do you check for NULL values?
Using IS NULL.

Example:
```sql
SELECT * FROM students WHERE city IS NULL;
```
---

## 4. How do you check for NOT NULL values?
Using IS NOT NULL.

Example:
```sql
SELECT * FROM students WHERE marks IS NOT NULL;
```
---

## 5. What is the difference between NULL and 0?
NULL = no value,  
0 = actual numeric value.

---

## 6. What is the difference between NULL and empty string?
NULL = unknown value  
'' = empty but known value

---

## 7. Write query to find rows with NULL values.
```sql
SELECT * FROM students WHERE marks IS NULL;
```
---

## 8. Can NULL be used in WHERE with AND/OR?
Yes, NULL conditions can be combined using AND/OR.

---

## 9. Why is NULL important?
It helps identify missing or incomplete data in real-world datasets.

---

## 10. Where is NULL used in real-world?
Used in data cleaning, analytics, and handling missing user data.

---

## 🔹 Pro Tip

Always handle NULL values carefully:
- Use IS NULL / IS NOT NULL
- Avoid = NULL mistakes
- Important in interviews and real projects
