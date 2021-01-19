	--1
	SELECT eventNo, dateheld, EventRequest.CustNo, custname, EventRequest.facNo, facName FROM Eventrequest, Customer, facility
	WHERE EventRequest.custNo = Customer.CustNO AND
	EventRequest.facNo = facility.facno AND
	EXTRACT (YEAR FROM DATEHELD) = 2018 AND
    city = 'Boulder';
	--2
   SELECT c.custno, CUSTNAME, eventNO, dateheld, e.facno, facname, (EstCost/EstAudience) AS estcostperperson
   FROM CUSTOMER c INNER JOIN EVENTREQUEST e 
   ON c.CUSTNO = e.CUSTNO 
   INNER JOIN FACILITY f
   ON e.facno = f.facno
   WHERE EXTRACT(YEAR FROM dateheld) = 2018 
   AND (EstCost/EstAudience) < 0.2;
   --3
  SELECT e.custno, CUSTNAME, SUM(EstCost) AS totalestcost 
   FROM EVENTREQUEST e INNER JOIN CUSTOMER c 
   ON e.CUSTNO = c.CUSTNO 
   WHERE status = 'Approved'
   GROUP BY e.custno, custname;
  --4
  INSERT INTO CUSTOMER VALUES('C106', 'Lucas', '63276 street','N', 'Ás Lucas', '321341', 'BeloH', 'MG','33201' );
 --5
 UPDATE RESOURCETBL 
 SET RATE = rate*1.1
 WHERE resname = 'nurse';
--7
DELETE FROM Customer 
WHERE custno = 'C106';
   