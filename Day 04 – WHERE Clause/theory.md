# Day 04 – WHERE Clause

## 1. Introduction

The **WHERE clause** is used to filter records in a table.

It allows us to retrieve only the rows that satisfy a specific condition.

Without the WHERE clause, SQL returns **all rows** from the table.

---

## 2. Basic Syntax

```sql
SELECT column_name
FROM table_name
WHERE condition;
```
**3. Example Table**

Assume we have a table called students.

| id | name  | age | course | city   |
| -- | ----- | --- | ------ | ------ |
| 1  | Rahul | 21  | BSc    | Pune   |
| 2  | Priya | 20  | BCA    | Mumbai |
| 3  | Amit  | 22  | BSc    | Delhi  |
| 4  | Sneha | 21  | BBA    | Pune   |

**4. Using WHERE with Numbers**

We can filter rows using numeric values.

Example: Retrieve students whose age is 21
```sql
SELECT *
FROM students
WHERE age = 21;
```
**5. Using WHERE with Text
**
We can also filter using text values.

Example: Retrieve students who live in Pune

```sql
SELECT *
FROM students
WHERE city = 'Pune';
```
Note: Text values must be written inside single quotes.

**6. Using WHERE with Comparison Operators**

Common comparison operators used with WHERE:

| Operator | Meaning               |
| -------- | --------------------- |
| =        | Equal                 |
| !=       | Not equal             |
| >        | Greater than          |
| <        | Less than             |
| >=       | Greater than or equal |
| <=       | Less than or equal    |

Example:
```sql
SELECT *
FROM students
WHERE age > 21;
```
**7. Selecting Specific Columns with WHERE
**
We can combine column selection and filtering.

Example:
```sql
SELECT name, city
FROM students
WHERE course = 'BSc';
```
**8. Key Points**

WHERE filters rows from a table.

It works with numbers and text values.

Text values must be written in single quotes.

WHERE is used before clauses like ORDER BY and LIMIT.
