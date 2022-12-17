USE v_art;

SELECT * FROM artwork;

-- Filter with a range
SELECT title, period, artyear
FROM artwork
WHERE artyear > 1800 AND artyear < 1900;

-- Another way to get a filter with range
SELECT title, period, artwork
FROM artwork
WHERE artyear BETWEEN 1800 AND 1900;

SELECT title, period
FROM artwork
WHERE period IN ("Modern", "Baroque", "Impressionism");

SELECT title, period
FROM artwork
WHERE period LIKE "%impression%";

SELECT title, period
FROM artwork
WHERE period REGEXP "impression";

SELECT title, period
FROM artwork
WHERE period REGEXP "^Post";

SELECT title, period
FROM artwork
WHERE period LIKE "_ost-impression%";

SELECT title, period
FROM artwork
WHERE period REGEXP "ism$";

SELECT title, period
FROM artwork
WHERE title REGEXP "old";

SELECT title, period
FROM artwork
WHERE period REGEXP "the|in|on";

SELECT * FROM artist;

SELECT fname AS FIRST, mname AS MIDDLE, lname AS LAST
FROM artist
WHERE mname IS NOT NULL
ORDER BY MIDDLE;

USE bike;

SELECT * FROM product;

SELECT product_name, model_year, ROUND(list_price) AS "Rounded Price"
FROM product;

SELECT product_name, model_year, list_price + 100 AS marked_up, list_price
FROM product
WHERE list_price + 100 > 1000
ORDER BY marked_up;

SELECT product_name, model_year
FROM product
WHERE (product_name LIKE "Trek%" OR product_name LIKE "Surly%") AND model_year <> 2016;

SELECT product_name, list_price, ROUND(list_price - (list_price * 20 / 100), 2) AS discount_price
FROM product
WHERE product_name LIKE "%Haro%"
ORDER BY discount_price;

SELECT customer_id, first_name, last_name, email
FROM customer
WHERE email REGEXP '@gmail';