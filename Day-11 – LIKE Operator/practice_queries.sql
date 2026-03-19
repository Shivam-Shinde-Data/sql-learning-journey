-- Day 11 – Practice Queries (LIKE Operator)

-- Create Table
CREATE TABLE students (
    id INT,
    name VARCHAR(50),
    city VARCHAR(50)
);

-- Insert Data
INSERT INTO students VALUES
(1, 'Amit', 'Pune'),
(2, 'Neha', 'Mumbai'),
(3, 'Rahul', 'Delhi'),
(4, 'Sneha', 'Pune'),
(5, 'Kiran', 'Nashik'),
(6, 'Ankit', 'Pimpri');

--------------------------------------------------

-- 1. Names starting with 'A'
SELECT * FROM students
WHERE name LIKE 'A%';

-- 2. Names ending with 'a'
SELECT * FROM students
WHERE name LIKE '%a';

-- 3. Names containing 'h'
SELECT * FROM students
WHERE name LIKE '%h%';

-- 4. Names with exactly 4 characters
SELECT * FROM students
WHERE name LIKE '____';

-- 5. Names where second letter is 'm'
SELECT * FROM students
WHERE name LIKE '_m%';

-- 6. Cities starting with 'P'
SELECT * FROM students
WHERE city LIKE 'P%';

-- 7. Cities ending with 'i'
SELECT * FROM students
WHERE city LIKE '%i';

-- 8. Names NOT starting with 'A'
SELECT * FROM students
WHERE name NOT LIKE 'A%';

-- 9. Names containing 'an'
SELECT * FROM students
WHERE name LIKE '%an%';

-- 10. Combine LIKE with ORDER BY
SELECT * FROM students
WHERE name LIKE '%a%'
ORDER BY name ASC;
