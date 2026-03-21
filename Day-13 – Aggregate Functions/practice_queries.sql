-- Day 13 – Practice Queries (Aggregate Functions)

-- Create Table
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    marks INT
);

-- Insert Data
INSERT INTO students VALUES
(1, 'Amit', 85),
(2, 'Neha', 90),
(3, 'Rahul', 70),
(4, 'Sneha', 60),
(5, 'Kiran', 88),
(6, 'Riya', NULL);

--------------------------------------------------

-- 1. Count total students
SELECT COUNT(*) FROM students;

-- 2. Count students with marks
SELECT COUNT(marks) FROM students;

-- 3. Find total marks
SELECT SUM(marks) FROM students;

-- 4. Find average marks
SELECT AVG(marks) FROM students;

-- 5. Find minimum marks
SELECT MIN(marks) FROM students;

-- 6. Find maximum marks
SELECT MAX(marks) FROM students;

-- 7. Count students with marks > 80
SELECT COUNT(*) FROM students
WHERE marks > 80;

-- 8. Find average marks > 70
SELECT AVG(marks) FROM students
WHERE marks > 70;

-- 9. Find total marks excluding NULL
SELECT SUM(marks) FROM students;

-- 10. Combine with ORDER BY (example with subquery)
SELECT * FROM students
ORDER BY marks DESC;
