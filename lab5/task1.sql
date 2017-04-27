

SELECT S2.requires FROM SREQUIRED S1
JOIN SREQUIRED S2
ON S2.sname = S1.requires
WHERE S1.sname = 'C++ programming';

SELECT S2.sname FROM SREQUIRED S1
JOIN SREQUIRED S2
ON S1.sname = S2.requires
WHERE S1.requires = 'writing';
