-- =====================================================
-- Day 04 - WHERE Clause Practice
-- =====================================================

-- -----------------------------------------------------
-- Step 1: Create Table
-- -----------------------------------------------------

CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    city VARCHAR(50)
);

-- -----------------------------------------------------
-- Step 2: Insert Sample Data
-- -----------------------------------------------------

INSERT INTO students VALUES
(1, 'Rahul', 21, 'BSc', 'Pune'),
(2, 'Priya', 20, 'BCA', 'Mumbai'),
(3, 'Amit', 22, 'BSc', 'Delhi'),
(4, 'Sneha', 21, 'BBA', 'Pune'),
(5, 'Rohan', 23, 'BCA', 'Mumbai'),
(6, 'Neha', 20, 'BSc', 'Pune');

-- -----------------------------------------------------
-- Display Entire Table
-- -----------------------------------------------------

SELECT * FROM students;

-- =====================================================
-- Practice Questions with Answers
-- =====================================================

-- -----------------------------------------------------
-- Question 1
-- Retrieve students whose age is 21
-- -----------------------------------------------------

SELECT *
FROM students
WHERE age = 21;

-- -----------------------------------------------------
-- Question 2
-- Retrieve students who live in Pune
-- -----------------------------------------------------

SELECT *
FROM students
WHERE city = 'Pune';

-- -----------------------------------------------------
-- Question 3
-- Retrieve students whose age is greater than 20
-- -----------------------------------------------------

SELECT *
FROM students
WHERE age > 20;

-- -----------------------------------------------------
-- Question 4
-- Retrieve students studying BSc
-- -----------------------------------------------------

SELECT *
FROM students
WHERE course = 'BSc';

-- -----------------------------------------------------
-- Question 5
-- Retrieve students whose age is less than 22
-- -----------------------------------------------------

SELECT *
FROM students
WHERE age < 22;

-- -----------------------------------------------------
-- Question 6
-- Retrieve names of students who live in Mumbai
-- -----------------------------------------------------

SELECT name
FROM students
WHERE city = 'Mumbai';

-- -----------------------------------------------------
-- Question 7
-- Retrieve students whose age is not equal to 21
-- -----------------------------------------------------

SELECT *
FROM students
WHERE age != 21;

-- -----------------------------------------------------
-- Question 8
-- Retrieve students studying BBA
-- -----------------------------------------------------

SELECT *
FROM students
WHERE course = 'BBA';

-- -----------------------------------------------------
-- Question 9
-- Retrieve name and city of students studying BSc
-- -----------------------------------------------------

SELECT name, city
FROM students
WHERE course = 'BSc';

-- -----------------------------------------------------
-- Question 10
-- Retrieve students whose age is greater than or equal to 21
-- -----------------------------------------------------

SELECT *
FROM students
WHERE age >= 21;
