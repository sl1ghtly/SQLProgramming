--create a user in system
CREATE USER student
    IDENTIFIED BY student
    DEFAULT TABLESPACE USERS
    QUOTA 4M ON USERS;

GRANT CREATE SESSION TO student;

GRANT CONNECT, RESOURCE TO student;

--to drop the user type....
--DROP USER student CASCADE;

/*Every Oracle database contains a tablespace called USERS, 
another called SYSTEM and TEMP too. They are created automatically 
when the database is created. The data dictionary is 
stored in the SYSTEM tablespace. */