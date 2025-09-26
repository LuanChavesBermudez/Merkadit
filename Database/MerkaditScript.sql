USE merkadit;

CREATE TABLE nombres_mockup (
	firstNameID INT AUTO_INCREMENT PRIMARY KEY,
	firstName VARCHAR(30) NOT NULL
);
INSERT INTO nombres_mockup (firstName)
VALUES
	('Alonzo'),
	('Tiff'),
	('Eberto'),
	('Venita'),
	('Ewen'),
	('Susana'),
	('Felice'),
	('Sydney'),
	('Tootsie'),
	('Roi'),
	('Lonni'),
	('Irvine'),
	('Arlen'),
	('Alina'),
	('Claudie'),
	('Chelsy'),
	('Towny'),
	('Oralie'),
	('Waverly'),
	('Charlton');
    
CREATE TABLE apellidos_mockup (
	lastNameID INT AUTO_INCREMENT PRIMARY KEY,
	lastName VARCHAR(30) NOT NULL
);
INSERT INTO apellidos_mockup (lastName)
VALUES
	('Rivaland'),
	('Nelmes'),
	('Bordessa'),
	('Mattiato'),
	('Maxfield'),
	('Macrow'),
	('Dewick'),
	('Ruffle'),
	('Leyshon'),
	('Geraghty'),
	('Padwick'),
	('Hanratty'),
	('Dahlbom'),
	('Badam'),
	('Elecum'),
	('Wilcott'),
	('Caven'),
	('Berg'),
	('Cavanaugh'),
	('Keston');

INSERT INTO countries (countryName) VALUES ('Costa Rica'), ('Estados Unidos');
INSERT INTO states (stateName, countryID) VALUES ('Cartago', 1), ('Limon', 1), ('Los Angeles', 2);
INSERT INTO cities (cityName, stateID) VALUES ('San Rafael', 1), ('Guapiles', 2), ('Glendale', 3);
INSERT INTO addresses (addressDescription, cityID)
VALUES
	('frente a oficentro Murano, 500m noreste de la basilica', 1),
    ('frente a hospital de guapiles, contiguo a musmani', 2),
    ('5970 W. Brown Street, Suite 200, Glendale, AZ 85301', 3);
INSERT INTO buildings (buildingName, addressID) VALUES ('Plaza los Angeles', 1), ('Plaza Qizatlan', 2);
INSERT INTO stores (storeName, description, phoneNumber, legalCertificate, localNumber, floorNumber, isActive, storeDimensions)
VALUES
	('La Estación', 'todo tipo de articulos', '2588-8888', '1000456870', '16-B', 2, 1, '20x20x6'),
    ('Tienda los tucanes', 'productos variados', '2712-3456', '1013069901', '8', 1, 1, '25x30x5'),
    ('Allmart', 'Articulos importados', '2722-3333', '1190024730', '12', 2, 1, '25x15x6');
INSERT INTO storesperbuildings(buildingID, storeID, postTime, isActive)
VALUES
	(1, 1, '2012-09-04', 1),
    (2, 2, '2017-02-11', 1),
    (2, 3, '2015-12-01', 1);

CREATE TABLE businesses_mockup (
	businessID INT AUTO_INCREMENT PRIMARY KEY,
	businessName VARCHAR(40) NOT NULL,
	businessContact VARCHAR(40) NOT NULL,
	postTime DATETIME(3) NOT NULL,
    legalName VARCHAR(40) NOT NULL,
    isActive BIT NOT NULL,
    addressID INT
);
INSERT INTO businesses_mockup (businessName, businessContact, postTime, legalName, isActive, addressID)
VALUES
	('McClure, Casper and Wehner', '+86 (643) 289-9049', '2024-04-26', 'MCW', 1, 3),
	('Abbott-Anderson', '+54 (773) 200-8077', '2019-03-22', 'AA', 1, 3),
	('VonRueden Inc', '+33 (328) 278-8252', '2021-09-25', 'VR', 1, 3),
	('Wisoky, Dickinson and Swaniawski', '+351 (472) 504-3371', '2021-12-11', 'WDS', 1, 3),
	('Dibbert-Jacobi', '+63 (142) 425-2956', '2021-11-08', 'D-J', 1, 3),
	('Goodwin, Ullrich and Buckridge', '+46 (510) 110-5068', '2025-05-31', 'GUB', 1, 3),
	('Swaniawski-Kub', '+55 (387) 287-8859', '2024-02-06', 'S-K', 1, 3),
	('Hahn and Sons', '+86 (524) 341-3682', '2020-10-01', 'H&S', 1, 3),
	('Bahringer and Sons', '+93 (725) 759-5795', '2021-02-23', 'B&S', 1, 3),
	('Schmitt-Barton', '+86 (441) 914-7837', '2025-05-08', 'S-B', 1, 3),
	('Bayer Group', '+351 (564) 818-6493', '2022-08-06', 'BG', 1, 3),
	('Wilkinson-Bode', '+62 (844) 125-9992', '2023-12-31', 'W-B', 1, 3),
	('Crist, Hauck and Fadel', '+84 (258) 698-1347', '2020-10-02', 'CHF', 1, 3),
	('Smitham, Abernathy and Torphy', '+86 (303) 348-5278', '2022-11-08', 'SAT', 1, 3),
	('Nitzsche Group', '+62 (452) 121-1144', '2025-02-22', 'NG', 1, 3),
	('Pagac-White', '+263 (305) 675-2520', '2023-09-14', 'P-W', 1, 3),
	('Welch, Barrows and Boehm', '+381 (701) 800-7840', '2023-10-22', 'WBB', 1, 3),
	('Baumbach, Feest and Lebsack', '+51 (157) 880-1183', '2023-04-27', 'BFL', 1, 3),
	('Weber Group', '+86 (582) 456-9050', '2022-06-17', 'WG', 1, 3),
	('Morar, Wisoky and Balistreri', '+380 (120) 566-2075', '2025-06-04', 'MWB', 1, 3);

DELIMITER //
CREATE PROCEDURE randomizeBusinesses()
BEGIN
	DECLARE vCantidad INT;
    DECLARE vRandomID INT;
    SELECT FLOOR(RAND()*(7-4+1)+4) INTO vCantidad; -- cantidad entre 4 y 7
    
    WHILE vCantidad > 0 DO
		SELECT FLOOR(RAND()*(20-1+1)+1) INTO vRandomID;
        
		INSERT INTO businesses (businessName, businessContact, postTime, legalName, isActive, addressID)
        SELECT businessName, businessContact, postTime, legalName, isActive, addressID FROM businesses_mockup
        WHERE businesses_mockup.businessID = vRandomID AND businesses_mockup.isActive = 1;
        
		UPDATE businesses_mockup
		SET isActive = 0
		WHERE businesses_mockup.businessID = vRandomID;
        
		SET vCantidad = vCantidad - 1;
    END WHILE;
END //
DELIMITER ;

CALL randomizeBusinesses();

DELIMITER //
CREATE PROCEDURE randomizeUsers()
BEGIN
	DECLARE vCantidad INT DEFAULT 20;
    DECLARE vFirstNameID INT;
    DECLARE vLastNameID INT;
    DECLARE vFirstName VARCHAR(30);
    DECLARE vLastName VARCHAR(30);
    
    WHILE vCantidad > 0 DO
		SELECT FLOOR(RAND()*(20-1+1)+1) INTO vFirstNameID;
        SELECT FLOOR(RAND()*(20-1+1)+1) INTO vLastNameID;
        SELECT n.firstName INTO vFirstName FROM nombres_mockup n WHERE n.firstNameID = vFirstNameID;
        SELECT a.lastName INTO vLastName FROM apellidos_mockup a WHERE a.lastNameID = vLastNameID;
        
		INSERT INTO users (firstName, lastName, password, isActive, postTime)
        VALUE (vFirstName, vLastName, 0x1234567890ABCDEF, 1, now());
        
		SET vCantidad = vCantidad - 1;
    END WHILE;
END //
DELIMITER ;

CALL randomizeUsers();

INSERT INTO roles (roleName, isActive) VALUES ('Administrador', 1), ('Tenant', 1);
INSERT INTO userRoles (userid, roleid, postTime, isActive) VALUE (1, 1, now(), 1);
INSERT INTO userrolesperstores (storeid, userid, roleid, isActive, postTime)
VALUES
	(1, 1, 1, 1, now()),
    (2, 1, 1, 1, now()),
    (3, 1, 1, 1, now());

INSERT INTO contractStatuses (statusDescription)
VALUES
	('Activo'),
    ('Terminado'),
    ('Pendiente'),
    ('Suspendido');

INSERT INTO stallStatuses (stallStatusDescription)
VALUES
	('Libre'),
    ('Ocupado'),
    ('En Remodelacion');

INSERT INTO stallTypes (stallTypeName)
VALUES
	('Gastronomia'),
    ('Retail');
    
INSERT INTO stalls (stallStatusID, stallTypeID, storeID, stallDimensions, stallCode)
VALUES
	(1, 1, 1, '1x1.25x1.5', '05A2'),
    (1, 1, 1, '1x1.25x1.5', '05A3'),
    (1, 2, 1, '1x0.75x2', '05A4'),
    (1, 2, 1, '1x0.75x2', '05A5'),
    (1, 2, 1, '1x0.75x2', '05A6'),
    (1, 1, 2, '0.75x1x1.5', '2302'),
    (1, 1, 2, '0.75x1x1.5', '2303'),
    (1, 2, 2, '1x0.75x1.5', '2304'),
    (1, 2, 2, '1x0.75x1.5', '2305'),
    (1, 2, 2, '1x0.75x1.5', '2306'),
    (1, 1, 3, '1x1x2', 'AA10'),
    (1, 1, 3, '1x1x2', 'AA11'),
    (1, 2, 3, '1x0.5x2', 'AA12'),
    (1, 2, 3, '1x0.5x2', 'AA13'),
    (1, 2, 3, '1x0.5x2', 'AA14');

INSERT INTO stallCostHistory (costValue, isCurrent, postTime, computer, stallID, userID)
VALUES
	(75000, 1, now(), 'AdminDesktop', 1, 1),
    (80000, 1, now(), 'AdminDesktop', 2, 1),
    (70500, 1, now(), 'AdminDesktop', 3, 1),
    (100000, 1, now(), 'AdminDesktop', 4, 1),
    (68900, 1, now(), 'AdminDesktop', 5, 1),
    (75000, 1, now(), 'AdminDesktop', 6, 1),
    (72000, 1, now(), 'AdminDesktop', 7, 1),
    (72200, 1, now(), 'AdminDesktop', 8, 1),
    (68500, 1, now(), 'AdminDesktop', 9, 1),
    (75650, 1, now(), 'AdminDesktop', 10, 1),
    (93000, 1, now(), 'AdminDesktop', 11, 1),
    (86800, 1, now(), 'AdminDesktop', 12, 1),
    (83000, 1, now(), 'AdminDesktop', 13, 1),
    (59300, 1, now(), 'AdminDesktop', 14, 1),
    (67450, 1, now(), 'AdminDesktop', 15, 1);

DELIMITER //
CREATE PROCEDURE randomizeContracts()
BEGIN
	DECLARE vCantidadNegocios INT;
	DECLARE vRandomStartDate DATETIME;
    DECLARE vRandomEndDate DATETIME;
    DECLARE vRandomBillingDate DATETIME;
    DECLARE vRandomRent FLOAT;
    DECLARE vRandomFee FLOAT;
    DECLARE vRandomStallID INT;
    DECLARE vStallCost FLOAT;
    DECLARE i INT DEFAULT 0;
    
    SELECT MAX(businessID) FROM businesses into vCantidadNegocios;
    
    WHILE i < vCantidadNegocios DO
		-- sacados de inter para generar fechas aleatorias
		SET vRandomStartDate = DATE(date_add('2021-01-01', INTERVAL FLOOR(RAND()*365) DAY));
        SET vRandomEndDate = DATE(date_add('2026-01-01', INTERVAL FLOOR(RAND()*365) DAY));
        SET vRandomBillingDate = DATE(date_add(vRandomStartDate, INTERVAL FLOOR(RAND()*28) DAY));
        SET vRandomRent = TRUNCATE(RAND()*(300000-210000+1)+210000, 4);
        SET vRandomFee = TRUNCATE(RAND()*26, 4);
		SELECT stallID FROM stalls WHERE stallStatusID = 1 ORDER BY RAND() LIMIT 1 INTO vRandomStallID;
        SELECT costValue FROM stallCostHistory WHERE stallID = vRandomStallID AND isCurrent = 1 INTO vStallCost;
        
        INSERT INTO contracts (startDate, endDate, billingDate, baseRent, contractFee, totalCost, contractNumber, contractStatusID)
        VALUE
			(vRandomStartDate, vRandomEndDate, vRandomBillingDate, vRandomRent, vRandomFee, vRandomRent + vStallCost, 110000 - i, 1);
		
		UPDATE stalls
        SET stallStatusID = 2
		WHERE stallID = vRandomStallID;
        
		SET i = i + 1;
    END WHILE;
END //
DELIMITER ;

CALL randomizeContracts();

INSERT INTO brands (brandName) value ('Suli');
INSERT INTO suppliers (supplierName, isActive) value ('Swift Service', 1);

INSERT INTO productCategories (productCategoryName)
VALUES
    ('Electronics'),
    ('Furniture'),
    ('Clothing'),
    ('Home Appliances'),
    ('Sports Equipment'),
    ('Books'),
    ('Toys'),
    ('Beauty Products'),
    ('Automotive'),
    ('Grocery'),
    ('Health & Wellness'),
    ('Jewelry'),
    ('Outdoor Gear'),
    ('Stationery'),
    ('Music Instruments'),
    ('Kitchenware'),
    ('Pet Supplies'),
    ('Baby Products'),
    ('Office Supplies'),
    ('Gardening');

CREATE TABLE products_mockup(
	productID INT AUTO_INCREMENT PRIMARY KEY,
    productName VARCHAR(40),
    productDescription VARCHAR(100),
    quantity INT,
    arrivalDate DATETIME(3),
    categoryID INT
);

INSERT INTO products_mockup(productName, productDescription, quantity, arrivalDate, categoryID)
VALUES
	('Smartphone', 'A high-tech smartphone with the latest features', 25, '2025-06-01', 1),
    ('Laptop', 'A portable laptop with powerful specs', 40, '2025-05-15', 1),
    ('Headphones', 'Noise-cancelling wireless headphones', 30, '2025-07-10', 1),
    ('Smartwatch', 'A smartwatch with fitness tracking and notifications', 45, '2025-08-05', 1),
    ('Tablet', 'A lightweight tablet with a high-resolution screen', 35, '2025-04-20', 1),
    ('Sofa', 'A comfortable 3-seater sofa', 30, '2025-06-10', 2),
    ('Dining Table', 'A modern wooden dining table', 15, '2025-07-25', 2),
    ('Bookshelf', 'A stylish bookshelf with ample storage', 25, '2025-05-18', 2),
    ('Chair', 'An ergonomic office chair with lumbar support', 50, '2025-03-22', 2),
    ('Coffee Table', 'A sleek, modern coffee table for your living room', 40, '2025-04-30', 2),
    ('T-shirt', 'A stylish cotton T-shirt', 60, '2025-04-30', 3),
    ('Jeans', 'Denim jeans with a perfect fit', 50, '2025-03-10', 3),
    ('Jacket', 'A warm jacket for cold weather', 40, '2025-07-01', 3),
    ('Sneakers', 'Comfortable sneakers for everyday wear', 55, '2025-05-18', 3),
    ('Dress', 'A fashionable evening dress', 30, '2025-08-20', 3),
    ('Air Conditioner', 'A high-efficiency air conditioner', 20, '2025-06-12', 4),
    ('Refrigerator', 'A spacious refrigerator with energy-efficient features', 25, '2025-07-15', 4),
    ('Microwave', 'A quick and powerful microwave oven', 40, '2025-08-10', 4),
    ('Washing Machine', 'A top-load washing machine with smart functions', 15, '2025-05-25', 4),
    ('Vacuum Cleaner', 'A powerful vacuum cleaner with multi-surface capability', 30, '2025-04-05', 4),
    ('Soccer Ball', 'A high-quality soccer ball for practice and matches', 25, '2025-07-12', 5),
    ('Tennis Racket', 'A lightweight tennis racket with great control', 35, '2025-06-15', 5),
    ('Baseball Bat', 'A durable baseball bat for amateur players', 40, '2025-04-10', 5),
    ('Dumbbells', 'A set of adjustable dumbbells for strength training', 45, '2025-05-05', 5),
    ('Yoga Mat', 'A non-slip yoga mat for your fitness routine', 50, '2025-08-25', 5),
    ('Fiction Novel', 'A thrilling fiction novel that keeps you hooked', 60, '2025-03-01', 6),
    ('Cookbook', 'A cookbook with delicious recipes for every occasion', 45, '2025-05-30', 6),
    ('Biography', 'The biography of a famous historical figure', 50, '2025-04-15', 6),
    ('Science Fiction', 'A science fiction novel set in a futuristic world', 30, '2025-06-05', 6),
    ('Childrens Book', 'A fun and educational book for kids', 70, '2025-07-01', 6),
    ('Building Blocks', 'Colorful building blocks for kids to build and create', 55, '2025-05-05', 7),
    ('Doll', 'A soft, huggable doll for children', 60, '2025-06-10', 7),
    ('Action Figure', 'A detailed action figure from a popular movie', 50, '2025-04-25', 7),
    ('Toy Car', 'A remote-controlled toy car for kids', 40, '2025-07-20', 7),
    ('Puzzle', 'A challenging puzzle for all ages', 45, '2025-03-15', 7),
    ('Lipstick', 'A long-lasting lipstick in various shades', 40, '2025-06-01', 8),
    ('Shampoo', 'A nourishing shampoo for healthy hair', 30, '2025-05-25', 8),
    ('Perfume', 'A luxurious fragrance that lasts all day', 45, '2025-07-15', 8),
    ('Skincare Cream', 'A moisturizing skincare cream for glowing skin', 50, '2025-04-05', 8),
    ('Nail Polish', 'A set of vibrant nail polish colors', 60, '2025-03-25', 8),
    ('Car Battery', 'A reliable and durable car battery', 25, '2025-06-15', 9),
    ('Motor Oil', 'High-quality motor oil for smooth engine performance', 35, '2025-07-10', 9),
    ('Tire Set', 'A set of four durable tires for your vehicle', 40, '2025-08-20', 9),
    ('Seat Cover', 'A comfortable seat cover for your car', 30, '2025-05-12', 9),
    ('Car Wax', 'A car wax for a shiny and smooth finish', 50, '2025-04-18', 9),
    ('Rice', 'A bag of high-quality rice for cooking', 60, '2025-06-20', 10),
    ('Olive Oil', 'Pure and natural olive oil for cooking and dressing', 50, '2025-07-05', 10),
    ('Cereal', 'A nutritious cereal for a healthy breakfast', 45, '2025-05-15', 10),
    ('Coffee Beans', 'Freshly roasted coffee beans', 30, '2025-04-02', 10),
    ('Pasta', 'Organic pasta made with whole wheat', 55, '2025-08-15', 10);

CREATE TABLE productCost_mockup(
	productCostID INT AUTO_INCREMENT PRIMARY KEY,
    costValue FLOAT,
    isCurrent BIT,
    postTime DATETIME,
    computer VARCHAR(20),
    productID INT,
    userID INT
);
INSERT INTO productCost_mockup (costValue, isCurrent, postTime, computer, productID, userID) VALUES
	(450000, 1, '2025-06-01', 'AdminDesktop', 1, 1),
	(650000, 1, '2025-05-15', 'AdminDesktop', 2, 1),
	(120000, 1, '2025-07-10', 'AdminDesktop', 3, 1),
	(180000, 1, '2025-08-05', 'AdminDesktop', 4, 1),
	(250000, 1, '2025-04-20', 'AdminDesktop', 5, 1),
	(350000, 1, '2025-06-10', 'AdminDesktop', 6, 1),
	(280000, 1, '2025-07-25', 'AdminDesktop', 7, 1),
	(150000, 1, '2025-05-18', 'AdminDesktop', 8, 1),
	(130000, 1, '2025-03-22', 'AdminDesktop', 9, 1),
	(110000, 1, '2025-04-30', 'AdminDesktop', 10, 1),
	(9000, 1, '2025-04-30', 'AdminDesktop', 11, 1),
	(20000, 1, '2025-03-10', 'AdminDesktop', 12, 1),
	(45000, 1, '2025-07-01', 'AdminDesktop', 13, 1),
	(30000, 1, '2025-05-18', 'AdminDesktop', 14, 1),
	(60000, 1, '2025-08-20', 'AdminDesktop', 15, 1),
	(280000, 1, '2025-06-12', 'AdminDesktop', 16, 1),
	(450000, 1, '2025-07-15', 'AdminDesktop', 17, 1),
	(90000, 1, '2025-08-10', 'AdminDesktop', 18, 1),
	(320000, 1, '2025-05-25', 'AdminDesktop', 19, 1),
	(100000, 1, '2025-04-05', 'AdminDesktop', 20, 1),
	(15000, 1, '2025-07-12', 'AdminDesktop', 21, 1),
	(25000, 1, '2025-06-15', 'AdminDesktop', 22, 1),
	(30000, 1, '2025-04-10', 'AdminDesktop', 23, 1),
	(70000, 1, '2025-05-05', 'AdminDesktop', 24, 1),
	(12000, 1, '2025-08-25', 'AdminDesktop', 25, 1),
	(8000, 1, '2025-03-01', 'AdminDesktop', 26, 1),
	(12000, 1, '2025-05-30', 'AdminDesktop', 27, 1),
	(10000, 1, '2025-04-15', 'AdminDesktop', 28, 1),
	(9000, 1, '2025-06-05', 'AdminDesktop', 29, 1),
	(7000, 1, '2025-07-01', 'AdminDesktop', 30, 1),
	(25000, 1, '2025-05-05', 'AdminDesktop', 31, 1),
	(12000, 1, '2025-06-10', 'AdminDesktop', 32, 1),
	(18000, 1, '2025-04-25', 'AdminDesktop', 33, 1),
	(22000, 1, '2025-07-20', 'AdminDesktop', 34, 1),
	(9000, 1, '2025-03-15', 'AdminDesktop', 35, 1),
	(7000, 1, '2025-06-01', 'AdminDesktop', 36, 1),
	(6000, 1, '2025-05-25', 'AdminDesktop', 37, 1),
	(25000, 1, '2025-07-15', 'AdminDesktop', 38, 1),
	(15000, 1, '2025-04-05', 'AdminDesktop', 39, 1),
	(3500, 1, '2025-03-25', 'AdminDesktop', 40, 1),
	(45000, 1, '2025-06-15', 'AdminDesktop', 41, 1),
	(12000, 1, '2025-07-10', 'AdminDesktop', 42, 1),
	(280000, 1, '2025-08-20', 'AdminDesktop', 43, 1),
	(15000, 1, '2025-05-12', 'AdminDesktop', 44, 1),
	(9000, 1, '2025-04-18', 'AdminDesktop', 45, 1),
	(14000, 1, '2025-06-20', 'AdminDesktop', 46, 1),
	(5500, 1, '2025-07-05', 'AdminDesktop', 47, 1),
	(4500, 1, '2025-05-15', 'AdminDesktop', 48, 1),
	(16000, 1, '2025-04-02', 'AdminDesktop', 49, 1),
	(5000, 1, '2025-08-15', 'AdminDesktop', 50, 1);

DELIMITER //
CREATE PROCEDURE randomizeInventory()
BEGIN
	DECLARE vRandomBusinessID INT;
	DECLARE vRandomProductID INT;
	DECLARE vRandomStoreID INT;
	DECLARE i INT DEFAULT 0;
	DECLARE j INT DEFAULT 0;
	
	WHILE i < 3 DO
		SELECT businessID FROM businesses
		WHERE businessID NOT IN (SELECT businessID FROM products)
        ORDER BY RAND() LIMIT 1 INTO vRandomBusinessID;
		
		WHILE j < 3 DO
			SELECT productID FROM products_mockup
			WHERE productName NOT IN (SELECT productName FROM products)
			ORDER BY RAND() LIMIT 1 INTO vRandomProductID;
            
			SET vRandomStoreID = FLOOR(RAND() * 3);
			
			INSERT INTO products (productName, description, quantity, arrivalDate, productCategoryID, isActive, brandID, supplierID, businessID)
			SELECT productName, productDescription, quantity, arrivalDate, categoryID, 1, 1, 1, vRandomBusinessID
			FROM products_mockup
			WHERE productID = vRandomProductID;
            
            INSERT INTO productCostHistory (costValue, isCurrent, postTime, computer, productID, userID)
            SELECT costValue, isCurrent, postTime, computer, last_insert_id(), userID
            FROM productCost_mockup
            WHERE productID = vRandomProductID;
			
			SET j = j + 1;
		END WHILE;
        
		SET i = i + 1;
        SET j = 0;
	END WHILE;
END //
DELIMITER ;

CALL randomizeInventory();

INSERT INTO logSources (logSourceName) VALUE ('Ventas');
INSERT INTO logLevels (logLevelDescription) VALUES ('Info'), ('Warning'), ('Error');
INSERT INTO logTypes (logTypeName) VALUES ('Factura');


DELIMITER //
CREATE PROCEDURE registerSale(pProductName VARCHAR(40), pStoreName VARCHAR(25), 
				 pQuantitySold INT, pAmountPaid FLOAT, pPaymentMethod VARCHAR(50), pPostTime DATETIME,
                 pRefid BIGINT, pInvoiceNumber BIGINT, pCustomer VARCHAR(50), pDiscounts FLOAT)
this_procedure: BEGIN
    DECLARE vChecksumInvoice VARBINARY(32);
    DECLARE vChecksumDetail VARBINARY(32);
    DECLARE vChecksumLog VARBINARY(32);
    DECLARE vProductID INT;
    DECLARE vProductCostID INT;
    DECLARE vProductQuantity INT;
    
    SELECT productID, quantity FROM products WHERE productName = pProductName INTO vProductID, vProductQuantity;
    SELECT productCostID FROM productCostHistory WHERE productID = vProductID INTO vProductCostID;
    
    SET vChecksumInvoice = MD5(CONCAT(pPostTime, pInvoiceNumber, pAmountPaid));
    SET vChecksumDetail = MD5(CONCAT(pQuantitySold, vProductID, vProductCostID));
    SET vChecksumLog = MD5(CONCAT(pRefid, pPostTime));
    
    IF (vProductQuantity < pQuantitySold) THEN
		INSERT INTO logs (logDescription, computer, refid, postTime, checksum, logTypeID, logLevelID, logSourceID, userID)
			value ('Facturacion de venta fallida', 'AdminDesktop', pRefid, pPostTime, vChecksumLog, 1, 3, 1, 1);
		 LEAVE this_procedure;
    END IF;
    
    INSERT INTO invoices(postTime, invoiceNumber, client, computer, discount, taxApplied, taxAmount, checksum, total, paymentMethod, userID)
    value
		(pPostTime, pInvoiceNumber, pCustomer, 'AdminDesktop', pDiscounts, 0.04, pAmountPaid * taxApplied, vChecksumInvoice, pAmountPaid, pPaymentMethod, 1);
        
	INSERT INTO invoiceDetails (quantity, computer, checksum, invoiceID, productID, productCostID, userID)
    value
		(pQuantitySold, 'AdminDesktop', vChecksumDetail, last_insert_id(), vProductID, vProductCostID, 1);
        
	INSERT INTO logs (logDescription, computer, refid, postTime, checksum, logTypeID, logLevelID, logSourceID, userID)
    value ('Facturacion de venta exitosa', 'AdminDesktop', pRefid, pPostTime, vChecksumLog, 1, 1, 1, 1);
    
    UPDATE products
    SET quantity = quantity - pQuantitySold
    WHERE productID = vProductID;
END //
DELIMITER ;

CREATE TABLE paymentMethods_mockup(
	paymentMethodID INT AUTO_INCREMENT PRIMARY KEY,
    paymentMethodName VARCHAR(30)
);

INSERT INTO paymentMethods_mockup (paymentMethodName)
VALUES
	('Mastercard'),
    ('Efectivo'),
    ('SINPE Movil'),
    ('Visa');

DELIMITER //
CREATE PROCEDURE randomizePurchases()
BEGIN
    DECLARE vStartDate DATETIME;
    DECLARE vRandomProductName VARCHAR(40);
    DECLARE vRandomProductID INT;
	DECLARE vMonthQuantity INT DEFAULT 4;
    DECLARE vRandomDate DATETIME;
    DECLARE vRandomPurchaseAmount INT;
    DECLARE vRandomStoreName VARCHAR(25);
    DECLARE vProductCost FLOAT;
    DECLARE vAmountSold INT;
    DECLARE vClientName VARCHAR(60);
    DECLARE vPaymentMethod VARCHAR(30);
    
    SET vStartDate = DATE(date_sub(now(), INTERVAL vMonthQuantity MONTH));
    
    WHILE vMonthQuantity > 0 DO
		SET vRandomPurchaseAmount = FLOOR(rand() * (70 - 50) + 50);
        
        WHILE vRandomPurchaseAmount > 0 DO
			SET vRandomDate = DATE(DATE_ADD(vStartDate, INTERVAL FLOOR(RAND()*30) DAY));
            
            SELECT productName, productID FROM products
			WHERE quantity > 0
			ORDER BY RAND() LIMIT 1 INTO vRandomProductName, vRandomProductID;
            
            SELECT storeName FROM stores
			ORDER BY RAND() LIMIT 1 INTO vRandomStoreName;
            
            SELECT paymentMethodName FROM paymentMethods_mockup
            ORDER BY RAND() LIMIT 1 INTO vPaymentMethod;
            
            SET vAmountSold = FLOOR(RAND()*3) + 1;
            
            SELECT costValue FROM productCostHistory
            WHERE productID = vRandomProductID
            INTO vProductCost;
            
            SELECT CONCAT(firstName, ' ', lastName) FROM users
            ORDER BY RAND() LIMIT 1 INTO vClientName;
            
            CALL registerSale(vRandomProductName, vRandomStoreName, vAmountSold, vAmountSold * vProductCost,
							  vPaymentMethod, vRandomDate, 100000 + (vRandomProductID * 1000), 100000 + (vRandomProductID * 1000),
                              vClientName, 0.0);
            
			SET vRandomPurchaseAmount = vRandomPurchaseAmount - 1;
        END WHILE;
        SET vStartDate = DATE(DATE_ADD(vStartDate, INTERVAL 1 MONTH));
		SET vMonthQuantity = vMonthQuantity - 1;
    END WHILE;
END //
DELIMITER ;
CALL randomizePurchases();
select * from invoices;