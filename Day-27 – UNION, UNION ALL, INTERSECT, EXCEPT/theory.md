# Day 27 – UNION, UNION ALL, INTERSECT, EXCEPT

## 1. Overview

These SQL operators are used to combine results from multiple SELECT queries.

---

## 2. UNION

### 🔹 Definition:
UNION combines results of two queries and removes duplicates.

### 🔹 Syntax:
```sql
SELECT column_name FROM table1
UNION
SELECT column_name FROM table2;
```
### 🔹 Key Points:
- Removes duplicate rows
- Requires same number of columns
- Column data types must be compatible

### 🔹 Example:
```sql
SELECT name FROM employees
UNION
SELECT name FROM customers;
```
---

## 3. UNION ALL

### 🔹 Definition:
UNION ALL combines results and keeps duplicates.

### 🔹 Syntax:
```sql
SELECT column_name FROM table1
UNION ALL
SELECT column_name FROM table2;
```
### 🔹 Key Points:
- Faster than UNION
- Does NOT remove duplicates

### 🔹 Example:
```sql
SELECT name FROM employees
UNION ALL
SELECT name FROM customers;
```
---

## 4. INTERSECT

### 🔹 Definition:
Returns only common rows from both queries.

### 🔹 Syntax:
```sql
SELECT column_name FROM table1
INTERSECT
SELECT column_name FROM table2;
```
### 🔹 Key Points:
- Returns intersection (common data)
- Removes duplicates automatically

### 🔹 Example:
```sql
SELECT name FROM employees
INTERSECT
SELECT name FROM customers;
```
---

## 5. EXCEPT (or MINUS)

### 🔹 Definition:
Returns rows from first query that are NOT present in second.

### 🔹 Syntax:
```sql
SELECT column_name FROM table1
EXCEPT
SELECT column_name FROM table2;
```
### 🔹 Key Points:
- Works like subtraction
- Removes duplicates

### 🔹 Example:
```sql
SELECT name FROM employees
EXCEPT
SELECT name FROM customers;
```
---

## 6. Rules for Set Operators

- Same number of columns in both queries
- Same order of columns
- Compatible data types

---

## 7. Difference Summary

| Operator     | Removes Duplicates | Description                  |
|-------------|--------------------|------------------------------|
| UNION       | Yes                | Combine + unique             |
| UNION ALL   | No                 | Combine + keep duplicates    |
| INTERSECT   | Yes                | Common rows only             |
| EXCEPT      | Yes                | First minus second           |

---

## 8. Real-World Use Cases

### 🔸 UNION:
- Combine data from multiple sources

### 🔸 UNION ALL:
- Fast merging in ETL pipelines

### 🔸 INTERSECT:
- Find common users/customers

### 🔸 EXCEPT:
- Find missing records or mismatches

---

## 9. Summary

- UNION → Unique combined results
- UNION ALL → All results including duplicates
- INTERSECT → Common rows
- EXCEPT → Difference between datasets
