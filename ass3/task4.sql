
SPOOL task4.lst;
--Task4.1

SET ECHO ON;
SET FEEDBACK ON;
SET LINESIZE 100;
SET PAGESIZE 100;
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE WHOTAUGHT (SubjectCode IN SUBJECT.CODE%TYPE)
IS
  LecturerFirstName ACADEMIC.FIRST_NAME%TYPE;
  LecturerLastName ACADEMIC.LAST_NAME%TYPE;
  SubjectName SUBJECT.NAME%TYPE;
  CURSOR Q1 IS
    SELECT DISTINCT ACADEMIC.FIRST_NAME, ACADEMIC.LAST_NAME FROM TEACHES
      JOIN ACADEMIC ON TEACHES.LECTURER = ACADEMIC.STAFF#
      WHERE (TEACHES.CODE = SubjectCode) AND (TEACHES.YEAR < 2016);
BEGIN

  SELECT NAME INTO SubjectName FROM SUBJECT WHERE SUBJECT.CODE = SubjectCode;
  DBMS_OUTPUT.PUT_LINE('Subject: ' || SubjectName);
  DBMS_OUTPUT.PUT_LINE('');
  DBMS_OUTPUT.PUT_LINE('Lecturers names who taught subject before 2016:');

  OPEN Q1;
    LOOP
    
    FETCH Q1 INTO LecturerFirstName, LecturerLastName;
        IF Q1%NOTFOUND THEN EXIT; END IF;
        
        DBMS_OUTPUT.PUT_LINE(LecturerFirstName || ' ' || LecturerLastName);
    
    END LOOP;
  CLOSE Q1;

END WHOTAUGHT;
/

EXECUTE WHOTAUGHT('CSCI235');

--Task4.2

CREATE OR REPLACE FUNCTION FINDSUBJECTS (AcademicNumber IN ACADEMIC.STAFF#%TYPE)
RETURN VARCHAR IS
  FirstName ACADEMIC.FIRST_NAME%TYPE;
  LastName ACADEMIC.LAST_NAME%TYPE;
  SubjectCode TEACHES.CODE%TYPE;
  finalRow VARCHAR2(2000);
  CURSOR Q1 IS
    SELECT CODE FROM TEACHES WHERE LECTURER = AcademicNumber;
BEGIN

  SELECT FIRST_NAME, LAST_NAME INTO FirstName, LastName FROM ACADEMIC WHERE STAFF# = AcademicNumber;
  
  finalRow := FirstName || ' ' || LastName || '      ';
  
  OPEN Q1;
  LOOP
    FETCH Q1 INTO SubjectCode;
    IF Q1%NOTFOUND THEN EXIT; END IF;
    
      finalRow := finalRow || ' ' || SubjectCode;
    
    END LOOP;
  CLOSE Q1;
    
  RETURN(finalRow);
  
END FINDSUBJECTS;
/

SELECT FINDSUBJECTS(STAFF#) AS "ACADEMIC SUBJECTS" FROM ACADEMIC;

  spool off;