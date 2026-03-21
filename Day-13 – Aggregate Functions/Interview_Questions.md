# Day 13 – Interview Questions (Aggregate Functions)

## 1. What are aggregate functions?
Aggregate functions perform calculations on multiple rows and return a single value.

---

## 2. Name some aggregate functions.
COUNT(), SUM(), AVG(), MIN(), MAX()

---

## 3. What does COUNT(*) do?
It counts all rows including NULL values.

---

## 4. What is the difference between COUNT(*) and COUNT(column)?
COUNT(*) counts all rows  
COUNT(column) counts only non-NULL values

---

## 5. Write query to find average marks.
SELECT AVG(marks) FROM students;

---

## 6. Do aggregate functions ignore NULL values?
Yes, except COUNT(*)

---

## 7. Can aggregate functions be used with WHERE?
Yes

Example:
SELECT SUM(marks) FROM students WHERE marks > 80;

---

## 8. Which function gives highest value?
MAX()

---

## 9. Which function gives lowest value?
MIN()

---

## 10. Where are aggregate functions used?
Used in reporting, analytics, dashboards, and business insights.

---

## 🔹 Pro Tip

Aggregate functions are heavily used with:
- GROUP BY (next topic)
- HAVING clause
- Real-world analytics
