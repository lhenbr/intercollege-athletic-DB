--1
SELECT r.eventNo, dateheld, count(p.eventno) AS planNUmber 
FROM eventrequest r, eventplan p 
WHERE r.eventno = p.eventno AND 
EXTRACT (YEAR FROM dateheld) = '2018' AND 
EXTRACT (MONTH FROM dateheld) = '12' 
GROUP BY r.eventNo, r.dateheld
HAVING count(p.EVENTNO) > 1;
--2
SELECT planno, e.eventno, workdate, activity 
FROM EVENTREQUEST e ,EVENTPLAN p, FACILITY f
WHERE e.eventno = p.eventno AND 
e.FACNO = f.facno AND
EXTRACT (YEAR FROM workdate) = '2018' AND 
EXTRACT (MONTH FROM workdate) = '12'  AND 
facname = 'Basketball arena';
--3
SELECT r.eventno, dateheld, status, estcost
FROM EVENTREQUEST r, employee e, facility f, EVENTPLAN p
WHERE p.empno = e.empno AND 
r.facno = f.FACNO AND 
r.EVENTNO = p.EVENTNO AND 
empname = 'Mary Manager' AND 
Facname ='Basketball arena' AND 
DATEHELD BETWEEN TO_DATE('01/01/2018','DD/MM/YYYY') AND TO_DATE('31/12/2018','DD/MM/YYYY') ;
--4
SELECT p.PLANNO, pl.LINENO, RESname, NUMBERFLD, LOCNAME, TIMESTART, TIMEEND
FROM EVENTPLANLINE pl ,LOCATION l, FACILITY f, EVENTPLAN p, REsourcetbl r
WHERE p.planno = pl.planno AND  
pl.locno = l.locno AND 
l.FACNO = f.FACNO AND 
pl.resno = r.resno AND
Facname ='Basketball arena' AND 
activity = 'Operation' AND 
workdate BETWEEN to_date('01/10/2018','DD/MM/YYYY') AND TO_DATE('31/12/2018','DD/MM/YYYY') ; 
--DB modification problems
--5
INSERT INTO facility VALUES('F104', 'Swimming Pool');
--6
Insert into LOCATION values ('L107','F104','Door');
--7
Insert into LOCATION values ('L108','F104','Locker Room');
--8
UPDATE LOCATION 
SET locname = 'Gate'
WHERE locname = 'Door';
--9
DELETE FROM LOCATION 
WHERE locno = 'L108';

--SQL Statements with Errors and Poor Formatting
--1 the PK FK connection between eventRequest and eventPlan tables is missing, this is a syntax error
SELECT eventrequest.eventno, dateheld, status, estcost
FROM eventrequest, employee, facility, eventplan
WHERE estaudience > 5000
  AND EVENTREQUEST.EVENTNO = eventplan.EVENTNO 
  AND eventplan.empno = employee.empno 
  AND eventrequest.facno = facility.facno
  AND facname = 'Football stadium' 
  AND empname = 'Mary Manager';
  --2 The group by clause is useless, there are no agregatte function. It's a redudancy problem
  SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
  FROM eventrequest, eventplan
  WHERE estaudience > 4000
  AND eventplan.eventno = eventrequest.eventno; 
  --3 There is a redundancy problem, the employee table is useless in this problem
  SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
  FROM eventrequest, facility, eventplan
  WHERE estaudience > 5000
  AND eventrequest.facno = facility.facno
  AND eventplan.eventno = eventrequest.eventno 
  AND facname = 'Football stadium'; 
  --4 syntax errors in Between statement misspelled and ambiguoous columns eventNO in Select statement
  SELECT DISTINCT eventrequest.eventno, dateheld, status, estcost
  FROM eventrequest, employee, eventplan
  WHERE estaudience BETWEEN 5000 AND 10000
  AND eventplan.empno = employee.empno 
  AND eventrequest.eventno = eventplan.eventno
  AND empname = 'Mary Manager';
 --5
    SELECT eventplan.planno, lineno, resname, numberfld, timestart, timeend
    FROM eventrequest, facility, eventplan, eventplanline, resourcetbl
    WHERE eventrequest.eventno = eventplan.eventno
    AND eventrequest.facno = facility.facno
    AND eventplanline.resno = resourcetbl.resno
    AND eventplan.planno = eventplanline.planno 
    AND estaudience = '10000'
    AND facname = 'Basketball arena' 
  
