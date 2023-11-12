INSERT INTO customer (
last_name,
first_name,
phone_number,
email,
address,
city,
state,
zip_code
) VALUES (
'Brink',
'Gabby',
'415-777-9876',
'gabby@aol.com',
'123 Tell St',
'Amazing Town',
'FL',
'12385'
);

SELECT *
FROM customer

INSERT INTO service_technician(
last_name,
first_name
) VALUES (
'Smith',
'Billy');

SELECT *
FROM service_technician

INSERT INTO service_ticket(
service_ticket_number,
date_received,
date_returned,
comments_,
car_id,
customer_id,
service_tech_id
)VALUES (
'S987',
'2023-11-08 17:36:00',
'2023-11-10 17:37:00',
'Oil change and routine maintence.',
'1',
'1',
'1');

SELECT *
FROM service_ticket


INSERT INTO sales_person(
last_name,
first_name) VALUES(
'Doe',
'John');

SELECT *
FROM sales_person

INSERT INTO pos(
invoice_number,
date_,
total,
car_id,
customer_id,
salesperson_id,
service_ticket_id)VALUES(
'09999',
'2023-11-10 18:03:00',
'300.80',
'1',
'1',
'1',
'1'
);

SELECT *
FROM pos

INSERT INTO service(
service_name,
rate,
service_ticket_id,
part_id
)VALUES (
'Oil Change',
'50.00',
'1',
'1');

SELECT *
FROM service

INSERT INTO car(
vin,
make,
model,
year_,
color,
mileage,
new_,
sales_price)VALUES(
'12345678901234567',
'Nissan',
'Pathfinder',
'2015',
'Blue',
'70000',
'False',
'10000.00');

SELECT *
FROM car

INSERT INTO payment(
payment_method,
customer_id
)VALUES(
'Visa',
'1');

SELECT *
FROM payment

INSERT INTO parts(
part_number,
description,
price,
quantity) VALUES (
'56576567',
'Oil Filter',
'10.00',
'1');

SELECT *
FROM parts





