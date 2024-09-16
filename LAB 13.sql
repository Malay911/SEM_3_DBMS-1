----------------------------------------------PART A--------------------------------------------------------

--1 Display all the villages of Rajkot city.
SELECT CITY.NAME,VILLAGE.NAME
FROM CITY JOIN VILLAGE
ON CITY.CITYID=VILLAGE.CITYID
WHERE CITY.NAME='RAJKOT';

--2 Display city along with their villages & pin code.
SELECT CITY.NAME,VILLAGE.NAME,CITY.PINCODE
FROM CITY JOIN VILLAGE
ON CITY.CITYID=VILLAGE.CITYID;

--3 Display the city having more than one village.
SELECT CITY.NAME,COUNT(VILLAGE.NAME)
FROM CITY JOIN VILLAGE
ON CITY.CITYID=VILLAGE.CITYID
GROUP BY CITY.NAME
HAVING COUNT(VILLAGE.NAME)>1;

--4 Display the city having no village.
SELECT CITY.NAME
FROM CITY LEFT JOIN VILLAGE 
ON CITY.CITYID=VILLAGE.CITYID
WHERE VILLAGE.CITYID IS NULL;

--5 Count the total number of villages in each city.
SELECT CITY.NAME,COUNT(VILLAGE.NAME) AS TOTAL_VILLAGES
FROM CITY JOIN VILLAGE
ON CITY.CITYID=VILLAGE.CITYID
GROUP BY CITY.NAME;

--6 Count the total number of villages in each city.
SELECT COUNT(CITY.CITYID) AS CITY_COUNT
FROM CITY JOIN VILLAGE
ON CITY.CITYID=VILLAGE.CITYID
GROUP BY CITY.NAME
HAVING COUNT(VILLAGE.NAME)>1;



--1 Count the total number of villages in each city.
--DONE USING DESIGN VIEW

--2 Do not allow Bklog less than 0.
--DONE USING DESIGN VIEW

--3 Do not allow Bklog less than 0.
--DONE USING DESIGN VIEW

--4 Try to update SPI of Raju from 8.80 to 12.
UPDATE STU_MASTER 
SET SPI=12 
WHERE NAME='RAJU';
--SHOWS ERROR

--5 Try to update Bklog of Neha from 0 to -1.
UPDATE STU_MASTER 
SET BKLOG=-1 
WHERE NAME='NEHA';
--SHOWS ERROR

----------------------------------------------PART B--------------------------------------------------------

CREATE TABLE Emp_details (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(50) NOT NULL,
    Did INT NOT NULL,
    Cid INT NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL CHECK (Salary >= 0),
    Experience INT NOT NULL CHECK (Experience >= 0)
);

CREATE TABLE Dept_details (
    Did INT PRIMARY KEY,
    Dname VARCHAR(50) NOT NULL
);

CREATE TABLE City_details (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(50) NOT NULL
);

--VALID DATA
INSERT INTO Dept_details (Did, Dname) VALUES (1, 'Sales');
INSERT INTO City_details (Cid, Cname) VALUES (1, 'Ahmedabad');
INSERT INTO Emp_details (Eid, Ename, Did, Cid, Salary, Experience) VALUES (1, 'John Doe', 1, 1, 50000.00, 5);

--INVALID DATA
-- Violates Salary constraint
INSERT INTO Emp_details (Eid, Ename, Did, Cid, Salary, Experience) VALUES (2, 'Jane Smith', 1, 1, -1000.00, 3);

-- Violates Experience constraint
INSERT INTO Emp_details (Eid, Ename, Did, Cid, Salary, Experience) VALUES (3, 'Michael Johnson', 1, 1, 40000.00, -2);

-- Violates foreign key constraint (invalid department ID)
INSERT INTO Emp_details (Eid, Ename, Did, Cid, Salary, Experience) VALUES (4, 'Emily Davis', 2, 1, 35000.00, 4);

SELECT * FROM EMP_DETAILS;
SELECT * FROM DEPT_DETAILS;
SELECT * FROM CITY_DETAILS;

----------------------------------------------PART C--------------------------------------------------------
