USE bike;

-- 1
SELECT ROUND(AVG(quantity)) AS "Stock Average"
FROM stock;

-- 2
SELECT product_name
FROM product p
	JOIN stock s
		ON s.product_id = p.product_id
WHERE quantity = 0
GROUP BY product_name
ORDER BY product_name
LIMIT 12;

-- 3
SELECT category_name, quantity AS "instock"
FROM category c
	JOIN stock s
		ON s.store_id = c.category_name
WHERE store_id = 2
GROUP BY category_name;

USE employees;

-- 4
SELECT COUNT(emp_no) AS "Number of Employees"
FROM employees;

-- 5
SELECT dept_name, AVG(salary) AS "average_salary"
FROM departments d
	JOIN salaries s
		ON s.emp_no = d.dept_no
WHERE FORMAT(AVG(salary), 2) < 60000;

-- 6
SELECT dept_name, gender AS "Number of Females"
FROM departments d
	JOIN employees e
		ON e.emp_no = d.dept_no
WHERE gender = "f";