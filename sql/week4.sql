use uni;

-- 1 Obtain a list of applications where the CourseID is unknown

SELECT 
    applicationid, courseappliedfor AS CourseID
FROM
    application
WHERE
    CourseAppliedFor IS NULL;


-- 2 Obtain a list of students where their CourseID is not unknown

SELECT 
    *
FROM
    application
WHERE
    courseappliedfor IS NULL;


-- 3 Obtain a list of students whom were born in the month of June 2002

SELECT 
    *
FROM
    student
WHERE
    DateOfBirth between  '2002-06-01' and '2002-06-30';
    
    
    
 -- 4    Obtain a list of applications where CourseID is unknown and the applications

-- where made between 01/04/2020 and 31/07/2020

SELECT 
    *
FROM
    application
WHERE
    DateOfApplication BETWEEN ('01/04/2020' AND '31/07/2020') AND CourseID IS NULL;


-- Task 2

-- 1 Obtain the number of modules which are assigned to each course

select *
from module;

SELECT 
    Subject, COUNT(ModuleID) AS 'Module Number'
FROM
    module
GROUP BY Subject;


-- 2 Retrieve Information on the number of successful applications per course
SELECT 
    courseappliedfor,
    COUNT(accepted) AS 'Successful Applications'
FROM
    application
WHERE
    accepted = 1
GROUP BY courseappliedfor;



-- 3 Find the average Membership Fee of Student Clubs by the ID of the Staff member

-- (Lecturer) supervising it

SELECT 
    ClubName, SupervisingStaff, JoiningFee, AVG(MembershipFee) AS "Avg Membership Fees"
    
FROM
    club
group by SupervisingStaff;



-- 4 Find the Sum total of Joining Fees for all active clubs by Staff Member supervising

-- them

select SupervisingStaff, ClubName, sum(JoiningFee) as "Joining Fee Total"
from club
where active = 1
group by SupervisingStaff;


-- Task 3 Advanced Joins

-- 1 Obtain a list of all modules and the names of any courses they may be taught

-- (include modules without courses)
 SELECT 
    *
FROM
    module;

SELECT 
    m.ModuleID,
    m.ModuleName,
    m.Subject,
    m.CourseID,
    c.CourseName
FROM
    module AS m
        LEFT JOIN
    course AS c ON m.CourseID = c.CourseID
ORDER BY CourseName;

-- 2 Obtain a list of students along with any related application numbers if they have

-- them

SELECT 
    student.*, application.applicationid
FROM
    student
        LEFT JOIN
    application ON student.studentid = application.studentid;

-- 3 Obtain the Class ID, Class Date and Feedback score of the latest class scheduled for

-- each Class ID