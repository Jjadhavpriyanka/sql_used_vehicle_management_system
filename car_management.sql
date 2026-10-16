USE usedCarManagment;

-- User table 
CREATE TABLE users ( 
    userID INT AUTO_INCREMENT PRIMARY KEY,   
    firstName VARCHAR(50) NOT NULL, 
    lastName VARCHAR(50), 
    email VARCHAR(100) UNIQUE NOT NULL,      
    phone VARCHAR(15), 
    userType ENUM ('admin', 'seller', 'buyer'),  
    INDEX (email)                            
); 

INSERT INTO users (firstName, lastName, email, phone, userType) 
VALUES 
('Priyanshi', 'Sharma', 'priya.sharma@gmail.com', '+44-1234567890', 'seller'), 
('John', 'Dowy', 'john.Dowy@gmail.com', '+44-8765432109', 'buyer'), 
('Emily', 'Williams', 'emily.Williams@gmail.com', '+44-7654321098', 'admin'), 
('Sophia', 'Brown', 'sophia.Brown@gmail.com', '+44-6543210987', 'seller'), 
('Akira', 'Tanaka', 'akira.Tanaka@gmail.com', '+44-5432109876', 'buyer'), 
('Fatima', 'Khan', 'fatima.Khan@gmail.com', '+44-4321098765', 'admin'), 
('Liam', 'Johnson', 'liam.Johnson@gmail.com', '+44-3210987654', 'buyer'), 
('Wei', 'Zhang', 'wei.Zhang@gmail.com', '+44-2109876543', 'seller'), 
('Maria', 'Garcia', 'maria.Garcia@gmail.com', '+44-1098765432', 'admin'), 
('Robert', 'Smith', 'robert.Smith@gmail.com', '+44-1987654321', 'buyer'), 
('Alice', 'Walker', 'alice.Walker@gmail.com', '+44-1234567890', 'seller'), 
('James', 'Miller', 'james.Miller@gmail.com', '+44-9876543211', 'buyer'), 
('Helen', 'King', 'helen.King@gmail.com', '+44-8765432108', 'admin'), 
('Leo', 'Martinez', 'leo.Martinez@gmail.com', '+44-7654321097', 'seller'), 
('Nora', 'Lee', 'nora.Lee@gmail.com', '+44-6543210986', 'buyer'), 
('Ethan', 'Clark', 'ethan.Clark@gmail.com', '+44-5432109875', 'admin'), 
('Emma', 'Davis', 'emma.Davis@gmail.com', '+44-4321098764', 'buyer'), 
('Olivia', 'Jones', 'olivia.Jones@gmail.com', '+44-3210987653', 'seller'), 
('Mia', 'Wilson', 'mia.Wilson@gmail.com', '+44-2109876542', 'admin'), 
('Noah', 'White', 'noah.White@gmail.com', '+44-1098765431', 'buyer'); 


-- Seller table 

CREATE TABLE seller ( 
    userID INT PRIMARY KEY NOT NULL, 
    taxID VARCHAR(50) NOT NULL, 
    FOREIGN KEY (userID) REFERENCES users(userID) 
); 

INSERT INTO seller (userID, taxID) 
VALUES 
(1, 'TAX001-UK'), 
(4, 'TAX002-UK'), 
(8, 'TAX003-UK'), 
(11, 'TAX004-UK'), 
(14, 'TAX005-UK'),
(18, 'TAX006-UK');

 -- Buyer table 

CREATE TABLE buyer ( 
    userID INT PRIMARY KEY NOT NULL, 
    preferredPaymentMethod VARCHAR(50) NOT NULL, 
    shippingAddress VARCHAR(255) NOT NULL, 
    FOREIGN KEY (userID) REFERENCES users(userID) 
); 

INSERT INTO buyer (userID, preferredPaymentMethod, shippingAddress) 
VALUES 
(2, 'Credit Card', '6 Rowan Terrace, Meadowfield, Cardiff, CF15 &XA'), 
(5, 'PayPal', '21 Birch Crescent, Stonebridge, Glasgow, G40 4HD'), 
(7, 'Debit Card', '17 Cedar Close, Fairbrook, Liverpool, L14 7QP'), 
(10, 'Cash', '30 Kings Road, Elmbury, Bristol, BS8 1PL'), 
(12, 'Credit Card', '89 Rosewood Avenue, Ashbridge, Leeds, LS9 2TW'), 
(15, 'PayPal', '5 Willow Lane, Heatherton, Birmingham, B25 3HL'), 
(17, 'Debit Card', '42 High Street, Waverley, London, SE5 9DU'), 
(20, 'Cash', '12 Maple Grove, Oakley, Manchester, M16 8BX'); 


-- Admin table 
CREATE TABLE admin ( 
    userID INT PRIMARY KEY NOT NULL, 
    department VARCHAR(50) NOT NULL, 
    accessLevel INT DEFAULT 1,                
    FOREIGN KEY (userID) REFERENCES users(userID) 
); 


INSERT INTO admin (userID, department, accessLevel) 
VALUES 
(3, 'IT', 3), 
(6, 'HR', 2), 
(9, 'Finance', 1), 
(13, 'Operations', 2), 
(16, 'Security', 3), 
(19, 'R&D', 1); 


-- Vehicle category table 
CREATE TABLE vehicleCategory ( 
    categoryID INT AUTO_INCREMENT NOT NULL PRIMARY KEY, 
    categoryName VARCHAR(50) NOT NULL UNIQUE, 
    parentCategoryID INT, 
    FOREIGN KEY (parentCategoryID) REFERENCES vehicleCategory(categoryID) 
); 

INSERT INTO vehicleCategory(categoryID, categoryName, parentCategoryID)  
VALUES 
(1, 'CAR', NULL), 
(2, 'VAN', NULL), 
(3, 'BIKE', NULL), 
(4, 'TRUCK', NULL), 
(5, 'Hatchback', 1), 
(6, 'Sedan', 1), 
(7, 'SUV', 1), 
(8, 'Coupe', 1), 
(9, 'Convertible', 1), 
(10, 'Estate', 1), 
(11, 'Crossover', 1), 
(12, 'Passenger Van', 2), 
(13, 'Cargo Van', 2), 
(14, 'Mini Van', 2), 
(15, 'High Roof Van', 2), 
(16, 'Flatbed Van', 2), 
(17, 'Electric Van', 2), 
(18, 'Luxury Van', 2), 
(19, 'Sports Bike', 3), 
(20, 'Cruiser Bike', 3), 
(21, 'Touring Bike', 3), 
(22, 'Off-Road Bike', 3), 
(23, 'Standard Bike', 3), 
(24, 'Electric Bike', 3), 
(25, 'Scooter', 3), 
(26, 'Flatbed Truck', 5), 
(27, 'Tanker Truck', 5), 
(28, 'Box Truck', 5), 
(29, 'Dump Truck', 5), 
(30, 'Refrigerated Truck', 5), 
(31, 'Logging Truck', 5), 
(32, 'Electric Truck', 5); 



-- vehicle table
CREATE TABLE vehicle ( 
    vehicleID INT AUTO_INCREMENT PRIMARY KEY,  
    make VARCHAR(50) NOT NULL,                   
    model VARCHAR(50) NOT NULL,                 
    fuelType VARCHAR(20),                      
    modelYear YEAR NOT NULL,            
    mileage INT NOT NULL CHECK (mileage >= 0), 
    price DECIMAL(10, 2) NOT NULL,              
    color VARCHAR(20), 
    previousOwner INT, 
    serviceHistory ENUM ('Full','Partial'), 
    transmission ENUM ('Automatic', 'Manual', 'Semi-Automatic'), 
    categoryID INT NOT NULL,  
    userID INT NOT NULL, 
    FOREIGN KEY (categoryID) REFERENCES vehicleCategory(categoryID), 
    FOREIGN KEY (userID) REFERENCES users(userID) 
); 


DELIMITER $$  
CREATE TRIGGER validate_modelYear 
BEFORE INSERT ON vehicle 
FOR EACH ROW 
BEGIN 
    IF NEW.modelYear < 1986 OR NEW.modelYear > YEAR(CURDATE()) THEN 
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'modelYear must be between 1986 and the current year'; 
    END IF; 
END$$ 
DELIMITER ; 

 
INSERT INTO vehicle (categoryID, userID, make, model, fuelType, modelYear, mileage, price, color, previousOwner, serviceHistory, transmission) 
VALUES 
(6, 4, 'Toyota', 'Corolla', 'Petrol', 2018, 25000, 15000, 'White', 1, 'Full', 'Automatic'), 
(7, 1, 'Honda', 'CR-V', 'Diesel', 2020, 15000, 25000, 'Black', 1, 'Full', 'Automatic'), 
(5, 1, 'Ford', 'Fiesta', 'Petrol', 2017, 35000, 12000, 'Blue', 2, 'Partial', 'Manual'), 
(8, 8, 'BMW', '3 Series', 'Diesel', 2021, 10000, 30000, 'Red', 1, 'Full', 'Automatic'), 
(9, 4, 'Mercedes-Benz', 'C-Class', 'Petrol', 2022, 8000, 35000, 'Silver', 2, 'Full', 'Automatic'), 
(10, 8, 'Audi', 'A6 Avamt', 'Diesel', 2019, 20000, 28000, 'Grey', 1, 'Full', 'Automatic'), 
(11, 1, 'Nissan', 'Juke', 'Petrol', 2016, 45000, 11000, 'Black', 3, 'Partial', 'Manual'), 
(13, 14, 'Volkswagon', 'Transporter', 'Diesel', 2018, 30000, 25000, 'White', 1, 'Full', 'Manual'), 
(15, 14, 'Ford', 'Transit', 'Diesel', 2021, 15000, 32000, 'Silver', 1, 'Full', 'Automatic'), 
(17, 14, 'Tesla', 'Model X', 'Electric', 2023, 5000, 70000, 'Blue', 1, 'Full', 'Automatic'), 
(19, 11, 'Kawasaki', 'Ninja 650', 'Petrol', 2022, 3000, 9000, 'Green', 1, 'Full', 'Manual'), 
(20, 8, 'Harley-Davidson', 'Fat Boy', 'Petrol', 2020, 8000, 15000, 'Black', 1, 'Full', 'Manual'), 
(21, 11, 'BMW Motorrad', 'K 1600 GT', 'Petrol', 2012, 5000, 25000, 'Silver', 1, 'Full', 'Manual'), 
(22, 8, 'KTM', '250 EXC', 'Petrol', 2019, 12000, 6000, 'Orange', 2, 'Partial', 'Manual'), 
(23, 11, 'Honda', 'CB500F', 'Petrol', 2020, 10000, 7000, 'Red', 1, 'Full', 'Manual'), 
(25, 8, 'Piaggio', 'Vespa GTS', 'Petrol', 2023, 500, 5000, 'White', 1, 'Full', 'Automatic'), 
(16, 14, 'Iveco', 'Daily Flatbed', 'Diesel', 2022, 20000, 40000, 'White', 1, 'Full', 'Manual'), 
(27, 18, 'Volvo', 'FH166 750', 'Diesel', 2020, 100000, 120000, 'White', 1, 'Full', 'Manual'), 
(26, 18, 'Mercedes-Benz', 'Arocs 3345', 'Diesel', 2019, 80000, 95000, 'Red', 2, 'Full', 'Automatic'), 
(29, 18, 'Caterpillar', '725C', 'Diesel', 2012, 20000, 150000, 'Yellow', 1, 'Full', 'Manual'), 
(28, 18, 'Isuzu', 'NQR', 'Diesel', 2018, 50000, 55000, 'Grey', 1, 'Partial', 'Automatic'), 
(31, 18, 'Kenworth', 'T800', 'Diesel', 2020, 90000, 115000, 'Blue', 1, 'Full', 'Manual'); 


-- Car table 

CREATE TABLE car ( 
    vehicleID INT PRIMARY KEY, 
    doors INT, 
    seats INT 
); 

INSERT INTO car (vehicleID, doors, seats) 
VALUES  
(1, 4, 5), 
(2, 5, 5), 
(3, 3, 5), 
(4, 4, 5), 
(5, 4, 5), 
(6, 5, 5), 
(7, 5, 5); 

-- Bike table 

CREATE TABLE bike ( 
    vehicleID INT NOT NULL PRIMARY KEY, 
    frameMaterial VARCHAR(50) NOT NULL,  
    frameSize DECIMAL(4, 1) NOT NULL,  
    numberOfGears INT,  
    brakeType VARCHAR(50),  
    suspensionType VARCHAR(50), 
    tireWidth DECIMAL(3, 1),  
    kickstandPresent BOOLEAN 
); 

INSERT INTO bike (vehicleID, frameMaterial, frameSize, numberOfGears, brakeType, suspensionType, tireWidth, kickstandPresent) 
VALUES 
(11, 'Aluminium', 17, 6, 'Disc', 'Front', 2.1, TRUE), 
(12, 'Steel', 19.0, 6, 'Disc', 'Dual', 2.5, TRUE), 
(13, 'Steel', 20.0, 6, 'Disc', 'Telelever', 2.3, TRUE),  
(14, 'Chromoly', 16.0, 5, 'Drum', 'None', 1.9, FALSE),  
(15, 'Aluminum', 21.0, 7, 'Disc', 'Double-wishbone', 3.0, TRUE),  
(16, 'Steel', 14.0, NULL, 'Disc', 'Single-arm', 1.8, TRUE); 


-- Van table 

CREATE TABLE van ( 
    vehicleID INT PRIMARY KEY, 
    highRoof ENUM ('Yes', 'No'), 
    cabType VARCHAR (50), 
    emissionClass VARCHAR (50), 
    Wheelbase VARCHAR (20) 
); 

INSERT INTO van (vehicleID, highRoof, cabType, emissionClass, Wheelbase) 
VALUES 
(8, 'Yes', 'Standard Cab', 'Euro VI', 'Medium'),  
(9, 'No', 'Standard Cab', 'Euro VI', 'Short'),  
(10, 'No', 'Standard Cab', 'Zero Emission', 'Long'),  
(17, 'Yes', 'Flatbed Cab', 'Euro VI', 'Long'); 


-- Truck table 

CREATE TABLE truck ( 
vehicleID INT PRIMARY KEY, 
axles VARCHAR (10), 
grossVehicleWeight INT NOT NULL, 
enginePower INT, 
cabType VARCHAR (50), 
emissionClass VARCHAR (10) 
); 

INSERT INTO truck (vehicleID, axles, grossVehicleWeight, enginePower, cabType, emissionClass) 
VALUES 
(18, '6x4', 44000, 540, 'Sleeper Cab', 'Euro VI'),  
(19, '6x4', 26000, 450, 'ClassicSpace', 'Euro VI'),  
(20, '6x6', 24000, 375, 'Day Cab', 'Tier 4'),  
(21, '4x2', 7500, 190, 'Standard Cab', 'Euro V'),  
(22, '6x4', 36000, 500, 'Aerodynamic Cab', 'EPA 2010'); 



-- Order table 
CREATE TABLE orders ( 
    orderID INT AUTO_INCREMENT PRIMARY KEY, 
    userID INT NOT NULL,                       
    vehicleID INT NOT NULL,                       
    orderDate DATETIME DEFAULT CURRENT_TIMESTAMP, 
    orderStatus ENUM('Pending', 'Confirmed', 'Cancelled', 'Completed') NOT NULL, 
    totalAmount DECIMAL(10, 2) NOT NULL,     
    paymentMethod VARCHAR(50),  
    FOREIGN KEY (userID) REFERENCES users(userID), 
    FOREIGN KEY (vehicleID) REFERENCES vehicle(vehicleID) 
); 

INSERT INTO orders (userID, vehicleID, orderDate, orderStatus, totalAmount, paymentMethod) 
VALUES 
(2, 2, '2025-04-10 10:30:00', 'Confirmed', 15000.00, 'Credit Card'), 
(10, 4, '2025-04-11 14:00:00', 'Pending', 18000.00, 'PayPal'), 
(2, 6, '2025-04-12 09:15:00', 'Completed', 32000.00, 'Cash'), 
(10, 7, '2025-04-13 16:30:00', 'Cancelled', 28000.00, 'Bank Transfer'), 
(12, 5, '2025-04-14 11:45:00', 'Confirmed', 35000.00, 'Credit Card'), 
(5, 13, '2025-04-15 13:00:00', 'Pending', 45000.00, 'Cash'), 
(17, 15, '2025-04-16 17:45:00', 'Completed', 30000.00, 'PayPal'), 
(5, 14, '2025-04-17 12:20:00', 'Confirmed', 40000.00, 'Bank Transfer'), 
(12, 21, '2025-04-18 15:15:00', 'Cancelled', 20000.00, 'Credit Card'), 
(7, 18, '2025-04-19 08:50:00', 'Completed', 32000.00, 'Cash'), 
(20, 8, '2025-04-20 14:10:00', 'Pending', 25000.00, 'PayPal'), 
(15, 10, '2025-04-21 09:30:00', 'Completed', 50000.00, 'Bank Transfer'); 


-- Sales table 

CREATE TABLE sales ( 
    saleID INT AUTO_INCREMENT PRIMARY KEY,  
    orderID INT NOT NULL,                
    vehicleID INT NOT NULL,                                
    buyerID INT NOT NULL,                                  
    sellerID INT NOT NULL,                                 
    saleDate DATETIME DEFAULT CURRENT_TIMESTAMP,           
    paymentStatus ENUM('Pending', 'Paid', 'Refunded')  DEFAULT 'Pending',                                 
    totalAmount DECIMAL(10, 2) NOT NULL,                   
    paymentMethod VARCHAR(50)  
        CHECK (paymentMethod IN ('Cash', 'Credit Card', 'PayPal', 'Bank Transfer')),  
    notes TEXT,                                           
    FOREIGN KEY (vehicleID) REFERENCES vehicle(vehicleID), 
    FOREIGN KEY (buyerID) REFERENCES users(userID),     
    FOREIGN KEY (sellerID) REFERENCES users(userID) 
); 

CREATE INDEX idx_saleDate ON sales(saleDate); 

INSERT INTO sales (orderID, vehicleID, buyerID, sellerID, saleDate, paymentStatus, totalAmount, paymentMethod, notes)
VALUES 
(1, 2, 2, 1, '2025-04-10 10:30:00', 'Paid', 25000.00, 'Credit Card', 'Smooth transaction. Buyer satisfied.'), 
(2, 4, 10, 8, '2025-04-11 14:00:00', 'Pending', 30000.00, 'PayPal', 'Awaiting payment confirmation.'), 
(3, 6, 2, 11, '2025-04-12 09:15:00', 'Paid', 28000.00, 'Cash', 'Buyer inspected vehicle before payment.'), 
(4, 7, 10, 11, '2025-04-13 16:30:00', 'Refunded', 11000.00, 'Bank Transfer', 'Transaction cancelled due to documentation issue.'), 
(5, 5, 12, 1, '2025-04-14 11:45:00', 'Paid', 35000.00, 'Credit Card', 'First-time buyer. Seller provided excellent service.'), 
(6, 13, 5, 4, '2025-04-15 13:00:00', 'Pending', 25000.00, 'Cash', 'Vehicle delivery scheduled.'), 
(7, 15, 17, 14, '2025-04-16 17:45:00', 'Paid', 7000.00, 'PayPal', 'Smooth transaction. Buyer happy with purchase.'), 
(8, 14, 5, 8, '2025-04-17 12:20:00', 'Paid', 6000.00, 'Bank Transfer', 'Seller offered extended warranty.'), 
(9, 21, 12, 4, '2025-04-18 15:15:00', 'Refunded', 55000.00, 'Credit Card', 'Buyer returned vehicle due to quality issues.'), 
(10, 18, 7, 18, '2025-04-19 08:50:00', 'Paid', 120000.00, 'Cash', 'Buyer confirmed receipt. Transaction successful.'), 
(11, 20, 8, 14, '2025-04-20 14:10:00', 'Pending', 25000.00, 'PayPal', 'Vehicle delivery scheduled.'), 
(12, 15, 10, 18, '2025-04-21 09:30:00', 'Paid', 70000.00, 'Bank Transfer', 'Smooth transaction. Buyer satisfied.'); 

-- Shipping table: 
CREATE TABLE shipping ( 
    shippingID INT AUTO_INCREMENT PRIMARY KEY, 
    orderID INT NOT NULL, 
    saleID INT NOT NULL,    
    paymentStatus ENUM('Pending', 'Paid', 'Refunded')  
        DEFAULT 'Pending',                     
    deliveryAddress VARCHAR(255) NOT NULL,      
    shippingDate DATETIME DEFAULT CURRENT_TIMESTAMP,   
    estimatedDeliveryDate DATE,                
    actualDeliveryDate DATE,                   
    shippingStatus ENUM('Pending', 'In Transit', 'Delivered', 'Delayed') NOT NULL DEFAULT 'Pending',   
    carrierName VARCHAR(50) CHECK (carrierName != ''),   
    trackingNumber VARCHAR(100),   
    FOREIGN KEY (saleID) REFERENCES sales(saleID), 
    FOREIGN KEY (orderID) REFERENCES orders(orderID) ON DELETE CASCADE  
); 

INSERT INTO shipping (orderID, saleID, paymentStatus, deliveryAddress, shippingDate, estimatedDeliveryDate, actualDeliveryDate, shippingStatus, carrierName, trackingNumber) 
VALUES 
(1, 1, 'Paid', '6 Rowan Terrace, Meadowfield, Cardiff, CF15 7XA', '2025-04-10', '2025-04-15', '2025-04-15', 'Delivered', 'FedEx', 'TRACK12345'), 
(2, 2, 'Pending', '30 Kings Road, Elmbury, Bristol, BS8 1PL', '2025-04-11', '2025-04-17', NULL, 'In Transit', 'DHL', 'TRACK67890'), 
(3, 3, 'Paid', '21 Birch Crescent, Stonebridge, Glasgow, G40 4HD', '2025-04-12', '2025-04-16', '2025-04-16', 'Delayed', 'UPS', 'TRACK54321'), 
(4, 4, 'Refunded', '12 Maple Grove, Oakley, Manchester, M16 8BX', '2025-04-13', '2025-04-19', NULL, 'Delivered', 'Royal Mail', 'TRACK98765'), 
(5, 5, 'Paid', '12 Maple Grove, Oakley, Manchester, M16 8BX', '2025-04-14', '2025-04-20', NULL, 'In Transit', 'Hermes', 'TRACK11223'), 
(6, 6, 'Pending', '42 High Street, Waverley, London, SE5 9DU', '2025-04-15', '2025-04-22', NULL, 'Pending', 'DPD', 'TRACK44567'), 
(7, 7, 'Paid', '6 Rowan Terrace, Meadowfield, Cardiff, CF15 7XA', '2025-04-16', '2025-04-23', '2025-04-23', 'Delivered', 'FedEx', 'TRACK55678'), 
(8, 8, 'Paid', '5 Willow Lane, Heatherton, Birmingham, B25 3HL', '2025-04-17', '2025-04-24', NULL, 'Pending', 'UPS', 'TRACK66789'), 
(9, 9, 'Refunded', '30 Kings Road, Elmbury, Bristol, BS8 1PL', '2025-04-18', '2025-04-25', NULL, 'Delivered', 'DHL', 'TRACK77890'), 
(10, 10, 'Paid', '89 Rosewood Avenue, Ashbridge, Leeds, LS9 2TW', '2025-04-19', '2025-04-26', '2025-04-26', 'Delayed', 'Royal Mail', 'TRACK88901'), 
(11, 11, 'Pending', '17 Cedar Close, Fairbrook, Liverpool, L14 7QP', '2025-04-20', '2025-04-27', NULL, 'Pending', 'Hermes', 'TRACK99012'), 
(12, 12, 'Paid', '21 Birch Crescent, Stonebridge, Glasgow, G40 4HD', '2025-04-21', '2025-04-28', '2025-04-28', 'Delivered', 'DPD', 'TRACK10123'); 



-- Filter criteria table
CREATE TABLE filterCriteria ( 
    filterCriteriaID INT AUTO_INCREMENT PRIMARY KEY, 
    make VARCHAR(50), 
    model VARCHAR(50), 
    yearFrom INT, 
    yearTo INT, 
    priceMin DECIMAL(10,2) DEFAULT 0.00, 
    priceMax DECIMAL(10,2) DEFAULT 0.00, 
    mileageMin INT CHECK (mileageMin >= 0),            
    mileageMax INT CHECK (mileageMax >= 0),              
    bodyType VARCHAR(50), 
    fuelType VARCHAR(20), 
    transmissionType VARCHAR(20), 
    location VARCHAR(100), 
    INDEX idx_bodyType (bodyType),                       
    INDEX idx_search_criteria (make, model, yearFrom, yearTo) ); 

INSERT INTO filterCriteria (make, model, yearFrom, yearTo, priceMin, priceMax, mileageMin, mileageMax, bodyType, fuelType, transmissionType, location) 
VALUES 
('Toyota', 'Corolla', 2015, 2019, 14000.00, 20000.00, 10000, 30000, 'Sedan', 'Petrol', 'Automatic', 'London'), 
('Honda', 'CR-V', 2018, 2022, 22000.00, 30000.00, 10000, 20000, 'SUV', 'Diesel', 'Automatic', 'Manchester'), 
('Ford', 'Fiesta', 2015, 2020, 8000.00, 15000.00, 30000, 50000, 'Hatchback', 'Petrol', 'Manual', 'Birmingham'), 
('BMW', '3 Series', 2019, 2022, 28000.00, 35000.00, 5000, 15000, 'Sedan', 'Diesel', 'Automatic', 'Glasgow'), 
('Mercedes-Benz', 'C-Class', 2020, 2023, 33000.00, 45000.00, 8000, 12000, 'Sedan', 'Petrol', 'Automatic', 'Leeds'), 
('Audi', 'A6 Avamt', 2018, 2021, 25000.00, 30000.00, 15000, 30000, 'Estate', 'Diesel', 'Automatic', 'Bristol'), 
('Nissan', 'Juke', 2016, 2019, 9000.00, 13000.00, 40000, 60000, 'SUV', 'Petrol', 'Manual', 'Sheffield'), 
('Volkswagon', 'Transporter', 2017, 2020, 20000.00, 30000.00, 20000, 40000, 'Van', 'Diesel', 'Manual', 'Cardiff'), 
('Ford', 'Transit', 2020, 2023, 28000.00, 35000.00, 10000, 20000, 'Van', 'Diesel', 'Automatic', 'Bristol'), 
('Tesla', 'Model X', 2022, 2024, 60000.00, 80000.00, 0, 10000, 'SUV', 'Electric', 'Automatic', 'Cambridge'), 
('Kawasaki', 'Ninja 650', 2020, 2023, 8000.00, 10000.00, 2000, 5000, 'Sportsbike', 'Petrol', 'Manual', 'Newcastle'), 
('Harley-Davidson', 'Fat Boy', 2018, 2021, 13000.00, 17000.00, 6000, 9000, 'Cruiser', 'Petrol', 'Manual', 'Liverpool'), 
('BMW Motorrad', 'K 1600 GT', 2010, 2015, 20000.00, 30000.00, 3000, 8000, 'Touring Bike', 'Petrol', 'Manual', 'Leeds'), 
('KTM', '250 EXC', 2018, 2021, 5000.00, 8000.00, 8000, 15000, 'Motocross', 'Petrol', 'Manual', 'Belfast'), 
('Honda', 'CB500F', 2018, 2022, 6000.00, 9000.00, 5000, 12000, 'Standard Bike', 'Petrol', 'Manual', 'Edinburgh'), 
('Piaggio', 'Vespa GTS', 2020, 2023, 4000.00, 6000.00, 0, 1500, 'Scooter', 'Petrol', 'Automatic', 'London'), 
('Iveco', 'Daily Flatbed', 2020, 2023, 30000.00, 45000.00, 10000, 25000, 'Flatbed Van', 'Diesel', 'Manual', 'Liverpool'), 
('Volvo', 'FH166 750', 2018, 2023, 100000.00, 130000.00, 80000, 110000, 'Heavy Truck', 'Diesel', 'Manual', 'Manchester'), 
('Mercedes-Benz', 'Arocs 3345', 2017, 2021, 85000.00, 100000.00, 70000, 90000, 'Heavy Truck', 'Diesel', 'Automatic', 'Leeds'), 
('Caterpillar', '725C', 2010, 2015, 140000.00, 160000.00, 10000, 50000, 'Articulated Truck', 'Diesel', 'Manual', 'Glasgow'), 
('Isuzu', 'NQR', 2015, 2018, 50000.00, 60000.00, 30000, 60000, 'Medium Truck', 'Diesel', 'Automatic', 'Cardiff'), 
('Kenworth', 'T800', 2018, 2023, 110000.00, 130000.00, 80000, 120000, 'Heavy Truck', 'Diesel', 'Manual', 'Sheffield'); 

-- Search Filter table 
CREATE TABLE searchFilter ( 
    searchFilterID INT AUTO_INCREMENT PRIMARY KEY,       
    userID INT NOT NULL,                                 
    filterCriteriaID INT NOT NULL,                       
    filterName VARCHAR(50) NOT NULL,                 
    createdDate DATETIME DEFAULT CURRENT_TIMESTAMP,       
    isActive BOOLEAN DEFAULT TRUE, 
    INDEX idx_isActive (isActive),                    
    INDEX idx_filterName (filterName),                  
    FOREIGN KEY (userID) REFERENCES users(userID) ON DELETE CASCADE, 
    FOREIGN KEY (filterCriteriaID) REFERENCES filterCriteria(filterCriteriaID) ON DELETE CASCADE  
); 

INSERT INTO searchFilter (userID, filterCriteriaID, createdDate, filterName, isActive) 
VALUES 
(5, 22, '2023-06-01', 'Affordable Sedans', TRUE),  
(17, 15, '2023-06-05', 'Reliable SUVs', TRUE),  
(4, 8, '2023-06-10', 'Compact Hatchbacks', TRUE),  
(17, 12, '2023-06-15', 'Luxury Sedans', FALSE),  
(10, 19, '2023-06-20', 'Executive Cars', TRUE),  
(20, 4, '2023-06-25', 'Estate Cars for Families', TRUE),  
(11, 2, '2023-07-01', 'Budget-Friendly SUVs', TRUE),  
(4, 5, '2023-07-05', 'Versatile Vans', FALSE),  
(15, 7, '2023-07-10', 'Durable Work Vans', TRUE),   
(7, 1, '2023-07-15', 'Electric SUVs', TRUE),  
(10, 9, '2023-07-20', 'High-Performance Sportsbikes', TRUE),  
(1, 3, '2023-07-25', 'Classic Cruisers', TRUE),  
(7, 20, '2023-08-01', 'Touring Bikes', FALSE),  
(5, 13, '2023-08-05', 'Motocross Adventures', TRUE),  
(1, 17,'2023-08-10', 'Standard Bikes for Everyday Use', TRUE),  
(8, 16, '2023-08-15', 'City-Friendly Scooters', TRUE),  
(15, 4, '2023-08-20', 'Heavy-Duty Vans', TRUE),  
(11, 10, '2023-08-25', 'Powerful Heavy Trucks', TRUE),  
(14, 18, '2023-09-01', 'Construction Trucks', TRUE),  
(12, 6, '2023-09-05', 'Off-Road Trucks', TRUE),  
(18, 11, '2023-09-10', 'Medium Work Trucks', TRUE),  
(12, 21, '2023-09-15', 'Long-Haul Trucks', FALSE);  



 -- Report  

CREATE TABLE report ( 
    reportId INT AUTO_INCREMENT PRIMARY KEY,                 
    reportName VARCHAR(100) NOT NULL,                        
    createdOn DATETIME DEFAULT CURRENT_TIMESTAMP,            
    generatedByUserId INT NOT NULL,                          
    reportParameters TEXT,                                   
    reportType VARCHAR(50),                                  
    reportStatus ENUM('Draft', 'In Progress', 'Completed', 'Failed') DEFAULT 'Draft',  
    descriptions TEXT,                                        
    lastUpdated DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  
    executionTime INT,                                       
    fileLocation VARCHAR(255),                               
    visibility ENUM('Public', 'Private', 'Restricted') DEFAULT 'Private',  
    associatedEntity VARCHAR(100), 
    filterCriteriaID INT, 
    vehicleID INT, 
    INDEX `idx_generatedByUserId` (generatedByUserId), 
    INDEX `idx_reportStatus` (reportStatus), 
    INDEX `idx_createdOn` (createdOn), 
    INDEX `idx_reportType` (reportType), 
    INDEX `idex_vehicle_filterCriteria` (vehicleID, filterCriteriaID), 
    FOREIGN KEY (generatedByUserId) REFERENCES users(userID), 
    FOREIGN KEY (vehicleID) REFERENCES vehicle(vehicleID), 
    FOREIGN KEY (filterCriteriaID) REFERENCES filterCriteria(filterCriteriaID) 
); 


INSERT INTO report (reportName, generatedByUserId, reportParameters, reportType, reportStatus, descriptions, executionTime, fileLocation, visibility, associatedEntity, filterCriteriaID, vehicleID)  
VALUES  
('Monthly Sales Summary', 3, '{"year": 2025, "month": "March"}', 'Summary', 'Completed', 'Monthly sales report generated successfully.', 30, '/files/reports/sales_march.pdf', 'Private', 'Sales Department', 1, 1), 
('Employee Leave Analysis', 6, '{"year": 2025, "type": "Leave"}', 'Detailed', 'In Progress', 'Analysing employee leave trends.', 45, NULL, 'Restricted', 'HR Department', NULL, NULL), 
('Year-End Financial Overview', 9, '{"year": 2024}', 'Statistical', 'Draft', 'Report prepared for year-end financial analysis.', NULL, NULL, 'Private', 'Finance Department', NULL, NULL), 
('Logistics Efficiency Report', 13, '{"quarter": "Q1"}', 'Log', 'Completed', 'Logistics performance metrics for Q1.', 20, '/files/reports/logistics_q1.pdf', 'Public', 'Operations Department', 13, NULL), 
('Incident Response Analysis', 16, '{"severity Level": "High"}', 'Detailed', 'Completed', 'Response analysis for high-severity incidents.', 60, '/files/reports/security_incident.pdf', 'Restricted', 'Security', NULL, NULL), 
('Patent Review Summary', 19, '{"area": "AI Innovations"}', 'Summary', 'In Progress', 'Overview of patent applications in AI.', NULL, NULL, 'Private', 'R&D Department', NULL, NULL), 
('System Performance Audit', 3, '{"servers": 10, "uptime Hours": 1000}', 'Detailed', 'Completed', 'Audit of system performance and server uptime.', 120, '/files/reports/system_audit.pdf', 'Private', 'IT Department', NULL, NULL), 
('Employee Satisfaction Survey', 6, '{"participants": 200, "year": 2025}', 'Statistical', 'In Progress', 'Survey results for employee satisfaction.', NULL, NULL, 'Restricted', 'HR Department', NULL, NULL), 
('Quarterly Budget Analysis', 9, '{"quarter": "Q1", "year": 2025}', 'Summary', 'Completed', 'Detailed breakdown of quarterly budgets.', 45, '/files/reports/q1_budget.pdf', 'Private', 'Finance Department', NULL, NULL), 
('Supply Chain Risk Assessment', 13, '{"risks assessed": 5, "severity": "Medium"}', 'Detailed', 'In Progress', 'Assessment of supply chain risks and mitigation strategies.', 90, NULL, 'Restricted', 'Operations Department', 7, NULL), 
('Vulnerability Scan Report', 16, '{"scan date": "2025-04-12", "vulnerabilities": 12}', 'Log', 'Completed', 'Summary of system vulnerabilities discovered during the scan.', 50, '/files/reports/vuln_scan.pdf', 'Public', 'Security Department', NULL, NULL), 
('Innovations Patent Filing', 19, '{"applications": 10, "pending": 3}', 'Summary', 'Draft', 'Details of recent patent filings in innovation sectors.', NULL, NULL, 'Private', 'R&D Department', NULL, NULL), 
('Incident Logs Report', 3, '{"incidents logged": 50, "resolved": 45}', 'Log', 'Completed', 'Log of IT incidents with resolutions provided.', 35, '/files/reports/incident_logs.pdf', 'Private', 'IT Department', NULL, NULL), 
('Recruitment Tracker', 6, '{"open positions": 20, "candidates": 150}', 'Detailed', 'Completed', 'Recruitment tracker for ongoing hiring processes.', 40, '/files/reports/recruitment_tracker.pdf', 'Private', 'HR Department', NULL, NULL); 


-- views for monitoring user search behaviour
CREATE VIEW ActiveSearchFilters AS 
								SELECT  
									sf.searchFilterID, 
									sf.filterCriteriaID,  
									sf.userID, 
									fc.make AS VehicleMake, 
									fc.model AS VehicleModel, 
									fc.yearFrom AS YearFrom, 
									fc.yearTo AS YearTo, 
									fc.priceMin AS PriceMin, 
									fc.priceMax AS PriceMax, 
									sf.filterName AS FilterName, 
									sf.createdDate AS CreatedDate, 
									sf.isActive AS IsActive 
								FROM searchFilter sf JOIN filterCriteria fc 
														  ON sf.filterCriteriaID = fc.filterCriteriaID 
													 JOIN users u 
														  ON sf.userID = u.userID 
								WHERE sf.isActive = TRUE; 

-- to analyse most popular vehicle makes and models, sellers can align their listings with demand trends, and pricing strategies
SELECT  
    fc.make AS PopularMake, 
    fc.model AS PopularModel, 
    COUNT(sf.searchFilterID) AS UsageCount, 
    ROUND(AVG(fc.priceMin), 2) AS AvgMinPrice, 
    ROUND(AVG(fc.priceMax), 2) AS AvgMaxPrice 
FROM ActiveSearchFilters sf JOIN filterCriteria fc 
								ON sf.filterCriteriaID = fc.filterCriteriaID 
GROUP BY fc.make, fc.model 
ORDER BY UsageCount DESC, AvgMinPrice ASC; 

-- time-based search trends (2023) and inventory planning
SELECT  
    CONCAT(fc.yearFrom, '-', fc.yearTo) AS YearRange, 
    fc.make AS VehicleMake, 
    fc.model AS VehicleModel, 
    COUNT(sf.searchFilterID) AS TotalFilters, 
    ROUND(AVG(fc.priceMin), 2) AS AvgPriceMin, 
    ROUND(AVG(fc.priceMax), 2) AS AvgPriceMax 
FROM ActiveSearchFilters sf JOIN filterCriteria fc 
								ON sf.filterCriteriaID = fc.filterCriteriaID 
WHERE sf.createdDate BETWEEN '2023-01-01' AND '2023-12-31' 
GROUP BY fc.make, fc.model, fc.yearFrom, fc.yearTo 
ORDER BY TotalFilters DESC; 

-- view for admin to monitor individual buyer transactions and buyers can view their order history
CREATE VIEW BuyerOrderHistory AS 
								SELECT  
									u.userID AS BuyerID, 
									o.orderID AS OrderID, 
									v.vehicleID AS VehicleID, 
									v.make AS Make, 
									v.model AS Model, 
									o.orderDate AS OrderDate, 
									s.shippingStatus AS ShippingStatus 
								FROM  users u INNER JOIN  orders o 
														ON  u.userID = o.userID 
											  INNER JOIN  shipping s 
														ON  o.orderID = s.orderID 
											  INNER JOIN  vehicle v 
														ON  o.vehicleID = v.vehicleID 
								WHERE  u.userType = 'buyer'; 
                                
-- checking delivery status
SELECT BuyerID, OrderID, Make, Model, OrderDate, ShippingStatus 
FROM BuyerOrderHistory 
WHERE ShippingStatus = 'Delivered'; 

-- total number of orders for each buyer
SELECT BuyerID, COUNT(OrderID) AS TotalOrders 
FROM BuyerOrderHistory 
GROUP BY BuyerID; 

-- stored procedures for generating custom report
DELIMITER // 
CREATE PROCEDURE GenerateCustomReport ( 
    IN startDate DATE, 
    IN endDate DATE) 
BEGIN 
    SELECT  
        vc.categoryName AS Category, 
        COUNT(s.saleID) AS VehiclesSold, 
        SUM(s.totalAmount) AS RevenueGenerated 
    FROM  sales s INNER JOIN  vehicle v 
							ON  s.vehicleID = v.vehicleID 
				  INNER JOIN  vehicleCategory vc 
							ON  v.categoryID = vc.categoryID 
	WHERE  s.saleDate BETWEEN startDate AND endDate 
    GROUP BY  vc.categoryName; 
END; 
// DELIMITER ;

CALL GenerateCustomReport('2025-04-10', '2025-04-21');	 

-- stored procedure for tracking shipping efficiency
DELIMITER // 
CREATE PROCEDURE TrackShippingEfficiency() 
BEGIN 
    SELECT  
        shp.carrierName AS Carrier, 
        COUNT (CASE WHEN shp.shippingStatus = 'Delivered' THEN 1 END)  / COUNT(*) * 100 AS DeliveryRate 
    FROM shipping shp 
    GROUP BY shp.carrierName 
    ORDER BY DeliveryRate DESC; 
END; 
// DELIMITER ; 

Call TrackShippingEfficiency() ;

-- triggers for updating order status on shipping completion
DELIMITER // 
CREATE TRIGGER UpdateOrderStatusAfterDelivery 
AFTER UPDATE ON shipping 
FOR EACH ROW 
BEGIN 
    IF NEW.shippingStatus = 'Delivered' THEN 
        UPDATE orders
        SET orderStatus = 'Completed' 
        WHERE orderID = NEW.orderID; 
    END IF; 
END; 
// DELIMITER ; 


SELECT orderID, orderStatus 
FROM orders;

UPDATE shipping 
SET shippingStatus = 'Delivered' 
WHERE orderID = 5; 

SELECT orderID, orderStatus 
FROM orders 
WHERE orderID = 5; -- confirms the successful change.  

UPDATE orders 
SET orderStatus = 'Pending' 
WHERE orderID = 5; -- just to check agai if it works

