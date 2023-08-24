SELECT COUNT(*)
FROM all_tables;

CREATE USER company
IDENTIFIED BY test
PASSWORD EXPIRE
DEFAULT TABLESPACE USERS
QUOTA 10M ON USERS;

sqlplus company/test@localhost/xepdb1

--
SQL> CREATE table employee(
  2  id INT);

Table created.

SQL> INSERT INTO employee
  2  VALUES(1);

1 row created.

SQL> INSERT INTO employee
  2  VALUES(2);

1 row created.

SQL> DELETE FROM employee
  2  WHERE id = 1
  3  ;

1 row deleted.

SQL> SELECT *
  2  FROM employee;

        ID
----------
         2

SQL>
--