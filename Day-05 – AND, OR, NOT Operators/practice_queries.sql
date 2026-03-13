-- =====================================================
-- Day 05 - AND, OR, NOT Practice
-- =====================================================

-- Create Table

CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    city VARCHAR(50)
);

-- Insert Data

INSERT INTO students VALUES
(1, 'Rahul', 21, 'BSc', 'Pune'),
(2, 'Priya', 20, 'BCA', 'Mumbai'),
(3, 'Amit', 22, 'BSc', 'Delhi'),
(4, 'Sneha', 21, 'BBA', 'Pune'),
(5, 'Rohan', 23, 'BCA', 'Mumbai'),
(6, 'Neha', 20, 'BSc', 'Pune');

-- Display table

SELECT * FROM students;

-- =====================================================
-- Practice Queries
-- =====================================================

-- Question 1
-- Students studying BSc AND living in Pune

SELECT *
FROM students
WHERE course = 'BSc' AND city = 'Pune';

-- Question 2
-- Students living in Pune OR Mumbai

SELECT *
FROM students
WHERE city = 'Pune' OR city = 'Mumbai';

-- Question 3
-- Students with age > 20 AND course BSc

SELECT *
FROM students
WHERE age > 20 AND course = 'BSc';

-- Question 4
-- Students NOT from Pune

SELECT *
FROM students
WHERE NOT city = 'Pune';

-- Question 5
-- Students studying BCA OR BBA

SELECT *
FROM students
WHERE course = 'BCA' OR course = 'BBA';

-- Question 6
-- Students with age > 21 OR city Pune

SELECT *
FROM students
WHERE age > 21 OR city = 'Pune';

-- Question 7
-- Students studying BSc AND age > 20

SELECT *
FROM students
WHERE course = 'BSc' AND age > 20;

-- Question 8
-- Students NOT studying BSc

SELECT *
FROM students
WHERE NOT course = 'BSc';

-- Question 9
-- Students in Mumbai studying BCA

SELECT *
FROM students
WHERE city = 'Mumbai' AND course = 'BCA';

-- Question 10
-- Students from Delhi OR Pune

SELECT *
FROM students
WHERE city = 'Delhi' OR city = 'Pune';
