**1. Introduction to SELECT Statement**

The SELECT statement is used to retrieve data from a database table.
It is one of the most commonly used SQL commands.

With SELECT, we can:

Retrieve specific columns

Retrieve all columns

Filter data (using conditions later)

Sort results

**Basic Syntax:**
```sql
SELECT column_name
FROM table_name;
```
If you want to select multiple columns:
```sql
SELECT column1, column2, column3
FROM table_name;
```
**2. Example Table**

Assume we have a table called students.

| id | name  | age | course | city   |
| -- | ----- | --- | ------ | ------ |
| 1  | Rahul | 21  | BSc    | Pune   |
| 2  | Priya | 20  | BCA    | Mumbai |
| 3  | Amit  | 22  | BSc    | Delhi  |
| 4  | Sneha | 21  | BBA    | Pune   |

**3. Selecting All Columns**

To retrieve all columns from a table, we use the * symbol.
```sql
SELECT * 
FROM students;
```
**Output**

| id | name  | age | course | city   |
| -- | ----- | --- | ------ | ------ |
| 1  | Rahul | 21  | BSc    | Pune   |
| 2  | Priya | 20  | BCA    | Mumbai |
| 3  | Amit  | 22  | BSc    | Delhi  |
| 4  | Sneha | 21  | BBA    | Pune   |

**4. Selecting Specific Columns**

If we want only specific columns, we mention them explicitly.
```sql
SELECT name, course
FROM students;
```
**Output**

| name  | course |
| ----- | ------ |
| Rahul | BSc    |
| Priya | BCA    |
| Amit  | BSc    |
| Sneha | BBA    |

**5. Selecting a Single Column**

We can also retrieve data from one column only.
```sql
SELECT name
FROM students;
```
**Output**

| name  |
| ----- |
| Rahul |
| Priya |
| Amit  |
| Sneha |

**6. Using Column Aliases**

Aliases are used to give a temporary name to a column in the result.

**Syntax**
```sql
SELECT column_name AS alias_name
FROM table_name;
```
**Example**
```sql
SELECT name AS student_name
FROM students;
```
**Output**

| student_name |
| ------------ |
| Rahul        |
| Priya        |
| Amit         |
| Sneha        |

**7. Key Points to Remember**

-SELECT is used to retrieve data from a table.

-* retrieves all columns.

-You can select one or multiple columns.

-AS is used for column aliases.

-SELECT does not modify data; it only reads data.
