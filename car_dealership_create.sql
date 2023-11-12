CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  last_name VARCHAR(30),
  first_name VARCHAR(30),
  phone_number VARCHAR(16),
  email VARCHAR(50),
  address VARCHAR(100),
  city VARCHAR(50),
  state CHAR(2),
  zip_code INTEGER 
);

CREATE TABLE service_technician (
  service_tech_id SERIAL PRIMARY KEY,
  last_name VARCHAR(30),
  first_name VARCHAR(30)
);

CREATE TABLE service_ticket (
  service_ticket_id SERIAL PRIMARY KEY,
  service_ticket_number VARCHAR(20),
  date_received TIMESTAMP WITHOUT TIME ZONE,
  date_returned TIMESTAMP WITHOUT TIME ZONE,
  comments_ VARCHAR,
  car_id INTEGER,
  customer_id INTEGER,
  service_tech_id INTEGER,
  FOREIGN KEY (service_tech_id) REFERENCES service_technician(service_tech_id)
);

CREATE TABLE sales_person (
  salesperson_id SERIAL PRIMARY KEY,
  last_name VARCHAR(30),
  first_name VARCHAR(30)
);

CREATE TABLE pos (
  transaction_id SERIAL PRIMARY KEY,
  invoice_number VARCHAR(20),
  date_ TIMESTAMP WITHOUT TIME ZONE,
  total NUMERIC(8,2),
  car_id INTEGER,
  customer_id INTEGER,
  salesperson_id INTEGER,
  service_ticket_id INTEGER,
    FOREIGN KEY (customer_id)
      REFERENCES customer(customer_id),
    FOREIGN KEY (service_ticket_id)
      REFERENCES service_ticket(service_ticket_ID),
    FOREIGN KEY (salesperson_id)
      REFERENCES sales_person(salesperson_id)
);

CREATE TABLE service (
  service_id SERIAL PRIMARY KEY,
  service_name VARCHAR(50),
  rate NUMERIC(8,2),
  service_ticket_id INTEGER,
  part_id INTEGER,
    FOREIGN KEY (service_ticket_id)
    REFERENCES service_ticket(service_ticket_ID)
);

CREATE TABLE car (
  car_id SERIAL PRIMARY KEY,
  vin VARCHAR(17),
  make VARCHAR(30),
  model VARCHAR(30),
  year_ INTEGER,
  color VARCHAR(20),
  mileage INTEGER,
  new_ BOOLEAN,
  sales_price NUMERIC(8,2)
);


CREATE TABLE payment (
  payment_id SERIAL PRIMARY KEY,
  payment_method VARCHAR(20),
  customer_id INTEGER,
    FOREIGN KEY (customer_id)
    REFERENCES customer(customer_id)
);

CREATE TABLE parts (
  part_id SERIAL PRIMARY KEY,
  part_number INTEGER,
  description VARCHAR(50),
  price NUMERIC(8,2),
  quantity INTEGER
);