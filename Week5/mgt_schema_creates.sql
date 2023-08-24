---management table CREATES
 
CREATE TABLE Division
     (div_id 	NUMBER(3) NOT NULL, 
      divName 	VARCHAR2(10),
      city 	 	VARCHAR2(10),
      CONSTRAINT 	div_pk PRIMARY KEY (div_id));
            
CREATE TABLE Staff
     (	  snum 		    NUMBER(4) NOT NULL,
          fname 	    VARCHAR2(20) NOT NULL,
          surname 	    VARCHAR2(20) NOT NULL , 
          jobtitle 	    VARCHAR2(20),
          manager_id 	NUMBER(4),
          gender  	    VARCHAR2(1),
          joindate 	    DATE,
          div_id 	    NUMBER(3) NOT NULL, 
          salary 	    NUMBER(8,2),
          bonus 	    NUMBER(8,2),
          CONSTRAINT 	snum_pk PRIMARY KEY (snum));

ALTER TABLE Staff
ADD ( CONSTRAINT     staff_division_fk
                        FOREIGN KEY (div_id)     REFERENCES Division
    , CONSTRAINT     staff_manager_fk
                        FOREIGN KEY (manager_id) REFERENCES Staff(snum)
    ) ;
	
ALTER TABLE Staff
	ADD( CONSTRAINT   salary_min
                     CHECK (salary > 0) 
					 );

 CREATE TABLE Vehicle
     (
	  regno 	VARCHAR2(12) NOT NULL,
	  make  	VARCHAR2(20) NOT NULL ,
	  model 	VARCHAR2(20),
	  mileage 	NUMBER(10),
	  snum 		NUMBER(4),
	  div_id 	NUMBER(3) NOT NULL,     
      CONSTRAINT 	regno_pk PRIMARY KEY (regno));


ALTER TABLE Vehicle
ADD ( CONSTRAINT     vehicle_division_fk    FOREIGN KEY (div_id)
                                                REFERENCES Division
    , CONSTRAINT     vehicle_staff_fk       FOREIGN KEY (snum)
                                                REFERENCES Staff
    ) ;

DESC staff;

--query the user constraints views

SELECT table_name, constraint_name
FROM USER_CONSTRAINTS
WHERE constraint_name like '%FK'; 

--USER_CONS_COLUMNS will list the column name too
SELECT table_name, constraint_name, column_name
FROM USER_CONS_COLUMNS 
WHERE constraint_name like '%FK'; 


