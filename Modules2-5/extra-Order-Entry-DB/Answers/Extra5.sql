--1
SELECT OrdNO, OrdDate, c.CustNo, CustFirstName, CustLastName, e.empNo, empFirstName, empLastName 
FROM ORDERTBL o , CUSTOMER c,EMPLOYEE e 
WHERE c.CustNO = o.CUSTNO 
AND o.empNo = e.empNo
AND EXTRACT( YEAR FROM ORDDATE) = '2017'
AND EXTRACT( MONTH FROM ORDDATE) = '01'
AND CustState = 'CO';

--2
SELECT  c.CustNo, CustFirstName, CustLastName,o.OrdNO, OrdDate, e.EmpNO, EmpFirstName, EmpLastName,p.prodNo ,ProdName, (Qty * ProdPrice) AS Ordcost
FROM ORDERTBL o , CUSTOMER c, EMPLOYEE e , ORDLINE ol, PRODUCT p 
WHERE c.CustNO = o.CUSTNO
AND o.EMPNO = e.EMPNO 
AND ol.ORDNO = o.ORDNO
AND p.PRODNO = ol.PRODNO
AND ORDDATE = TO_DATE('23/01/2017')
AND (ol.Qty * ProdPrice) > 150;

--3
SELECT o.OrdNo, SUM(Qty * ProdPrice) AS totalAmountOrders
FROM ORDERTBL o INNER JOIN ORDLINE o2 ON o.ORDNO = o2.ORDNO 
INNER JOIN PRODUCT p ON o2.PRODNO = p.PRODNO 
WHERE ORDDATE = to_date('23-Jan-2017')
GROUP BY o.ORDNO ;
--4
SELECT o.ordNo,ordDate, c.custNo, custFirstName, custLastName, SUM(Qty * ProdPrice) AS totOrdAmt 
FROM ORDERTBL o ,ORDLINE o2 , PRODUCT p ,CUSTOMER c 
WHERE ORDDATE = '23-Jan-2017'
AND o.OrdNo = o2.OrdNo
AND o2.prodNo = p.prodNo
AND o.custNo = c.custNo
GROUP BY o.ordNo,ordDate, c.custNo, custFirstName, custLastName;
--5
INSERT INTO Customer VALUES('L0954327','Lucas','Braga', 'Livorno', 'Vespasiano', 'MG', '33201-092',200);
--6
INSERT INTO Employee VALUES('D9884325', 'Diego','Mass', '31)4433-1234', 'Dmass@bigco.com', NULL, 0.07);
--7
UPDATE PRODUCT 
SET prodprice = PRODPRICE * 1.1
WHERE  PRODNAME LIKE '%Ink Jet%';
--8
DELETE FROM Customer
  WHERE CustNo = 'L0954327';
 --9
 DELETE FROM Employee
  WHERE EmpNo = 'D9884325';
 