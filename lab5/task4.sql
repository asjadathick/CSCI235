SELECT ptitle FROM Position
WHERE EXISTS (select Applies.p# FROM Applies);

SELECT Applicant.fname || ' ' || Applicant.lname AS "Full Name" FROM Applicant WHERE
Applicant.a# IN (select a# from Applies);



SELECT ctitle FROM CoursePassed WHERE A# IN (SELECT A.a# FROM Applies A WHERE A.p# in (SELECT p# FROM SNeeded WHERE sname='C PROGRAMMING'));