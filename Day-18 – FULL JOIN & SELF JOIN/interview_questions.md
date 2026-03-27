# Day 18 – Interview Questions (FULL JOIN & SELF JOIN)

## 1. What is FULL JOIN?
FULL JOIN returns all records from both tables, matching where possible, otherwise NULL.

## 2. Difference between FULL JOIN and LEFT JOIN?
LEFT JOIN returns all rows from left table, FULL JOIN returns all from both tables.

## 3. Is FULL JOIN supported in MySQL?
No, use UNION of LEFT JOIN and RIGHT JOIN.

## 4. What is SELF JOIN?
Joining a table with itself.

## 5. Why use SELF JOIN?
To compare rows within same table or represent hierarchical data.

## 6. Can SELF JOIN be used without alias?
No, alias is required to differentiate table instances.

## 7. What is a real-world example of SELF JOIN?
Employee-manager relationship.

## 8. How to find unmatched records using FULL JOIN?
Use WHERE condition with NULL checks.

## 9. Can SELF JOIN use LEFT JOIN?
Yes, useful when some rows have NULL relationships (e.g., no manager).

## 10. Difference between INNER JOIN and SELF JOIN?
INNER JOIN → joins two tables  
SELF JOIN → joins same table
