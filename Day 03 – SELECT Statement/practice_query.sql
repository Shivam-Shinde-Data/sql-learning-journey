-- =====================================================
-- Day 03 Practice Queries – SELECT Statement
-- =====================================================

-- Sample Table
-- students(id, name, age, course, city)

-- -----------------------------------------------------
-- Question 1
-- Retrieve all columns from the students table.
-- -----------------------------------------------------

SELECT * FROM students;


-- -----------------------------------------------------
-- Question 2
-- Retrieve only name and course of all students.
-- -----------------------------------------------------

SELECT name, course
FROM students;


-- -----------------------------------------------------
-- Question 3
-- Retrieve only the city column from the students table.
-- -----------------------------------------------------

SELECT city
FROM students;


-- -----------------------------------------------------
-- Question 4
-- Retrieve student names and their ages.
-- -----------------------------------------------------

SELECT name, age
FROM students;


-- -----------------------------------------------------
-- Question 5
-- Display student names with a column alias "student_name".
-- -----------------------------------------------------

SELECT name AS student_name
FROM students;


-- -----------------------------------------------------
-- Question 6
-- Display course and city of students.
-- -----------------------------------------------------

SELECT course, city
FROM students;


-- -----------------------------------------------------
-- Question 7
-- Retrieve all data from students table.
-- -----------------------------------------------------

SELECT *
FROM students;


-- -----------------------------------------------------
-- Question 8
-- Display student names and rename the column as "Name".
-- -----------------------------------------------------

SELECT name AS Name
FROM students;


-- -----------------------------------------------------
-- Question 9
-- Retrieve student id and name.
-- -----------------------------------------------------

SELECT id, name
FROM students;


-- -----------------------------------------------------
-- Question 10
-- Display a constant message using SELECT.
-- -----------------------------------------------------

SELECT 'Learning SQL is easy';
