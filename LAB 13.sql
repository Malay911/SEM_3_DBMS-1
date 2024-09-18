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

INSERT INTO Dept_details (Did, Dname) VALUES (1, 'Sales');
INSERT INTO City_details (Cid, Cname) VALUES (1, 'Ahmedabad');
INSERT INTO Emp_details (Eid, Ename, Did, Cid, Salary, Experience) VALUES (1, 'John Doe', 1, 1, 50000.00, 5);

--Invalid Data
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
--Create table as per following schema with proper validation and try to insert data which violate your validation.
--1. Emp_info(Eid, Ename, Did, Cid, Salary, Experience)
--Dept_info(Did, Dname)
--City_info(Cid, Cname, Did))
--District(Did, Dname, Sid)
--State(Sid, Sname, Cid)
--Country(Cid, Cname)
--2. Insert 5 records in each table.
--3. Display employeename, departmentname, Salary, Experience, City, District, State and country of all employees.

CREATE TABLE Country_INFO (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL
);

CREATE TABLE State_INFO (
    Sid INT PRIMARY KEY,
    Sname VARCHAR(100) NOT NULL,
    Cid INT,
    FOREIGN KEY (Cid) REFERENCES Country_INFO(Cid)
);

CREATE TABLE District_INFO (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL,
    Sid INT,
    FOREIGN KEY (Sid) REFERENCES State_INFO(Sid)
);

CREATE TABLE Dept_INFO (
    Did INT PRIMARY KEY,
    Dname VARCHAR(100) NOT NULL
);

CREATE TABLE City_INFO (
    Cid INT PRIMARY KEY,
    Cname VARCHAR(100) NOT NULL,
    Did INT,
    FOREIGN KEY (Did) REFERENCES District_INFO(Did)
);

CREATE TABLE Emp_INFO (
    Eid INT PRIMARY KEY,
    Ename VARCHAR(100) NOT NULL,
    Did INT,
    Cid INT,
    Salary DECIMAL(10, 2) CHECK (Salary > 0), -- Salary must be positive
    Experience INT CHECK (Experience >= 0),  -- Experience cannot be negative
    FOREIGN KEY (Did) REFERENCES Dept_INFO(Did),
    FOREIGN KEY (Cid) REFERENCES City_INFO(Cid)
);

INSERT INTO Country_INFO (Cid, Cname) VALUES
(1, 'USA'),
(2, 'Canada'),
(3, 'UK'),
(4, 'Australia'),
(5, 'India');

INSERT INTO State_INFO (Sid, Sname, Cid) VALUES
(1, 'California', 1),
(2, 'Ontario', 2),
(3, 'London', 3),
(4, 'New South Wales', 4),
(5, 'Gujarat', 5);

INSERT INTO District_INFO (Did, Dname, Sid) VALUES
(1, 'Los Angeles', 1),
(2, 'Toronto', 2),
(3, 'Westminster', 3),
(4, 'Sydney', 4),
(5, 'Ahmedabad', 5);

INSERT INTO Dept_INFO (Did, Dname) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing'),
(4, 'Sales'),
(5, 'Finance');

INSERT INTO City_INFO (Cid, Cname, Did) VALUES
(1, 'Los Angeles City', 1),
(2, 'Toronto City', 2),
(3, 'London City', 3),
(4, 'Sydney City', 4),
(5, 'Ahmedabad City', 5);

INSERT INTO Emp_INFO (Eid, Ename, Did, Cid, Salary, Experience) VALUES
(1, 'John Doe', 1, 1, 50000.00, 5),
(2, 'Jane Smith', 2, 2, 75000.00, 8),
(3, 'Mike Johnson', 3, 3, 60000.00, 3),
(4, 'Alice Brown', 4, 4, 45000.00, 2),
(5, 'Bob Green', 5, 5, 40000.00, 4);

--3 Display employeename, departmentname, Salary, Experience, City, District, State and country of all employees.
SELECT EMP_INFO.ENAME,Dept_INFO.DNAME,EMP_INFO.SALARY,EMP_INFO.EXPERIENCE,City_INFO.CNAME,District_INFO.DNAME,State_INFO.SNAME,Country_INFO.CNAME 
FROM Emp_INFO JOIN Dept_INFO ON Emp_INFO.Did=Dept_INFO.Did
JOIN City_INFO ON Emp_INFO.Did=City_INFO.Did
JOIN District_INFO ON Emp_INFO.Did=District_INFO.Did
JOIN State_INFO ON Emp_INFO.Cid=State_INFO.Cid
JOIN Country_INFO ON Emp_INFO.Cid=Country_INFO.Cid;
