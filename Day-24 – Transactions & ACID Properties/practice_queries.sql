-- Day 24 – Practice: Transactions & ACID

-- Create Accounts Table
CREATE TABLE Accounts (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    balance INT
);

-- Insert Data
INSERT INTO Accounts VALUES
(1, 'Amit', 5000),
(2, 'Neha', 3000);

--------------------------------------------------
-- 1. Start Transaction
START TRANSACTION;

-- Debit from Amit
UPDATE Accounts
SET balance = balance - 1000
WHERE id = 1;

-- Credit to Neha
UPDATE Accounts
SET balance = balance + 1000
WHERE id = 2;

-- Commit Changes
COMMIT;

--------------------------------------------------
-- 2. Transaction with ROLLBACK

START TRANSACTION;

-- Deduct money
UPDATE Accounts
SET balance = balance - 2000
WHERE id = 1;

-- Error simulation (wrong id)
UPDATE Accounts
SET balance = balance + 2000
WHERE id = 99;

-- Rollback
ROLLBACK;

--------------------------------------------------
-- 3. Using SAVEPOINT

START TRANSACTION;

UPDATE Accounts
SET balance = balance - 500
WHERE id = 1;

SAVEPOINT sp1;

UPDATE Accounts
SET balance = balance + 500
WHERE id = 2;

-- Rollback to savepoint
ROLLBACK TO sp1;

COMMIT;

--------------------------------------------------
-- 4. Check Final Data
SELECT * FROM Accounts;
