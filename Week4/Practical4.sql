--  A template for creating a spool file in sql developer for practical and CA solutions

--to spool for sqldeveloper run the following test by running the script or press F5

SET echo ON;

--make sure you have the correct path specified and have created the folder
spool "D:\Year 2\Semester 4\SQL Programming\Week4\Practical4_Log.log";
--log files should always contain date and time
SELECT TO_CHAR(sysdate, 'dd-mm-yyyy hh24:mi:ss') "Log start"
FROM dual;

-- create table Division
CREATE TABLE Division
    (div_id     NUMBER(3) NOT NULL,
    divName     VARCHAR2(10),
    city        VARCHAR2(10),
    CONSTRAINT div_pk PRIMARY KEY (div_id));

-- create table Staff
CREATE TABLE Staff
    (snum       NUMBER(4) NOT NULL,
    fname       VARCHAR2(20) NOT NULL,
    surname     VARCHAR2(20) NOT NULL,
    jobtitle    VARCHAR2(20),
    manager_id  NUMBER(4),
    gender      VARCHAR2(1),
    joindate    DATE,
    salary      NUMBER(8, 2),
    bonus       NUMBER(8, 2),
    CONSTRAINT snum_pk PRIMARY KEY  (snum));

-- create table Vehicle
CREATE TABLE Vehicle
    (regno       VARCHAR2(12) NOT NULL,
    make        VARCHAR2(20) NOT NULL,
    model       VARCHAR2(20),
    milage      NUMBER(10),
    snum        NUMBER(4),
    div_id      NUMBER(3) NOT NULL,
    CONSTRAINT regno_pk PRIMARY KEY  (regno));

-- add foreign key div_id and manager_id to Staff table
ALTER TABLE Staff
ADD ( CONSTRAINT    staff_division_fk   FOREIGN KEY (div_id)        REFERENCES Division
    , CONSTRAINT    staff_manager_fk    FOREIGN KEY (manager_id)    REFERENCES Staff(snum)
    );

-- alter the table and add salary minimum
ALTER TABLE Staff
ADD ( CONSTRAINT    salary_min      CHECK (salary > 0)
    );

-- add foreign key div_id and snum to Vehicle table
ALTER TABLE Vehicle
ADD ( CONSTRAINT    vehicle_division_fk FOREIGN KEY (div_id)        REFERENCES Division
    , CONSTRAINT    vehicle_staff_fk    FOREIGN KEY (snum)          REFERENCES Staff
    );

-- check foreign keys
SELECT table_name, constraint_name
FROM USER_CONSTRAINTS
WHERE constraint_name like '%FK';

-- USER_CONS_COLUMNS will list the column name too
SELECT table_name, constraint_name
FROM USER_CONS_COLUMNS
WHERE constraint_name like '%FK';

--now spool off
SELECT TO_CHAR(sysdate, 'dd-mm-yyyy hh24:mi:ss') "Log end" FROM dual;
spool OFF;