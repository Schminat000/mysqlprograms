USE university;

-- 1
SELECT fname, lname, DATE_FORMAT(dob, '%M %d, %Y') AS 'Sept Birthdays'
FROM student
WHERE MONTH(DOB) = 9
ORDER BY lname;

-- 2
SELECT lname, fname
, FLOOR(datediff('2017-01-05', dob)/365) AS Years, MOD(datediff('2017-01-05', dob), 365) AS Days, CONCAT(FLOOR(datediff('2017-01-05', dob)/365), ' - Yrs,  ', MOD(datediff('2017-01-05', DOB), 365), ' - Days') AS 'Years and Days'
FROM student
Order By datediff('2017-01-05', dob) DESC;

-- 3
SELECT s.fname, s.lname
FROM student s
 JOIN enrollment e
	ON s.student_id = e.student_id
 JOIN section se
	ON e.section_id = se.section_id
 JOIN faculty f
	ON se.faculty_id = f.faculty_id
WHERE f.lname = 'Jensen' and f.fname = 'John'
ORDER BY s.lname;

-- 4
SELECT f.fname, f.lname
FROM faculty f
   JOIN section s
      ON f.faculty_id = s.faculty_id
   JOIN term t
      ON s.term_id = t.term_id
   JOIN enrollment e
      ON e.section_id = s.section_id
   JOIN student st
      ON e.student_id = st.student_id
WHERE st.fname = 'Bryce'
   AND t.year = 2018
   AND t.term = 'Winter'
ORDER BY f.lname;

-- 5
SELECT st.fname, st.lname
FROM section s
   JOIN term t
      ON s.term_id = t.term_id
   JOIN enrollment e
      ON e.section_id = s.section_id
   JOIN student st
      ON e.student_id = st.student_id
   JOIN course c
      ON s.course_id = c.course_id
WHERE c.name = 'Econometrics'
   AND t.year = 2019
   AND t.term = 'Fall'
ORDER BY st.lname;

-- 6
SELECT c.department_code, c.course_num, c.name
FROM term t
	JOIN section s
	  ON t.term_id = s.term_id
	JOIN course c
	  ON s.course_id = c.course_id
	JOIN enrollment e
	  ON s.section_id = e.section_id
	JOIN student st
	  ON e.student_id = st.student_id
WHERE st.lname = 'Carlson' AND term = 'Winter' AND year = 2018
ORDER BY c.name;

-- 7
SELECT term, year, COUNT(s.section_id) AS "Enrollment"
FROM term t
	JOIN section s
	ON t.term_id = s.term_id
	JOIN enrollment e
	ON s.section_id = e.section_id
WHERE term = 'Fall' AND year = 2019;

-- 8
SELECT c.name as Colleges, COUNT(course_num) As 'Number of Courses'
FROM college c
  JOIN department d
	ON c.college_id = d.college_id
  JOIN course co
	ON d.department_code = co.department_code
GROUP BY c.name
ORDER BY Colleges;

-- 9
SELECT f.fname, f.lname, SUM(capacity) AS TeachingCapacity
FROM faculty f
   JOIN section s
	ON f.faculty_id = s.faculty_id
   JOIN term t
	ON s.term_id = t.term_id
WHERE term = 'Winter' AND year = 2018
GROUP BY f.lname, f.fname
ORDER BY TeachingCapacity;

-- 10
SELECT st.lname, st.fname, SUM(c.credit) AS Credits
FROM Section s
   JOIN term t
	ON s.term_id = t.term_id
   JOIN enrollment e
	ON e.section_id = s.section_id
   JOIN student st
	ON e.student_id = st.student_id
   JOIN course c
	ON s.course_id = c.course_id
WHERE term = 'Fall' AND year = 2019
GROUP BY st.lname, st.fname
HAVING Credits > 3
ORDER BY credits DESC;