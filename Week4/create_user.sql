--create a user in system
CREATE USER management
    IDENTIFIED BY management
    DEFAULT TABLESPACE USERS
    QUOTA 4M ON USERS;

GRANT create session TO management;

GRANT CONNECT, RESOURCE TO management

--to drop the user type:
--DROP USER management CASCADE