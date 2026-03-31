# Day 22 – Constraints

## 1. What are Constraints?

Constraints are rules applied on table columns to **ensure data accuracy and integrity**.

👉 They restrict the type of data that can be inserted into a table.

---

## 2. Types of Constraints

### a) NOT NULL
- Column cannot have NULL values

Example:
```sql
name VARCHAR(50) NOT NULL
```
---

### b) UNIQUE
- All values must be unique

Example:
```sql
email VARCHAR(100) UNIQUE
```
---

### c) PRIMARY KEY
- Uniquely identifies each record
- Combination of NOT NULL + UNIQUE
- Only one primary key per table

Example:
```sql
id INT PRIMARY KEY
```
---

### d) FOREIGN KEY
- Links one table to another
- Maintains referential integrity

Example:
```sql
FOREIGN KEY (dept_id) REFERENCES Department(id)
```
---

### e) CHECK
- Ensures condition is satisfied

Example:
```sql
salary INT CHECK (salary > 0)
```
---

### f) DEFAULT
- Sets default value if none provided

Example:
```sql
status VARCHAR(20) DEFAULT 'Active'
```
---

## 3. Syntax

### Create Table with Constraints:
```sql
CREATE TABLE table_name (
    column_name datatype constraint,
    column_name datatype constraint
);
```
---

## 4. Example
```sql
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    salary INT CHECK (salary > 0),
    status VARCHAR(20) DEFAULT 'Active'
);
```
---

## 5. Adding Constraints After Table Creation

### Add Primary Key:
```sql
ALTER TABLE Employees
ADD PRIMARY KEY (id);

### Add Foreign Key:
ALTER TABLE Employees
ADD FOREIGN KEY (dept_id) REFERENCES Department(id);
```
---

## 6. Dropping Constraints

### Drop Primary Key:
```sql
ALTER TABLE table_name
DROP PRIMARY KEY;
```
---

## 7. Advantages of Constraints

- Ensures data accuracy
- Maintains data consistency
- Prevents invalid data entry
- Enforces relationships between tables

---

## 8. Key Points

- Constraints = Data validation rules
- Applied at column level or table level
- Improves database reliability
- Important for real-world applications

---

## Real-World Use Cases

- Prevent duplicate emails in user table
- Ensure valid salary values
- Maintain relationships between orders and customers
- Automatically assign default status
