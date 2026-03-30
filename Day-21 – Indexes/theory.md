# Day 21 – Indexes

## 1. What is an Index?

An Index is used to **speed up data retrieval** in a table.

- Works like an index in a book
- Helps database find data quickly
- Created on one or more columns

👉 Without index → Full table scan  
👉 With index → Faster search

---

## 2. Syntax

### Create Index:
```sql
CREATE INDEX index_name
ON table_name (column_name);
```
### Create Composite Index:
```sql
CREATE INDEX index_name
ON table_name (column1, column2);
```
---

## 3. Example
```sql
CREATE INDEX idx_salary
ON Employees(salary);
```
### Query:
```sql
SELECT * FROM Employees
WHERE salary > 40000;
```
👉 This query becomes faster using index

---

## 4. Types of Indexes

### a) Single Column Index
- Index on one column

Example:
```sql
CREATE INDEX idx_name
ON Employees(name);
```
---

### b) Composite Index
- Index on multiple columns

Example:
```sql
CREATE INDEX idx_name_dept
ON Employees(name, department);
```
---

### c) Unique Index
- Prevents duplicate values

Example:
```sql
CREATE UNIQUE INDEX idx_email
ON Users(email);
```
---

### d) Primary Index
- Automatically created on PRIMARY KEY

---

## 5. Advantages of Indexes

- Faster SELECT queries
- Improves search performance
- Useful for large datasets
- Reduces query execution time

---

## 6. Disadvantages of Indexes

- Slows down INSERT, UPDATE, DELETE
- Takes extra storage space
- Needs maintenance

---

## 7. When to Use Index

Use index on:
- Frequently searched columns (WHERE)
- Columns used in JOIN
- Columns used in ORDER BY / GROUP BY

Avoid index on:
- Small tables
- Columns with frequent updates
- Columns with low uniqueness

---

## 8. Dropping an Index
```sql
DROP INDEX index_name;
```
---

## 9. Key Points

- Index = Performance optimization tool
- Speeds up reads, slows down writes
- Not stored like table data (structure-based)
- Essential for large-scale databases

---

## Real-World Use Cases

- Searching users by email or username
- Filtering large transaction tables
- Optimizing reporting dashboards
- Speeding up JOIN operations
