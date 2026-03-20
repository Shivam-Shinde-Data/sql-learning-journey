-- Day 12 – Practice Queries (IS NULL & IS NOT NULL)

-- Create Table
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    marks INT
);

-- Insert Data (with NULL values)
INSERT INTO students VALUES
(1, 'Amit', 'Pune', 85),
(2, 'Neha', NULL, 90),
(3, 'Rahul', 'Delhi', NULL),
(4, 'Sneha', 'Pune', 60),
(5, 'Kiran', NULL, 88),
(6, 'Riya', 'Mumbai', NULL);

--------------------------------------------------

-- 1. Find students with NULL city
SELECT * FROM students
WHERE city IS NULL;

-- 2. Find students with NOT NULL city
SELECT * FROM students
WHERE city IS NOT NULL;

-- 3. Find students with NULL marks
SELECT * FROM students
WHERE marks IS NULL;

-- 4. Find students with NOT NULL marks
SELECT * FROM students
WHERE marks IS NOT NULL;

-- 5. Find rows where any column is NULL
SELECT * FROM students
WHERE city IS NULL OR marks IS NULL;

-- 6. Find students with valid marks greater than 70
SELECT * FROM students
WHERE marks IS NOT NULL AND marks > 70;

-- 7. Find students with NULL city and marks > 80
SELECT * FROM students
WHERE city IS NULL AND marks > 80;

-- 8. Update NULL city to 'Unknown'
UPDATE students
SET city = 'Unknown'
WHERE city IS NULL;

-- 9. Delete rows where marks are NULL
DELETE FROM students
WHERE marks IS NULL;

-- 10. Combine with ORDER BY
SELECT * FROM students
WHERE marks IS NOT NULL
ORDER BY marks DESC;
