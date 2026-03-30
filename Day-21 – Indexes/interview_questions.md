# Day 21 – Interview Questions (Indexes)

## 1. What is an Index in SQL?
An index is a database object that improves the speed of data retrieval operations.

---

## 2. Why do we use indexes?
To make SELECT queries faster and improve overall query performance.

---

## 3. Does an index store actual data?
No, it stores pointers to the data, not the actual data.

---

## 4. What are the disadvantages of indexes?
- Slows down INSERT, UPDATE, DELETE
- Uses extra storage

---

## 5. What is a composite index?
An index created on multiple columns to optimize queries using those columns together.

---

## 6. What is a unique index?
An index that ensures all values in the column are unique.

---

## 7. What is the difference between primary key and index?
Primary key:
- Unique + Not Null
- Automatically creates index

Index:
- Can allow duplicates (unless unique index)

---

## 8. When should you avoid using indexes?
- Small tables
- Frequently updated columns
- Low cardinality columns (few unique values)

---

## 9. How does an index improve performance?
It reduces the number of rows scanned by using a faster lookup mechanism.

---

## 10. Can we delete an index?
Yes, using:
DROP INDEX index_name;

---

## 11. What happens if there are too many indexes?
- Slower write operations
- Increased storage usage

---

## 12. What is indexing in real-world terms?
Like a book index that helps quickly find topics instead of reading the whole book.
