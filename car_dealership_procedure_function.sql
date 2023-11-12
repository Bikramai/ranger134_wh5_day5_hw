--PROCEDURE FOR NEW SALES PERSON
CREATE OR REPLACE PROCEDURE new_salesperson (_last_name VARCHAR, _first_name VARCHAR)
LANGUAGE plpgsql
AS $$ 
BEGIN
	INSERT INTO sales_person(last_name, first_name) VALUES (
	_last_name, _first_name
	);
END; 
$$
--ADDING NEW SALEPERSON
CALL new_salesperson ('Smith', 'Bob');
CALL new_salesperson ('Long', 'Steve');
CALL new_salesperson ('Rhodes', 'Ryan');



SELECT *
FROM sales_person

--ADDING NEW SERVICE TECH
CREATE OR REPLACE FUNCTION new_service_tech(_service_tech_id INTEGER, 
			_last_name VARCHAR, 
			_first_name VARCHAR)
	
RETURNS void
LANGUAGE plpgsql
AS
$$

BEGIN
	INSERT INTO service_technician
	VALUES (_service_tech_id,
			_last_name,
			_first_name
		   );
	
END;
$$

SELECT new_service_tech(2, 'Green', 'Joe');
SELECT new_service_tech(3, 'Swiggum', 'Alex');

SELECT *
FROM service_technician


--FUNCTION TO ADD NEW CUSTOMER

CREATE OR REPLACE FUNCTION customer_new(
	_customer_id INTEGER,
	_lastname VARCHAR, 
	_firstname VARCHAR, 
	phone VARCHAR, 
	_email VARCHAR, 
	addy VARCHAR, 
	_city VARCHAR, 
	_state CHAR, 
	zip INTEGER) 
RETURNS void
LANGUAGE plpgsql
AS
$$

BEGIN
	INSERT INTO customer
	VALUES (_customer_id, _lastname, _firstname, phone, _email, addy, _city, _state, zip);	
END;
$$
--CALLING FUNCTION CUSTOMER NEW
SELECT customer_new (2,'Sony', 'Harmony', '415-987-0977', 'harmony@yahoo.com', '145 I Dont Know St', 'Somewhere', 'AL', '56749');

SELECT customer_new (3,'Frank', 'June', '615-222-0987', 'junefrank@gmail.com', '325 Found The St', 'Here', 'IL', '98723');

SELECT customer_new (4,'Sweetwater', 'Amanda', '202-847-9203', 'amanda2000@aol.com', '987 Hollow Rd', 'Over', 'CA', '98763');

SELECT customer_new (5,'Freed', 'David', '303-963-0837', 'davidf@yahoo.com', '22 Victory Lane', 'Texas', 'OH', '78374');

SELECT customer_new (6,'Host', 'Joy', '303-923-7894', 'host_joy@gmail.com', '18997 Lost Rd', 'Denver', 'CO', '56749');

SELECT customer_new (7,'Happy', 'Liz', '615-897-5567', 'liz_happy@gmail.com', '555 Cool Car Lane', 'Chicago', 'IL', '60683');


SELECT *
FROM customer
WHERE customer_id = 2;

--FUNCTION TO ADD CAR
CREATE OR REPLACE FUNCTION add_car(_car_id INTEGER, 
			_vin VARCHAR, 
			_make VARCHAR, 
			_model VARCHAR, 
			_year INTEGER, 
			_color VARCHAR, 
			_mileage INTEGER, 
			_new BOOLEAN, 
			_salesprice NUMERIC)
	
RETURNS void
LANGUAGE plpgsql
AS
$$

BEGIN
	INSERT INTO car
	VALUES (_car_id, 
			_vin, 
			_make, 
			_model, 
			_year, 
			_color, 
			_mileage, 
			_new, 
			_salesprice);
	
END;
$$


--CALLING FUNCTION ADD CARS
SELECT add_car(2, '11111222223333344', 'Chevrolet', 'Corvette Stingray', '2024', 'White', '2', 'True', '98070.00');  

SELECT add_car(3, '99999999999999999','Ford','Mustang','2021','Red','40091','False','25000.00');

SELECT add_car(4, '88887777666655551','Toyota','Tundra','2015','Orange','80765','False','25099.00');

SELECT add_car(5, '88887777666655552','Chevrolet','Chevelle','1965','Black','83927','False','30099.00');

SELECT add_car(6, '00000000001111111','BMW','X6','2024','Grey','10','True','75000.00');

SELECT add_car(7, '00000000001111112','BMW','X5','2022','Silver','30000','False','40000.00');

SELECT add_car(8, '00000000001111117','Mercedes','GLE AMG','2024','Pink','9','True','103000.00');

SELECT add_car(9, '00009000001811112','KIA','Sportage','2020','Brown','20000','False','20000.00');

SELECT *
FROM car
WHERE car_id = 2;

--ADD SERVICE TICKET FUNCTION
CREATE OR REPLACE FUNCTION new_service_ticket(_service_ticket_id INTEGER, 
			_service_ticket_number VARCHAR,
			_date_received TIMESTAMP WITHOUT TIME ZONE,
			_date_returned TIMESTAMP WITHOUT TIME ZONE,
			_comments VARCHAR,
			_car_id INTEGER,
			_customer_id INTEGER,
			_service_tech_id INTEGER)
RETURNS void
LANGUAGE plpgsql
AS
$$

BEGIN
	INSERT INTO service_ticket
	VALUES (_service_ticket_id, 
			_service_ticket_number,
			_date_received,
			_date_returned,
			_comments,
			_car_id,
			_customer_id,
			_service_tech_id);
END;
$$
--CALLING FUNCTION TO CREATE NEW SERVICE TICKET
SELECT new_service_ticket(2, 'S988', '2023-11-08 18:00:00', '2023-11-09 12:00:00', 'Replaced brakes.', '5', '3', '1');
SELECT new_service_ticket(3, 'S989', '2023-11-08 19:00:00', '2023-11-11 16:00:00', 'Replaced fuel injector.', '9', '4', '1');
SELECT new_service_ticket(4, 'S990', '2023-11-09 07:00:00', '2023-11-10 14:00:00', 'Replaced air filter.', '2', '7', '1');

--OLD STUFF
-- DELETE FROM service_ticket
-- WHERE service_ticket_id = 2;

SELECT *
FROM service_ticket


-- FUNCTION TO CALCULATE SERVICE RATE
CREATE OR REPLACE FUNCTION service_rate( _rate NUMERIC, hours_worked INTEGER)
RETURNS numeric
LANGUAGE plpgsql
AS 
$$
BEGIN
	RETURN (_rate * hours_worked);
END;
$$

SELECT service_rate(100.00, 15) AS labor_cost;

-- FUNCTION TO CALCULATE PARTS COST
CREATE OR REPLACE FUNCTION parts_cost( _price NUMERIC, _quantity INTEGER)
RETURNS NUMERIC
LANGUAGE plpgsql
AS 
$$
BEGIN
	RETURN (_price * _quantity);
END
$$;

SELECT parts_cost(50.00, 2);

CREATE OR REPLACE FUNCTION add_parts(
	_part_id INTEGER,
	_part_number INTEGER,
	_description VARCHAR,
	_price NUMERIC,
	_quantity INTEGER)
RETURNS void
LANGUAGE plpgsql
AS 
$$
BEGIN 
	INSERT INTO parts
	VALUES (_part_id, _part_number, _description, _price, _quantity);
END
$$;

SELECT add_parts(2, '56576568', 'Spoiler - 2024 Corvette Stingray', '2000.00', '1');
SELECT add_parts(3, '56576570', 'Wheels - 2024 BMW X6', '10000.00', '4');
SELECT add_parts(4, '56576571', 'Carbon Fiber Hood - 2021 Ford Mustang', '2000.00', '1');
SELECT add_parts(5, '56576575', 'Dual Exhaust Muffler - 2024 Mercedes GLE AMG', '3000.00', '1');
SELECT add_parts(6, '56576580', 'All Weather Floor Mats - 2020 KIA Sportage', '200.00', '1');

SELECT *
FROM car

-- _sales_price, added_parts_price,

CREATE OR REPLACE FUNCTION sales_transaction(total_price NUMERIC, _sales_price NUMERIC, added_parts_price NUMERIC, _car_id INTEGER, _parts_id INTEGER)
RETURNS NUMERIC
LANGUAGE plpgsql
AS 
$$
BEGIN
	SELECT sales_price INTO _sales_price
	FROM car
	WHERE car_id = _car_id;
	
	SELECT price INTO added_parts_price
	FROM parts
	WHERE parts_id = _parts_id;
	RETURN total_price;

	total_price = _sales_price + added_parts_price;
-- 	RETURN(car.sales_price + parts.price);
END
$$;
------------------------------------------------------------------------------------------------
-- WE ARE WORKING ON CALLING THE ABOVE FUNCTION, THE FUNCTION WORKS, BUT WE ARE CONFUSED ON HOW TO CALL IT.
--EVERYTHING WORKS OTHERWISE 
-- SELECT sales_transaction(3,4) AS total_price;

SELECT *
FROM parts

SELECT *
FROM car

SELECT *
FROM pos
-- 300.80

CREATE OR REPLACE PROCEDURE update_pos(_add_to_total NUMERIC,
									   _transaction_id INTEGER
)
LANGUAGE plpgsql
AS $$ 
BEGIN
	UPDATE pos
	SET total = total + _add_to_total
	WHERE transaction_id = _transaction_id;
COMMIT;
END
$$; 

CALL update_pos(parts_cost(50.00, 2),1);
CALL update_pos(sales_price(10000.00),2);


SELECT *
FROM car

--ALTERING TABLE, ADDED COLUMN IS_SERVICED
ALTER TABLE car
ADD is_serviced BOOLEAN;

--PROCEDURE TO UPDATE SERVICE STATUS 
CREATE OR REPLACE PROCEDURE update_service_status(
	_car_id INTEGER
)
LANGUAGE plpgsql
AS $$ 
BEGIN

	UPDATE car 
	SET is_serviced = True
	WHERE car_id = _car_id;
-- 	IN (
-- 	SELECT car_id FROM service_ticket
-- 	WHERE is_serviced = null); -- We had is_serviced = False OR is_serviced = null
COMMIT;
END
$$; 

CALL update_service_status(2);

-- DROP PROCEDURE IF EXISTS update_service_status;


