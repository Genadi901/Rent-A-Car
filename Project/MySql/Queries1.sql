-- 1 (SUB Queries)

SELECT cus_id, first_name, last_name
FROM customers 
WHERE cus_id IN (
	SELECT cust_id
	FROM reservations r
	WHERE p_date = "2015-05-20" 
);

SELECT brand, color
FROM cars 
WHERE cat_id IN (
	SELECT cat_id 
	FROM categories
	WHERE cat_desc LIKE "%luggage%"
); 


-- 2 (create view)

CREATE VIEW top_rent AS
SELECT l.city, c2.cat_label, COUNT(reservation_i d) as TotalRes
FROM location l, cars c , categories c2 , reservations r 
WHERE r.p_loc = l.loc_id AND c.cat_id = c2.cat_id AND c.vin_num = r.VIN 
GROUP BY l.city , c2.cat_label
ORDER BY l.city, TotalRes DESC;

SELECT DISTINCT city, cat_label, MAX(TotalRes)
FROM top_rent
GROUP BY city, cat_label ;

-- 3 (Window func)
SELECT DISTINCT c.cat_label ,
MAX(r.amount)  OVER (PARTITION BY c.cat_label ) as max_amount
FROM reservations r, categories c  ;
 
-- 5 (cursor)
CREATE PROCEDURE firstCurs()

BEGIN
	DECLARE finished int default 0; -- finished default value 0 

	DECLARE emails_list varchar(500) default ""; -- list of emails 

	DECLARE user_email VARCHAR(30) default ""; -- individual emails
	
	DECLARE cust_data CURSOR FOR SELECT email FROM customers c LIMIT 5 ; -- declare the cursor (basically iterating to a result set)  

	DECLARE CONTINUE HANDLER FOR NOT FOUND SET finished = 1;  -- if we have no data to read from the results set, set a terminate condition 

	OPEN cust_data; -- opening the cursor after declaring it 

	get_email: LOOP 
	
	FETCH cust_data INTO user_email ; -- storing all the result set into variables list
	
	IF finished = 1 THEN 
		LEAVE get_email;

	END IF;
	
	SET emails_list = CONCAT(emails_list, user_email, " , ");
	
	END LOOP get_email;

	CLOSE cust_data;

	SELECT emails_list;
END;

DROP PROCEDURE IF EXISTS firstCurs;

CALL firstCurs ();

-- 6 (triggers)
DELIMITER $$ 
	CREATE TRIGGER my_trigger 
	BEFORE INSERT ON reservations 
	FOR EACH ROW BEGIN 
	INSERT INTO alerts VALUES 
	("New reservation made"); END $$ 
DELIMITER ; 

INSERT INTO reservations (amount, p_date, r_date, p_loc, r_loc, VIN, cust_id) VALUES
(145.23, "2014-08-10", "2014-09-13", 5, 3, "MD217DA", 4);

SELECT *
FROM alerts ;

-- 7 (join)
SELECT c.brand, c.model, c2.cat_label
FROM cars c 
INNER JOIN categories c2 
USING (cat_id)
WHERE c.car_desc LIKE "%manual%";

-- 8 (cte)
WITH rent_pickup AS
(SELECT COUNT(reservation_id) as Pickups, l2.city 
FROM reservations r2 , location l2 
WHERE l2.city IN ("Plovdiv","Sofia","Botevgrad") AND r2.p_loc = l2.loc_id AND r2.p_date LIKE "2015-05%" 
GROUP BY l2.city)

SELECT *
FROM rent_pickup;


-- 9 (case when)
SELECT reservation_id, amount, 
	(CASE 
		WHEN amount > 100 THEN "The amount is greater than 100"
		WHEN amount <= 50 THEN "The amount is equal or less than 50"
		ELSE "......"
	END) AS case_statemen
	FROM reservations r ;
