-- Day 23 – Practice: Normalization

--------------------------------------------------
-- Unnormalized Table (Bad Design)
CREATE TABLE Student_Courses (
    student_id INT,
    student_name VARCHAR(50),
    course_id INT,
    course_name VARCHAR(50)
);

-- Insert Data (redundant)
INSERT INTO Student_Courses VALUES
(1, 'Amit', 101, 'SQL'),
(1, 'Amit', 102, 'Python'),
(2, 'Neha', 101, 'SQL'),
(2, 'Neha', 103, 'Java');

--------------------------------------------------
-- 1NF Applied (Atomic values already ok)

--------------------------------------------------
-- 2NF (Remove Partial Dependency)

-- Create Student Table
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50)
);

-- Create Courses Table
CREATE TABLE Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(50)
);

-- Create Mapping Table
CREATE TABLE Student_Course_Map (
    student_id INT,
    course_id INT,
    PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);

--------------------------------------------------
-- Insert Data into normalized tables

INSERT INTO Students VALUES
(1, 'Amit'),
(2, 'Neha');

INSERT INTO Courses VALUES
(101, 'SQL'),
(102, 'Python'),
(103, 'Java');

INSERT INTO Student_Course_Map VALUES
(1, 101),
(1, 102),
(2, 101),
(2, 103);

--------------------------------------------------
-- 3NF Example (Remove Transitive Dependency)

-- Bad Table
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    dept_name VARCHAR(50)
);

--------------------------------------------------
-- Normalize into 2 tables

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE Employee_Normalized (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

--------------------------------------------------
-- Insert Data

INSERT INTO Department VALUES
(1, 'IT'),
(2, 'HR');

INSERT INTO Employee_Normalized VALUES
(1, 'Amit', 1),
(2, 'Neha', 2);

--------------------------------------------------
-- Query using JOIN
SELECT e.id, e.name, d.dept_name
FROM Employee_Normalized e
JOIN Department d
ON e.dept_id = d.dept_id;
