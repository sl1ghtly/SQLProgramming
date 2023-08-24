--  A template for creating a spool file in sql developer for practical and CA solutions

--to spool for sqldeveloper run the following test by running the script or press F5

SET echo ON;

--make sure you have the correct path specified and have created the folder
spool "D:\Year 2\Semester 4\SQL Programming\Week3\Practical3_Log.log";
--log files should always contain date and time
SELECT TO_CHAR(sysdate, 'dd-mm-yyyy hh24:mi:ss') "Log start"
FROM dual;




--now spool off
SELECT TO_CHAR(sysdate, 'dd-mm-yyyy hh24:mi:ss') "Log end" FROM dual;
spool OFF;