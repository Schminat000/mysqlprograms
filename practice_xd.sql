USE v_art;

SELECT fname, lname, title
FROM artwork
	JOIN artist
		ON artwork.artist_id = artist.artist_id
WHERE lname = "da Vinci";
        
SELECT * FROM artist;

SELECT * FROM artwork;

USE bike;

SELECT * FROM catergory;

SELECT * FROM product;

SELECT product_name, category_name, brand_name, list_price
FROM product
	JOIN category
    ON product.category_id = category.category_id
    JOIN brand
    ON product.brand_id = brand.brand_id
WHERE category_name = "Children Bicycles";
    
SELECT * FROM brand;

SELECT first_name, last_name
FROM staff
	JOIN store
		ON staff.store_id = store.store_id
WHERE store_name = "Rowlett Bikes";