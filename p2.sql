SHOW DATABASES;
USE riya;
SELECT * FROM employee;

SELECT COUNT(*) AS 'Total_employee',COUNT(salary) AS 'Non-null salaries' , COUNT(DISTINCT salary) AS 'Unique salary' FROM employee;

SELECT SUM(salary) AS 'Total Salary', SUM(DISTINCT salary) AS 'Total Unique Salary' FROM employee; 

SELECT ROUND(AVG(salary),2)AS 'Average Salary', ROUND(AVG(DISTINCT salary),2)AS 'Averagr Unique Salary' FROM employee; 

SELECT MAX(salary) AS 'Maximum Salary',MIN(salary) AS 'Minimum Salary' FROM employee;

SHOW TABLES;

CREATE  TABLE IF NOT EXISTS details(sid INT  PRIMARY KEY AUTO_INCREMENT,name VARCHAR(20),address VARCHAR(20));

DROP TABLE details;

USE setops_practice;

SHOW TABLES;

SELECT customer_id FROM borrower
UNION
SELECT customer_id FROM depositor ORDER BY customer_id;

SELECT customer_id FROM borrower
UNION ALL
SELECT customer_id FROM depositor ORDER BY customer_id;

SELECT customer_id FROM borrower
INTERSECT
SELECT customer_id FROM depositor;

SELECT customer_id FROM borrower
EXCEPT
SELECT customer_id FROM depositor ORDER BY customer_id;

USE riya;

SELECT subject,count(salary) FROM student GROUP BY subject;

SELECT subject,year,AVG(salary) FROM student GROUP BY subject,year HAVING AVG(salary)> 40000;

SELECT subject,year,AVG(salary) FROM student GROUP BY subject,year HAVING AVG(salary)> 40000 ORDER BY AVG(salary) ASC;

USE PRACTICE;
SELECT * FROM student;
SELECT * FROM marks;

SELECT name,marks 
FROM student
INNER JOIN marks
ON student.id=marks.id;

SELECT name,marks 
FROM student
LEFT JOIN marks
ON student.id=marks.id;

SELECT name,marks 
FROM student
RIGHT JOIN marks
ON student.id=marks.id;

-- full can't used
SELECT name,marks 
FROM student
LEFT JOIN marks ON student.id=marks.id
UNION
SELECT name,marks 
FROM student
RIGHT JOIN marks ON student.id=marks.id;


SELECT name
FROM student
WHERE id IN (SELECT id FROM marks WHERE marks>70);