--practical - insert, updates and delete data
--section 2
--some statements to help you finish the practical
-- management schema inserts

INSERT INTO Division (div_id, divname, city)  
            VALUES(10,	'ADMIN',	'BELFAST');
            
--Try the following inserts
INSERT INTO Division VALUES (60, 'LONDON'); --error!

INSERT INTO Division (div_ID, city) 
    VALUES (60, 'LONDON');

DELETE FROM division 
WHERE DIV_ID = 60;

--insert the remaining division data            
INSERT INTO Division (div_id, divname, city) 
            VALUES(20,	'SALES',	'DUBLIN');

INSERT INTO Division (div_id, divname, city) 
            VALUES(30,	'CONSULTING',	'BELFAST');

INSERT INTO Division (div_id, divname, city) 
            VALUES(40,	'TRAINING',	'GALWAY');

INSERT INTO Division (div_id, divname, city) 
            VALUES(50,	'COMPUTING',	'DONEGAL');

COMMIT;

/**************************************************************/
--Insert Data into the Staff table

INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
				VALUES(3016,'ANGELA','MCGEE','SECRETARY',3414,'F',to_date('11-Jul-1999','dd-mon-yyyy'),10,22288,NULL);
                
--enable / disable FK constraints and insert the data

ALTER TABLE Staff
DISABLE CONSTRAINT staff_manager_fk;

SELECT constraint_name, constraint_type, status
FROM user_constraints
WHERE table_name = 'STAFF'
ORDER BY constraint_name ;

INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
				VALUES(3016,'ANGELA','MCGEE','SECRETARY',3414,'F',to_date('11-Jul-1999','dd-mon-yyyy'),10,22288,NULL);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3107,'ANN','HAMILTON','SALESMAN',3200,'M',to_date('13-Dec-2002','dd-mon-yyyy'),20,28534,4500);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3200,'PAUL','QUINN','MANAGER',3812,'F',to_date('01-Jul-2010','dd-mon-yyyy'),20,35872,500);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3215,'THOMAS','SWEENEY','CLERK',3200,'M',to_date('16-Mar-2011','dd-mon-yyyy'),20,19384,NULL);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3365,'MARIA','HUGHES','ACCOUNTANT',3414,'M',to_date('17-Nov-2013','dd-mon-yyyy'),10,33760,NULL);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3407,'CARA','KELLY','SECRETARY',3926,'F',to_date('13-Dec-2002','dd-mon-yyyy'),10,26200,NULL);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3414,'AOIFE','MCDERMOT','MANAGER',3813,'M',to_date('22-Jun-2017','dd-mon-yyyy'),10,45872,NULL);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3488,'BRENDAN','BOYLE','CLERK',3365,'F',to_date('01-Dec-2012','dd-mon-yyyy'),10,18652,NULL);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3698,'MARY','FRENCH','CONSULTANT',3788,'M',to_date('01-Apr-2000','dd-mon-yyyy'),30,50184,NULL);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3724,'OWEN','MARKEY','CONSULTANT',3788,'M',to_date('28-Oct-2009','dd-mon-yyyy'),30,59400,825);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3788,'RONAN','BOYLE','MANAGER',3813,'M',to_date('10-Feb-2005','dd-mon-yyyy'),30,30816,1586);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3812,'CIAN','FLEMING','DIRECTOR',3926,'M',to_date('14-Dec-2002','dd-mon-yyyy'),20,62000,950);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3813,'JULIE','HOWLEY','DIRECTOR',3926,'F',to_date('20-Apr-2000','dd-mon-yyyy'),10,66752,NULL);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3926,'ELAINE','BURKE','CHAIRMAN',NULL,'F',to_date('03-Sep-2004','dd-mon-yyyy'),10,65816,NULL);
INSERT INTO Staff (snum, fname, surname, jobtitle, manager_id, gender, joindate, div_id, salary, bonus) 
                VALUES(3989,'ALEC','DOHERTY','CONSULTANT',3788,'M',to_date('24-Sep-2003','dd-mon-yyyy'),30,38000,825);

COMMIT;

ALTER TABLE Staff
ENABLE CONSTRAINT staff_manager_fk;
/**********************************************************************/
--INSERT INTO VEHICLE

INSERT INTO Vehicle ( snum, regno, make, model, mileage, div_id) 
                VALUES(3107,'161DL314','BMW','316I',27216,20);
INSERT INTO Vehicle ( snum, regno, make, model, mileage, div_id) 
                VALUES(3200,'161DL567','FORD','MONDEO',30986,20);
INSERT INTO Vehicle ( snum, regno, make, model, mileage, div_id) 
                VALUES(3414,'161D4565','VOLVO','340',28216,10);
INSERT INTO Vehicle ( snum, regno, make, model, mileage, div_id) 
                VALUES(3698,'151G5454','FORD','MONDEO',18311,30);
INSERT INTO Vehicle ( snum, regno, make, model, mileage, div_id) 
                VALUES(3724,'152G6546','FORD','FIESTA',20016,30);
INSERT INTO Vehicle ( snum, regno, make, model, mileage, div_id) 
                VALUES(3788,'171DL654','VOLVO','440',16485,30);
INSERT INTO Vehicle ( snum, regno, make, model, mileage, div_id) 
                VALUES(3812,'172D4567','TOYOTA','LEXUS',2193,20);
INSERT INTO Vehicle ( snum, regno, make, model, mileage, div_id) 
                VALUES(3813,'152G4333','BMW','320',28726,10);
INSERT INTO Vehicle ( snum, regno, make, model, mileage, div_id) 
                VALUES(3926,'142SO097','JAGUAR','XJ6',21817,10);
INSERT INTO Vehicle ( snum, regno, make, model, mileage, div_id) 
                VALUES(3989,'172DL987','FORD','FIESTA',30168,30);
COMMIT;