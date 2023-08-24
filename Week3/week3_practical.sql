--  A template for creating a spool file in sql developer for practical and CA solutions

--to spool for sqldeveloper run the following test by running the script or press F5

SET echo ON;

--make sure you have the correct path specified and have created the folder
spool "D:\Year 2\Semester 4\SQL Programming\Week3\Practical3_Log.log";
--log files should always contain date and time
SELECT TO_CHAR(sysdate, 'dd-mm-yyyy hh24:mi:ss') "Log start"
FROM dual;

--part 1
--query 1
SELECT *
FROM employees;

--query 2
SELECT DEPARTMENT_NAME 
FROM departments;

--query 3
SELECT LAST_NAME
FROM employees;

--query 4
SELECT CITY, POSTAL_CODE
FROM locations;

--part 2
--query 1
SELECT DEPARTMENT_ID, DEPARTMENT_NAME
FROM departments
ORDER BY DEPARTMENT_NAME desc;

--query 2
SELECT LAST_NAME, SALARY, SALARY + (SALARY / 20) AS "Salary Increase"
FROM employees;

--query 3
SELECT FIRST_NAME || ' ' || LAST_NAME AS "FULL_NAME"
FROM employees;

--query 4
SELECT DISTINCT MANAGER_ID
FROM employees
WHERE MANAGER_ID IS NOT NULL
ORDER BY MANAGER_ID desc;

--part 3
--query 1
SELECT FIRST_NAME || ' ' || LAST_NAME AS "FULL_NAME", SALARY
FROM employees
WHERE SALARY <= 6000;

--query 2
SELECT *
FROM employees
WHERE DEPARTMENT_ID IS NULL;

--query 3
SELECT FIRST_NAME || ' ' || LAST_NAME AS "FULL_NAME", HIRE_DATE , SALARY, DEPARTMENT_ID
FROM employees
WHERE FIRST_NAME NOT LIKE '%M%';

--query 4
SELECT *
FROM employees
WHERE (SALARY BETWEEN 8000 AND 12000)
AND (COMMISSION_PCT IS NOT NULL)
AND (HIRE_DATE > '05-JUN-2005');

--query 5
SELECT FIRST_NAME, LAST_NAME, EMAIL, SALARY, MANAGER_ID
FROM employees
WHERE MANAGER_ID = 120
OR MANAGER_ID = 103
OR MANAGER_ID = 145;

--query 6
SELECT FIRST_NAME, SALARY, SALARY + (SALARY / 10) AS "Proposed Pay"
from employees;

--query 6.1
SELECT FIRST_NAME, SALARY, SALARY + (SALARY / COMMISSION_PCT) AS "Total Pay"
from employees
WHERE COMMISSION_PCT IS NOT NULL;

--part 4
--query 1
SELECT AVG(SALARY) AS "Average Salary"
FROM employees
WHERE MANAGER_ID = 101;

--query 2
SELECT SUM(SALARY) AS "Total Salaries"
FROM employees
WHERE DEPARTMENT_ID = 50
OR DEPARTMENT_ID = 60;

--query 3
SELECT MIN(SALARY), MAX(HIRE_DATE), MIN(LAST_NAME)
FROM employees;

--query 4
SELECT MIN(HIRE_DATE)
FROM employees;

--query 5
SELECT 'The company operates in ' || COUNT(DISTINCT REGION_NAME) || ' Regions' AS "REGIONS"
FROM REGIONS;

--part 5
--query 1
SELECT COUNT(EMPLOYEE_ID)
FROM employees;

SELECT COUNT(EMPLOYEE_ID) AS "No of Employees", DEPARTMENT_ID
FROM employees
GROUP BY DEPARTMENT_ID;

--query 2
SELECT MANAGER_ID, MIN(SALARY) AS "Min Salary", MAX(SALARY) AS "Max Salary", AVG(SALARY) AS "Average Salary"
FROM employees
GROUP BY MANAGER_ID
ORDER BY MANAGER_ID;

--query 3
SELECT DEPARTMENT_ID, MIN(SALARY) AS "Min Salary", MAX(SALARY) AS "Max Salary", AVG(SALARY) AS "Average Salary"
FROM employees
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

--query 4
SELECT DEPARTMENT_NAME AS "Department", MIN(SALARY) AS "Minimum Salary"
FROM departments, employees
WHERE departments.department_id = employees.department_id
AND (SALARY <= 7000)
GROUP BY departments.DEPARTMENT_NAME
ORDER BY "Minimum Salary";

--part 6
--query 1
SELECT FIRST_NAME, LAST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM departments D, employees E
WHERE (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
AND (E.MANAGER_ID = 100)
ORDER BY LAST_NAME;

--query 2
SELECT FIRST_NAME, LAST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME
FROM departments D, employees E
WHERE (D.DEPARTMENT_ID = E.DEPARTMENT_ID)
AND (E.MANAGER_ID = 80) 
OR (E.MANAGER_ID = 40)
ORDER BY LAST_NAME;

--query 3
SELECT JOB_TITLE, DEPARTMENT_NAME, FIRST_NAME || ' ' || LAST_NAME AS "FULL_NAME", HIRE_DATE AS "START_DATE"
FROM departments d, employees e, jobs j, job_history j2
WHERE d.DEPARTMENT_ID = e.DEPARTMENT_ID
AND e.JOB_ID = j2.JOB_ID AND j2.JOB_ID = j.JOB_ID
AND (j2.START_DATE BETWEEN '01-JAN-03' AND '31-AUG-07');

--query 4


--query 5



--now spool off
SELECT TO_CHAR(sysdate, 'dd-mm-yyyy hh24:mi:ss') "Log end" FROM dual;
spool OFF;