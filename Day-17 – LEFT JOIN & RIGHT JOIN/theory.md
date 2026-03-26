# Day 17 – LEFT JOIN & RIGHT JOIN

## 1. What is LEFT JOIN?

LEFT JOIN returns:
- All records from the LEFT table
- Matching records from the RIGHT table
- If no match → NULL values

---

## 2. What is RIGHT JOIN?

RIGHT JOIN returns:
- All records from the RIGHT table
- Matching records from the LEFT table
- If no match → NULL values

---

## 3. Basic Syntax
```sql
-- LEFT JOIN
SELECT columns
FROM table1
LEFT JOIN table2
ON table1.column = table2.column;

-- RIGHT JOIN
SELECT columns
FROM table1
RIGHT JOIN table2
ON table1.column = table2.column;
```
---

## 4. Example Tables

### employees

| emp_id | name  | dept_id |
|--------|-------|--------|
| 1      | Amit  | 101    |
| 2      | Neha  | 102    |
| 3      | Rahul | 101    |
| 4      | Priya | 103    |

### departments

| dept_id | dept_name |
|--------|-----------|
| 101    | IT        |
| 102    | HR        |
| 104    | Finance   |

---

## 5. LEFT JOIN Example
```sql
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;
```
Result:
```sql
Amit → IT  
Neha → HR  
Rahul → IT  
Priya → NULL  (no matching department)
```
---

## 6. RIGHT JOIN Example
```sql
SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;
```
Result:
```sql
Amit → IT  
Neha → HR  
Rahul → IT  
NULL → Finance  (no matching employee)
```
---

## 7. Key Difference

| Feature | LEFT JOIN | RIGHT JOIN |
|--------|----------|-----------|
| Keeps all rows from | Left table | Right table |
| Missing values | NULL in right | NULL in left |

---

## 8. LEFT JOIN with WHERE
```sql
SELECT e.name, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_name IS NULL;
```
👉 Finds employees without a department

---

## 9. RIGHT JOIN with WHERE
```sql
SELECT e.name, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id
WHERE e.emp_id IS NULL;
```
👉 Finds departments without employees

---

## 10. Important Points

- LEFT JOIN is used more frequently than RIGHT JOIN
- RIGHT JOIN can be replaced by swapping table positions in LEFT JOIN
- NULL values indicate missing matches

---

## 11. Real-World Use Cases

- Find users who did NOT place orders
- Find products with no sales
- Find departments without employees

---

## 12. Key Takeaways

- LEFT JOIN → keeps all rows from left table
- RIGHT JOIN → keeps all rows from right table
- NULL shows unmatched data
