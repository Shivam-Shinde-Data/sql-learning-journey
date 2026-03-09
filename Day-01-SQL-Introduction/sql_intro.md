**1. What is SQL?**

SQL (Structured Query Language) is a language used to interact with relational databases.

It helps users perform operations like:

storing data

retrieving data

updating records

deleting records

Almost every organization that works with data uses SQL.

**Example**

If a company wants to find all customers who purchased a product today, SQL can retrieve that data from the database.

**2. What is a Database?**

A database is a collection of organized data stored electronically.

It allows data to be stored in a structured way so it can be easily accessed and managed.

**Example**

A student database may store information like:

student_id	name	course	marks
1	Rahul	BSc	85
2	Priya	BCA	90
3	Amit	BSc	78

**3. What is a Table?**

A table is where data is stored inside a database.

A table organizes data in the form of:

Columns → attributes (name, marks, course)

Rows → records (each student's data)

Example Table: Students

student_id	name	course	marks
1	Rahul	BSc	85
2	Priya	BCA	90
3	Amit	BSc	78

Each row represents one record and each column represents a field.

**4. What is DBMS?**

A DBMS (Database Management System) is software used to create and manage databases.

It allows users to store, retrieve, and update data using SQL.

Examples of DBMS

MySQL

PostgreSQL

Oracle

SQL Server

These systems execute SQL queries and manage the database.

**5. Why SQL is Important**

SQL is important because it allows organizations to work with large amounts of data efficiently.

With SQL we can:

retrieve information from databases

insert new records

update existing data

delete unnecessary records

Because of this, SQL is widely used in roles like Data Analyst, Data Engineer, and Backend Developer.

**6. Example of SQL in Real World**

Consider a food delivery company storing order data.

Table: Orders

order_id	customer_name	city	amount
101	Ravi	Mumbai	500
102	Neha	Pune	350
103	Arjun	Delhi	420

To see all orders stored in the table, we can use:

SELECT * FROM Orders;

Explanation

SELECT → retrieves data

* → selects all columns

FROM Orders → specifies the table

**7. Types of SQL Commands**

SQL commands are divided into categories based on their function.

**1. DDL (Data Definition Language)**

Used to define database structure.

Examples: CREATE, ALTER, DROP

Example:

CREATE TABLE Students (
    student_id INT,
    name VARCHAR(50),
    marks INT
);

**2. DML (Data Manipulation Language)
**
Used to modify data in tables.

Examples: INSERT, UPDATE, DELETE

Example:

INSERT INTO Students VALUES (1, 'Rahul', 85);

**3. DQL (Data Query Language)**

Used to retrieve data.

Example:

SELECT * FROM Students;

**4. DCL (Data Control Language)
**
Used to control permissions.

Examples: GRANT, REVOKE

**5. TCL (Transaction Control Language)**

Used to manage transactions.

Examples: COMMIT, ROLLBACK

**Summary**

In this lesson we learned:

-What SQL is
-What a database is
-What a table is
-What DBMS means
-Why SQL is important
-A real SQL example
-Types of SQL commands
