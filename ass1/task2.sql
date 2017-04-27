CREATE TABLE STAFF(
	StaffNumber int not null,
	Name varchar(40),
	DOB date,
	PosLevel varchar(10),
	CONSTRAINT staff_pkey1 PRIMARY KEY(StaffNumber)
);

CREATE TABLE PROJECT(
	ProjectNumber int not null,
	SponsorName varchar(40),
	StartDate date,
	EndDate date,
	Budget decimal(19,4),
	Manager int,
	CONSTRAINT proj_pkey1 PRIMARY KEY(ProjectNumber)
);

CREATE TABLE STUDENT(
	StudentNumber int not null,
	Name varchar(40),
	DOB date,
	DegreeProgram varchar(10),
	DepartmentName varchar(20),
	CONSTRAINT stud_pkey1 PRIMARY KEY(StudentNumber)
);

CREATE TABLE DEPARTMENT(
	Name varchar(20),
	Office varchar(20),
	DepartmentHead varchar(10),
	CONSTRAINT dept_pkey1 PRIMARY KEY(Name)
);

CREATE TABLE STAFFPROJECT(
	StaffNumber int not null,
	ProjectNumber int not null,
	CONSTRAINT staffproj_pkey1 PRIMARY KEY(StaffNumber,ProjectNumber)
);

CREATE TABLE STUDENTPROJECT(
	StudentNumber int not null,
	ProjectNumber int not null,
	Supervisor int not null,
	CONSTRAINT studentproj_pkey1 PRIMARY KEY(StudentNumber,ProjectNumber)
);

CREATE TABLE STAFFDEPARTMENT(
	StaffNumber int not null,
	DeptName varchar(20) not null,
	TimePerc decimal(5,2) not null,
	CONSTRAINT staffdept_pkey1 PRIMARY KEY(StaffNumber,DeptName)
);

--Foreign key constraints
ALTER TABLE PROJECT
	ADD CONSTRAINT proj_fkey1 FOREIGN KEY(Manager) REFERENCES STAFF(StaffNumber);

ALTER TABLE STAFFPROJECT
	ADD CONSTRAINT staffproj_fkey1 FOREIGN KEY(StaffNumber) REFERENCES STAFF(StaffNumber);

ALTER TABLE STAFFPROJECT
	ADD CONSTRAINT staffproj_fkey2 FOREIGN KEY(ProjectNumber) REFERENCES PROJECT(ProjectNumber);

ALTER TABLE STAFFDEPARTMENT
	ADD CONSTRAINT staffdept_fkey1 FOREIGN KEY(StaffNumber) REFERENCES STAFF(StaffNumber);

ALTER TABLE STAFFDEPARTMENT
	ADD CONSTRAINT staffdept_fkey2 FOREIGN KEY(DeptName) REFERENCES DEPARTMENT(Name);

ALTER TABLE STUDENT
	ADD CONSTRAINT stud_fkey1 FOREIGN KEY(DepartmentName) REFERENCES DEPARTMENT(Name);

ALTER TABLE STUDENTPROJECT
	ADD CONSTRAINT studentproj_fkey1 FOREIGN KEY(StudentNumber) REFERENCES STUDENT(StudentNumber);

ALTER TABLE STUDENTPROJECT
	ADD CONSTRAINT studentproj_fkey2 FOREIGN KEY(ProjectNumber) REFERENCES PROJECT(ProjectNumber);

ALTER TABLE STUDENTPROJECT
	ADD CONSTRAINT studentproj_fkey3 FOREIGN KEY(Supervisor) REFERENCES STAFF(StaffNumber);
