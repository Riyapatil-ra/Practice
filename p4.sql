SHOW DATABASES;
USE companydb;
SHOW TABLES;
SELECT * FROM students;

SELECT gender,COUNT(*) AS 'Total Students Per Group' FROM students GROUP BY gender;
SELECT race,AVG(math_score) AS 'Average score in math per race group' FROM students GROUP BY race;
SELECT lunch,COUNT(*) AS 'Total Students Per lunch' FROM students GROUP BY lunch;
SELECT gender,COUNT(*) AS 'Total Students Per Group' FROM students GROUP BY gender;
SELECT parent_edu,AVG(reading_score) AS 'Average reading score' , AVG(writing_score) AS 'Average writing score' FROM students GROUP BY parent_edu;

SELECT * FROM students ORDER BY math_score DESC;
SELECT * FROM students ORDER BY writing_score ASC;
SELECT * FROM students ORDER BY reading_score DESC LIMIT 5;
SELECT race,AVG(math_score) AS 'Average math score' FROM students GROUP BY race HAVING AVG(math_score) > 60;
SELECT parent_edu,AVG(writing_score) AS 'Average writing score' FROM students GROUP BY parent_edu HAVING AVG(writing_score) < 65;
SELECT lunch,COUNT(*) AS 'Total Students' FROM students GROUP BY lunch HAVING COUNT(*) > 300;

SELECT gender,AVG(math_score) AS 'Average math score' FROM students GROUP BY gender HAVING AVG(math_score) > 60 ORDER BY AVG(math_score) DESC;
SELECT race,COUNT(*) AS 'Total Students' FROM students WHERE test_preparation_course = 'completed' GROUP BY race ORDER BY COUNT(*) DESC;
SELECT parent_edu,AVG(reading_score) AS 'Average reading score' FROM students GROUP BY parent_edu HAVING AVG(reading_score) > 65 ORDER BY parent_edu DESC LIMIT 3;
SELECT race,MAX(math_score) AS 'Maximum math score' FROM students GROUP BY race HAVING MAX(math_score) > 90 ORDER BY MAX(math_score) DESC;
SELECT gender,race,AVG(writing_score) AS 'Avg writing score',AVG(math_score) AS 'Avg math score',AVG(reading_score) AS 'Avg reading score' FROM students GROUP BY gender,race ORDER BY gender ASC;

SELECT race,AVG(math_score) AS 'Avg Math Score' FROM students GROUP BY race ORDER BY AVG(math_score) DESC;
SELECT parent_edu,AVG(writing_score) AS 'Avg Writing_score' FROM students GROUP BY parent_edu HAVING AVG(writing_score) > 65 ORDER BY AVG(writing_score) DESC;
SELECT gender,AVG(reading_score) AS 'Avg Reading Score' FROM students GROUP BY gender;

SELECT lunch FROM students GROUP BY lunch;

SELECT lunch,AVG(math_score),AVG(reading_score),AVG(writing_score) FROM students GROUP BY lunch;
SELECT gender,
    COUNT(*) AS 'Total Students',
    COUNT(CASE WHEN test_preparation_course = 'completed' THEN 1 END) AS 'Completed',
    COUNT(CASE WHEN test_preparation_course = 'none' THEN 1 END) AS 'Not Completed',
    ROUND(COUNT(CASE WHEN test_preparation_course = 'completed' THEN 1 END) * 100.0 / COUNT(*), 2) AS 'Completion Rate (%)',
    ROUND(COUNT(CASE WHEN test_preparation_course = 'none' THEN 1 END) * 100.0 / COUNT(*), 2) AS 'Non-Completion Rate (%)'
FROM students
GROUP BY gender;
SELECT race,MIN(math_score) AS 'Minimum Math Score' FROM students GROUP by race HAVING MIN(math_score) < 20 ORDER BY MIN(math_score) ASC;

SELECT gender,
    COUNT(*) AS 'Total Students',
    AVG(CASE WHEN test_preparation_course = 'completed' THEN math_score END) AS 'Completed avg math score',
    AVG(CASE WHEN test_preparation_course = 'none' THEN math_score END) AS 'Not Completed avg math score'
FROM students
GROUP BY gender
ORDER BY 'Avg Math Score (Completed)' DESC;
