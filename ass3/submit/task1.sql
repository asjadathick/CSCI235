SPOOL task1.lst;
SET ECHO ON;
SET linesize 100;
--Task1.1

CREATE OR REPLACE VIEW TASK1POINT1 AS
	SELECT A1.FIRST_NAME, A1.LAST_NAME, S1.CODE, S1.NAME FROM RunningSubject R1 JOIN Subject S1
	ON R1.CODE = S1.CODE JOIN Teaches T1 ON
	T1.CODE = R1.CODE AND T1.ASESSION = R1.ASESSION AND T1.YEAR = R1.YEAR JOIN Academic A1
	ON T1.LECTURER = A1.STAFF#
	WHERE S1.CREDITS >= 12 AND R1.ENROLMENT > 50;
  
SELECT * FROM TASK1POINT1;


--Task1.2

CREATE OR REPLACE VIEW TASK1POINT2 AS
	  SELECT S1.CODE, S1.NAME, count(A1.staff#) As "Total Lecturers" FROM RunningSubject R1 JOIN Subject S1
	  ON R1.CODE = S1.CODE JOIN Teaches T1 ON
	  T1.CODE = R1.CODE AND T1.ASESSION = R1.ASESSION AND T1.YEAR = R1.YEAR JOIN Academic A1
	  ON T1.LECTURER = A1.STAFF#
	  WHERE R1.YEAR<2016 AND S1.CODE IN ('CSCI235','CSCI212','CSCI222')
	  GROUP BY S1.CODE, S1.NAME;

SELECT * FROM TASK1POINT2;

--Task1.3

CREATE OR REPLACE VIEW TASK1POINT3 AS
  SELECT A1.STAFF#, A1.FIRST_NAME, A1.LAST_NAME FROM Academic A1
  WHERE A1.STAFF# NOT IN (SELECT lecturer FROM Teaches WHERE year = EXTRACT(YEAR FROM sysdate) AND ASESSION='AUTUMN');

SELECT * FROM TASK1POINT3;

--Task1.4



CREATE OR REPLACE VIEW TASK1POINT4 AS
SELECT DISTINCT A.staff#, A.first_name, A.last_name
FROM Academic A
JOIN Teaches T1 ON T1.lecturer = A.staff#
	AND T1.code = 'CSCI235'
JOIN Teaches T2 ON T2.lecturer = A.staff#
	AND T2.code = 'CSCI204'
JOIN Teaches T3 ON T3.lecturer = A.staff#
	AND T3.code = 'CSCI222';


INSERT INTO Teaches VALUES ('CSCI235', 'AUTUMN', 2016, 1000000010);
INSERT INTO Teaches VALUES ('CSCI204', 'AUTUMN', 2016, 1000000010);
INSERT INTO Teaches VALUES ('CSCI222', 'AUTUMN', 2016, 1000000010);

SELECT * FROM TASK1POINT4;

spool off;
