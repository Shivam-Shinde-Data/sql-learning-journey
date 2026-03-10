**Day 02 – Database and Tables**

**1. Difference Between Database and Table**

A database is a collection of related data stored in an organized way.

A table is a structure inside a database used to store the actual data in rows and columns.

**Example**

Database: College_Database

Tables inside the database:

Students

Courses

Teachers

**Example table: Students**
| student_id | name | course | marks |
|------------|------|--------|------|
| 1 | Rahul | BSc | 85 |
| 2 | Priya | BCA | 90 |
| 3 | Amit | BSc | 78 |

**Understanding
**
Database → container that stores multiple tables
Table → structure that stores the records

**2. Creating a Table (CREATE TABLE)**

The CREATE TABLE command is used to create a new table inside a database.

**Syntax**
```sql
CREATE TABLE table_name (
    column_name data_type,
    column_name data_type
);
```
**Example**
```sql
CREATE TABLE Students (
    student_id INT,
    name VARCHAR(50),
    course VARCHAR(50),
    marks INT
);
```
**Explanation**

Students → table name

student_id, name, course, marks → column names

INT, VARCHAR → data types that define what type of data will be stored

After executing this command, an empty table called Students will be created.

**3. Inserting Data into a Table (INSERT INTO)**

The INSERT INTO command is used to add records into a table.

**Syntax**
```sql
INSERT INTO table_name VALUES (value1, value2, value3);
```
**Example**
```sql
INSERT INTO Students VALUES (1, 'Rahul', 'BSc', 85);
INSERT INTO Students VALUES (2, 'Priya', 'BCA', 90);
INSERT INTO Students VALUES (3, 'Amit', 'BSc', 78);
```
After running these queries, the table will contain:

| student_id | name  | course | marks |
|------------|-------|--------|-------|
| 1 | Rahul | BSc | 85 |
| 2 | Priya | BCA | 90 |
| 3 | Amit | BSc | 78 |

We can also insert data by specifying column names.

**Example**
```sql
INSERT INTO Students (student_id, name, course, marks)
VALUES (4, 'Sneha', 'BBA', 88);
```
This method is useful when we want to insert values into specific columns.

**Summary**

In this lesson we learned:

Difference between Database and Table

How to create a table using CREATE TABLE

How to insert data using INSERT INTO

These commands are part of DML and DDL operations and are used frequently when working with databases.
