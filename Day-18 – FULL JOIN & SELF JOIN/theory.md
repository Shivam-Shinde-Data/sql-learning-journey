# Day 18 – FULL JOIN & SELF JOIN

## 1. FULL JOIN (FULL OUTER JOIN)

### Definition:
FULL JOIN returns **all records** when there is a match in either left or right table.

- If there is a match → combines rows
- If no match → fills with NULL

### Syntax:
```sql
SELECT columns
FROM table1
FULL JOIN table2
ON table1.column = table2.column;
```
### Visual Understanding:
- LEFT JOIN → All from left + matched from right
- RIGHT JOIN → All from right + matched from left
- FULL JOIN → All from BOTH tables

### Example Tables:

#### Employees
| emp_id | name   | dept_id |
|--------|--------|---------|
| 1      | A      | 10      |
| 2      | B      | 20      |
| 3      | C      | NULL    |

#### Departments
| dept_id | dept_name |
|---------|-----------|
| 10      | HR        |
| 30      | IT        |

### Query:
```sql
SELECT e.name, d.dept_name
FROM Employees e
FULL JOIN Departments d
ON e.dept_id = d.dept_id;
```
### Output:
| name | dept_name |
|------|-----------|
| A    | HR        |
| B    | NULL      |
| C    | NULL      |
| NULL | IT        |

### Key Points:
- Returns all rows from both tables
- Unmatched values → NULL
- Not supported in MySQL directly (use UNION)

---

## 2. SELF JOIN

### Definition:
SELF JOIN is a join where a table is joined with itself.

Used when:
- Comparing rows within same table
- Hierarchical data (manager-employee)

### Syntax:
```sql
SELECT a.column, b.column
FROM table a
JOIN table b
ON a.common_column = b.common_column;
```
### Example Table: Employees
| emp_id | name   | manager_id |
|--------|--------|------------|
| 1      | A      | NULL       |
| 2      | B      | 1          |
| 3      | C      | 1          |
| 4      | D      | 2          |

### Query:
```sql
SELECT e.name AS Employee, m.name AS Manager
FROM Employees e
JOIN Employees m
ON e.manager_id = m.emp_id;
```
### Output:
| Employee | Manager |
|----------|---------|
| B        | A       |
| C        | A       |
| D        | B       |

### Key Points:
- Same table used twice
- Requires alias (e, m)
- Useful for hierarchical relationships

---

## Difference: FULL JOIN vs SELF JOIN

| Feature       | FULL JOIN                  | SELF JOIN                    |
|--------------|--------------------------|-----------------------------|
| Tables Used  | Two different tables     | Same table                  |
| Purpose      | Combine all records      | Compare within same table   |
| NULL values  | Yes                      | Depends                     |
| Use Case     | Missing data analysis    | Employee-manager relation   |

---

## Real-World Use Cases

### FULL JOIN:
- Data comparison between two systems
- Finding missing records
- Data auditing

### SELF JOIN:
- Employee hierarchy
- Finding duplicates
- Comparing rows in same dataset
