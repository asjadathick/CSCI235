SELECT P1.p#, P1.ptitle FROM POSITION P1
WHERE p# IN (SELECT p# FROM SNeeded WHERE sname = 'COOKING' and skilllevel>5);

SELECT skill FROM LSkill
WHERE skill NOT IN (SELECT sname FROM SPossessed);

SELECT sname FROM SNeeded
GROUP BY sname
HAVING count(p#) > 3;