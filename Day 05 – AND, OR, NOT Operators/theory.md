# Day 05 – AND, OR, NOT Operators

## 1. Introduction

The **AND, OR, and NOT operators** are used to combine multiple conditions in the `WHERE` clause.

These operators help filter data more precisely.

Example:
Instead of checking one condition, we can check **multiple conditions at the same time**.

---

# 2. AND Operator

The **AND operator** returns records only if **all conditions are true**.

## Syntax

```sql
SELECT column_name
FROM table_name
WHERE condition1 AND condition2;
```
**Example**

Retrieve students who study BSc and live in Pune.
```sql
SELECT *
FROM students
WHERE course = 'BSc' AND city = 'Pune';
```
**3. OR Operator**

The OR operator returns records if any one condition is true.

**Syntax**
```sql
SELECT column_name
FROM table_name
WHERE condition1 OR condition2;
```
Example

Retrieve students who live in Pune or Mumbai.
```sql
SELECT *
FROM students
WHERE city = 'Pune' OR city = 'Mumbai';
```
**4. NOT Operator**

The NOT operator is used to exclude records that meet a condition.

**Syntax**
```sql
SELECT column_name
FROM table_name
WHERE NOT condition;
```
Example

Retrieve students who are not from Pune.
```sql
SELECT *
FROM students
WHERE NOT city = 'Pune';
```
**5. Combining AND, OR, NOT**

We can combine multiple operators in a single query.

Example:
```sql
SELECT *
FROM students
WHERE course = 'BSc' AND city = 'Pune';
```
Example:
```sql
SELECT *
FROM students
WHERE city = 'Pune' OR city = 'Delhi';
```
**6. Key Points**

AND → All conditions must be true.

OR → Any condition can be true.

NOT → Excludes a condition.

These operators are commonly used with the WHERE clause.

**7. Real-world Example**

Find employees who:

work in IT department

and have salary greater than 50000
```sql
SELECT *
FROM employees
WHERE department = 'IT' AND salary > 50000;
```
