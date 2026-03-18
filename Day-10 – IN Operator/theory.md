# Day 10 – SQL IN Operator

## 🔹 What is IN Operator?

The IN operator is used to filter records where a column matches **any value in a given list**.

It is a cleaner and shorter alternative to using multiple OR conditions.

---

## 🔹 Syntax
```sql
SELECT column1, column2
FROM table_name
WHERE column_name IN (value1, value2, value3, ...);
```
---

## 🔹 Why Use IN?

Instead of writing:
```sql
WHERE city = 'Pune' OR city = 'Mumbai' OR city = 'Delhi'
```
We can write:
```sql
WHERE city IN ('Pune', 'Mumbai', 'Delhi')
```
✔ Cleaner  
✔ Easier to read  
✔ Better for multiple values  

---

## 🔹 Example Table: students

| id | name  | city   | marks |
|----|-------|--------|-------|
| 1  | A     | Pune   | 85    |
| 2  | B     | Mumbai | 90    |
| 3  | C     | Delhi  | 70    |
| 4  | D     | Pune   | 60    |
| 5  | E     | Nashik | 88    |

---

## 🔹 Example 1: Basic IN
```sql
SELECT * 
FROM students
WHERE city IN ('Pune', 'Mumbai');
```
✔ Returns students from Pune and Mumbai

---

## 🔹 Example 2: IN with Numbers
```sql
SELECT * 
FROM students
WHERE marks IN (85, 90);
```
✔ Returns students with marks 85 or 90

---

## 🔹 Example 3: NOT IN
```sql
SELECT * 
FROM students
WHERE city NOT IN ('Pune', 'Mumbai');
```
✔ Returns students NOT from Pune or Mumbai

---

## 🔹 Example 4: IN with Subquery
```sql
SELECT * 
FROM students
WHERE city IN (
    SELECT city FROM colleges WHERE state = 'Maharashtra'
);
```
✔ Fetches students whose city exists in another table

---

## 🔹 Important Points

- Works with **strings, numbers, dates**
- Can be used with **SELECT, UPDATE, DELETE**
- Improves readability over multiple OR conditions
- NOT IN is used to exclude values
- Be careful: NULL values inside IN can affect results

---

## 🔹 IN vs OR

| IN Operator                     | OR Operator                         |
|--------------------------------|------------------------------------|
| WHERE city IN ('A','B')        | WHERE city='A' OR city='B'         |
| Short & clean                  | Long & repetitive                  |
| Preferred for multiple values  | Not scalable                       |

---

## 🔹 Real-World Example

📌 E-commerce:
```sql
SELECT * 
FROM orders
WHERE status IN ('Pending', 'Shipped', 'Delivered');
```
✔ Fetch orders in multiple states

---

## 🔹 Summary

- IN checks multiple values in one condition
- Replaces multiple OR conditions
- NOT IN excludes values
- Can be combined with subqueries
