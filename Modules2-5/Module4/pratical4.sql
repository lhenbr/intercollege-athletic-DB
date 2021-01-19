--1
SELECT CUSTNO, CUSTNAME, PHONE, CITY FROM CUSTOMER;
--2
SELECT CUSTNO, CUSTNAME, PHONE, CITY FROM CUSTOMER
WHERE STATE = 'CO';
--3
SELECT * FROM EVENTREQUEST
WHERE ESTCOST > 4000
ORDER BY DATEHELD;
--4
SELECT EVENTNO, DATEHELD, ESTAUDIENCE FROM EVENTREQUEST
WHERE(STATUS = 'Approved' AND ESTAUDIENCE > 9000) 
OR (STATUS ='Pending' AND ESTAUDIENCE > 7000);
--5
SELECT EVENTNO, DATEHELD, E.CUSTNO, CUSTNAME 
FROM EVENTREQUEST E INNER JOIN CUSTOMER C 
ON E.CUSTNO = C.CUSTNO 
WHERE CITY = 'Boulder'
AND EXTRACT(YEAR FROM dATEHELD) = '2018'
AND EXTRACT(MONTH FROM DATEHELD) ='12';
--6
SELECT PLANNO, AVG(NUMBERFLD) AS avgfld FROM EVENTPLANLINE e 
WHERE LOCNO = 'L100'
GROUP BY PLANNO ;
--7
SELECT PLANNO, AVG(NUMBERFLD) AS avgfld_L100 FROM EVENTPLANLINE e 
WHERE LOCNO = 'L100'
GROUP BY PLANNO 
HAVING COUNT(*) > 1;