-- Stored function for inserting a new customer
CREATE OR REPLACE FUNCTION insert_customer(first_name VARCHAR, last_name VARCHAR, address VARCHAR, phone_number VARCHAR)
RETURNS INTEGER AS $$
  DECLARE
    new_id INTEGER;
  BEGIN
    INSERT INTO Customer (first_name, last_name, address, phone_number)
    VALUES (first_name, last_name, address, phone_number)
    RETURNING customer_id INTO new_id;
    RETURN new_id;
  END;
$$ LANGUAGE plpgsql;

-- Stored function for inserting a new vehicle
CREATE OR REPLACE FUNCTION insert_vehicle(VIN VARCHAR, year INTEGER, make VARCHAR, model VARCHAR, customer_id INTEGER)
RETURNS INTEGER AS $$
  DECLARE
    new_id INTEGER;
  BEGIN
    INSERT INTO Vehicle (VIN, year, make, model, customer_id)
    VALUES (VIN, year, make, model, customer_id)
    RETURNING vehicle_id INTO new_id;
    RETURN new_id;
  END;
$$ LANGUAGE plpgsql;

-- Stored function for inserting a new  staff member
CREATE OR REPLACE FUNCTION insert_service_staff(first_name VARCHAR, last_name VARCHAR)
RETURNS INTEGER AS $$
  DECLARE
    new_id INTEGER;
  BEGIN
    INSERT INTO service_Staff (first_name, last_name)
    VALUES (first_name, last_name)
    RETURNING service_staff_id INTO new_id;
    RETURN new_id;
  END;
$$ LANGUAGE plpgsql;

-- Inserting a new customer using the stored function
SELECT insert_customer('John', 'Doe', '123 Main St', '555-1234');

-- Inserting a new vehicle using the stored function
SELECT insert_vehicle('1G1BL52P0TR127520', 2000, 'Chevrolet', 'Impala');

-- Inserting a new sales staff member using the stored function
SELECT insert_service_staff('Jane', 'Smith');