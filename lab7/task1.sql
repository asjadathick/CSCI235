SELECT ANUMBER FROM APPLIES WHERE PNUMBER = 4 AND ANUMBER IN (SELECT ANUMBER FROM SPOSSESSED WHERE SNAME = ';

SELECT * FROM APPLIES;

SELECT SNAME, SLEVEL FROM SNEEDED WHERE PNUMBER = 4;

SELECT ANUMBER, SNAME, SLEVEL FROM SPOSSESSED
WHERE SNAME= 'SQL programming' AND SLEVEL>=6;