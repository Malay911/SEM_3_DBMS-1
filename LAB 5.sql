CREATE TABLE STUDENT(
STUID INT,
FIRSTNAME VARCHAR(25),
LASTNAME VARCHAR(25),
WEBSITE VARCHAR(50),
CITY VARCHAR(25),
ADDRESS VARCHAR(100));

INSERT INTO STUDENT VALUES(1011,'KEYUR','PATEL','techonthenet.com','RAJKOT','A-303,''VASANT KUNJ'',RAJKOT');
INSERT INTO STUDENT VALUES(1022,'HARDIK','SHAH','digminecraft.com','Ahmedabad','"RAM KRUPA",RAIYA ROAD');
INSERT INTO STUDENT VALUES(1033,'KAJAL','TRIVEDI','bigactivities.com','BARODA','RAJ BHAVAN PLOT,NEAR GARDEN');
INSERT INTO STUDENT VALUES(1044,'BHOOMI','GAJERA','checkyourmath.com','Ahmedabad','"JIG''S HOME",NAROL');
INSERT INTO STUDENT VALUES(1055,'HARMIT','MITEL','@me.darshan.com','RAJKOT','B-55,RAJ RESIDENCY');
INSERT INTO STUDENT VALUES(1066,'ASHOK','JANI',NULL,'BARODA','A-502,CLUB HOUSE BUILDING');

SELECT * FROM STUDENT;

--1 Display the name of students whose name starts with ‘k’.
SELECT FIRSTNAME FROM STUDENT WHERE FIRSTNAME LIKE 'K%';
--2 Display the name of students whose name consists of five characters.
SELECT FIRSTNAME FROM STUDENT WHERE FIRSTNAME LIKE '_____';
--3 Retrieve the first name & last name of students whose city name ends with a & contains six characters.
SELECT FIRSTNAME,LASTNAME FROM STUDENT WHERE CITY LIKE '_____A';
--4 Display all the students whose last name ends with ‘tel’.
SELECT * FROM STUDENT WHERE LASTNAME LIKE '%TEL';
--5 Display all the students whose first name starts with ‘ha’ & ends with‘t’.
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE 'HA%T';
--6 Display all the students whose first name starts with ‘k’ and third character is ‘y’.
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE 'K_Y%';
--7 Display the name of students having no website and name consists of five characters.
SELECT FIRSTNAME FROM STUDENT WHERE WEBSITE IS NULL AND FIRSTNAME LIKE '_____';
--8 Display all the students whose last name consist of ‘jer’.
SELECT * FROM STUDENT WHERE LASTNAME LIKE '%JER%';
--9 Display all the students whose city name starts with either ‘r’ or ‘b’.
SELECT * FROM STUDENT WHERE CITY LIKE 'R%' OR CITY LIKE 'B%';
--10 Display all the name students having websites.
SELECT * FROM STUDENT WHERE WEBSITE LIKE '%';
--11 Display all the students whose name starts from alphabet A to H.
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '[A-H]%';
--12 Display all the students whose name’s second character is vowel.
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '_[A,E,I,O,U]%';
--13 Display the name of students having no website and name consists of minimum five characters.
SELECT FIRSTNAME FROM STUDENT WHERE WEBSITE LIKE '%' AND FIRSTNAME LIKE '_____%';
--14 Display all the students whose last name starts with ‘Pat’.
SELECT * FROM STUDENT WHERE LASTNAME LIKE 'PAT%';
--15 Display all the students whose city name does not starts with ‘b’.
SELECT * FROM STUDENT WHERE CITY NOT LIKE 'B%';

--PART B
--1 Display all the students whose name starts from alphabet A or H.
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '[A,H]%';
--2 Display all the students whose name’s second character is vowel and of and start with H.
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE 'H[A,E,I,O,U]%';
--3 Display all the students whose last name does not ends with ‘a’.
SELECT * FROM STUDENT WHERE LASTNAME NOT LIKE '%A';
--4 Display all the students whose first name starts with consonant.
SELECT * FROM STUDENT WHERE FIRSTNAME NOT LIKE '[A,E,I,O,U]%';
--5 Display all the students whose website contains .net
SELECT * FROM STUDENT WHERE WEBSITE LIKE '%.NET%';


--PART C
--1 Display all the students whose address consist of -.
SELECT * FROM STUDENT WHERE ADDRESS LIKE '%-%';
--2 Display all the students whose address contains single quote or double quote.
SELECT * FROM STUDENT WHERE ADDRESS LIKE '%''%' OR ADDRESS LIKE '%"%';
--3 Display all the students whose website contains @.
SELECT * FROM STUDENT WHERE WEBSITE LIKE '%@%';
--4 Display all the names those are either four or five characters.
SELECT * FROM STUDENT WHERE FIRSTNAME LIKE '____' OR FIRSTNAME LIKE '_____';
