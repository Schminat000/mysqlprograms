USE v_art;
-- 1
SELECT artfile
FROM artwork
WHERE period = "impressionism";

-- 2
SELECT artfile
FROM artwork
	JOIN artwork_keyword
		ON artwork.artwork_id = artwork_keyword.artwork_id
WHERE keyword_id = 1;

-- 3
SELECT fname, lname, title
FROM artwork
	JOIN artist
		ON artwork.artist_id = artist.artist_id;
        
USE magazine;
-- 4
SELECT magazineName, subscriberLastName, subscriberFirstName
FROM magazine
	JOIN subscription
		ON magazine.magazinekey = subscription.magazinekey
	JOIN subscriber
		ON subscription.subscriberKey = subscriber.subscriberKey
ORDER BY magazineName ASC;
        
-- 5
SELECT magazineName
FROM magazine
	JOIN subscription
		ON magazine.magazineKey = subscription.magazineKey
	JOIN subscriber
		ON subscriber.subscriberKey = subscription.subscriberKey
WHERE subscriberLastName = "Sanders" AND subscriberFirstName = "Samantha";

USE employees;
-- 6
SELECT * FROM departments;
SELECT first_name, last_name
FROM employees
	JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no
	JOIN departments
		ON departments.dept_no = dept_emp.dept_no
WHERE dept_name = "Customer Service"
ORDER BY last_name ASC
LIMIT 5;

-- 7
SELECT first_name, last_name, dept_name, salary, salaries.from_date
FROM employees
	JOIN dept_emp
		ON employees.emp_no = dept_emp.emp_no
    JOIN departments
		ON departments.dept_no = dept_emp.dept_no
    JOIN salaries
		ON salaries.emp_no = dept_emp.emp_no
WHERE first_name = "Berni" AND last_name = "Genin"
ORDER BY salary ASC
LIMIT 1;