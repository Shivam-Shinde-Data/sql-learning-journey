# Day 12 – SQL IS NULL & IS NOT NULL

## 🔹 What is NULL?

NULL represents a **missing, unknown, or empty value** in a database.

✔ It is NOT:
- 0
- Empty string ('')
- False

---

## 🔹 Why NOT use = NULL?

❌ This will NOT work:
```sql
SELECT * FROM students WHERE marks = NULL;
```
Reason:
NULL cannot be compared using = or !=

---

## 🔹 Correct Way

Use:
- IS NULL
- IS NOT NULL

---

## 🔹 Syntax

-- Check NULL values
```sql
SELECT column1
FROM table_name
WHERE column_name IS NULL;
```
-- Check NOT NULL values
```sql
SELECT column1
FROM table_name
WHERE column_name IS NOT NULL;
```
---

## 🔹 Example Table: students

| id | name  | city   | marks |
|----|-------|--------|-------|
| 1  | Amit  | Pune   | 85    |
| 2  | Neha  | NULL   | 90    |
| 3  | Rahul | Delhi  | NULL  |
| 4  | Sneha | Pune   | 60    |
| 5  | Kiran | NULL   | 88    |

---

## 🔹 Example 1: Find NULL values
```sql
SELECT * 
FROM students
WHERE city IS NULL;
```
✔ Returns students with no city

---

## 🔹 Example 2: Find NOT NULL values
```sql
SELECT * 
FROM students
WHERE marks IS NOT NULL;
  ```
✔ Returns students with marks present

---

## 🔹 Example 3: NULL in Multiple Columns
```sql
SELECT * 
FROM students
WHERE city IS NULL OR marks IS NULL;
  ```
✔ Finds rows with missing data

---

## 🔹 Example 4: NOT NULL with Condition
```sql
SELECT * 
FROM students
WHERE marks IS NOT NULL AND marks > 70;
```
✔ Filters valid and high scores

---

## 🔹 Important Points

- NULL means **unknown value**
- Cannot use = or != with NULL
- Always use IS NULL / IS NOT NULL
- Useful for **data cleaning**
- Common in real-world datasets

---

## 🔹 NULL vs Empty String

| NULL            | Empty String ('')       |
|-----------------|------------------------|
| No value        | Value is empty         |
| Unknown         | Known but blank        |
| Uses IS NULL    | Uses = ''              |

---

## 🔹 Real-World Example

📌 Data Cleaning:
```sql
SELECT * 
FROM users
WHERE email IS NULL;
```
✔ Find users without email (incomplete data)

---

## 🔹 Summary

- NULL = missing value
- Use IS NULL to find missing data
- Use IS NOT NULL to filter valid data
- Important for real-world datasets
