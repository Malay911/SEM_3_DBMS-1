----------------------------------------------Subqueries-------------------------------------------------------------

CREATE TABLE Stu_Data (
    Rno INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT,
);

INSERT INTO Stu_Data (Rno, Name, City, DID) VALUES
(101, 'Raju', 'Rajkot', 10),
(102, 'Amit', 'Ahmedabad', 20),
(103, 'Sanjay', 'Baroda', 40),
(104, 'Neha', 'Rajkot', 20),
(105, 'Meera', 'Ahmedabad', 30),
(106, 'Mahesh', 'Baroda', 10);

CREATE TABLE Academic (
    Rno INT,
    SPI DECIMAL(3, 1),
    Bklog INT
);

INSERT INTO Academic (Rno, SPI, Bklog) VALUES
(101, 8.8, 0),
(102, 9.2, 2),
(103, 7.6, 1),
(104, 8.2, 4),
(105, 7.0, 2),
(106, 8.9, 3);

CREATE TABLE Department (
    DID INT,
    DName VARCHAR(50)
);

INSERT INTO Department (DID, DName) VALUES
(10, 'Computer'),
(20, 'Electrical'),
(30, 'Mechanical'),
(40, 'Civil');


---------------------------------------------- Part A ---------------------------------------------------------------

--1. Display details of students who are from computer department.
	
	select * from Stu_Data
	where did in (select did from Department where dname ='computer');

--2. Displays name of students whose SPI is more than 8.

	select name from  Stu_Data 
	where rno in (select rno from Academic where spi > 8);

--3. Display details of students of computer department who belongs to Rajkot city.

	select * from Stu_Data
	where did in(select did from Department where dname ='computer') and city='Rajkot';

--4. Find total number of students of electrical department.

	select count(did) as total_ec from Stu_Data
	where did in(select did from Department where dname='electrical');

--5. Display name of student who is having maximum SPI.

	select name as maxspi_stu from Stu_Data 
	where rno in (select rno from Academic where spi = (select max(spi) from Academic));

--6. Display details of students having more than 1 backlog.
	
	select * from Stu_Data
	where rno in ( select rno from Academic where Bklog>1);


---------------------------------------------- Part B ---------------------------------------------------------------

--1. Display name of students who are either from computer department or from mechanical department.

	select * from Stu_Data
	where did in (select did from Department where dname ='computer' or dname ='mechanical' );	

--2. Display name of students who are in same department as 102 studying in.
	
	select name from Stu_Data
	where did in ( select did from Department where did in(select did from Stu_Data where rno = 102));

---------------------------------------------- Part C ---------------------------------------------------------------

--1. Display name of students whose SPI is more than 9 and who is from electrical department.

	SELECT name 
	FROM Stu_Data 
	WHERE did in (SELECT did FROM Department WHERE dname = 'electrical')
	AND rno in (SELECT rno FROM Academic WHERE spi > 9);

	
--2. Display name of student who is having second highest SPI.
	
	SELECT name FROM Stu_Data 
	WHERE rno = (
    SELECT rno 
    FROM Academic 
    WHERE spi = (
        SELECT MAX(spi) 
        FROM Academic 
        WHERE spi < (SELECT MAX(spi) FROM Academic)
    ));
	
--3. Display city names whose students branch wise SPI is 9.2

SELECT DISTINCT city 
FROM Stu_Data 
WHERE rno IN (
    SELECT rno 
    FROM Academic 
    WHERE spi = 9.2
) 
AND did IN (
    SELECT did 
    FROM Department
);


----------------------------------------------- SET OPERATORS ------------------------------------------------------

CREATE TABLE Computer (
    RollNo INT,
    Name VARCHAR(50)
);


INSERT INTO Computer (RollNo, Name) VALUES
(101, 'Ajay'),
(109, 'Haresh'),
(115, 'Manish');

CREATE TABLE Electrical (
    RollNo INT PRIMARY KEY,
    Name VARCHAR(50)
);

INSERT INTO Electrical (RollNo, Name) VALUES
(105, 'Ajay'),
(107, 'Mahesh'),
(115, 'Manish');


------------------------------------------------- PART A ------------------------------------------------------------

--1. Display name of students who is either in Computer or in Electrical.

	SELECT name FROM computer
	UNION
	SELECT name FROM electrical;

--2. Display name of students who is either in Computer or in Electrical including duplicate data.

	SELECT name FROM computer
	UNION ALL
	SELECT name FROM electrical;

--3. Display name of students who is in both Computer and Electrical.

	SELECT name FROM computer
	INTERSECT
	SELECT name FROM electrical;

--4. Display name of students who are in Computer but not in Electrical.

	SELECT name FROM computer
	EXCEPT
	SELECT name FROM electrical;

--5. Display name of students who are in Electrical but not in Computer.

	SELECT name FROM electrical
	EXCEPT
	SELECT name FROM computer;

--6. Display all the details of students who are either in Computer or in Electrical.

	SELECT rollno, name FROM computer
	UNION
	SELECT rollno, name FROM electrical;


--7. Display all the details of students who are in both Computer and Electrical.

	SELECT rollno, name FROM computer
    WHERE rollno IN (SELECT rollno FROM electrical);

------------------------------------------------ PART B ------------------------------------------------------------

CREATE TABLE Emp_DATA (
    EID INT,
    Name VARCHAR(50)
);

INSERT INTO Emp_DATA (EID, Name) VALUES
(1, 'Ajay'),
(9, 'Haresh'),
(5, 'Manish');

CREATE TABLE Customer (
    CID INT,
    Name VARCHAR(50)
);

INSERT INTO Customer (CID, Name) VALUES
(5, 'Ajay'),
(7, 'Mahesh'),
(5, 'Manish');

--1. Display name of persons who is either Employee or Customer.

	SELECT Name FROM EMP_DATA
	UNION
	SELECT Name FROM CUSTOMER;

--2. Display name of persons who is either Employee or Customer including duplicate data.

	SELECT Name FROM EMP_DATA
	UNION ALL
	SELECT Name FROM CUSTOMER;

--3. Display name of persons who is both Employee as well as Customer.

	SELECT Name FROM EMP_DATA
	INTERSECT
	SELECT Name FROM CUSTOMER;

--4. Display name of persons who are Employee but not Customer.

	SELECT Name FROM EMP_DATA
	EXCEPT
	SELECT Name FROM CUSTOMER;

--5. Display name of persons who are Customer but not Employee.

	SELECT Name FROM CUSTOMER
	EXCEPT
	SELECT Name FROM EMP_DATA;

---------------------------------------------- PART C --------------------------------------------------------------

--Perform all the queries of Part-B but display ID and Name columns instead of Name only.

--1.
	SELECT EID AS ID, Name
	FROM EMP_DATA
	UNION
	SELECT CID AS ID, Name
	FROM CUSTOMER;

--2.
	SELECT EID AS ID, Name
	FROM EMP_DATA
	UNION ALL
	SELECT CID AS ID, Name
	FROM CUSTOMER;

--3.
	SELECT EID AS ID, Name
	FROM EMP_DATA
	INTERSECT
	SELECT CID AS ID, Name
	FROM CUSTOMER;

--4.
	SELECT EID AS ID, Name
	FROM EMP_DATA
	EXCEPT
	SELECT CID AS ID, Name
	FROM CUSTOMER;

--5.
	SELECT CID AS ID, Name
	FROM CUSTOMER
	EXCEPT
	SELECT EID AS ID, Name
	FROM EMP_DATA;
