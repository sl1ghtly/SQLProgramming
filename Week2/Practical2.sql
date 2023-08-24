-- Open a Text Editor --
SELECT COUNT(*)
FROM  all_tables;

-- Spooling Output to a file --
SPOOL "O:\Semester 4\SQL Programming\Week 2\Practical\Pract2_log.log"
SPOOL OFF

set echo ON
SPOOL "O:\Semester 4\SQL Programming\Week 2\Practical\Pract2_log.log"
select to_char(sysdate, 'dd-mm-yyyy hh24:mi:ss') "Log start" from dual;
show user;
select to_char(sysdate, 'dd-mm-yyyy hh24:mi:ss') "Log end" from dual;
Spool off

-- Container Database (CBD) --
SHO con_name;

-- To query views about all containers installed.
COLUMN name FORMAT a15
SELECT name, con_id
FROM v$containers
ORDER BY con_id;

-- Improve the output
SET LINESIZE 50
SET WRAP OFF

-- Etiquette And The Data Dictionary
DESC dba_pdbs

-- 5. Switch Container --
ALTER SESSION SET CONTAINER = XEPDB1;
SHO con_name

-- 6. Create a new User --
CREATE USER test
 IDENTIFIED BY test
 PASSWORD EXPIRE 
 DEFAULT TABLESPACE USERS 
 QUOTA 10M ON USERS;
 
-- 7. Connect as Test --
sqlplus test/test@localhost/xepdb1
 
-- 8. Grant Create session to test 
GRANT create session TO test;

-- 9. Grant resource to tesT --
GRANT RESOURCE TO test;

-- 10. Test can now create tables, insert data and drop the table and lots other stuff
CREATE TABLE t1(2  col1 INT);

-- insert data
INSERT INTO t1
  2  VALUES(1);
  
-- select from table  
SELECT *
  2  FROM t1;
  
-- drop TABLE
DROP TABLE t1;  

--11. Drop the test user --
DROP USER test CASCADE;

-- 12. TASK --

/*Create a new user called company on XEPDB1 with a suitable password, provide 
tablespace and quota.
*/

ALTER SESSION SET CONTAINER = XEPDB1;
SHO con_name

CREATE USER company
 IDENTIFIED BY company
 PASSWORD EXPIRE 
 DEFAULT TABLESPACE USERS 
 QUOTA 10M ON USERS;
 
-- Grant necessary privileges to company --
sqlplus test/test@localhost/xepdb1 --cmd--

GRANT create session TO test;
GRANT RESOURCE TO test;

-- Create and populate a table called employee with 2 columns and 2 rows --
CREATE TABLE t1(2  col1 INT);

-- Select from employee --

-- Delete one record from employee --

-- Drop the company schema. --
