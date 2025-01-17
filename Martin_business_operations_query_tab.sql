/*
I created 4 tables for the basics of a food truck company 
then populated the tables with sample data
*/
DROP DATABASE IF EXISTS food_truck_company;

CREATE DATABASE food_truck_company;

USE food_truck_company;

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
('Quincy', '2024-10-13 11:13:42', 21.46, 5),
('Charlie', '2024-10-13 12:18:26', 33.09, 1),
('Bob', '2024-10-13 12:30:07', 40.81, 6),
('Quincy', '2024-10-13 13:58:29', 46.15, 2),
('Olivia', '2024-10-13 14:18:42', 24.25, 6),
('Grace', '2024-10-13 14:58:47', 23.58, 3),
('Rachel', '2024-10-13 15:59:22', 99.17, 4),
('Quincy', '2024-10-13 16:20:07', 50.16, 3),
('Rachel', '2024-10-13 19:13:39', 64.74, 3),
('Paul', '2024-10-13 19:33:29', 55.47, 3),
('Isaac', '2024-10-13 20:28:32', 82.91, 4),
('Tina', '2024-10-13 20:36:06', 42.33, 6),
('Hannah', '2024-10-13 22:06:22', 20.21, 2),
('Mia', '2024-10-13 22:46:17', 39.80, 4),
('Frank', '2024-10-14 10:03:14', 81.86, 6),
('Isaac', '2024-10-14 11:02:40', 95.16, 3),
('David', '2024-10-14 11:11:23', 43.25, 4),
('Quincy', '2024-10-14 11:44:29', 57.37, 1),
('Sam', '2024-10-14 12:20:01', 70.08, 1),
('Noah', '2024-10-14 12:28:05', 50.55, 3),
('Jack', '2024-10-14 12:39:44', 68.44, 5),
('Quincy', '2024-10-14 12:49:47', 94.41, 6),
('Frank', '2024-10-14 13:27:52', 59.99, 1),
('Paul', '2024-10-14 13:59:22', 20.71, 2),
('Liam', '2024-10-14 16:54:32', 22.02, 4),
('Eve', '2024-10-14 18:04:34', 23.33, 4),
('Hannah', '2024-10-14 18:15:52', 75.95, 2),
('Quincy', '2024-10-14 19:11:57', 40.68, 6),
('Bob', '2024-10-14 20:40:43', 25.07, 1),
('Charlie', '2024-10-14 21:08:53', 77.85, 4),
('Jack', '2024-10-14 21:43:13', 23.11, 3),
('David', '2024-10-14 22:56:17', 75.98, 6),
('Olivia', '2024-10-15 12:45:53', 41.45, 4),
('Liam', '2024-10-15 13:06:05', 74.32, 6),
('Jack', '2024-10-15 13:23:42', 95.14, 1),
('Mia', '2024-10-15 14:10:26', 38.96, 4),
('Kelly', '2024-10-15 15:04:21', 84.88, 5),
('Eve', '2024-10-15 15:58:33', 60.80, 3),
('Charlie', '2024-10-15 16:17:23', 79.13, 3),
('Hannah', '2024-10-15 16:42:01', 73.75, 2),
('Alice', '2024-10-15 16:53:43', 42.84, 3),
('Isaac', '2024-10-15 17:02:35', 92.97, 4),
('Jack', '2024-10-15 17:14:04', 94.82, 5),
('Kelly', '2024-10-15 18:30:26', 62.78, 1),
('Quincy', '2024-10-16 10:24:58', 57.37, 1),
('Rachel', '2024-10-16 11:35:15', 65.88, 1),
('Bob', '2024-10-16 12:14:26', 40.81, 6),
('Paul', '2024-10-16 12:52:44', 55.47, 3),
('Mia', '2024-10-16 15:11:33', 39.80, 4),
('Hannah', '2024-10-16 15:38:16', 75.95, 2),
('Alice', '2024-10-16 18:19:33', 42.84, 3),
('Kelly', '2024-10-16 19:47:02', 75.10, 4),
('Jack', '2024-10-17 10:03:15', 95.14, 1),
('Eve', '2024-10-17 12:12:17', 93.14, 4),
('Olivia', '2024-10-17 14:23:11', 41.45, 4),
('Tina', '2024-10-17 15:36:15', 63.55, 6),
('Paul', '2024-10-17 18:01:04', 56.95, 6),
('Grace', '2024-10-17 19:22:05', 49.99, 6),
('Hannah', '2024-10-17 20:15:33', 75.95, 2),
('Mia', '2024-10-17 21:10:46', 85.35, 5),
('Charlie', '2024-10-17 22:45:55', 88.29, 2),
('Emma', '2024-10-18 09:15:22', 45.67, 3),
('Lucas', '2024-10-18 10:45:33', 34.56, 2),
('Sophia', '2024-10-18 11:30:44', 67.89, 4),
('Ethan', '2024-10-18 12:15:55', 55.55, 5),
('Ava', '2024-10-18 13:00:11', 29.99, 1),
('Mason', '2024-10-18 14:45:22', 88.88, 6),
('Isabella', '2024-10-18 15:30:33', 77.77, 3),
('James', '2024-10-18 16:15:44', 66.66, 2),
('Charlotte', '2024-10-18 17:00:55', 44.44, 4),
('Benjamin', '2024-10-18 18:45:11', 33.33, 5),
('Amelia', '2024-10-18 19:30:22', 22.22, 1),
('Elijah', '2024-10-18 20:15:33', 11.11, 6),
('Harper', '2024-10-18 21:00:44', 99.99, 3),
('Daniel', '2024-10-18 22:45:55', 88.88, 2),
('Evelyn', '2024-10-19 09:15:22', 77.77, 4),
('Logan', '2024-10-19 10:45:33', 66.66, 5),
('Abigail', '2024-10-19 11:30:44', 55.55, 1),
('Alexander', '2024-10-19 12:15:55', 44.44, 6),
('Emily', '2024-10-19 13:00:11', 33.33, 3),
('Michael', '2024-10-19 14:45:22', 22.22, 2),
('Madison', '2024-10-19 15:30:33', 11.11, 4),
('William', '2024-10-19 16:15:44', 99.99, 5),
('Ella', '2024-10-19 17:00:55', 88.88, 1),
('Oliver', '2024-10-19 18:45:11', 77.77, 6),
('Scarlett', '2024-10-19 19:30:22', 66.66, 3),
('Henry', '2024-10-19 20:15:33', 55.55, 2),
('Avery', '2024-10-19 21:00:44', 44.44, 4),
('Sebastian', '2024-10-19 22:45:55', 33.33, 5),
('Sofia', '2024-10-20 09:15:22', 22.22, 1),
('Jackson', '2024-10-20 10:45:33', 11.11, 6),
('Lily', '2024-10-20 11:30:44', 99.99, 3),
('Aiden', '2024-10-20 12:15:55', 88.88, 2),
('Chloe', '2024-10-20 13:00:11', 77.77, 4),
('Carter', '2024-10-20 14:45:22', 66.66, 5),
('Victoria', '2024-10-20 15:30:33', 55.55, 1),
('Luke', '2024-10-20 16:15:44', 44.44, 6),
('Grace', '2024-10-20 17:00:55', 33.33, 3),
('Ryan', '2024-10-20 18:45:11', 22.22, 2),
('Zoe', '2024-10-20 19:30:22', 11.11, 4),
('Owen', '2024-10-20 20:15:33', 99.99, 5),
('Nora', '2024-10-20 21:00:44', 88.88, 1),
('Wyatt', '2024-10-20 22:45:55', 77.77, 6);
