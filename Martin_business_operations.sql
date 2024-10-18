/*
I created 4 tables for the basics of a food truck company 
then populated the tables with sample data
*/

#basic employee info
CREATE TABLE Employees (
  employee_id INT AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(20),
  last_name VARCHAR(20),
  phone_number VARCHAR(10),
  address VARCHAR(75),
  email VARCHAR(50)
);

#all the company trucks and storage location
CREATE TABLE Trucks (
  truck_id INT AUTO_INCREMENT PRIMARY KEY,
  make VARCHAR(20),
  model VARCHAR(20),
  year INT,
  storage_location VARCHAR(75),
  driver_id INT,
  FOREIGN KEY (driver_id) REFERENCES Employees(employee_id)
);

# general information needed for an order
CREATE TABLE Orders (
  order_id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(20),
  order_date_time DATETIME,
  total DECIMAL(10, 2),
  employee_id INT,
  FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);

#exaple of ingredients needed in weitgh for ingredients
# and whole numbers (int) for individually prepackaged items
CREATE TABLE Inventory (
  truck_id INT,
  beef_lbs DECIMAL(10, 2),
  pork_lbs DECIMAL(10, 2),
  chicken_lbs DECIMAL(10, 2),
  tortillas_lbs DECIMAL(10, 2),
  cilantro_lbs DECIMAL(10, 2),
  lime_lbs DECIMAL(10, 2),
  lettuce_lbs DECIMAL(10, 2),
  tomato_lbs DECIMAL(10, 2),
  onion_lbs DECIMAL(10, 2),
  green_salsa_lbs DECIMAL(10, 2),
  red_salsa_lbs DECIMAL(10, 2),
  sour_cream_lbs DECIMAL(10, 2),
  cheese_lbs DECIMAL(10, 2),
  water_bottle INT,
  soft_drinks INT,
  PRIMARY KEY (truck_id),
  FOREIGN KEY (truck_id) REFERENCES Trucks(truck_id)
);

# the following queries are for inserting sample data
INSERT INTO Employees (first_name, last_name, phone_number, address, email)
VALUES
('John', 'Doe', '555-1234', '123 Main St', 'john.doe@example.com'),
('Jane', 'Smith', '555-5678', '456 Oak Ave', 'jane.smith@example.com'),
('Mike', 'Johnson', '555-9101', '789 Pine Rd', 'mike.johnson@example.com'),
('Sarah', 'Brown', '555-1213', '101 Maple Ln', 'sarah.brown@example.com'),
('Tom', 'White', '555-1415', '202 Elm St', 'tom.white@example.com'),
('Lucy', 'Green', '555-1617', '303 Cedar Blvd', 'lucy.green@example.com')
;

INSERT INTO Trucks (make, model, year, storage_location, driver_id) VALUES
('Ford', 'Step Van', 2020, 'Garage 1', 1),  -- John Doe is the driver
('Chevrolet', 'P30', 2021, 'Garage 2', 3),  -- Mike Johnson is the driver
('Freightliner', 'MT55', 2019, 'Garage 3', 5)  -- Tom White is the driver
;

INSERT INTO Inventory (truck_id, beef_lbs, pork_lbs, chicken_lbs, tortillas_lbs,
 cilantro_lbs, lime_lbs, lettuce_lbs, tomato_lbs, onion_lbs, green_salsa_lbs,
 red_salsa_lbs, sour_cream_lbs, cheese_lbs, water_bottle, soft_drinks) 
 VALUES
(1, 100, 80, 120, 50, 10, 5, 15, 20, 25, 10, 15, 30, 40, 200, 150),
(2, 120, 90, 100, 60, 12, 6, 18, 22, 30, 12, 17, 25, 35, 220, 170),
(3, 110, 85, 110, 55, 11, 6, 17, 21, 28, 11, 16, 28, 37, 210, 160)
;

INSERT INTO Orders (customer_name, order_date_time, total, employee_id) VALUES
('Alice', '2024-10-12 10:05:23', 34.50, 1),
('Bob', '2024-10-12 10:10:15', 55.20, 2),
('Charlie', '2024-10-12 10:25:42', 28.99, 1),
('David', '2024-10-12 10:35:17', 48.75, 2),
('Eve', '2024-10-12 10:40:50', 60.45, 1),
('Frank', '2024-10-12 10:50:30', 72.10, 3),
('Grace', '2024-10-12 11:05:12', 39.85, 4),
('Hannah', '2024-10-12 11:15:43', 90.25, 3),
('Isaac', '2024-10-12 11:22:55', 25.65, 4),
('Jack', '2024-10-12 11:35:28', 47.50, 3),
('Kelly', '2024-10-12 11:45:10', 62.40, 5),
('Liam', '2024-10-12 11:55:35', 29.90, 6),
('Mia', '2024-10-12 12:05:47', 85.35, 5),
('Noah', '2024-10-12 12:15:20', 33.70, 6),
('Olivia', '2024-10-12 12:25:10', 41.80, 5),
('Paul', '2024-10-12 12:35:42', 56.95, 6),
('Quincy', '2024-10-12 12:45:18', 38.60, 5),
('Rachel', '2024-10-12 12:55:30', 49.25, 6),
('Sam', '2024-10-12 13:05:55', 75.10, 5),
('Tina', '2024-10-12 13:15:12', 63.55, 6);
