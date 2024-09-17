CREATE TABLE Stu_Detail (
    Rno INT,
    Name VARCHAR(50),
    City VARCHAR(50),
    DID INT,
);

INSERT INTO Stu_Detail (Rno, Name, City, DID) VALUES
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

--PART A
--1
SELECT * FROM Stu_Detail WHERE DID=(SELECT DID FROM Department WHERE DName='COMPUTER');

--2
SELECT NAME FROM Stu_Detail WHERE RNO IN(SELECT RNO FROM Academic WHERE SPI>8);

--3
SELECT * FROM Stu_Detail WHERE CITY='RAJKOT' AND DID=(SELECT DID FROM Department WHERE DName='COMPUTER');

--4
SELECT COUNT(RNO) AS  'students of electrical department' FROM Stu_Detail WHERE DID=(SELECT DID FROM Department WHERE DID=20);

--5
SELECT NAME FROM Stu_Detail WHERE RNO=(SELECT RNO FROM Academic WHERE SPI IN(SELECT MAX(SPI) FROM Academic));

--6
SELECT NAME FROM Stu_Detail WHERE RNO IN(SELECT RNO FROM Academic WHERE Bklog>1);


--SET OPERATOR
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

--1
SELECT NAME FROM Computer UNION SELECT NAME FROM Electrical;

--2
SELECT NAME FROM Computer UNION ALL SELECT NAME FROM Electrical;

--3
SELECT NAME FROM Computer INTERSECT SELECT Name FROM Electrical;

--4
SELECT * FROM Computer EXCEPT SELECT * FROM Electrical;

--5
SELECT * FROM Electrical EXCEPT SELECT * FROM Computer;

--6
SELECT * FROM Computer UNION SELECT * FROM Electrical;

--7
SELECT * FROM Computer INTERSECT SELECT * FROM Electrical;