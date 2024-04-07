create database aspire;
use aspire;

CREATE TABLE Programmer (
    name varchar(8) not null,
    dob date not null,
    doj date not null,
    sex varchar(1) not null,
    prof1 varchar(8),
    prof2 varchar(8),
    salary int(4) not null
);

CREATE TABLE Software (
	name varchar(8) not null,
    title varchar(20) not null,
    dev_in varchar(8) not null,
    scost float(8,2),
    dcost int(5),
    sold int(3)
);

CREATE TABLE Studies (
	name varchar(8) not null,
	splace varchar(9) not null,
	course varchar(5) not null,
	ccost varchar(5) not null
);
-- DROP TABLE Software;

INSERT INTO Programmer (name,dob,doj,sex,prof1,prof2,salary) VALUES ('sombutt' ,'1966-04-21','1992-04-21','m','pascal','basic',3200); 
INSERT INTO Programmer (name,dob,doj,sex,prof1,prof2,salary) VALUES ('Dinesh' ,'2003-04-27','2023-03-21','m','pascal','Java',3800); 
INSERT INTO Programmer (name,dob,doj,sex,prof1,prof2,salary) VALUES ('Arun' ,'1977-04-23','1999-01-31','m','pascal','C',3500); 
INSERT INTO Programmer (name,dob,doj,sex,prof1,prof2,salary) VALUES ('devdutt' ,'2000-09-02','2020-04-02','m','Java','C',3900); 
select*from Programmer;

INSERT INTO Software (name,title,dev_in,scost,dcost,sold) VALUES ('somdutt','parachutes','basic',399.95,6000,43);
INSERT INTO Software (name,title,dev_in,scost,dcost,sold) VALUES ('Dinesh','rocket','pascal',499.34,8000,47);
INSERT INTO Software (name,title,dev_in,scost,dcost,sold) VALUES ('Arun','parachutes','pascal',399.95,6500,50);
INSERT INTO Software (name,title,dev_in,scost,dcost,sold) VALUES ('devdutt','parachutes','Java',399.95,7500,53);
select*from Software;

INSERT INTO Studies(name,splace,course,ccost) VALUES ('sombutt','sabhari','pgdca',4500);
INSERT INTO Studies(name,splace,course,ccost) VALUES ('devdutt','bdps','dcs',5000);
INSERT INTO Studies(name,splace,course,ccost) VALUES ('Dinesh','sabhari','dcs',5500);
INSERT INTO Studies(name,splace,course,ccost) VALUES ('Arun','bdps','pgdca',6000);
select*from Studies;

-- 1 sales cost avg for prof1 in PASCAL
SELECT AVG(sold) FROM Software WHERE dev_in='Pascal';

-- 2 names and ages of all programmers
SELECT name,TIMESTAMPDIFF(YEAR, dob, CURDATE()) AS age FROM Programmer;

-- 3 names and ages of all the programmers who have undergone training in DCS course
SELECT p.name, TIMESTAMPDIFF(YEAR, p.dob, CURDATE()) AS age FROM Programmer p 
JOIN Studies s 
ON p.name = s.name 
WHERE s.course = 'DCS'; 

-- 4  highest numbers of copies sold by a package
SELECT MAX(sold) AS highest_sold FROM Software;

-- 5 Display the names and date of birth of all the programmer born in JANUARY
SELECT name, dob FROM Programmer WHERE MONTH(dob) = 1;

-- 6 Display lowest course fee
SELECT MIN(ccost) AS lowest_course_fee FROM Studies;

-- 7 programmer has done PGDCA course
SELECT COUNT(*) AS pgdca_count FROM Studies WHERE course = 'PGDCA';

-- 8 revenue has been earned through sales of packages in C
SELECT SUM(sold * scost) AS revenue_earned
FROM Software
WHERE title = 'C';

-- 9 details of software developed by Dinesh
SELECT * FROM Software WHERE name = 'Dinesh';

-- 10 programmers studied at SABHARI
SELECT COUNT(splace) AS sabhari_programmers_count FROM Studies WHERE splace = 'SABHARI';

-- 11  details of PACKAGES whose sales crossed the 20000 mark
SELECT * FROM Software WHERE sold > 20000;

-- 12 number of copies which should be sold in order to recover the development cost 
SELECT title, CEIL(dcost / scost) AS copies_to_recover_cost
FROM Software;	

-- 13  price of the costliest software developed in BASIC
SELECT MAX(scost) AS costliest_software_price
FROM Software
WHERE dev_in = 'basic';

-- 14 details of packages for which development cost has been recovered
SELECT name, title, dev_in, scost, dcost, sold
FROM Software
WHERE sold * scost >= dcost;

--  15 packages were developed in dbase
SELECT COUNT(title) AS dev_in_java FROM software
WHERE dev_in = 'dbase';

-- 16 programmers studies at paragathi 
INSERT INTO studies VALUES('Sam','paragathi' ,'dca' ,7500);
SELECT COUNT(*)
FROM Studies
WHERE splace = 'paragathi';

-- 17 programmers paid 5000 to 10000 for their course
SELECT COUNT(studies.ccost) AS count
FROM studies
WHERE ccost BETWEEN '5000' AND '10000';

-- 18  average course fee
SELECT AVG(ccost) AS average
FROM studies;

-- 19 Display the details of programmers knowing c
SELECT *
FROM Programmer
WHERE prof1 = 'c' OR prof2 = 'c';

-- 20  programmers know either Cobol or Pascal
SELECT COUNT(*)
FROM Programmer
WHERE prof1 IN ('cobol', 'pascal') OR prof2 IN ('cobol', 'pascal');

-- 21  programmers don't know Pascal & C
SELECT COUNT(*)
FROM Programmer
WHERE prof1 NOT IN ('pascal', 'c') AND prof2 NOT IN ('pascal', 'c');

-- 22 oldest male programmers
SELECT MAX(EXTRACT(YEAR FROM CURDATE()) - EXTRACT(YEAR FROM dob)) AS oldest_male_age
FROM Programmer
WHERE sex = 'm';

-- 23  average age of female programmers
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(dob)) AS average_female_age
FROM Programmer
WHERE sex = 'F';

-- 24 experience in years for each programmers and display along names in desc
SELECT name,TIMESTAMPDIFF(YEAR, doj, CURDATE()) AS experience_in_years
FROM Programmer
ORDER BY experience_in_years DESC;

-- 25 programmers who celebrate their birthday during the current month
SELECT name, dob
FROM Programmer
WHERE MONTH(dob) = MONTH(CURDATE());

-- 26 no of females
SELECT COUNT(*)
FROM Programmer
WHERE sex = 'F';

-- 27 languages known by the male programmers
SELECT DISTINCT prof1 AS language
FROM programmer
WHERE sex = 'm'
UNION
SELECT DISTINCT prof2
FROM programmer
WHERE sex = 'm';

-- 28 average salary
SELECT AVG(salary) AS average_salary
FROM programmer;

-- 29 salary between 2000 and 4000
SELECT COUNT(*) AS count
FROM programmer
WHERE salary BETWEEN 2000 AND 4000;

-- 30 details of those who don't know Clipper, Cobol or Pascal
SELECT * FROM Programmer
WHERE prof1 NOT IN ('clipper', 'cobol', 'pascal')
AND prof2 NOT IN ('clipper', 'cobol', 'pascal');

-- 31 Female programmers knowing C are above 24 years of age
SELECT COUNT(*) AS count
FROM Programmer
WHERE sex = 'female'
AND (prof1 = 'c' OR prof2 = 'c')
AND TIMESTAMPDIFF(YEAR, dob, CURDATE()) > 24;

-- 32 programmers who will be celebrating their Birthday within a week?
SELECT name, dob FROM programmer
WHERE DAYOFYEAR(DOB) BETWEEN DAYOFYEAR(CURDATE()) AND DAYOFYEAR(CURDATE() + INTERVAL 7 DAY);

-- 33 details of those with less than a year's experience
SELECT *
FROM Programmer
WHERE TIMESTAMPDIFF(YEAR, doj, CURDATE()) < 1;

-- 34 details of those who will be completing 2 years of service this year
SELECT *
FROM Programmer
WHERE TIMESTAMPDIFF(YEAR, doj, CURDATE())=2;

-- 35 amount to be recovered for packages whose development cost not recovered
SELECT name, (dcost - (scost * sold)) AS amount_to_be_recovered
FROM Software
WHERE dcost > (scost * sold);

-- 36  packages which have not been sold so far
SELECT *
FROM Software
WHERE sold = 0;

-- 37  cost of the software developed by Mary
SELECT scost
FROM Software
WHERE name = 'mary';

-- 38 institute’s names from the studies table without duplicate
SELECT DISTINCT splace FROM Studies;

-- 39 different courses are mentioned in the studies table
SELECT COUNT(DISTINCT course) AS number_of_courses FROM Studies;

-- 40 names of the programmers whose names contain 2 occurrences of the letter A
SELECT name
FROM Programmer
WHERE LENGTH(name) - LENGTH(REPLACE(name, 'a', '')) = 2;

--  41 names of programmers whose names contain unto 5 characters
SELECT name
FROM Programmer
WHERE LENGTH(name) <= 5;

-- 42 female programmers knowing COBOL have more than 2 years experience
SELECT COUNT(*)
FROM Programmer
WHERE sex = 'female'
AND (prof1 = 'cobol' OR prof2 = 'cobol')
AND TIMESTAMPDIFF(YEAR, doj, CURDATE()) > 2;

-- 43  length of the shortest name in the programmer table
SELECT MIN(LENGTH(name)) AS shortest_name_length
FROM Programmer;

-- 44 average development cost of a package developed in COBOL
SELECT AVG(dcost) AS average_development_cost
FROM Software
WHERE dev_in = 'cobol';

-- 46  programmers who were born on the last day of the month
SELECT name, sex, dob, doj
FROM Programmer
WHERE DAY(LAST_DAY(dob)) = DAY(dob);

-- 47 amount paid in salaries of the male programmers who do not know Cobol
SELECT SUM(salary) AS total_salary_paid
FROM Programmer
WHERE sex = 'male' AND (prof1 != 'cobol' AND prof2 != 'cobol');

-- 48 title, scost, dcost and difference between scost and dcost in descending order
SELECT title, scost, dcost, (scost - dcost) AS cost_difference
FROM Software
ORDER BY cost_difference DESC;

-- 49 name, dob, doj of those month of birth and month of joining are same
SELECT name, dob, doj
FROM Programmer
WHERE MONTH(dob) = MONTH(doj);

-- 50 names of the packages whose names contain more than 1 word
SELECT dev_in AS language, COUNT(dev_in) AS number_of_packages
FROM Software
GROUP BY dev_in;

-- queries 2
-- 1  NUMBER OF packages developed in EACH language
SELECT dev_in AS language, COUNT(dev_in) AS number_of_packages
FROM Software
GROUP BY dev_in;

-- 2 NUMBER OF packages developed by EACH person
SELECT name, COUNT(name) AS number_of_packages
FROM Software
GROUP BY name;

-- 3 NUMBER OF male and female programmer
SELECT sex,COUNT(*) AS total
FROM Programmer
GROUP BY sex;

-- 4 COSTLIEST packages and HIGEST selling developed in EACH language
SELECT dev_in, MAX(scost), MAX(dcost) 
FROM software GROUP BY dev_in;

-- 5 NUMBER OF people BORN in EACH YEAR
SELECT YEAR(dob),COUNT(*) 
FROM Programmer GROUP BY YEAR(dob);

-- 6 NUMBER OF people JOINED in EACH YEAR
SELECT YEAR(doj),COUNT(*) 
FROM Programmer GROUP BY YEAR(doj);

-- 7 NUMBER OF people BORN in EACH MONTH
SELECT MONTH(dob),COUNT(*) 
FROM Programmer GROUP BY MONTH(dob);

-- 8 NUMBER OF people JOINED in EACH MONTH
SELECT MONTH(doj),COUNT(*) 
FROM Programmer GROUP BY MONTH(doj);

-- 9 language wise COUNTS of prof1
SELECT prof1,COUNT(*) 
FROM Programmer GROUP BY prof1;

-- 10 language wise COUNTS of prof2
SELECT prof2,COUNT(*) 
FROM Programmer GROUP BY prof2;

-- 11 NUMBER OF people in EACH salary group
SELECT salary,COUNT(*) 
FROM Programmer GROUP BY salary 
ORDER BY salary;

-- 12  NUMBER OF people who studied in EACH institute
SELECT splace AS institute_name, COUNT(*) AS no_of_people 
FROM studies GROUP BY splace;

-- 13 NUMBER OF people who studied in EACH course
SELECT course, COUNT(*) AS count 
FROM studies GROUP BY course;

-- 14 TOTAL development COST of the packages developed in EACH language
SELECT dev_in AS LANGUAGE , SUM(dcost) AS TOTALCOST 
FROM SOFTWARE GROUP BY dev_in;

-- 15 selling cost of the package developed in EACH language
SELECT dev_in AS LANGUAGE , SUM(scost) AS SELLINGCOST 
FROM SOFTWARE GROUP BY dev_in;	

-- 16  cost of the package developed by EACH programmer
SELECT name , SUM(dcost) AS TOTALCOST 
FROM software GROUP BY name;

-- 17 sales values of the package developed inEACH programmer
SELECT name, SUM(scost*SOLD) AS SALES_COST 
FROM software GROUP BY name;

-- 18  NUMBER of packages developed by EACH programmer
SELECT name, COUNT(TITLE) AS NO_OF_PACKAGE 
FROM software GROUP BY name;

-- 19 sales COST of packages developed by EACH programmer language wise
SELECT dev_in, SUM(scost) 
FROM software GROUP BY dev_in;

-- 20 EACH programmers name, costliest package and cheapest packages developed
SELECT  name, MIN(dcost),MAX(dcost) 
FROM software GROUP BY name;

-- 21 language name with AVERAGE
SELECT dev_in, AVG(dcost) AS avg_dcost, AVG(scost) AS AVG_COST, AVG(scost) AS SELLING_COST 
FROM SOFTWARE 
GROUP BY dev_in;

-- 22 institute name with NUMBER of courses, AVERAGE cost per course
SELECT splace AS institute_name, COUNT(course) AS no_of_course, AVG(ccost) AS COST_PER_COURSE 
FROM studies GROUP BY splace;

-- 23 institute name with NUMBER of student
SELECT splace AS institute_name, COUNT(name) AS  no_of_students 
FROM studies GROUP BY splace;

-- 24  names of male and female programmers
SELECT  name , sex 
FROM programmer 
ORDER BY sex;

-- 25  programmer's name and their packages
SELECT name, title AS package 
FROM software 
ORDER BY name;

-- 26 NUMBER of packages in EACH language
SELECT dev_in,COUNT(title) 
FROM software 
GROUP BY dev_in;

-- 27 development cost is less than 1000
SELECT dev_in,COUNT(title) 
FROM software 
WHERE dcost<10000 
GROUP BY dcost ; 

-- 28 AVERAGE difference BETWEEN scost and dcost for EACH language
SELECT dev_in, AVG(dcost-scost) 
FROM software 
GROUP BY dev_in;

-- 29 TOTAL scost, dcsot and amount TOBE recovered
SELECT name,SUM(scost),SUM(dcost),SUM(dcost-(scost*sold)) 
FROM software GROUP BY NAME 
HAVING SUM(dcost)>SUM(scost*sold);

-- 30 highest, lowest and average salaries for THOSE earning MORE than 2000
SELECT MAX(salary),MIN(salary),AVG(salary) 
FROM programmer 
WHERE salary>2000;

-- queries 3	
-- 1 highest paid C programmer
SELECT name
FROM Programmer
WHERE prof1 = 'C'
ORDER BY salary DESC
LIMIT 1;

-- 2 highest paid female cobol programmer
SELECT name
FROM Programmer
WHERE sex = 'female' AND prof1 = 'cobol'
ORDER BY salary DESC
LIMIT 1;

-- 3  name of the HIGEST paid programmer for EACH language (prof1)
SELECT prof1 AS language, name
FROM Programmer
GROUP BY language
HAVING MAX(salary);

-- 4 LEAST experienced programmer
SELECT name
FROM Programmer
ORDER BY doj
LIMIT 1;

-- 5 MOST experienced programmer
SELECT name
FROM Programmer
ORDER BY doj DESC
LIMIT 1;

-- 6 language is known by ONLY ONE programmer
SELECT prof2 AS programmer_name FROM programmer 
GROUP BY prof1 
HAVING prof1 NOT IN (SELECT prof2 FROM programmer) AND COUNT(prof1)=1
UNION
SELECT prof2 FROM PROGRAMMER 
GROUP BY prof2 
HAVING prof2 NOT IN (SELECT prof1 FROM programmer) AND COUNT(prof2)=1;


-- 7 YONGEST programmer knowing DBASE
SELECT name
FROM Programmer
WHERE prof1 = 'dbase'
ORDER BY dob
LIMIT 1;

-- 8 MOST NUMBER of students
SELECT splace AS institute_name, COUNT(*) AS number_of_students
FROM Studies
GROUP BY institute_name
ORDER BY number_of_students DESC
LIMIT 1;

-- 10 female earns MORE than 3000/- but DOES NOT know C, C++, Oracle or Dbase
SELECT name
FROM Programmer
WHERE sex = 'female' AND salary > 3000
AND prof1 NOT IN ('C', 'C++', 'Oracle', 'Dbase')
AND prof2 NOT IN ('C', 'C++', 'Oracle', 'Dbase');

-- 11 costliest course
SELECT course,ccost
FROM studies
ORDER BY ccost desc
LIMIT 1;

-- 12 course done by most of students
SELECT count(course),course
FROM studies
GROUP BY course
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 13 institute and course Which has below AVERAGE course fee
SELECT splace,course
FROM studies
WHERE ccost < (
SELECT AVG(ccost)
FROM studies);

-- 14  institute conducts COSTLIEST course
SELECT course as costliest_course
FROM studies
ORDER BY ccost DESC
LIMIT 1;

-- 15 course has below AVERAGE number of students
SELECT course, COUNT(*) AS num_students
FROM studies
GROUP BY course
HAVING COUNT(*) < (
    SELECT AVG(num_students)
    FROM (
        SELECT course, COUNT(*) AS num_students
        FROM studies
        GROUP BY course
    ) AS course_counts
);

-- 16 institute conducts the above course
SELECT s.course, COUNT(*) AS num_students, s.splace AS institute
FROM studies s
GROUP BY s.course, s.splace
HAVING COUNT(*) < (
    SELECT AVG(num_students)
    FROM (
        SELECT course, COUNT(*) AS num_students
        FROM studies
        GROUP BY course
    ) AS course_counts
);

-- 17  course WHOSE fees are within 1000(+ or -) of the AVERAGE fee
SELECT course FROM studies 
WHERE ccost <= (SELECT AVG(ccost)+1000 FROM studies)
 AND 
ccost>=(SELECT AVG(ccost)-1000 FROM studies);

-- 18  package has the HIGEST development cost
SELECT title FROM software 
ORDER BY dcost DESC
LIMIT 1;

-- 19 package has the LOWEST selling cost
SELECT title FROM software 
ORDER BY scost 
LIMIT 1;

-- 20 who developed package sold the LEAST number of copies
SELECT name FROM software
ORDER BY sold
LIMIT 1;

-- 21 language was used to develop the package WHICH has the HIGEST sales amount
SELECT name,dev_in FROM software
ORDER BY (scost*sold) DESC
LIMIT 1;

-- 22 copies of the package that has the LEAST DIFFRENCE between development and
-- selling cost were sold
SELECT COUNT(*) AS least_diff FROM software 
WHERE (dcost-scost) =
(SELECT MIN(dcost-scost) FROM software);

-- 23 COSTLIEAST package developed in PASCAL
SELECT title FROM software
WHERE dcost=(SELECT MAX(dcost) FROM software) AND dev_in='pascal';

-- 24  used to develop the MOST NUMBER of package
SELECT dev_in FROM software
GROUP BY dev_in 
HAVING MAX(dev_in)=(SELECT MAX(dev_in) FROM software);

-- 25 developed the HIGEST NUMBER of package
SELECT s.name AS programmer_name, COUNT(*) AS num_packages_developed
FROM software s
GROUP BY s.name
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 26 author of the COSTLIEST package
SELECT s.name AS author_name
FROM software s
WHERE s.scost = (
    SELECT MAX(scost)
    FROM software
);

-- 27 sold LESS THAN the AVERAGE number of copies
SELECT title AS package_name
FROM software
WHERE sold < (
    SELECT AVG(sold) AS avg_sold
    FROM software
);

-- 28 female programmers earning MORE than the HIGEST paid male programmers
SELECT p.name, p.salary
FROM programmer p
WHERE p.sex = 'f'
AND p.salary > (
    SELECT MAX(p2.salary)
    FROM programmer p2
    WHERE p2.sex = 'm'
);

-- 29  prof1 by MOST of the programmers
SELECT prof1 AS programming_language, COUNT(*) AS num_programmers
FROM programmer
GROUP BY prof1
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 30 author MORE THAN double the development cost
SELECT s.name AS author_name
FROM software s
WHERE s.sold * s.scost > 2 * s.dcost;

-- 31 programmer names and CHEAPEST package developed by them
SELECT p.name,s.dev_in,MIN(s.sold) AS CHEAPEST_PACKAGE
FROM programmer p INNER JOIN software s ON p.name=s.name
GROUP BY p.name,s.dev_in;

-- 32 YOUNGEST male programmer born in 1965
SELECT name
FROM Programmer
WHERE sex = 'male' AND dob = (SELECT MIN(dob) FROM Programmer WHERE sex = 'male' AND YEAR(dob) = 1965);

-- 33 HIGEST selling and LOWEST selling package
SELECT name, MAX(dev_in) AS highest_selling_language, MIN(dev_in) AS lowest_selling_language
FROM Software
GROUP BY name;

-- 34  OLDEST female programmer WHO joined in 1992
SELECT name
FROM Programmer
WHERE sex = 'female' AND YEAR(doj) = 1992
ORDER BY dob ASC
LIMIT 1;

-- 35 MOST NUMBER of programmer born
SELECT YEAR(dob) AS birth_year
FROM Programmer
GROUP BY birth_year
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 36 month MOST NUMBRER of programmer join
SELECT MONTH(doj) AS join_month
FROM Programmer
GROUP BY join_month
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 37 language are MOST of the programmer's proficient
SELECT prof1 AS language
FROM Programmer
GROUP BY language
ORDER BY COUNT(*) DESC
LIMIT 1;

-- 38 male BELOW the AVERAGE salary of female programmers
SELECT name
FROM Programmer
WHERE sex = 'm'
AND salary < (SELECT AVG(salary) FROM Programmer WHERE sex = 'f');

-- queries 4
-- 1 details of THOSE WHO are drawing the same salary
SELECT *
FROM Programmer
WHERE salary IN (
    SELECT salary
    FROM Programmer
    GROUP BY salary
    HAVING COUNT(*) > 1
);

-- 2  details of software developed by male programmers earning MORE than 3000
SELECT *
FROM Software
WHERE name IN (
    SELECT name
    FROM Programmer
    WHERE sex = 'male' AND salary > 3000
);

-- 3 details of packages developed in PASCAL by female programmers
SELECT *
FROM Software
WHERE dev_in = 'PASCAL' AND name IN (
    SELECT name
    FROM Programmer
    WHERE sex = 'female'
);

-- 4 details of the programmer WHO joined BEFORE 1990
SELECT *
FROM Programmer
WHERE YEAR(doj) < 1990;

-- 5 details of software developed in C by female programmers of PRAGATHI
SELECT *
FROM Software
WHERE dev_in = 'C' AND name IN (
    SELECT name
    FROM Programmer
    WHERE sex = 'female' AND splace = 'PRAGATHI'
);

-- 6 NUMBER of packages NUMBER of copies sold and sales value
SELECT p.name AS programmer_name, s.splace AS institute, COUNT(*) AS number_of_packages, SUM(s.sold) AS total_copies_sold, SUM(s.sold * s.scost) AS total_sales_value
FROM Programmer p
JOIN Software s ON p.name = s.name
GROUP BY p.name, s.splace;

-- 7 details of software developed in DBASE by male programmer
SELECT *
FROM Software
WHERE dev_in = 'DBASE' AND name IN (
    SELECT name
    FROM Programmer
    WHERE sex = 'male' AND splace = (
        SELECT splace
        FROM Studies
        GROUP BY splace
        ORDER BY COUNT(*) DESC
        LIMIT 1
    )
);

-- 8  male programmers born BEFORE 1965 and female programmers born AFTER 1975
SELECT *
FROM Software
WHERE name IN (
    SELECT name
    FROM Programmer
    WHERE (sex = 'male' AND YEAR(dob) < 1965) OR (sex = 'female' AND YEAR(dob) > 1975)
);

-- 9  software that was developed in the language that is NOT theprogrammer’s first proficiency
SELECT *
FROM Software
WHERE dev_in NOT IN (
    SELECT prof1
    FROM Programmer
    UNION
    SELECT prof2
    FROM Programmer
);

-- 10 language which is NEITHER first NOR second proficiency of the programmer
SELECT *
FROM Software
WHERE dev_in NOT IN (
    SELECT prof1
    FROM Programmer
    UNION
    SELECT prof2
    FROM Programmer
);

-- 11 details of software developed by male students of SABHARI.
SELECT *
FROM Software
WHERE name IN (
    SELECT name
    FROM Programmer
    WHERE sex = 'male' AND splace = 'SABHARI'
);

-- 12 names of programmers WHO HAVE NOT developed any package
SELECT name
FROM Programmer
WHERE name NOT IN (
    SELECT DISTINCT name
    FROM Software
);

-- 13  total cost of the software developed by the programmers by APPLE
SELECT SUM(dcost) AS total_cost
FROM Software
WHERE name IN (
    SELECT name
    FROM Programmer
    WHERE splace = 'APPLE'
);

-- 14 programmers WHO JOINED in the same day
SELECT name
FROM Programmer
GROUP BY doj
HAVING COUNT(*) > 1;

-- 15 programmers WHO HAVE THE SAME PROF2
SELECT name
FROM Programmer
GROUP BY prof2
HAVING COUNT(*) > 1;

-- 16 total sales values of software, institutes-wise
SELECT splace AS institute, SUM(sold * scost) AS total_sales_value
FROM Software
GROUP BY institute;

-- 17 developed the COSTLIEST package study
SELECT splace AS institute
FROM Studies
WHERE name IN (
    SELECT name
    FROM Software
    ORDER BY scost DESC
    LIMIT 1
);

-- 18 listed in prof1 and prof2 HAS NOT BEEN used to develop any package
SELECT language
FROM (
    SELECT prof1 AS language FROM Programmer
    UNION
    SELECT prof2 FROM Programmer
) AS languages
WHERE language NOT IN (
    SELECT dev_in
    FROM Software
);

-- 19 HIGHEST selling package earn and WHAT course did he/she undergo
SELECT p.name AS programmer_name, p.salary, s.course
FROM Programmer p
JOIN Software s ON p.name = s.name
WHERE s.sold = (
    SELECT MAX(sold)
    FROM Software
);

-- 20 months will it take for each programmer to recover the cost
SELECT p.name AS programmer_name, s.ccost / p.salary AS months_to_recover_cost
FROM Programmer p
JOIN Studies s ON p.name = s.name;

-- 21 COSTLIEST package developed by a person with under 3 year’s expenences
SELECT *
FROM Software
WHERE name IN (
    SELECT name
    FROM Programmer
    WHERE YEAR(CURDATE()) - YEAR(doj) < 3
);

-- 22 AVERAGE salary for those WHOSE software's sales value is more than 50,000
SELECT AVG(p.salary) AS average_salary
FROM Programmer p
JOIN Software s ON p.name = s.name
GROUP BY p.name
HAVING SUM(s.sold * s.scost) > 50000;

-- 23 studied in the institute that Charge the LOWEST course fee
SELECT COUNT(*)
FROM Software
WHERE name IN (
    SELECT name
    FROM Studies
    WHERE ccost = (
        SELECT MIN(ccost)
        FROM Studies
    )
);

-- 24 packages developed the CHEAPEST package and splace
SELECT COUNT(*)
FROM Software
WHERE name = (
    SELECT name
    FROM Software
    ORDER BY scost ASC
    LIMIT 1
);

/* 25 packages were developed by female programmers earning MORE than the
HIGHEST paid male programmer */
SELECT COUNT(*) AS num_packages
FROM software s
JOIN (
    SELECT p.name
    FROM programmer p
    WHERE p.sex = 'f'
    AND p.salary > (
        SELECT MAX(p.salary)
        FROM programmer p
        WHERE p.sex = 'm'
    )
) AS female_programmers ON s.name = female_programmers.name;

-- 26 packages were developed by the MOST experienced programmers from BDPS
SELECT COUNT(*) AS num_packages
FROM software s
WHERE s.name = (
    SELECT p.name
    FROM programmer p
    WHERE p.name IN (
        SELECT s.name
        FROM studies s
        WHERE s.splace = 'bdps'
    )
    ORDER BY p.doj ASC
    LIMIT 1
);

-- 27 programmers and institutes they studied, including those WHO DIDN'T develop any package
SELECT p.name AS programmer_name, s.splace AS institute_studied_at
FROM programmer p
LEFT JOIN studies s ON p.name = s.name;

/* 28 profit with the number of programmers having that prof1 and the number of packages
developed in that prof1 */
SELECT prof1 AS proficiency, COUNT(*) AS number_of_programmers, (
    SELECT COUNT(*)
    FROM Software
    WHERE dev_in = prof1
) AS number_of_packages_developed
FROM Programmer
GROUP BY prof1;

-- 29 programmer names and number of packages EACH developed
SELECT name, COUNT(*) AS number_of_packages_developed
FROM Software
GROUP BY name;

-- 30 all the details of programmers who have done a course at S.S.I.L
SELECT p.*
FROM Programmer p
JOIN Studies s ON p.name = s.name
WHERE s.splace = 'S.S.I.L';