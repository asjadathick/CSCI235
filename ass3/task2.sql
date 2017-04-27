--Task2.1

DELETE FROM Academic WHERE STAFF# IN (SELECT staff# FROM Academic WHERE staff# NOT IN (SELECT lecturer FROM Teaches T1
WHERE year > 2013 AND year < 2016));

----CHANGE TO WORK WITH ANY YEAR!!!

--Task2.2

DROP TABLE CSCI235;
CREATE TABLE CSCI235 AS (SELECT * FROM Academic WHERE 1=0);

SELECT * FROM CSCI235;

ALTER TABLE CSCI235
ADD (
  CONSTRAINT CSCI235_pkey PRIMARY KEY( staff# ),
	CONSTRAINT CSCI235_ckey1 UNIQUE ( first_name, last_name ),
	CONSTRAINT CSCI235_ckey2 UNIQUE( email ),
	CONSTRAINT CSCI235_ckey3 UNIQUE( bldg#, room#),
	CONSTRAINT CSCI235_ckey4 UNIQUE( phone# ),
	CONSTRAINT CSCI235_fkey4 FOREIGN KEY ( position )
				REFERENCES LPosition( position )
);

INSERT INTO CSCI235 (SELECT * FROM Academic WHERE Academic.staff# IN (SELECT lecturer from Teaches WHERE Teaches.code = 'CSCI235'));


--Task2.3

ALTER TABLE Academic
ADD total_subjects INT;

UPDATE Academic
SET total_subjects = (SELECT count(*) FROM Teaches WHERE Lecturer=staff#);

