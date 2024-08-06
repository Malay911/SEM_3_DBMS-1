--PART A
--1 Display the result of 5 multiply by 30.
SELECT 5*30 AS RESULT;
--2 Find out the absolute value of -25, 25, -50 and 50.
SELECT ABS(-25),ABS(25),ABS(-50),ABS(50);
--3 Find smallest integer value that is greater than or equal to 25.2, 25.7 and -25.2.
SELECT CEILING(25.2),CEILING(25.7),CEILING(-25.2);
--4 Find largest integer value that is smaller than or equal to 25.2, 25.7 and -25.2.
SELECT FLOOR(25.2),FLOOR(25.7),FLOOR(-25.2);
--5 Find out remainder of 5 divided 2 and 5 divided by 3
SELECT 5%2,5%3;
--6 Find out value of 3 raised to 2nd power and 4 raised 3rd power
SELECT POWER(3,2),POWER(4,3);
--7 Find out the square root of 25, 30 and 50
SELECT SQRT(25),SQRT(30),SQRT(50);
--8 Find out the square of 5, 15, and 25.
SELECT SQUARE(5),SQUARE(15),SQUARE(25);
--9 Find out the value of PI.
SELECT PI();
--10
SELECT ROUND(157.732,2),ROUND(157.732,0),ROUND(157.732,-2);
--11
SELECT EXP(2),EXP(3);
--12
SELECT LOG(10),LOG(2);
--13
SELECT LOG(5,10),LOG(100,10);
--14
SELECT SIN(3.1415),COS(3.1415),TAN(3.1415);
--15
SELECT SIGN(-25),SIGN(0),SIGN(25);
--16
SELECT RAND();

--PART B

CREATE TABLE EMP_MASTER(
EMPNO INT,
EMPNAME VARCHAR(25),
JOININGDATE DATE,
SALARY DECIMAL(8,2),
COMMISSION INT,
CITY VARCHAR(20),
DEPTCODE VARCHAR(10));

INSERT INTO EMP_MASTER VALUES(101,'KEYUR','2002-01-05',12000.00,4500,'RAJKOT','3@G');
INSERT INTO EMP_MASTER VALUES(102,'HARDIK','2004-02-15',14000.00,2500,'AHMEDBABAD','3@');
INSERT INTO EMP_MASTER VALUES(103,'KAJAL','2006-03-14',15000.00,3000,'BARODA','3-GD');
INSERT INTO EMP_MASTER VALUES(104,'BHOOMI','2005-06-23',12500.00,1000,'AHMEDBABAD','1A3D');
INSERT INTO EMP_MASTER VALUES(105,'HARMIT','2004-02-15',1400.00,2000,'RAJKOT','312A');

SELECT * FROM EMP_MASTER;

--1 Display the result of Salary plus Commission.
SELECT (SALARY+COMMISSION) AS 'RESULT' FROM EMP_MASTER;
--2 Find smallest integer value that is greater than or equal to 55.2, 35.7 and -55.2.
SELECT CEILING(55.2),CEILING(35.7),CEILING(-55.2);
--3 Find largest integer value that is smaller than or equal to 55.2, 35.7 and -55.2
SELECT FLOOR(55.2),FLOOR(35.7),FLOOR(-55.2);
--4 Find out remainder of 55 divided 2 and 55 divided by 3.
SELECT 55%2,55%3;
--5 Find out value of 23 raised to 2nd power and 14 raised 3rd power
SELECT POWER(23,2),POWER(14,3);

--PART C
--1 Find out the square root of 36, 49 and 81.
SELECT SQRT(36) AS SQRT,SQRT(49) AS SQRT,SQRT(81) AS SQRT;
--2 Find out the square of 3, 9, and 12.
SELECT SQUARE(3) AS SQUARE,SQUARE(9) AS SQUARE,SQUARE(12) AS SQUARE;
--3 Find out round value of 280.8952 for 2, 0 and -2 decimal points
SELECT ROUND(280.8952,2),ROUND(280.8952,0),ROUND(280.8952,-2);
--4 Find sine, cosine and tangent of 4.2014.
SELECT SIN(4.2014),COS(4.2014),TAN(4.2014);
--5 Find sign of -55, 0 and 95.
SELECT SIGN(-55),SIGN(0),SIGN(95);


--STRING FUNCTION
--PART-A
--1 Find the length of following. (I) NULL (II) ‘ hello ’ (III) Blank
SELECT LEN(NULL),LEN(' hello '),LEN('');
--2 Display your name in lower & upper case.
SELECT LOWER('Malay'),UPPER('Malay');
--3 Display first three characters of your name.
SELECT SUBSTRING('MALAY',1,3);
--4 Display 3rd to 10th character of your name.
SELECT SUBSTRING('MALAY PANARA',3,10);
--5 Write a query to convert ‘abc123efg’ to ‘abcXYZefg’ & ‘abcabcabc’ to ‘ab5ab5ab5’ using REPLACE.
SELECT REPLACE('abc123efg','123','XYZ'),REPLACE('abcabcabc','cabcabc','5ab5ab5');
--6 Write a query to display ASCII code for ‘a’,’A’,’z’,’Z’, 0, 9.
SELECT ASCII('a'),ASCII('A'),ASCII('z'),ASCII('Z'),ASCII(0),ASCII(9);
--7 Write a query to display character based on number 97, 65,122,90,48,57.
SELECT CHAR(97),CHAR(65),CHAR(122),CHAR(90),CHAR(48),CHAR(57);
--8 Write a query to remove spaces from left of a given string ‘hello world ‘
SELECT LTRIM('hello world     ');
--9 Write a query to remove spaces from right of a given string ‘ hello world ‘.
SELECT TRIM('    HELLO WORLD     ');
--10 Write a query to display first 4 & Last 5 characters of ‘SQL Server’
SELECT LEFT('SQL Server',4),RIGHT('SQL Server',5);
--11 Write a query to convert a string ‘1234.56’ to number (Use cast and convert function).
SELECT CAST('1234.56' AS DECIMAL);
--12 Write a query to convert a float 10.58 to integer (Use cast and convert function)
SELECT CAST(10.58 AS INT);
--13 Write a query to convert a float 10.58 to integer (Use cast and convert function)
SELECT SPACE(10)+'MALAY';
--14 Combine two strings using + sign as well as CONCAT ()
SELECT CONCAT('DARSHAN','UNIVERSITY');
SELECT 'DARSHAN'+'UNIVERSITY';
--15 Find reverse of “Darshan”
SELECT REVERSE('DARSHAN');
--16 Repeat your name 3 times.
SELECT REPLICATE('MALAY',3);


--Part – B: Perform following queries on Student table of practical no 5.
--1. Find the length of FirstName and LastName columns.
SELECT LEN(FIRSTNAME),LEN(LASTNAME) FROM STUDENT;
--2. Display FirstName and LastName columns in lower & upper case. 
SELECT UPPER(FIRSTNAME),LOWER(LASTNAME) FROM STUDENT;
--3. Display first three characters of FirstName column. 
SELECT LEFT(FIRSTNAME,3) FROM STUDENT;
--4. Display 3rd to 10th character of Website column. 
SELECT SUBSTRING(WEBSITE,3,10) FROM STUDENT;
--5. Write a query to display first 4 & Last 5 characters of Website column.
SELECT LEFT(WEBSITE,4),RIGHT(WEBSITE,5) FROM STUDENT;


--Part-C
--1. Put 10 space before FirstName using function. 
SELECT CONCAT('          ',FIRSTNAME) FROM STUDENT;
--2. Combine FirstName and LastName columns using + sign as well as CONCAT (). 
SELECT CONCAT(FIRSTNAME,LASTNAME), FIRSTNAME+' '+LASTNAME FROM STUDENT;
--3. Combine all columns using + sign as well as CONCAT (). 
SELECT STUID+' '+FIRSTNAME+' '+LASTNAME+' '+WEBSITE+' '+CITY+' '+ADDRESS FROM STUDENT;
--4. Find reverse of FirstName column.
SELECT REVERSE(FIRSTNAME) FROM STUDENT;
--5. Repeat FirstName column 3 times 
SELECT REPLICATE(FIRSTNAME,3) FROM STUDENT;
--6. Give the Names which contains 5 characters. 
SELECT FIRSTNAME FROM STUDENT WHERE FIRSTNAME LIKE '_';
--7. Combine the result as <FirstName> Lives in <City>.
SELECT FIRSTNAME+' '+CITY AS RESULT FROM STUDENT;
--8. Combine the result as Student_ID of < FirstName > is <StuID> .
SELECT CONCAT_WS(STUID,FIRSTNAME,' ') AS STUDENT_ID FROM STUDENT;



--Date Functions
--Part – A:
--1. Write a query to display the current date & time. Label the column Today_Date.
SELECT GETDATE() AS Today_Date;
--2. Write a query to find new date after 365 day with reference to today.
SELECT DATEADD(D,365,GETDATE());
--3. Display the current date in a format that appears as may 5 1994 12:00AM.
SELECT CONVERT(VARCHAR(20),GETDATE(),100);
--4. Display the current date in a format that appears as 03 Jan 1995.
SELECT CONVERT(VARCHAR(20),GETDATE(),106);
--5. Display the current date in a format that appears as Jan 04, 96.
SELECT CONVERT(VARCHAR(20),GETDATE(),107);
--6. Write a query to find out total number of months between 31-Dec-08 and 31-Mar-09.
SELECT DATEDIFF(MONTH,'2008-12-31','2009-03-31');
--7. Write a query to find out total number of years between 25-Jan-12 and 14-Sep-10.
SELECT DATEDIFF(YEAR,'2012-01-25','2010-09-14');
--8. Write a query to find out total number of hours between 25-Jan-12 7:00 and 26-Jan-12 10:30.
SELECT DATEDIFF(HOUR,'2012-01-25 7:00','2012-01-26 10:30');
--9. Write a query to extract Day, Month, Year from given date 12-May-16.
SELECT DATEPART(DAY,'2016-05-12'), DATEPART(MONTH,'2016-05-12'), DATEPART(YEAR,'2016-05-12');
--10. Write a query that adds 5 years to current date.
SELECT DATEADD(YEAR,5,GETDATE());
--11. Write a query to subtract 2 months from current date.
SELECT DATEADD(MONTH,-2,GETDATE());
--12. Extract month from current date using datename () and datepart () function.
SELECT DATENAME(MONTH,GETDATE()), DATEPART(MONTH,GETDATE());
--13. Write a query to find out last date of current month.
SELECT EOMONTH(GETDATE());
--14. Calculate your age in years and months.
SELECT DATEDIFF(YEAR,'2005-06-13','2024-08-06'), DATEDIFF(MONTH,'2005-09-26','2024-07-31');

--PART-B
--1
