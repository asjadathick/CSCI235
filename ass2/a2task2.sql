set ECHO ON;
spool task2

--Task2.1
SELECT Department.D#, Department.DName
FROM Department JOIN DeptLocation
ON Department.D# = DeptLocation.D#
WHERE  UPPER(DeptLocation.Address) LIKE '%WOLLONGONG%';

--Task2.2
SELECT Department.D#, Department.DName, Department.Manager# FROM Department
WHERE Department.D# NOT IN (SELECT D# FROM Project);

--Task2.3
SELECT Department.D#, Department.DName, COALESCE(sum(Project.Budget),0) AS "TOTAL BUDGETS"
FROM Department FULL JOIN Project
ON Department.D# = Project.D#
GROUP BY Department.D#, Department.DName;

--Task2.4
SELECT Employee.E#, Employee.Name, Employee.D#, COALESCE(sum(WorksOn.Hours),0) AS "TOTAL HOURS/W"
FROM Employee FULL JOIN WorksOn
ON Employee.E# = WorksOn.E#
GROUP BY Employee.E#, Employee.Name, Employee.D#;

--Task2.5
SELECT Employee.E#, Employee.Name 
FROM Employee JOIN Department
ON Employee.D# = Department.D#
WHERE Department.Manager# = (SELECT Employee.E# FROM Employee WHERE Employee.Name = 'Alvin') AND Employee.E# <> (SELECT Employee.E# FROM Employee WHERE Employee.Name = 'Alvin');


--Task2.6
SELECT Employee.E#, Employee.Name FROM Employee
WHERE NOT EXISTS (SELECT * FROM Dependent WHERE Dependent.E# = Employee.E#);

--Task2.7
SELECT DISTINCT Employee.E#, Employee.Name
FROM Employee JOIN WorksOn
ON Employee.E# = WorksOn.E#
WHERE (SELECT Project.Budget FROM Project WHERE Project.P# = WorksOn.P#) > 200000;

--Task2.8
SELECT Project.Sponsor, sum(Project.Budget) as "Total Sponsored"
FROM Project
GROUP BY Project.Sponsor;

--Task2.9
SELECT Employee.E#, Employee.Name FROM Employee 
WHERE Employee.E# IN (SELECT WorksOn.E# FROM WorksOn WHERE WorksOn.P# IN (SELECT P# FROM Project WHERE Project.Sponsor = 'Education committee'));

--Task2.10
SELECT  CAST(AVG(MONTHS_BETWEEN(SYSDATE, Employee.DOB)/12) AS INT) AS "AVERAEGE AGE" FROM Employee;
       
spool off;