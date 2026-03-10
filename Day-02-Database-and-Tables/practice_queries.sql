Example for creating and iserting a table 
-- Create Students Table
CREATE TABLE Students (
    student_id INT,
    name VARCHAR(50),
    course VARCHAR(50),
    marks INT
);

-- Insert records
INSERT INTO Students VALUES (1, 'Rahul', 'BSc', 85);
INSERT INTO Students VALUES (2, 'Priya', 'BCA', 90);
INSERT INTO Students VALUES (3, 'Amit', 'BSc', 78);

-- Retrieve all data
SELECT * FROM Students;
