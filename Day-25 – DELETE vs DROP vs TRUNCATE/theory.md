# Day 25 – DELETE vs DROP vs TRUNCATE

## 1. Overview

These three SQL commands are used to remove data, but they work very differently:

| Command   | Removes Data | Removes Structure | Rollback | Speed |
|-----------|-------------|-------------------|----------|-------|
| DELETE    | Yes         | No                | Yes      | Slow  |
| TRUNCATE  | Yes (All)   | No                | No       | Fast  |
| DROP      | Yes         | Yes               | No       | Fast  |

---

## 2. DELETE

### 🔹 Definition:
DELETE removes specific rows from a table.

### 🔹 Syntax:
```sql
DELETE FROM table_name
WHERE condition;
```
### 🔹 Key Points:
- Can delete selected rows using WHERE
- Can delete all rows (if WHERE not used)
- Supports ROLLBACK (if transaction is used)
- Slower because it logs each row deletion

### 🔹 Example:
```sql
DELETE FROM employees
WHERE salary < 20000;
```
---

## 3. TRUNCATE

### 🔹 Definition:
TRUNCATE removes ALL rows from a table quickly.

### 🔹 Syntax:
```sql
TRUNCATE TABLE table_name;
```
### 🔹 Key Points:
- Cannot use WHERE clause
- Removes all rows
- Faster than DELETE
- Cannot be rolled back (in most DBMS)
- Resets AUTO_INCREMENT

### 🔹 Example:
```sql
TRUNCATE TABLE employees;
```
---

## 4. DROP

### 🔹 Definition:
DROP completely removes the table from the database.

### 🔹 Syntax:
```sql
DROP TABLE table_name;
```
### 🔹 Key Points:
- Deletes entire table structure + data
- Cannot be rolled back
- Table no longer exists after execution

### 🔹 Example:
DROP TABLE employees;

---

## 5. Key Differences

| Feature              | DELETE             | TRUNCATE           | DROP               |
|---------------------|--------------------|--------------------|--------------------|
| WHERE clause        | ✅ Yes             | ❌ No              | ❌ No              |
| Remove all rows     | ✅ Yes             | ✅ Yes             | ✅ Yes             |
| Remove structure    | ❌ No              | ❌ No              | ✅ Yes             |
| Rollback possible   | ✅ Yes             | ❌ No              | ❌ No              |
| Speed               | Slow              | Fast              | Fast              |

---

## 6. Real-World Use Cases

### 🔸 Use DELETE when:
- You want to remove specific records
- Example: Remove inactive users

### 🔸 Use TRUNCATE when:
- You want to clear a table quickly
- Example: Reset staging tables in ETL pipeline

### 🔸 Use DROP when:
- Table is no longer needed
- Example: Removing temporary or old tables

---

## 7. Interview Tip

👉 Common Question:
**Q: Which is faster – DELETE or TRUNCATE?**
✔ Answer: TRUNCATE, because it does not log individual row deletions.

---

## 8. Summary

- DELETE = Row-level removal (flexible but slow)
- TRUNCATE = Full data removal (fast but limited)
- DROP = Remove entire table (data + structure)
