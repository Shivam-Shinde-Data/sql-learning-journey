-- Day 10 – Practice Queries (IN Operator)

-- Create Table
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    marks INT
);

-- Insert Data
INSERT INTO students VALUES
(1, 'Amit', 'Pune', 85),
(2, 'Neha', 'Mumbai', 90),
(3, 'Rahul', 'Delhi', 70),
(4, 'Sneha', 'Pune', 60),
(5, 'Kiran', 'Nashik', 88),
(6, 'Riya', 'Mumbai', 75);

--------------------------------------------------

-- 1. Get students from Pune and Mumbai
SELECT * FROM students
WHERE city IN ('Pune', 'Mumbai');

-- 2. Get students with marks 70, 85, 90
SELECT * FROM students
WHERE marks IN (70, 85, 90);

-- 3. Get students NOT from Delhi
SELECT * FROM students
WHERE city NOT IN ('Delhi');

-- 4. Get students with id 1, 3, 5
SELECT * FROM students
WHERE id IN (1, 3, 5);

-- 5. Get students NOT having marks 60 or 75
SELECT * FROM students
WHERE marks NOT IN (60, 75);

-- 6. Select only names of students from Nashik and Pune
SELECT name FROM students
WHERE city IN ('Nashik', 'Pune');

-- 7. Get students from multiple cities
SELECT * FROM students
WHERE city IN ('Delhi', 'Mumbai', 'Pune');

-- 8. Update students in Pune and Mumbai
UPDATE students
SET marks = marks + 5
WHERE city IN ('Pune', 'Mumbai');

-- 9. Delete students from Nashik
DELETE FROM students
WHERE city IN ('Nashik');

-- 10. Combine IN with ORDER BY
SELECT * FROM students
WHERE city IN ('Pune', 'Mumbai')
ORDER BY marks DESC;
