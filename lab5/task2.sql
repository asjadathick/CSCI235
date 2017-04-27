SELECT Applicant.fname || ' ' || Applicant.lname AS "Full Name", SPossessed.sname FROM
Applicant LEFT JOIN SPossessed
ON Applicant.a# = SPossessed.a#;

SELECT S.skill, P.ptitle
FROM LSkill S
LEFT JOIN SNeeded SN
ON S.skill = SN.sname
LEFT JOIN Position P
ON P.p# = SN.p#;

SELECT Applicant.fname || ' ' || Applicant.lname AS FullName, count(SPossessed.a#) AS SkillCount
FROM Applicant LEFT JOIN SPossessed
ON Applicant.a# = SPossessed.a#
GROUP BY ( Applicant.fname || ' ' || Applicant.lname);

