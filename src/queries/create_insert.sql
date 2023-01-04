CREATE TABLE Suppliers (
    supplier_id INT NOT NULL 
                PRIMARY KEY 
                GENERATED ALWAYS AS IDENTITY 
                (START WITH 1, INCREMENT BY 1),
    supplier_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    product_lines VARCHAR(50) NOT NULL,
    active VARCHAR(1) NOT NULL DEFAULT 'y'
);

CREATE TABLE Products (
    product_id INT NOT NULL
               PRIMARY KEY 
               GENERATED ALWAYS AS IDENTITY 
               (START WITH 1, INCREMENT BY 1),
    product_name VARCHAR(50) NOT NULL,
    product_description VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    active VARCHAR(1) NOT NULL DEFAULT 'y'
);

CREATE TABLE Transactions (
    transaction_id INT NOT NULL
                   PRIMARY KEY 
                   GENERATED ALWAYS AS IDENTITY 
                   (START WITH 1, INCREMENT BY 1),
    supplier_id INT,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    transaction_date DATE NOT NULL,
    transaction_type VARCHAR(10),
    status VARCHAR(10),
    CONSTRAINT supplier_id_fk FOREIGN KEY(supplier_id) REFERENCES Suppliers(supplier_id),
    CONSTRAINT product_id_fk FOREIGN KEY(product_id) REFERENCES Products(product_id)
);

CREATE TABLE Admin_user (
    username VARCHAR(50),
    password VARCHAR(50)
);


INSERT INTO Admin_user
VALUES ('admin', 'admin');

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
VALUES ('Television', '50-inch 4K TV', 'Electronics', 'y'),
       ('Sofa', 'Leather couch', 'Furniture', 'y'),
       ('Jeans', 'Skinny fit', 'Clothing', 'y'),
       ('Tent', '4-person camping tent', 'Outdoor gear', 'y'),
       ('Action figure', 'Batman collectible', 'Toys', 'y'),
       ('Basketball', 'Official size and weight', 'Sports equipment', 'y'),
       ('Perfume', 'Luxury brand', 'Beauty products', 'y'),
       ('Car battery', 'Lead-acid battery', 'Automotive parts', 'y'),
       ('Refrigerator', 'Top-mount fridge', 'Home appliances', 'y'),
       ('Printer', 'Inkjet printer', 'Office supplies', 'y');

INSERT INTO Transactions (
                supplier_id, 
                product_id, 
                quantity, 
                cost, 
                transaction_date, 
                transaction_type, 
                status
            )
VALUES (1, 1, 20, 500000.00, '2022-08-01', 'purchase', 'delivered'),
       (2, 2, 10, 250000.00, '2022-08-02', 'purchase', 'pending'),
       (NULL, 3, 200, 500000.00, '2022-08-03', 'sale', 'delivered'),
       (4, 4, 10, 500000.00, '2022-08-04', 'purchase', 'delivered'),
       (NULL, 5, 100, 50000.00, '2022-09-05', 'sale', 'delivered'),
       (6, 6, 100, 25000.00, '2022-09-06', 'purchase', 'delivered'),
       (NULL, 7, 100, 250000.00, '2022-09-07', 'sale', 'delivered'),
       (8, 8, 50, 125000.00, '2022-09-08', 'purchase', 'delivered'),
       (NULL, 9, 10, 250000.00, '2022-10-09', 'sale', 'pending'),
       (NULL, 10, 10, 50000.00, '2022-10-10', 'sale', 'delivered'),
       (1, 1, 25, 125000.00, '2022-10-11', 'purchase', 'delivered'),
       (2, 2, 50, 250000.00, '2022-10-12', 'purchase', 'cancelled'),
       (NULL, 3, 75, 375000.00, '2022-11-13', 'sale', 'delivered'),
       (4, 4, 100, 500000.00, '2022-11-14', 'purchase', 'delivered'),
       (NULL, 5, 150, 750000.00, '2022-11-15', 'sale', 'delivered'),
       (6, 6, 200, 1000000.00, '2022-11-16', 'purchase', 'delivered'),
       (NULL, 7, 250, 1250000.00, '2022-12-17', 'sale', 'pending'),
       (8, 8, 300, 1500000.00, '2022-12-18', 'purchase', 'delivered'),
       (NULL, 9, 350, 1750000.00, '2022-12-19', 'sale', 'delivered'),
       (NULL, 10, 400, 2000000.00, '2022-12-20', 'sale', 'delivered');