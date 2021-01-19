--USING Oracle
--1
SELECT DISTINCT city, state, zip FROM CUSTOMER c ;
--2
SELECT empname, department, phone, email FROM EMPLOYEE  
WHERE phone LIKE '3-%';
--3
SELECT * FROM RESOURCETBL r 
WHERE RATE BETWEEN 10 AND 20
ORDER BY RATE;
--4
SELECT eventno, dateauth, status FROM EVENTREQUEST e 
WHERE (status ='Approved' OR STATUS ='Denied') 
AND DATEAUTH BETWEEN TO_DATE('2018-07-01', 'YYYY-MM-DD') AND TO_DATE('2018-07-31', 'YYYY-MM-DD') ; 
--5
SELECT LOCNO , LOCNAME FROM LOCATION INNER JOIN FACILITY  
ON location.FACNO = facility.FACNO 
WHERE FACNAME = 'Basketball arena';
--6
SELECT planno, COUNT(*) AS numberOFLines, SUM(NUMBERFLD) AS resourcesassigned FROM EVENTPLANLINE
GROUP BY planno
HAVING COUNT(*) > 0;
