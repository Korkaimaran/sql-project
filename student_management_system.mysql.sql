create database student 
use student
create table student_details (student_id INT PRIMARY KEY,name VARCHAR(50),age INT,class VARCHAR(10),contact varchar(20));
insert into student_details (student_id,name, age, class, contact)
values (01,'Kumara','18','ECE','3467823901'),
(02,'Siva','20','CSE','5689120573'),
(03,'Ram','19','EEE','4590743517'),
(04,'Guru','24','MECH','9834675891'),
(05,'Velu','22','CIVIL','5689342109'),
(06,'Maran','25','ECE','9104576289'),
(07,'Surya','23','MECH','5643890134'),
(08,'Arun','18','EEE','4590136789'),
(09,'Hari','26','CSE','3490657145'),
(10,'Murugan','30','CIVIL','9045783250'),
(11,'Karthi','20','EEE','8932670124'),
(12,'Navin','21','ECE','2389450157'),
(13,'Prabha','17','CIVIL','4593091427'),
(14,'Diana','28','MECH','9012871590'),
(15,'Charlie','27','ECE','1864529072'),
(16,'Velu','22','CIVIL','5689342109');

create table Courses (course_id int primary key, course_name varchar(50), duration int, credits int)
insert into courses (course_id,course_name, duration, credits)
values (101,'Power BI',90,2),
(102,'SQL',90,4),
(103,'Autocad',90,6),
(104,'Revit',90,8),
(105,'Python',90,10),
(106,'C++',90,12),
(107,'C',90,4),
(108,'HTML',90,6),
(109,'ML',90,8),
(110,'AI',90,10);

create table Enrollments (enrollment_id INT PRIMARY KEY,student_id INT,course_id INT,enrollment_date DATE,status VARCHAR(20));
insert into Enrollments (enrollment_id,student_id,course_id,enrollment_date,status)
values (1,1,101,'2025-01-15','active'),
(2,2,102,'2025-02-01','active'),
(3,3,103,'2025-03-10','completed'),
(4,4,104,'2025-04-05','active'),
(5,5,105,'2025-05-20','completed'),
(6,6,106,'2025-06-08','completed'),
(7,7,107,'2025-06-12','active'),
(8,8,108,'2025-07-19','active'),
(9,9,109,'2025-08-20','completed'),
(10,10,110,'2025-09-21','active'),
(11,11,103,'2025-10-22','active'),
(12,12,104,'2025-11-10','completed'),
(13,13,108,'2025-11-12','active'),
(14,14,102,'2025-11-20','active'),
(15,15,101,'2025-11-26','completed'),
(16,5,108,'2025-11-20','completed');
create table Fees (fee_id int PRIMARY KEY,student_id int,amount_paid int,due_date Date);
insert into Fees (fee_id,student_id,amount_paid,due_date)
values (201,1,4000,'2025-02-01'),                  
(202,2,6000,'2025-03-10'),
(203,3,8000,'2025-04-05'),   
(204,4,10000,'2025-05-20'),
(205,5,12000,'2025-06-08'),
(206,6,14000,'2025-06-12'),
(207,7,16000,'2025-07-19'),
(208,8,18000,'2025-08-20'),
(209,9,20000,'2025-09-21'),
(210,10,22000,'2025-10-22'),
(211,11,23000,'2025-11-10'),
(212,12,24000,'2025-11-12'),
(213,13,25000,'2025-11-20'),
(214,14,26000,'2025-11-26'),
(215,15,30000,'2025-12-26'),
(216,5,18000,'2025-12-28');

create table Exams (exam_id INT PRIMARY KEY,course_id INT,exam_date DATE,total_marks INT);
insert into Exams(exam_id,course_id, exam_date, total_marks)
values (301,101,'2025-03-10',100),
(302,102,'2025-04-01',100),
(303,103,'2025-05-10',100),
(304,104,'2025-06-05',100),
(305,105,'2025-07-20',100),
(306,106,'2025-08-08',100),
(307,107,'2025-09-12',100),
(308,108,'2025-10-19',100),
(309,109,'2025-11-20',100),
(310,110,'2025-12-21',100);

Create table Results (result_id INT PRIMARY KEY,student_id INT,exam_id INT,marks_obtained INT,grade varchar(2));
insert into Results (result_id,student_id,exam_id,marks_obtained,grade)
values (401,1,301,92,'A1'),
(402,2,302,90,'A1'),
(403,3,303,84,'A2'),
(404,4,304,87,'A2'),
(405,5,305,98,'A1'),
(406,6,306,82,'A2'),
(407,7,307,70,'B1'),
(408,8,308,66,'B2'),
(409,9,309,75,'B1'),
(410,10,310,89,'A2'),
(411,11,303,63,'B2'),
(412,12,304,80,'A2'),
(413,13,308,60,'B2'),
(414,14,302,68,'B2'),
(415,15,301,61,'B2'),
(416,5,308,93,'A1');

create table  Attendance (attendance_id INT PRIMARY KEY,student_id INT,date DATE,status VARCHAR(20))
insert into Attendance (attendance_id,student_id,date,status)
values (501,1,'2025-01-01','present'),
(502,2,'2025-01-01','present'),
(503,3,'2025-01-01','present'),
(504,4,'2025-01-01','present'),
(505,5,'2025-01-01','present'),	
(506,6,'2025-01-01','present'),	
(507,7,'2025-01-01','present'),	
(508,8,'2025-01-01','absent'),	
(509,9,'2025-01-01','present'),	
(510,10,'2025-01-01','present'),	
(511,11,'2025-01-01','absent'),	
(512,12,'2025-01-01','present'),	
(513,13,'2025-01-01','absent'),	
(514,14,'2025-01-01','present'),
(515,15,'2025-01-01','present'),
(516,16,'2025-01-01','present');


--1.By using subquery
select student_id,marks_obtained from Results Where marks_obtained = (select max(marks_obtained) from Results);

--join
Select student_details.name AS student_name,  
       Courses.course_name,
       Enrollments.status,
       Enrollments.enrollment_date
FROM student_details 
join Enrollments  ON student_details.student_id = Enrollments.student_id
join Courses  ON Enrollments.course_id = Courses.course_id;

--view
select count (*) as enrolled_students
SELECT * FROM Enrollement where status = 'completed';
--To Call the view:
select * from  GetEnrollmentCount;

--STORED PROCEDURE: students with marks greater than 60
DELIMITER $$
CREATE PROCEDURE GetHighScoringStudents()
BEGIN
    SELECT * 
    FROM Results
    WHERE marks_obtained > 60;
END $$
DELIMITER ;
--To Call the Procedure:
CALL GetHighScoringStudents();








