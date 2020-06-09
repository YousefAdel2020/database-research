create database student_record_keeping;
use student_record_keeping;
create table departments
(    
	department_ID int PRIMARY KEY,
	department_Name varchar(8000) NOT NULL,
);
create table courses
(
	course_ID int PRIMARY KEY,
    course_Name varchar(8000) NOT NULL,
	department_ID int FOREIGN KEY REFERENCES departments(department_ID),
	
);
create table professeors
(
	prof_ID int PRIMARY KEY,
    prof_Name varchar(8000) NOT NULL,
	phone varchar(8000),
	prof_address varchar(8000),
	department_ID int FOREIGN KEY REFERENCES departments(department_ID),
	
);
create table studentinfo
(
	student_ID int PRIMARY KEY,
    first_Name varchar(8000) NOT NULL,
	second_Name varchar(8000) NOT NULL,
	phone varchar(8000),
	student_address varchar(8000),
	fees bigint,
	department_ID int FOREIGN KEY REFERENCES departments(department_ID),
);
create table markinfo
(
	mark_ID int PRIMARY KEY,
	course_ID int FOREIGN KEY REFERENCES courses (course_ID),
	student_ID int FOREIGN KEY REFERENCES studentinfo (student_ID),
	marks int,
);
create table rooms
(
room_ID int PRIMARY KEY,
room_name varchar(8000) not null,

);

create table lec_rooms
(
lec_room_ID int PRIMARY KEY,
room_ID int FOREIGN KEY REFERENCES rooms (room_ID),
course_ID int FOREIGN KEY REFERENCES courses (course_ID),
prof_ID int FOREIGN KEY REFERENCES professeors(prof_ID),
the_date date,
timefrom time,
timeto time,
);
ALTER TABLE courses
ADD student_ID int FOREIGN KEY REFERENCES studentinfo (student_ID);

--Insert statments

INSERT INTO departments
VALUES (1,'CS');

INSERT INTO departments
VALUES (2,'SE');

INSERT INTO departments
VALUES (3,'IT');

INSERT INTO departments
VALUES (4,'IS');



INSERT INTO rooms
VALUES (1,'4A');

INSERT INTO rooms
VALUES (2,'5A');

INSERT INTO rooms
VALUES (3,'2B');

INSERT INTO rooms
VALUES (4,'2C');

INSERT INTO studentinfo
VALUES (1,'Ahmed','Ali','01025484','15stbitash',1000,1);

INSERT INTO studentinfo
VALUES (2,'Mohamed','Ali','01225484548','17st.el bitash,Alexandria,Egypt',2500,3);

INSERT INTO studentinfo
VALUES (3,'Ahmed','Hassan','01525484548','18 st. el bitash,Alexandria,Egypt',1500,4);

INSERT INTO studentinfo
VALUES (4,'yousef','Adel','01125484548','20 st. el bitash,Alexandria,Egypt',3500,1);

INSERT INTO studentinfo
VALUES (5,'yousef','Mohamed','01025484548','21st.el bitash,Alexandria,Egypt',3000,2);

INSERT INTO courses(course_ID,course_Name,department_ID,student_ID)
VALUES (1,'physics',1,1);

INSERT INTO courses(course_ID,course_Name,department_ID,student_ID)
VALUES (2,'Electronics',3,2);

INSERT INTO courses(course_ID,course_Name,department_ID,student_ID)
VALUES (3,'English',4,3);

INSERT INTO courses(course_ID,course_Name,department_ID,student_ID)
VALUES (4,'Data science',4,4);

INSERT INTO professeors
VALUES (1,'Ahmed','0102594649','25st.el bitash,Alexandria,Egypt',1);

INSERT INTO professeors
VALUES (2,'Ali','0152594649','31st.el bitash,Alexandria,Egypt',2);

INSERT INTO professeors
VALUES (3,'yousef','0112594649','29st.el bitash,Alexandria,Egypt',3);

INSERT INTO professeors
VALUES (4,'Hamdy','0112694649','78st.el bitash,Alexandria,Egypt',4);

INSERT INTO markinfo
VALUES (1,1,1,85);

INSERT INTO markinfo
VALUES (2,2,2,89);

INSERT INTO markinfo
VALUES (3,3,3,90);

INSERT INTO lec_rooms
VALUES (1,1,1,1,'January 1,2020','1:00','3:00');

INSERT INTO lec_rooms
VALUES (2,2,2,2,'January 3,2020','2:00','4:00');

INSERT INTO lec_rooms
VALUES (3,3,3,3,'January 20,2020','1:00','3:00');

--update statment

UPDATE professeors
SET prof_Name = 'Mahmod' 
WHERE prof_ID=3;

UPDATE markinfo
SET marks = 96 
WHERE mark_ID=3;

UPDATE studentinfo
SET second_Name = 'Mahmod' 
WHERE student_ID=4;

UPDATE courses
SET course_Name = 'network' 
WHERE course_ID=3;

UPDATE rooms
SET room_name = '1B' 
WHERE room_ID=3;

--Delete statments

DELETE FROM studentinfo WHERE student_ID = 5;

DELETE FROM rooms WHERE room_name = '2C';

DELETE FROM courses WHERE course_ID=4;

DELETE FROM professeors WHERE prof_ID =4;

DELETE FROM studentinfo WHERE student_ID = 4;


--select using Group

SELECT COUNT(student_ID),department_ID
FROM studentinfo
GROUP BY department_ID;

SELECT COUNT(prof_ID),department_ID
FROM professeors
GROUP BY department_ID;

--select using sub-query

select first_Name from studentinfo where student_ID IN (select mark_ID from markinfo where marks>70);

select first_Name from studentinfo where student_ID IN (select mark_ID from markinfo where marks>50);

select first_Name from studentinfo where student_ID IN (select mark_ID from markinfo where marks<70);

/*select using different functions*/

--select using count

SELECT COUNT(department_Name)
FROM departments;

--select using AVG function

SELECT AVG(fees)
FROM studentinfo;;

--select using sum

SELECT SUM(fees)
FROM studentinfo;

--select using min

SELECT MIN(fees)
FROM studentinfo;

--select using max

SELECT MAX(fees)
FROM studentinfo;

--select using abs

SELECT Abs(fees)
from studentinfo;

--select using power

SELECT POWER (fees,3)
from studentinfo;

--select using square

SELECT SQUARE (fees)
from studentinfo;

--select the current date and time

SELECT CURRENT_TIMESTAMP;

--select using concatination

SELECT CONCAT(first_Name,second_Name)
from studentinfo;

--select using difference

SELECT DIFFERENCE(first_Name, second_Name)
from studentinfo;

--select using replace 

SELECT REPLACE(room_name,'B','A')
from rooms;

--select using length

SELECT LEN(course_Name)
from courses;

--select using UPPER

SELECT UPPER(department_Name)
from departments;

--select using lower

SELECT LOWER(room_name)
from rooms;

--select using cast

SELECT CAST(marks AS int)
from markinfo;

--select using convert

SELECT CONVERT(int,phone)
from professeors;

--select using ISNULL

SELECT ISNULL(NULL,prof_name)
from professeors;

--select using NULLIF

SELECT NULLIF(lec_room_ID, room_ID)
from lec_rooms;

--select using isnumeric

SELECT ISNUMERIC(marks)
from markinfo;

--inner join

SELECT professeors.prof_Name, studentinfo.first_Name
FROM professeors
INNER JOIN studentinfo ON professeors.department_ID = studentinfo.department_ID;

--left join

SELECT professeors.prof_Name, studentinfo.first_Name
FROM professeors
LEFT JOIN studentinfo ON professeors.department_ID = studentinfo.department_ID;

--right join

SELECT professeors.prof_Name, studentinfo.first_Name
FROM professeors
RIGHT JOIN studentinfo ON professeors.department_ID = studentinfo.department_ID;

--full join

SELECT professeors.prof_Name, studentinfo.first_Name
FROM professeors
FULL JOIN studentinfo ON professeors.department_ID = studentinfo.department_ID;

--self join

SELECT A.first_Name AS studentname1, B.second_Name AS studentName2, A.fees
FROM studentinfo A, studentinfo B;