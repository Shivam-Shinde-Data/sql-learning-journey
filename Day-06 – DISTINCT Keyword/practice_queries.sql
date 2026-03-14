-- =====================================================
-- Day 06 – DISTINCT Practice
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
-- Retrieve unique cities from the students table
-- -----------------------------------------------------

SELECT DISTINCT city
FROM students;

-- -----------------------------------------------------
-- Question 2
-- Retrieve unique courses available in the table
-- -----------------------------------------------------

SELECT DISTINCT course
FROM students;

-- -----------------------------------------------------
-- Question 3
-- Retrieve unique ages of students
-- -----------------------------------------------------

SELECT DISTINCT age
FROM students;

-- -----------------------------------------------------
-- Question 4
-- Retrieve unique combinations of course and city
-- -----------------------------------------------------

SELECT DISTINCT course, city
FROM students;

-- -----------------------------------------------------
-- Question 5
-- Retrieve unique names of students
-- -----------------------------------------------------

SELECT DISTINCT name
FROM students;

-- -----------------------------------------------------
-- Question 6
-- Retrieve unique cities where students live
-- -----------------------------------------------------

SELECT DISTINCT city
FROM students;

-- -----------------------------------------------------
-- Question 7
-- Retrieve unique course and age combinations
-- -----------------------------------------------------

SELECT DISTINCT course, age
FROM students;

-- -----------------------------------------------------
-- Question 8
-- Retrieve unique city and course combinations
-- -----------------------------------------------------

SELECT DISTINCT city, course
FROM students;

-- -----------------------------------------------------
-- Question 9
-- Retrieve unique age and city combinations
-- -----------------------------------------------------

SELECT DISTINCT age, city
FROM students;

-- -----------------------------------------------------
-- Question 10
-- Retrieve unique name and course combinations
-- -----------------------------------------------------

SELECT DISTINCT name, course
FROM students;
