--PART A
--1
SELECT CITY.NAME,VILLAGE.NAME
FROM CITY JOIN VILLAGE
ON CITY.CITYID=VILLAGE.CITYID
WHERE CITY.NAME='RAJKOT';

--2
SELECT CITY.NAME,VILLAGE.NAME,CITY.PINCODE
FROM CITY JOIN VILLAGE
ON CITY.CITYID=VILLAGE.CITYID;

--3
SELECT CITY.NAME,COUNT(VILLAGE.NAME)
FROM CITY JOIN VILLAGE
ON CITY.CITYID=VILLAGE.CITYID
GROUP BY CITY.NAME
HAVING COUNT(VILLAGE.NAME)>1;

--4
