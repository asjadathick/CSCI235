--Task3.1
GRANT ALL ON Teaches to SCOTT;

--Task3.2
GRANT CREATE TABLE TO SCOTT;
GRANT REFERENCES (CODE) ON RunningSubject TO SCOTT;

--Task3.3
CREATE OR REPLACE VIEW TSK3 AS
	SELECT * FROM Academic WHERE staff#
	IN (SELECT Lecturer FROM Teaches WHERE code IN ('CSCI235', 'CSCI204', 'CSCI124'));

GRANT SELECT ON TSK3 TO SCOTT;