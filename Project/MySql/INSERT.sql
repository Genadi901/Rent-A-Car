INSERT INTO categories (cat_label, cat_desc) VALUES
("Compact", "Small cars, perfect for big cities and short trips."),
("Economy", "Good for longer trips."),
("Cargo", "Good for a lot of luggage and transportation of things."),
("Luxury", "Usually used for business meetings and professional chaufer services."),
("SUV", "Mix between a sedan and a Jeep, not too large and not too small, good for city and off-road usage."),
("Electric", "Fullt electric vehicles."),
("Convertible", "The roof of the car is retractable, hard-top or soft-top.");


INSERT INTO cars (vin_num, car_desc, color, brand, model, cat_id, purchase_date) VALUES 
("2HNYD28", "Small and compact city car with AC and CD Player, manual.", "Royal Blue", "Hyundai", "Getz", 1, "2009-02-08"),
("78DJHFG", "Professional and good looking, full-extra", "Dark Red", "BMW", "120", 1, "2011-07-16"), 
("98GJASG", "Hybrid, very economical, convinient , manual.", "Silver", "Toyota", "Prius", 2, "2012-11-07"),
("Y6261HF", "Hybrid, low consumntion and eye catching, automatic.", "Pale Green", "Chevrolet", "Volt", 2, "2014-05-18"),
("8FJA715", "Holds a lot of luggage ,manual.", "Orange", "Mercedes-Benz", "Sprinter", 3, "2012-12-19"),
("MD217DA", "Good for luggage and other things, manual.", "Sandy Brown", "Dacia", "Logan", 3, "2016-05-02"),
("0FPAP5D", "Nice and stylish, used for business and professional meetings, automatic.", "Nardo Gray", "Bentley", "Bentayga", 4, "2016-11-07"),
("6HA24LG", "Big town car, good performance, mainly used for business meetings, automatic.", "Maroon", "Rolls-Royce", "Ghost", 4, "2017-05-23"),
("89JAS6H", "Nice and stylish SUV, automatic.", "Dark Red", "Nissan", "Qashqai", 5, "2021-01-14"),
("872FJA6", "Parking assistant,5 doors, automatic.", "Light Green", "Volkswagen", "Tiguan", 5, "2013-12-12"),   
("981JNF3", "Fully electric and good looking, automatic.", "Dark Gray", "Skoda", "Enyaq", 6, "2016-02-25"),
("5FSDHD1", "Really fast fully electric vehicle with full extras, automatic.", "Light Cyan", "Tesla", "Model 3", 6, "2019-10-17"),
("07FHAGS", "Convertible with soft top, leather seats and cd player, manual.", "Brown", "BMW", "Z3", 7, "2021-03-26"),
("3FD56U5", "Convertible with hard top, GPS and sound system, manual.", "Cyan", "Mazda", "MX-5", 7, "2021-09-17");

INSERT INTO location (street, streetnum, city) VALUES 
("Ivan Vazov", 15, "Plovdiv"),
("Raichin Petkov", 76, "Botevgrad"),
("Zlaten rog", 24, "Sofia"),
("Ivan Popov", 32, "Veliko Tarnovo"),
("Kazbeg", 65, "Stara Zagora"),
("Kiril Drangov", 43, "Blagoevgrad");

INSERT INTO phone (phone_no, loc_id) VALUES 
("+359874312952", 1),
("+359765123952", 2),
("+359895426491", 3),
("+359887541259", 4),
("+359876152434", 5),
("+359816234579", 6);

INSERT INTO customers (first_name, last_name, email, ucn, mobile) VALUES 
("Ivan", "Atanasov", "ivan.atn@gmail.com", "0243030102", "+359874193548"),
("Petur", "Simeonov", "ptsim@gmail.com", "0601166180", "+359831245975"),
("Gabriela", "Anastasova", "gabi123@gmail.com", "0701035840", "+359331594479"),
("Ivailo", "Marinov", "ivom43@gmail.com", "0751053239", "+359199031149"),
("Marin", "Asenov", "marin_asenov32@gmail.com", "0809287061", "+359146234536"),
("Mariq", "Nikolova", "mariq_nikolova@gmail.com", "1604160150", "+359519606011"),
("Georgi", "Milchev", "georgi.milchev12@gmail.com", "2712013359", "+359233137351"),
("Svetlin", "Vasilev", "svetlin_vasi@gmail.com", "3607315727", "+359637360724"),
("Radoslav", "Tanchev", "radi_tan31@gmail.com", "4603209842", "+359395265877"),
("Polina", "Angelova", "poli.angl55@gmail.com", "5110047008", "+359193517243"),
("Nikol", "Georgieva", "nikol_georgieva53@gmail.com", "5704047968", "+359698324407"),
("Cvetelin", "Ovcharov", "cvetelin_ovcharov@gmail.com", "5907098035", "+359408024511"),
("Viktoria", "Marinova", "viktoria.marinova99@gmail.com", "7012089213", "+359233594318"),
("Ivana", "Ivanova", "ivana_ivanova00@gmail.com", "9310044235", "+359466877360"),
("Pavlina", "Petrova", "pavlinapetrova13@gmail.com", "9709199873", "+359102793539");

INSERT INTO reservations (amount,p_date ,r_date ,p_loc, r_loc ,VIN ,cust_id) VALUES
("132.23", "2015-05-02", "2015-10-10", 1, 1, "2HNYD28", 2), 
("111.11", "2015-05-03", "2015-05-04", 2, 2, "78DJHFG", 8), 
("222.22", "2015-05-04", "2015-05-05", 3, 3, "98GJASG", 8), 
("333.33", "2015-05-06", "2015-05-06", 1, 2, "8FJA715", 9),
("444.44", "2015-05-07", "2015-05-08", 3, 1, "MD217DA", 11),
("300.20", "2015-03-14", "2015-03-14", 6, 5, "0FPAP5D", 7),
("29.10", "2015-05-20", "2015-05-22", 2, 3, "6HA24LG", 15),
("1000.00", "2015-05-20", "2015-07-29", 4, 4, "89JAS6H", 14), 
("69.90", "2015-03-08", "2015-03-22", 3, 5, "872FJA6", 10),
("239.25", "2017-12-31", "2018-01-10", 6, 6, "981JNF3", 2),
("41.22", "2014-01-22", "2014-01-23", 5, 2, "07FHAGS", 1), 
("22.33", "2015-05-09", "2015-05-31", 3, 2, "3FD56U5", 3), 
("38.26", "2015-10-13", "2015-10-15", 4, 1, "89JAS6H", 6),
("77.88", "2015-10-22", "2015-10-27", 6, 1, "MD217DA", 5),
("99.66", "2015-05-23", "2015-05-29", 2, 5, "07FHAGS", 13),
("34.12", "2015-10-24", "2015-10-28", 3, 2, "89JAS6H", 4),
("667.99", "2015-03-19", "2015-03-20", 1, 2, "89JAS6H", 7), 
("156.01", "2014-08-06", "2014-08-12", 1, 2, "78DJHFG", 12), 
("39.29", "2015-01-07", "2015-01-11", 2, 4, "2HNYD28", 11), 
("45.55", "2015-01-08", "2015-01-10", 2, 2, "MD217DA", 9), 
("21.18", "2015-03-02", "2015-03-04", 3, 4, "981JNF3", 2), 
("109.57", "2015-08-01", "2015-08-15", 3, 3, "78DJHFG", 15),
("124.56", "2014-05-15", "2014-05-23", 4, 4, "2HNYD28", 6),
("543.22", "2014-05-24", "2014-05-08", 4, 5, "07FHAGS", 7),
("578.34", "2014-10-01", "2014-10-25", 4,1, "872FJA6", 8),
("199.99", "2014-04-06", "2018-04-15", 5, 5, "3FD56U5", 2),
("201.02", "2014-04-14", "2014-04-20", 5, 5, "8FJA715", 1),
("202.03", "2014-10-08", "2014-10-19", 5, 4, "8FJA715", 13);

SELECT 

INSERT INTO reservations
(amount, p_date, r_date, p_loc, r_loc, VIN, cust_id)
VALUES(145.23, '2014-08-10', '2014-09-13', 5, 3, 'MD217DA', 4);


INSERT INTO cars (vin_num, car_desc, color, brand, model, cat_id, purchase_date) VALUES
("31GC4X5", "Small and compact city car with AC and CD Player, manual.", "Royal Blue", "Hyundai", "Getz", 1, "2009-02-08");

SELECT * FROM reservations r ;

