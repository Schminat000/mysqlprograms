USE magazine;

-- 1
SELECT magazineName, ROUND(magazinePrice - (magazinePrice / 100) * 3, 2) AS "3% off"
FROM magazine;

-- 2
SELECT subscriberKey, ROUND(DATEDIFF("2020-12-20", subscriptionStartDate) / 365) AS "Years since subscription"
FROM subscription;

-- 3
SELECT subscriptionStartDate, subscriptionLength, DATE_FORMAT(DATE_ADD(subscriptionStartDate, INTERVAL subscriptionLength MONTH), "%M %e, %Y") AS "Subscription end"
FROM subscription;

USE bike;

-- 4
SELECT LEFT(product_name, LOCATE(" - ", product_name)) "Product Name without Year"
FROM product
ORDER BY product_id
LIMIT 14;

-- 5
SELECT product_name, CONCAT("$",FORMAT(ROUND(list_price / 3, 2), 2)) AS "One of 3 payments"
FROM product
WHERE product_name LIKE "%2019%";