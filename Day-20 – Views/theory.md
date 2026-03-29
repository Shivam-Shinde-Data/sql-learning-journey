# Day 20 – Views

## 1. What is a View?

A View is a **virtual table** created from a SQL query.

- Does not store data physically
- Stores only the query
- Data is fetched dynamically

---

## 2. Syntax

### Create View
```sql
CREATE VIEW view_name AS
SELECT column1, column2
FROM table
WHERE condition;
```
### Use View:
```sql
SELECT * FROM view_name;
```
---

## 3. Example
```sql
CREATE VIEW high_salary_employees AS
SELECT name, salary
FROM Employees
WHERE salary > 40000;
```
### Query:
```sql
SELECT * FROM high_salary_employees;
```
---

## 4. Types of Views

### a) Simple View
- Based on one table
- No complex functions

### b) Complex View
- Based on multiple tables
- Uses joins, group by, functions

---

## 5. Advantages of Views

- Security (restrict access to specific columns)
- Simplifies complex queries
- Reusability
- Data abstraction

---

## 6. Updating Views

Some views are updatable:
- Simple view → YES
- Complex view → NO (generally)

Example:
```sql
UPDATE view_name
SET column = value
WHERE condition;
```
---

## 7. Dropping a View
```sql
DROP VIEW view_name;
```
---

## 8. Key Points

- View = Saved query
- No data storage
- Always shows latest data
- Can be used like a table

---

## Real-World Use Cases

- Show limited data to users
- Hide sensitive columns (salary, passwords)
- Simplify reporting queries
