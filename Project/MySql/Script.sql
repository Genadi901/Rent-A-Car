CREATE TABLE categories (
	cat_id INT NOT NULL AUTO_INCREMENT,
	cat_label VARCHAR(50),
	cat_desc VARCHAR (255),
	PRIMARY KEY (cat_id)
);

CREATE TABLE cars(
	vin_num  VARCHAR(7) NOT NULL,
	car_desc VARCHAR(255),
	color VARCHAR(20),
	brand VARCHAR(20),
	model VARCHAR (20),
	cat_id INT,
	purchase_date DATE,
	PRIMARY KEY (vin_num),
	FOREIGN KEY (cat_id) REFERENCES categories (cat_id) 
);

CREATE TABLE location(
	loc_id INT NOT NULL AUTO_INCREMENT, 
	street VARCHAR(45),
	streetnum INT,
	city VARCHAR (30),
	PRIMARY KEY (loc_id)
);

CREATE TABLE phone (
	phone_id INT NOT NULL AUTO_INCREMENT, 
	phone_no VARCHAR(13),
	loc_id INT NOT NULL,
	PRIMARY KEY (phone_id),
	FOREIGN KEY (loc_id) REFERENCES location (loc_id)
);

CREATE TABLE customers (
	cus_id INT NOT NULL AUTO_INCREMENT,
	first_name VARCHAR(20),
	last_name VARCHAR(20),
	email VARCHAR(45),
	ucn VARCHAR (10) NOT NULL, -- (EGN) varchar because size is too big for int we could use BIGINT too 
	mobile VARCHAR (13),
	PRIMARY KEY(cus_id)	
);

CREATE TABLE reservations (
	reservation_id INT NOT NULL AUTO_INCREMENT,
	amount DECIMAL (6,2),
	p_date DATE,
	r_date DATE,
	p_loc INT NOT NULL,
	r_loc INT NOT NULL,
	VIN VARCHAR(7) NOT NULL,
	cust_id INT NOT NULL,
	PRIMARY KEY (reservation_id),
	FOREIGN KEY (VIN) REFERENCES cars(vin_num), 
 	FOREIGN KEY (cust_id) REFERENCES customers(cus_id),
 	FOREIGN KEY (p_loc) REFERENCES location(loc_id),
 	FOREIGN KEY (r_loc) REFERENCES location(loc_id) 
);

