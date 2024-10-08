------------------------------------PART A----------------------------------------------------------
--1 Find all persons with their department name & code.
SELECT PERSON.PERSONNAME,DEPT.DEPARTMENTNAME,DEPT.DEPARTMENTCODE
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID;

--2 Find the person's name whose department is in C-Block.
SELECT PERSON.PERSONNAME,DEPT.DEPARTMENTNAME
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE DEPT.LOCATION='C-BLOCK';

--3 Retrieve person name, salary & department name who belongs to Jamnagar city.
SELECT PERSON.PERSONNAME,PERSON.SALARY,DEPT.DEPARTMENTNAME
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE CITY='JAMNAGAR';

--4 Retrieve person name, salary & department name who does not belong to Rajkot city.
SELECT PERSON.PERSONNAME,PERSON.SALARY,DEPT.DEPARTMENTNAME
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE PERSON.CITY<>'RAJKOT';

--5 Retrieve person’s name of the person who joined the Civil department after 1-Aug-2001.
SELECT PERSON.PERSONNAME,DEPT.DEPARTMENTNAME
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE DEPT.DEPARTMENTNAME='CIVIL' AND JOININGDATE>'01-08-2001';

--6 Find details of all persons who belong to the computer department.
SELECT PERSON.PERSONNAME,DEPT.DEPARTMENTNAME
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE DEPT.DEPARTMENTNAME='COMPUTER';

--7 Display all the person's name with the department whose joining date difference with the current date is 
--more than 365 days.
SELECT PERSON.PERSONNAME,DEPT.DEPARTMENTNAME
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE DATEDIFF(DAY,PERSON.JOININGDATE, GETDATE())>365;


--8 Find department wise person counts.
SELECT DEPT.DEPARTMENTNAME,COUNT(PERSON.PERSONNAME) AS TOTAL_NUMBER
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
GROUP BY DEPT.DEPARTMENTNAME;

--9 Give department wise maximum & minimum salary with department name.
SELECT DEPT.DEPARTMENTNAME,MIN(PERSON.SALARY) AS MIN_SALARY,MAX(PERSON.SALARY) AS MAX_SALARY
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
GROUP BY DEPT.DEPARTMENTNAME;

--10 Find city wise total, average, maximum and minimum salary.
SELECT PERSON.CITY,SUM(PERSON.SALARY) AS TOTAL_SALARY,MIN(PERSON.SALARY) AS MIN_SALARY,MAX(PERSON.SALARY) AS MAX_SALARY,AVG(PERSON.SALARY) AS AVG_SALARY
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
GROUP BY PERSON.CITY;

--11 Find the average salary of a person who belongs to Ahmedabad city.
SELECT DEPT.DEPARTMENTNAME,AVG(PERSON.SALARY) AS AVG_SALARY
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE PERSON.CITY='AHMEDABAD'
GROUP BY DEPT.DEPARTMENTNAME;

--12 Produce Output Like: <PersonName> lives in <City> and works in <DepartmentName> Department. (In single column)
SELECT PERSON.PERSONNAME + ' lives in ' + PERSON.CITY + ' and works in ' + DEPT.DEPARTMENTNAME + ' Department.' AS Description
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID;

-----------------------------------------PART B--------------------------------------------------------
--1 Produce Output Like: <PersonName> earns <Salary> from <DepartmentName> department monthly. (In single column)
SELECT PERSON.PERSONNAME + ' EARNS ' + CAST(PERSON.SALARY AS VARCHAR) + ' FROM ' + DEPT.DEPARTMENTNAME + ' DEPARTMENT MONTHLY.' AS Description
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID;

--2 Find city & department wise total, average & maximum salaries.
SELECT PERSON.CITY,DEPT.DEPARTMENTNAME,AVG(PERSON.SALARY) AS AVG_SALARY,SUM(PERSON.SALARY) AS SUM_SALARY,MAX(PERSON.SALARY) AS MAX_SALARY
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
GROUP BY CITY,DEPARTMENTNAME;

--3 Find all persons who do not belong to any department.
SELECT PERSONID,DEPARTMENTID
FROM PERSON
WHERE DEPARTMENTID IS NULL;

--4 Find all departments whose total salary is exceeding 100000.
SELECT DEPT.DEPARTMENTNAME,SUM(PERSON.SALARY)
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
GROUP BY DEPT.DEPARTMENTNAME
HAVING SUM(PERSON.SALARY)>100000;

-----------------------------------------PART C--------------------------------------------------------
--1 List all departments who have no person.
SELECT DEPT.DEPARTMENTNAME,COUNT(PERSON.PERSONID) AS COUNT_PERSON
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
GROUP BY DEPT.DEPARTMENTNAME
HAVING COUNT(PERSON.PERSONID) IS NULL;

--2 List out department names in which more than two persons are working.
SELECT DEPT.DEPARTMENTNAME,COUNT(PERSON.PERSONID) AS COUNT_PERSON
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
GROUP BY DEPT.DEPARTMENTNAME
HAVING COUNT(PERSON.PERSONID)>2;

--3 Give a 10% increment in the computer department employee’s salary. (Use Update)
UPDATE PERSON
SET PERSON.SALARY=SALARY+SALARY*0.1
FROM PERSON JOIN DEPT
ON PERSON.DEPARTMENTID=DEPT.DEPARTMENTID
WHERE DEPT.DEPARTMENTNAME='COMPUTER';

SELECT * FROM PERSON;
SELECT * FROM DEPT;
