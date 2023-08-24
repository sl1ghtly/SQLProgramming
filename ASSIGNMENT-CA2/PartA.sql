-- create a system_conn_xepdb1 connection


-- create_Std_user.sql was used to create the Student schema


-- connected to student schema using student_conn_xepdb1 connection and
-- createStudent.sql was used to create the tables and populate with provided inserts


-- Write a Query to describe the structure of one of the tables.
DESC STUDENT;

-- Write a query to select from the tables. Ensure your query demonstrates the following:
-- Joins data from 3 or more tables
-- Uses 2 or more restricting data operators or keywords
-- Uses an aggregate function
-- Alias all columns appropriately

-- DISPLAY STUDENT_ID, the rounded average of the NUMERIC_GRADE from ENROLLMENT, GRADE and STUDENT
SELECT S.STUDENT_ID AS "STUDENT ID", ROUND(AVG(NUMERIC_GRADE)) AS "FINAL AVERAGE GRADES"
FROM ENROLLMENT E, GRADE G, STUDENT S
-- link STUDENT_ID in STUDENT with the one in ENROLLMENT and link SECTION_ID in ENROLLMENT with the one in GRADE
WHERE (S.STUDENT_ID = E.STUDENT_ID
AND E.SECTION_ID = G.SECTION_ID)
-- WHERE the NUMERIC_GRADE is BETWEEN 70 AND 100 AND the GRADE_TYPE_CODE is FI
AND (NUMERIC_GRADE BETWEEN 70 AND 100)
AND (GRADE_TYPE_CODE = 'FI')
-- GROUP BY the STUDENT_ID and ORDER BY the rounded average of NUMERIC_GRADE in descending order
GROUP BY S.STUDENT_ID
ORDER BY "FINAL AVERAGE GRADES" DESC;
