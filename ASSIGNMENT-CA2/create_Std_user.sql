-- create student schema


--drop user student cascade;

CREATE user student
IDENTIFIED by Mustbe12bytes
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT unlimited tablespace to student;

GRANT CONNECT, RESOURCE TO Student;

GRANT CREATE VIEW TO Student;

-- now connect as Student/Mustbe12bytes


--run the script on BB called createstudent.sql

--after the script has completed, it will show a list of counts representing the number of rows it created for each table. compare those on BB with your output.

