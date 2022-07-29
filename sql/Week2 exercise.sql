-- use unidatabase

use uni;

-- Task 1: Creating Calculations

-- check out the student table

SELECT 
    *
FROM
    student;

-- count how many students enrolled overall
SELECT 
    COUNT(studentID)
FROM
    student;


-- calculate the sum of full time fees for every full-time course

SELECT 
    SUM(FullTimeFee)
FROM
    fees;


-- cost of the least and most expensive course

-- least expensive cost
SELECT 
    MIN(FullTimeFee)
FROM
    fees;

-- most expensive cost
SELECT 
    MAX(FullTimeFee)
FROM
    fees;



-- average cost of all part time courses

SELECT 
    AVG(PartTimeFee)
FROM
    fees;


-- fee of each full time course after applying scholarship discount

SELECT 
    FeeID,
    CourseID,
    FullTimeFee,
    ScholarshipDiscount,
    FullTimeFee - ScholarshipDiscount AS 'Updated Fees'
FROM
    fees;

-- select only the course number of the cheapest fulltime course

SELECT 
    CourseID
FROM
    fees
WHERE
    FullTimeFee <= 4000;

-- find cost of the most expensive course after applying scholarship discount


SELECT 
    MAX(FullTimeFee - ScholarshipDiscount) AS 'Most Expensive Course'
FROM
    fees;

-- count the number of applications for history courses made between 01/03/2020 and 30/08/2020

SELECT 
    COUNT(*)
FROM
    application
WHERE
    CourseAppliedFor = 'History'
        AND DateOfApplication BETWEEN '01/03/2020' AND '30/08/2020';
 
 
 
 -- Task 2: Database functions
 
 -- Write a select statement to obtain all of the student information for successful
-- applications made for Course 11 which do not relate to current students
 
 -- obtain all students info
 
 SELECT 
    *
FROM
    student
WHERE
    CourseID = 11;
 
 
 -- Modify the select statement from the previous example into an insert statement and
-- insert the data into the student table

insert into student (CourseID, Forenames, Surname, Email)
select CourseID, Forenames, Surname, Email
from application
where CourseAppliedFor = 11 and StudentID = 0 and accepted = 1;

SELECT 
    *
FROM
    student;

-- Write a select statement to obtain all the information for the unsuccessful applications
-- made for Course 11

SELECT 
    *
FROM
    application
WHERE
   NOT accepted;

-- Modify the select statement from the previous example into a delete statement and
-- delete the unsuccessful Course 11

DELETE FROM application 
WHERE
    CourseAppliedFor = 11 AND accepted = 0;

-- Write a select statement to identify the unsuccessful applications for course 1 made after
-- 01/08/2020

SELECT 
    *
FROM
    application
WHERE
    CourseAppliedFor = 1 AND accepted = 0
        AND DateOfApplication > '01/03/2020';

-- Using the select statement from the previous example, modify it into an update
-- statement and update the applications to successful
UPDATE application 
SET 
    accepted = 1
WHERE
    CourseAppliedFor = 1 AND accepted = 0
        AND DateOfApplication > '2020-03-01';

SELECT 
    *
FROM
    application
WHERE
    CourseAppliedFor = 1 AND accepted = 0
        AND DateOfApplication > '2020-03-01';

-- Roll back the previous update

-- Modify the previous update to include applications for economics courses made after 01/09/2020


-- Task 3: Strech and challenge - inner joins

-- Obtain a list of Students and the name of the Courses they are studying

SELECT 
    StudentID, Forenames, Surname, CourseName, student.CourseID
FROM
    student
        INNER JOIN
    course ON student.CourseID = course.CourseID;

-- Obtain a list of course names, full time fees and part time fees for each course

SELECT 
    CourseName, fees.CourseID, FullTimeFee, PartTimeFee
FROM
    course
        INNER JOIN
    fees ON course.CourseID = fees.CourseID;


-- Obtain a list of classIDs for the Economics Course and the modules they relate to

SELECT 
    ClassID, class.moduleID, ModuleName
FROM
    class
        INNER JOIN
    module ON class.moduleID = module.moduleID;