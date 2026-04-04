# Day 26 – ALTER TABLE + UPDATE, SET, WHERE

## 1. ALTER TABLE

### 🔹 Definition:
ALTER TABLE is used to modify the structure of an existing table.

---

## 🔹 Common Operations:

### 1. Add Column
```sql
ALTER TABLE table_name
ADD column_name datatype;
```
### Example:
```sql
ALTER TABLE employees
ADD age INT;
```
---

### 2. Drop Column
```sql
ALTER TABLE table_name
DROP COLUMN column_name;
```
### Example:
```sql
ALTER TABLE employees
DROP COLUMN age;
```
---

### 3. Modify Column (datatype change)
```sql
ALTER TABLE table_name
MODIFY column_name new_datatype;
```
### Example:
```sql
ALTER TABLE employees
MODIFY salary DECIMAL(10,2);
```
---

### 4. Rename Column
```sql
ALTER TABLE table_name
RENAME COLUMN old_name TO new_name;
```
### Example:
```sql
ALTER TABLE employees
RENAME COLUMN name TO emp_name;
```
---

## ⚠️ Key Points:
- Used for structural changes
- Cannot rollback easily in many DBMS
- Be careful in production systems

---

## 2. UPDATE

### 🔹 Definition:
UPDATE is used to modify existing data in a table.

---

## 🔹 Syntax:
```sql
UPDATE table_name
SET column1 = value1, column2 = value2
WHERE condition;
```
---

## 🔹 Key Points:
- Always use WHERE to avoid updating all rows
- Multiple columns can be updated at once

---

## 3. SET Clause

### 🔹 Definition:
SET is used with UPDATE to assign new values to columns.

---

### Example:
```sql
UPDATE employees
SET salary = 30000;
```
---

## 4. WHERE Clause

### 🔹 Definition:
WHERE specifies which rows should be updated.

---

### Example:
```sql
UPDATE employees
SET salary = 35000
WHERE emp_id = 1;
```
---

## 5. Real-World Use Cases

### 🔸 ALTER TABLE:
- Adding new fields (e.g., adding email column)
- Changing datatype for scaling

### 🔸 UPDATE:
- Updating user details
- Correcting incorrect data

---

## 6. Common Mistake

❌ Missing WHERE clause:
UPDATE employees
SET salary = 0;

👉 This will update ALL rows!

---

## 7. Summary

- ALTER TABLE → Change table structure
- UPDATE → Modify data
- SET → Assign values
- WHERE → Filter rows
