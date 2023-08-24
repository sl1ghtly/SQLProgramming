-- Create your Oracle Cloud account(using the email you received from Oracle).


-- Create a Database Instance


-- Obtain an instance wallet


-- create a ADMIN_CA2_CLOUD connection


-- create_Std_user.sql was used to create the Student schema


-- connected to student schema using student_CA2_CLOUD connection and
-- createStudent.sql was used to create the tables and populate with provided inserts


-- Write a Query to describe the structure of one of the tables.
DESC ENROLLMENT;

-- Write a query to select from the tables. Ensure your query demonstrates the following:
-- Joins data from 3 or more tables
-- Uses 2 or more restricting data operators or keywords
-- Uses an aggregate function
-- Alias all columns appropriately

-- DISPLAY COURSE_NO, amount of STUDENT_ID from COURSE, SECTION and STUDENT
SELECT C.COURSE_NO AS "JAVA COURSE NUMBER", COUNT(S2.STUDENT_ID) AS "AMOUNT OF STUDENTS"
FROM COURSE C, ENROLLMENT E, SECTION S, STUDENT S2
-- link STUDENT_ID in STUDENT with the one in SECTION and link COURSE_NO in SECTION with the one in COURSE
WHERE (C.COURSE_NO = S.COURSE_NO
AND S.SECTION_ID = E.SECTION_ID
AND E.STUDENT_ID = S2.STUDENT_ID)
-- WHERE the COST IS NOT NULL AND the DESCRIPTION is LIKE %Java%
AND (C.COST IS NOT NULL)
AND (C.DESCRIPTION LIKE '%Java%')
-- GROUP BY the COURSE_NO and ORDER BY amount of STUDENT_ID from COURSE in descending order
GROUP BY C.COURSE_NO
ORDER BY "AMOUNT OF STUDENTS" DESC;