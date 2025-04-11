-- b) Make a wildcard selection to checkout the data
SELECT * FROM hemnet LIMIT 20;

-- c) Find out how many rows there are in the table
SELECT COUNT (*) AS total_rows FROM hemnet;

-- d) Describe the table that you have ingested to see the columns and data types
DESCRIBE hemnet;

-- e) Find out the 5 most expensive homes sold
SELECT address, commune, final_price, area, rooms, price_per_area
FROM hemnet
ORDER BY final_price DESC
LIMIT 5

-- f) Find out the 5 cheapest homes sold
SELECT address, commune, final_price, area, rooms, price_per_area
FROM hemnet
ORDER BY final_price ASC
LIMIT 5

-- g) Find out statistics on minimum, mean, median and maximum prices of homes sold
SELECT 
	MIN(final_price) AS  min_price,
	AVG(final_price) AS mean_price,
	MEDIAN(final_price) AS median_pricem,
	MAX(final_price) AS max_price
FROM hemnet;

-- h) Find out statistics on minimum, mean, median and maximum prices of price per area
SELECT 
    MIN(price_per_area) AS min_price_per_area,
    AVG(price_per_area) AS mean_price_per_area,
    MEDIAN(price_per_area) AS median_price_per_area,
    MAX(price_per_area) AS max_price_per_area
FROM hemnet;

-- i) How many unique communes are represented in the dataset
SELECT COUNT (DISTINCT commune) AS unique_communes FROM hemnet;

-- j) How many percentage of homes cost more than 10 million?
SELECT
	(COUNT (CASE WHEN final_price > 10000000 THEN 1 END) * 100.0 / COUNT(*)) AS percentage_above_10m
FROM hemnet;

-- k) Feel free to explore anything else you find interesting in this dataset

-- Distribution of homes by number of rooms
SELECT 
	rooms, 
	COUNT (*) AS count_homes,
	ROUND(AVG(final_price)) AS avg_price,
	ROUND (AVG(area)) AS avg_area
FROM hemnet
WHERE rooms IS NOT NULL
GROUP BY rooms
ORDER BY rooms;

-- Compare asked price vs final price
SELECT 
    AVG(pourcentage_difference) AS avg_percentage_diff,
    MAX(pourcentage_difference) AS max_percentage_diff,
    MIN(pourcentage_difference) AS min_percentage_diff,
    COUNT(CASE WHEN final_price > asked_price THEN 1 END) AS sold_above_asking,
    COUNT(CASE WHEN final_price < asked_price THEN 1 END) AS sold_below_asking,
    COUNT(CASE WHEN final_price = asked_price THEN 1 END) AS sold_at_asking
FROM hemnet;




