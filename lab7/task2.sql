SELECT * FROM APPLIES
WHERE PNUMBER=3;

SELECT * FROM SNEEDED WHERE PNUMBER=4;

--SELECT * FROM SPOSSESSED WHERE ANUMBER =5;

SELECT * FROM SPOSSESSED WHERE SNAME = ANY (SELECT SNAME FROM SNEEDED WHERE PNUMBER=4) AND ANUMBER=5;