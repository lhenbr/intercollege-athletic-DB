--1
SELECT CustNo, CustFirstName, CustLastName, CustBal FROM Customer;
--2
SELECT CustNo, CustFirstName, CustLastName, CustBal 
FROM Customer
WHERE CustState = 'CO';
--3
SELECT * FROM Product
WHERE ProdPrice > 50 
ORDER BY ProdMFg,ProdName;
--4
SELECT CustNo, CustFirstName, CustLastName,custcity, CustBal 
FROM Customer
WHERE (custcity = 'Denver' AND custbal > 150)
OR (custcity = 'Seattle' AND custbal > 300);
--5
SELECT OrdNo, ordDate,c.CustNo, CustFirstName, CustLastName 
FROM Customer c INNER JOIN ORDERTBL o ON c.CustNo = o.CustNo 
WHERE EXTRACT(MONTH FROM OrdDate) = '01'
AND EXTRACT(YEAR FROM OrdDate) = '2017'
AND OrdState = 'CO'; 
--6
SELECT CustCity, AVG(CustBal) AS AVGBalancePerCity FROM Customer
WHERE CustState = 'WA',
GROUP BY CustCity;
--7
SELECT CustCity, AVG(CustBal) AS AVGBalancePerCity, Count(*) AS Customers 
FROM Customer
WHERE CustState = 'WA'
GROUP BY CustCity
HAVING count(*) > 1;