set ECHO ON;
spool task1;

--Task1.1

ALTER TABLE Department
	ADD CONSTRAINT dep_fkmanager FOREIGN KEY(Manager#) REFERENCES Employee(E#);

ALTER TABLE Employee
  DISABLE CONSTRAINT Employee_FK1;
  
INSERT INTO Employee VALUES ('00271', 'Garret', TO_DATE('10/04/1980', 'DD/MM/YYYY'), '13 Hindmarsh Ave, North Wollongong, NSW 2500', 'M', 125.2, '00100', NULL);
INSERT INTO Department VALUES (6, 'Research Centre', '00271', TO_DATE('01/06/2016', 'DD/MM/YYYY'));
INSERT INTO DeptLocation VALUES (6, '3 Renovation campus, North Wollongong, NSW 2500');

UPDATE Employee
	SET D# = 6
	WHERE E# = 00271;
  
ALTER TABLE Employee
  ENABLE CONSTRAINT Employee_FK1;


--Task1.2
ALTER TABLE WorksOn
	ADD CONSTRAINT chk_hours CHECK (Hours <= 30);

--Task1.3
ALTER TABLE Project
MODIFY(
	PTitle VARCHAR2(50)
);

--Task1.4
ALTER TABLE Department
	ADD total_staff_number INT;

UPDATE Department
SET total_staff_number = (select count(*) FROM Employee WHERE Employee.D# = Department.D#);

--Task1.5
UPDATE DeptLocation
	SET DeptLocation.D# = 3
	WHERE DeptLocation.D# = 5;

UPDATE Employee
	SET Employee.D# = 3
	WHERE Employee.D# = 5;

UPDATE Project
	SET Project.D# = 3
	WHERE Project.D# = 5;

DELETE FROM Department
	WHERE Department.D# = 5;

UPDATE Department
	SET Department.total_staff_number = (select count(*) FROM Employee WHERE Employee.D# = 3)
	WHERE Department.D# = 3;
  

--Task1.6
ALTER TABLE Dependent
	DROP CONSTRAINT Dependent_CK;
ALTER TABLE Dependent
	ADD CONSTRAINT Dependent_CK CHECK (Relationship IN ('SON', 'DAUGHTER', 'SPOUSE', 'MOTHER', 'FATHER', 'OTHER'));


--Task1.7
SELECT Department.DName, count(P#) AS "Total Projects"
FROM Department FULL JOIN Project
ON Department.D# = Project.D#
WHERE Department.D# = &DepartmentNumber
GROUP BY Department.DName;

--Task1.8
ACCEPT ProjectNumber PROMPT "Enter Project Number: ";
ACCEPT ProjectTitle PROMPT "Enter Project Title: ";
ACCEPT Sponsor PROMPT "Enter Sponsor: ";
ACCEPT DepartmentNumber PROMPT "Enter Department Number: ";
ACCEPT Budget PROMPT "Enter Budget: ";

INSERT INTO Project VALUES (&ProjectNumber, '&ProjectTitle', '&Sponsor', &DepartmentNumber, &Budget);
                               
spool off;