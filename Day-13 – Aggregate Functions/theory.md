# Day 13 – SQL Aggregate Functions

## 🔹 What are Aggregate Functions?

Aggregate functions perform **calculations on multiple rows** and return a **single value**.

---

## 🔹 Common Aggregate Functions

| Function | Description                  |
|----------|------------------------------|
| COUNT()  | Counts number of rows        |
| SUM()    | Adds values                  |
| AVG()    | Calculates average           |
| MIN()    | Finds minimum value          |
| MAX()    | Finds maximum value          |

---

## 🔹 Syntax
```sql
SELECT AGG_FUNCTION(column_name)
FROM table_name;
```
---

## 🔹 Example Table: students

| id | name  | marks |
|----|-------|-------|
| 1  | Amit  | 85    |
| 2  | Neha  | 90    |
| 3  | Rahul | 70    |
| 4  | Sneha | 60    |
| 5  | Kiran | 88    |

---

## 🔹 COUNT()

```sql
SELECT COUNT(*) FROM students;
```
✔ Counts total rows

```sql
SELECT COUNT(marks) FROM students;
```
✔ Counts non-NULL values

---

## 🔹 SUM()

```sql
SELECT SUM(marks) FROM students;
```
✔ Total marks

---

## 🔹 AVG()

```sql
SELECT AVG(marks) FROM students;
```
✔ Average marks

---

## 🔹 MIN()

```sql
SELECT MIN(marks) FROM students;
```
✔ Lowest marks

---

## 🔹 MAX()

```sql
SELECT MAX(marks) FROM students;
```
✔ Highest marks

---

## 🔹 Aggregate with WHERE

```sql
SELECT COUNT(*) 
FROM students
WHERE marks > 80;
```
✔ Count students scoring above 80

---

## 🔹 Important Points

- Ignore NULL values (except COUNT(*))
- Return single value
- Used in analytics and reporting
- Can be combined with WHERE

---

## 🔹 Real-World Example

📌 Business Analytics:

SELECT AVG(price) FROM products;

✔ Find average product price

---

## 🔹 Summary

- Aggregate functions perform calculations
- Return one result from many rows
- Most used in reports and dashboards
