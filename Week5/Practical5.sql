-- case sensitive
SELECT *
FROM Staff
WHERE jobtitle = 'Secretary';

SELECT *
FROM Staff
WHERE jobtitle = 'SECRETARY';

-- update staff and add 100 to current salary
UPDATE Staff
SET salary = salary + 100
WHERE jobtitle = 'SECRETARY';

-- to save all data so far
COMMIT;

-- integrity constraing where child records are found
UPDATE Division
SET div_id=15
WHERE div_id=10;

-- deletes Maria Hughes
DELETE FROM Staff
WHERE snum=3016;

-- tries to delete but there are child records
DELETE FROM Staff
WHERE snum=3365;

-- update staff and remove that manager id f rom child records
UPDATE Staff SET MANAGER_ID = NULL
WHERE MANAGER_ID = 3365;

-- now can delete it
DELETE FROM Staff
WHERE snum=3365;

-- show update
SELECT *
FROM Staff;

-- rollback to use different method
ROLLBACK;

-- remove constraint first and then add it back
ALTER TABLE Staff
DROP CONSTRAINT staff_manager_fk;

ALTER TABLE Staff
ADD ( CONSTRAINT staff_manager_fk FOREIGN KEY (manager_id) REFERENCES Staff(snum) ON DELETE SET NULL
    );

-- there are child records so there's an error
DELETE FROM Staff
WHERE snum = 3788;

-- drop vehicle_staff constraint and add new one back
ALTER TABLE Vehicle DROP CONSTRAINT VEHICLE_STAFF_FK;

ALTER TABLE Vehicle ADD CONSTRAINT VEHICLE_STAFF_FK
FOREIGN KEY (snum) REFERENCES Staff(snum) ON DELETE SET NULL;

COMMIT;

-- show update
SELECT *
FROM Staff;

ROLLBACK;

-- try to add new division, it works after modifying the tables
INSERT INTO Division (div_id, divname, city) 
            VALUES(70,	'RESEARCHDEV',	'LETTERKENNY');

-- modify tables
ALTER TABLE Division
MODIFY (divName VARCHAR(12));

ALTER TABLE Division
MODIFY (city VARCHAR(12));

-- save everything
COMMIT;