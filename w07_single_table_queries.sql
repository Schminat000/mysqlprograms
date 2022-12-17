USE art_gallery;

-- 1
INSERT INTO artist VALUES
	(9, "Johannes", NULL, "Vermeer", 1632, 1674, "Netherlands", "n");

-- 2
SELECT * FROM artist
ORDER BY lname ASC;

-- 3
UPDATE artist
SET dod = 1675
WHERE artist_id = 9;

-- 4
DELETE FROM artist
WHERE artist_id = 9;

USE bike;

-- 5
SELECT first_name, last_name, phone
FROM customer
WHERE phone IS NOT NULL;

-- 6
SELECT product_name, list_price, list_price - 500 AS Discount_Price
FROM product
ORDER BY list_price DESC;

-- 7
SELECT first_name, last_name, email
FROM staff
WHERE store_id != 1;

-- 8
SELECT product_name, model_year, list_price
FROM product
WHERE product_name LIKE "%spider%";

-- 9
SELECT product_name, list_price
FROM product
WHERE list_price BETWEEN 500 AND 550
ORDER BY list_price ASC;

-- 10
SELECT first_name, last_name, phone, street, city, state, zip_code
FROM customer
WHERE phone IS NOT NULL AND city REGEXP "ach|och" OR last_name LIKE "%William%"
LIMIT 5;