SHOW DATABASES;

USE riya;

SHOW TABLES;

SELECT * FROM departments;

SELECT * FROM departments WHERE building = 'Block A';

UPDATE departments SET department_name='Mathematics' WHERE department_id=6;

INSERT INTO departments VALUES (11,'Power Point','Buliding B','Dr. Jones');

SELECT * FROM departments;

SELECT * FROM employee;

SELECT salary,COUNT(*) AS 'TOTAL' FROM employee GROUP BY salary;

SELECT * FROM student;

SELECT subject,SUM(salary) AS 'Total Salary', AVG(salary) AS 'Average Salary',MAX(salary) AS 'Maximum Salary',MIN(salary) AS 'Minimum Salary'  FROM student GROUP BY subject;  