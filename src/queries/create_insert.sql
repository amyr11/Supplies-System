CREATE TABLE Product_Categories (
    category_name VARCHAR(50) NOT NULL,
    CONSTRAINT category_name_pk PRIMARY KEY(category_name)
);

CREATE TABLE Suppliers (
    supplier_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    product_lines VARCHAR(50) NOT NULL,
    active VARCHAR(1) NOT NULL DEFAULT 'y',
    CONSTRAINT supplier_name_pk PRIMARY KEY(supplier_name),
    CONSTRAINT product_lines_fk FOREIGN KEY(product_lines) REFERENCES Product_Categories(category_name)
);

CREATE TABLE Products (
    product_name VARCHAR(50) NOT NULL,
    product_description VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    active VARCHAR(1) NOT NULL DEFAULT 'y',
    CONSTRAINT product_name_pk PRIMARY KEY(product_name),
    CONSTRAINT category_fk FOREIGN KEY(category) REFERENCES Product_Categories(category_name)
);

CREATE TABLE Transactions (
    transaction_id INT NOT NULL
                   PRIMARY KEY 
                   GENERATED ALWAYS AS IDENTITY 
                   (START WITH 1, INCREMENT BY 1),
    supplier_name VARCHAR(50),
    product_name VARCHAR(50) NOT NULL,
    quantity INT NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    transaction_date DATE NOT NULL,
    transaction_type VARCHAR(10),
    status VARCHAR(10),
    CONSTRAINT supplier_name_fk FOREIGN KEY(supplier_name) REFERENCES Suppliers(supplier_name),
    CONSTRAINT product_name_fk FOREIGN KEY(product_name) REFERENCES Products(product_name)
);

CREATE TABLE Admin_user (
    username VARCHAR(50),
    password VARCHAR(50)
);


INSERT INTO Admin_user
VALUES ('admin', 'admin');

INSERT INTO Product_Categories (
                category_name
            )
VALUES ('Electronics'),
       ('Furniture'),
       ('Clothing'),
       ('Outdoor gear'),
       ('Toys'),
       ('Sports equipment'),
       ('Beauty products'),
       ('Automotive parts'),
       ('Home appliances'),
       ('Office supplies');

INSERT INTO Suppliers (
                supplier_name, 
                email,
                contact_number, 
                product_lines, 
                active
            )
VALUES ('Acme Electronics', 'info@acme-electronics.com', '555-555-1212', 'Electronics', 'y'),
       ('Furnish Co.', 'contact@furnish-co.com', '555-555-1213', 'Furniture', 'y'),
       ('Fashion Inc.', 'fashion@fashion-inc.com', '555-555-1214', 'Clothing', 'y'),
       ('Outdoor Adventures', 'info@outdoor-adventures.com', '555-555-1215', 'Outdoor gear', 'y'),
       ('Toy World', 'contact@toy-world.com', '555-555-1216', 'Toys', 'y'),
       ('Sportswear Co.', 'sportswear@sportswear-co.com', '555-555-1217', 'Sports equipment', 'y'),
       ('Beauty Depot', 'beauty@beauty-depot.com', '555-555-1218', 'Beauty products', 'y'),
       ('AutoWorks', 'autoworks@autoworks.com', '555-555-1219', 'Automotive parts', 'y'),
       ('Home Essentials', 'home@home-essentials.com', '555-555-1220', 'Home appliances', 'y'),
       ('Office Supply Co.', 'office@office-supply-co.com', '555-555-1221', 'Office supplies', 'y');

INSERT INTO Products (
                product_name, 
                product_description, 
                category, 
                active
            )
VALUES ('50-in TV', '50-inch 4K TV', 'Electronics', 'y'),
       ('Sofa', 'Leather couch', 'Furniture', 'y'),
       ('Jeans', 'Skinny fit', 'Clothing', 'y'),
       ('Tent', '4-person camping tent', 'Outdoor gear', 'y'),
       ('Action figure', 'Batman collectible', 'Toys', 'y'),
       ('Basketball', 'High-quality basket ball', 'Sports equipment', 'y'),
       ('Perfume', 'Luxury brand', 'Beauty products', 'y'),
       ('Car battery', 'Lead-acid battery', 'Automotive parts', 'y'),
       ('Refrigerator', 'Top-mount fridge', 'Home appliances', 'y'),
       ('Printer', 'Inkjet printer', 'Office supplies', 'y');

INSERT INTO Transactions (
                supplier_name, 
                product_name, 
                quantity, 
                cost, 
                transaction_date, 
                transaction_type, 
                status
            )
VALUES ('Acme Electronics', '50-in TV', 20, -500000.00, '2022-08-01', 'purchase', 'delivered'),
       (NULL, '50-in TV', -18, 900000.00, '2022-08-02', 'sale', 'delivered'),
       ('Furnish Co.', 'Sofa', 10, -250000.00, '2022-08-03', 'purchase', 'delivered'),
       (NULL, 'Sofa', -2, 60000.00, '2022-08-04', 'sale', 'delivered'),
       ('Fashion Inc.', 'Jeans', 200, -500000.00, '2022-08-05', 'purchase', 'delivered'),
       (NULL, 'Jeans', -170, 850000.00, '2022-08-06', 'sale', 'delivered'),
       ('Outdoor Adventures', 'Tent', 10, -500000.00, '2022-08-07', 'purchase', 'delivered'),
       (NULL, 'Tent', -5, 300000.00, '2022-08-08', 'sale', 'delivered'),
       ('Toy World', 'Action figure', 100, -50000.00, '2022-09-09', 'purchase', 'delivered'),
       (NULL, 'Action figure', -90, 90000.00, '2022-09-10', 'sale', 'delivered'),
       ('Sportswear Co.', 'Basketball', 100, -25000.00, '2022-09-11', 'purchase', 'delivered'),
       (NULL, 'Basketball', -60, 36000.00, '2022-09-12', 'sale', 'delivered'),
       ('Beauty Depot', 'Perfume', 100, -250000.00, '2022-09-13', 'purchase', 'delivered'),
       (NULL, 'Perfume', -30, 90000.00, '2022-09-14', 'sale', 'delivered'),
       ('AutoWorks', 'Car battery', 50, -125000.00, '2022-09-15', 'purchase', 'delivered'),
       (NULL, 'Car battery', -10, 30000.00, '2022-09-16', 'sale', 'delivered'),
       ('Home Essentials', 'Refrigerator', 10, -250000.00, '2022-10-17', 'purchase', 'delivered'),
       (NULL, 'Refrigerator', -8, 320000.00, '2022-10-18', 'sale', 'delivered'),
       ('Office Supply Co.', 'Printer', 10, -50000.00, '2022-10-19', 'purchase', 'delivered'),
       (NULL, 'Printer', 9, 90000.00, '2022-10-20', 'sale', 'delivered'),
       ('Acme Electronics', '50-in TV', 20, -500000.00, '2022-11-01', 'purchase', 'delivered'),
       (NULL, '50-in TV', -20, 1000000.00, '2022-11-02', 'sale', 'delivered'),
       ('Furnish Co.', 'Sofa', 10, -250000.00, '2022-11-03', 'purchase', 'delivered'),
       (NULL, 'Sofa', -8, 240000.00, '2022-11-04', 'sale', 'delivered'),
       ('Fashion Inc.', 'Jeans', 200, -500000.00, '2022-11-05', 'purchase', 'delivered'),
       (NULL, 'Jeans', -190, 950000.00, '2022-11-06', 'sale', 'delivered'),
       ('Outdoor Adventures', 'Tent', 10, -500000.00, '2022-11-07', 'purchase', 'delivered'),
       (NULL, 'Tent', -7, 420000.00, '2022-11-08', 'sale', 'delivered'),
       ('Toy World', 'Action figure', 100, -50000.00, '2022-11-09', 'purchase', 'delivered'),
       (NULL, 'Action figure', -100, 100000.00, '2022-11-10', 'sale', 'delivered'),
       ('Sportswear Co.', 'Basketball', 100, -25000.00, '2022-11-11', 'purchase', 'delivered'),
       (NULL, 'Basketball', -90, 54000.00, '2022-11-12', 'sale', 'delivered'),
       ('Beauty Depot', 'Perfume', 100, -250000.00, '2022-12-13', 'purchase', 'delivered'),
       (NULL, 'Perfume', -100, 300000.00, '2022-12-14', 'sale', 'delivered'),
       ('AutoWorks', 'Car battery', 100, -250000.00, '2022-12-15', 'purchase', 'pending'),
       ('Home Essentials', 'Refrigerator', 50, -1250000.00, '2022-12-17', 'purchase', 'delivered'),
       (NULL, 'Refrigerator', -40, 1600000.00, '2022-12-18', 'sale', 'delivered'),
       ('Office Supply Co.', 'Printer', 20, -100000.00, '2022-12-19', 'purchase', 'delivered'),
       (NULL, 'Printer', -18, 216000.00, '2022-12-20', 'sale', 'delivered');