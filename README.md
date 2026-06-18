# SQL Practice Repository
 
This repository contains my SQL practice covering DDL, DML, and querying concepts, practiced across multiple databases including **Sakila**, a custom **Library** database, and a **Students** dataset.
 
---
 
## 📚 Databases Used
 
- **Sakila** — sample MySQL database (films, customers, rentals, payments, staff, etc.)
- **Library** — custom database created for DDL/DML/JOIN practice (Authors, Books, Members, BorrowRecords)
- **Students** — dataset with student exam scores (gender, race, parent education, lunch type, test preparation, math/reading/writing scores)
---
 
## ✅ Topics Covered
 
### 1. DDL (Data Definition Language)
- `CREATE TABLE` with primary keys, foreign keys, `AUTO_INCREMENT`
- Constraints: `NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`
- Foreign key behaviors: `ON DELETE SET NULL`, `ON DELETE CASCADE`, `ON DELETE RESTRICT`
- `ALTER TABLE`: add/modify/rename/drop columns, rename tables, add/drop constraints
- Understanding parent-child table relationships and correct delete order
### 2. DML (Data Manipulation Language)
- `INSERT` — single row, multiple rows, partial columns
- `UPDATE` — single column, multiple columns, conditional updates
- `DELETE` — with conditions, and handling foreign key restrictions
- Testing constraint violations (invalid CHECK values, duplicate UNIQUE values)
### 3. Aggregate Functions
- `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- Applied across Sakila tables (films, customers, payments, rentals)
### 4. GROUP BY, HAVING, ORDER BY
- Grouping data by single and multiple columns
- Filtering grouped results using `HAVING`
- Sorting using `ORDER BY` (including `CASE` inside `ORDER BY` for conditional sorting)
- Combining all three for analyst-style summary reports
### 5. CASE Statements
Practiced extensively across many use cases:
- Basic `CASE` in `SELECT` (labeling/categorizing rows)
- `CASE` inside `COUNT()`, `SUM()`, `AVG()`, `MIN()`, `MAX()`
- `CASE` with `BETWEEN` (bucketing values into ranges)
- `CASE` with `LIKE` (pattern-based classification)
- `CASE` with `AND` / `OR` (multi-condition logic)
- **Nested CASE** (CASE inside CASE)
- `CASE` for NULL handling, compared with `IFNULL` and `COALESCE`
- `CASE` inside `ORDER BY` for conditional sorting
- `CASE` inside `HAVING`
- Using `CASE` with `UPDATE` to permanently store computed categories (e.g., grade columns)
### 6. JOINs
- `INNER JOIN` (2 tables and multi-table joins)
- `LEFT JOIN` (including finding unmatched rows with `IS NULL`)
- Understanding `RIGHT JOIN` and why `LEFT JOIN` is generally preferred
- Multi-table joins through "bridge" tables (e.g., Books ↔ BorrowRecords ↔ Members)
- Deciding which JOIN type to use based on question wording (“all”, “only”, “never”, etc.)
- Understanding the **logical query execution order**: `FROM → JOIN → WHERE → SELECT`
- Combining JOINs with `GROUP BY`, `HAVING`, and `CASE`
### 7. Practice Problems (HackerRank-style)
- Multi-table join problems involving Hackers, Submissions, Challenges, and Difficulty tables
- Identifying which tables are needed based on problem requirements
- Recognizing when a problem requires subqueries (e.g., tie-breaking logic based on aggregate counts)
---
 
## 🔜 Topics Not Yet Covered
 
- Subqueries (correlated and non-correlated)
- Window functions (`ROW_NUMBER`, `RANK`, `LAG`/`LEAD`, running totals)
- Common Table Expressions (`WITH` clause)
- `UNION` / `UNION ALL`
- Self joins
- Indexing and query optimization basics
---
 
## 📝 Notes
 
- Practiced with a focus on understanding *why* a query works, not just memorizing syntax.
- Used a "data analyst scenario" approach for several exercises — interpreting query results into plain-language insights, not just running queries.
- Common mistakes caught and corrected during practice: quoting column aliases incorrectly in `ORDER BY`/`HAVING`, misusing `WHERE` vs `ON` in outer joins, forgetting `ON` clauses in multi-table joins, and confusing `AND`/`OR` logic in `CASE` conditions.
