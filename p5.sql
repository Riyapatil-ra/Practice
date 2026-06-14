SHOW DATABASES;
USE companydb;
SHOW TABLES;
SELECT * FROM students;

SELECT gender,
    CASE
        WHEN math_score >= 70 THEN 'Good'
        WHEN math_score >= 50 THEN 'Average'
        ELSE 'Poor'
    END AS 'Performance'
FROM students;

SELECT gender,lunch,
    CASE
        WHEN lunch = 'standard' THEN 'Paid'
        ELSE 'Free'
    END AS 'lunch_type'
FROM students;

SELECT gender,test_preparation_course,
    CASE
        WHEN test_preparation_course = 'completed' THEN 'Yes'
        ELSE 'No'
    END AS 'prepared'
FROM students;

SELECT gender,
    COUNT(CASE WHEN math_score >= 70 THEN 1 END) AS 'Good',
    COUNT(CASE WHEN math_score >= 50 AND math_score < 70 THEN 1 END) AS 'Average',
    COUNT(CASE WHEN math_score < 50 THEN 1 END) AS 'Poor'
FROM students
group by gender;

SELECT gender,
    COUNT(CASE
        WHEN lunch = 'standard' THEN 1 END) AS 'Paid',
    COUNT(CASE
        WHEN lunch = 'free/reduced' THEN 1 END) AS 'Free'
FROM students
GROUP BY gender;

SELECT gender,
    AVG(CASE WHEN writing_score >= 70 THEN reading_score END) AS 'Good',
    AVG(CASE WHEN writing_score >= 50 AND writing_score < 70 THEN reading_score END) AS 'Average',
    AVG(CASE WHEN writing_score < 50 THEN reading_score END) AS 'Poor'
FROM students
group by gender;

SELECT gender,reading_score,writing_score,math_score,
CASE
    WHEN (reading_score + writing_score + math_score) / 3 >= 80 THEN 'A'
    WHEN (reading_score + writing_score + math_score) / 3 >= 65 THEN 'B'
    WHEN (reading_score + writing_score + math_score) / 3 >= 50 THEN 'C'
    ELSE 'F'
END AS 'Grade'
FROM students;

SELECT gender,
CASE
    WHEN reading_score < 40 OR writing_score < 40 OR math_score < 40 THEN 'Yes'
    ELSE 'No'
END AS 'Support Needed'
FROM students;

SELECT gender,
CASE
    WHEN reading_score > 75 AND writing_score > 75 AND math_score > 75 THEN 'High Achiever'
    ELSE 'Normal'
END AS 'High Achiever'
FROM students;

SELECT race,
COUNT(*) AS 'Total Students',
COUNT(CASE
    WHEN reading_score > 75 AND writing_score > 75 AND math_score > 75 THEN 1 END) AS 'High Achievers',
COUNT(CASE
    WHEN reading_score <= 75 AND writing_score <= 75 AND math_score <= 75 THEN 1 END) AS 'Normal'
FROM students
GROUP BY race,
ORDER BY `High Achievers` DESC;

SELECT gender,
CASE
    WHEN math_score > reading_score THEN 'Better in Math'
    WHEN reading_score > math_score THEN 'Better in Reading'
    ELSE 'Equal'
END AS 'score_label'
FROM students;

SELECT gender,parent_edu,
CASE
    WHEN parent_edu = 'bachelor\'s degree' OR parent_edu='master\'s degree' THEN 'Higher Educated Family'
    ELSE 'Moderate Family'
END AS 'generation'
FROM students;

SELECT gender,reading_score,math_score
FROM students
ORDER BY 
  CASE WHEN gender = 'female' THEN reading_score END ASC,
  CASE WHEN gender = 'male' THEN math_score END ASC;

SELECT gender,
COUNT(*) AS 'Total Students',
ROUND(COUNT(CASE WHEN math_score BETWEEN 0 AND 50 THEN 1 END) * 100.0 / COUNT(*), 2) AS 'Percentage Math Score Range 0-50',
ROUND(COUNT(CASE WHEN math_score BETWEEN 51 AND 75 THEN 1 END) * 100.0 / COUNT(*), 2) AS 'Percentage Math Score Range 51-75',
ROUND(COUNT(CASE WHEN math_score > 75 THEN 1 END) * 100.0 / COUNT(*), 2) AS 'Percentage Math Score Range 76-100'
FROM students
GROUP BY gender;

SELECT race,
COUNT(*) AS 'Total Students',
COUNT(CASE WHEN reading_score > writing_score THEN 1 END) AS 'Better in Reading',
ROUND(COUNT(CASE WHEN reading_score > writing_score THEN 1 END) * 100.0 / COUNT(*), 2) AS 'Percentage Better in Reading'
FROM students
GROUP BY race
ORDER BY race ASC;

SELECT race,
COUNT(*) AS 'Total Students',
COUNT(CASE WHEN math_score > 70 THEN 1 END) AS 'Students with Math Score > 70',
ROUND(COUNT(CASE WHEN math_score > 70 THEN 1 END) * 100.0 / COUNT(*), 2) AS 'Percentage with Math Score > 70'
FROM students
GROUP BY race
HAVING COUNT(CASE WHEN math_score > 70 THEN 1 END ) > 50
ORDER BY `Total Students` DESC;


ALTER TABLE students ADD COLUMN Math_grade VARCHAR(5);
UPDATE students 
SET Math_grade = CASE
    WHEN math_score >= 80 THEN 'A'
    WHEN math_score >= 60 THEN 'B'
    WHEN math_score >= 40 THEN 'C'
    ELSE 'F'
END;

SELECT math_score, Math_grade FROM students;

SELECT gender, math_score, test_preparation_course,
CASE
    WHEN math_score > 80 AND test_preparation_course = 'completed' THEN 'Star'
    WHEN math_score > 80 AND test_preparation_course = 'none' THEN 'Potential'
    WHEN math_score <= 80 AND test_preparation_course = 'completed' THEN 'Needs Work'
    ELSE 'At Risk'
END AS 'Student Category'
FROM students;


SELECT race,
COUNT(*) AS 'Total Students',
ROUND(COUNT(CASE WHEN reading_score > 70 AND writing_score > 70 AND math_score > 70 THEN 1 END) * 100.0 / COUNT(*), 2) AS 'Percentage of students above 70 in all subjects'
FROM students
GROUP BY race
ORDER BY race ASC;

SELECT race,
COUNT(*) AS 'Total Students',
AVG(CASE WHEN test_preparation_course = 'completed' THEN math_score END) AS 'Completed ',
AVG(CASE WHEN test_preparation_course = 'none' THEN math_score END) AS 'Not Completed'
FROM students
GROUP BY race
ORDER BY race ASC;

SELECT gender,math_score,
CASE
    WHEN gender = 'female' THEN
    CASE
        WHEN math_score > 70 THEN 'Top Female'
        ELSE 'Average Female'
    END
    WHEN gender = 'male' THEN 
    CASE
        WHEN math_score > 70 THEN 'Top Male'
        ELSE 'Average Male'
    END
END AS 'Performance Category'
FROM students;

-- Handling Null values

SELECT * FROM students;

SELECT gender,Math_grade,
CASE 
    WHEN Math_grade IS NULL THEN 'Not Assigned'
    ELSE Math_grade
END AS 'Null Values'
FROM students;

SHOW databases;
use riya;
SHOW TABLES;
SELECT * FROM employee;

SELECT e_id,
CASE
    WHEN emp_name IS NULL THEN 'Not Assigned'
    ELSE emp_name
END AS 'Employee name without null values', 
CASE 
    WHEN salary IS NULL THEN 'Not Assigned'
    ELSE salary
END AS 'Salary without null values'
FROM employee;

SELECT e_id,
IFNULL (emp_name, 'Not Assigned') AS 'Employee',
IFNULL (salary, 'Not Assigned') AS 'Salary'
FROM employee;

SELECT e_id,
COALESCE (emp_name, 'Not Assigned') AS 'Employee',
COALESCE (CAST(salary AS CHAR), 'Not Assigned') AS 'Salary'
FROM employee;

SELECT * FROM students;

SELECT race,
SUM(CASE WHEN test_preparation_course='completed' THEN math_score END) AS 'Completed',
SUM(CASE WHEN test_preparation_course='none' THEN math_score END) AS 'none'
FROM students
GROUP BY race
ORDER BY race ASC;

SELECT gender,
SUM(CASE WHEN reading_score > 75 AND writing_score > 75 AND math_score > 75 THEN 1 ELSE 0 END) AS 'High Achievers'
FROM students
GROUP BY gender;

SELECT race,
MAX(CASE WHEN lunch = 'standard' THEN math_score END) AS 'Max Standard Lunch'
FROM students
GROUP BY race;

SELECT gender,
MIN(CASE WHEN test_preparation_course = 'completed' THEN reading_score END) AS 'Min Completed'
FROM students
GROUP BY gender;

SELECT gender,
COUNT(CASE WHEN math_score BETWEEN 0 AND 40 THEN 1 END) AS 'Low',
COUNT(CASE WHEN math_score BETWEEN 41 AND 70 THEN 1 END) AS 'Med',
COUNT(CASE WHEN math_score BETWEEN 71 AND 100 THEN 1 END) AS 'High'
FROM students
GROUP BY gender;

SELECT gender,
AVG(CASE WHEN reading_score BETWEEN 0 AND 50 THEN writing_score END) AS 'Low',
AVG(CASE WHEN reading_score BETWEEN 51 AND 75 THEN writing_score END) AS 'Med',
AVG(CASE WHEN reading_score BETWEEN 76 AND 100 THEN writing_score END) AS 'High'
FROM students
GROUP BY gender;

SELECT parent_edu,
CASE 
   WHEN parent_edu LIKE '%college%' THEN 'College Backgroud'
   WHEN parent_edu LIKE '%associate\'s%' THEN 'Associate Background'
   WHEN parent_edu LIKE '%degree%' THEN 'Degree Background'
   ELSE 'School Background'
END AS 'Education Background'
FROM students;

SELECT race,
CASE
    WHEN race IN ('group A', 'group B') THEN 'Lower Groups'
    WHEN race IN ('group D', 'group E') THEN 'Higher Groups'
    ELSE 'Middle Group'
END AS 'Race Category'
FROM students;
