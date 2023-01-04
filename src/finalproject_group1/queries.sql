CREATE TABLE Suppliers (
    supplier_id INT NOT NULL,
    supplier_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    product_lines VARCHAR(50) NOT NULL,
    active VARCHAR(1) NOT NULL DEFAULT 'y',
    CONSTRAINT supplier_id_pk PRIMARY KEY(supplier_id)
);

CREATE TABLE Products (
    product_id INT NOT NULL,
    product_name VARCHAR(50) NOT NULL,
    product_description VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    active VARCHAR(1) NOT NULL DEFAULT 'y',
    CONSTRAINT product_id_pk PRIMARY KEY(product_id)
);

CREATE TABLE Transactions (
    transaction_id INT NOT NULL,
    supplier_id INT,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    cost DECIMAL(10, 2) NOT NULL,
    date DATE NOT NULL,
    transaction_type VARCHAR(10),
    status VARCHAR(10),
    CONSTRAINT transaction_id_pk PRIMARY KEY(transaction_id),
    CONSTRAINT supplier_id_fk FOREIGN KEY(supplier_id) REFERENCES Suppliers(supplier_id),
    CONSTRAINT product_id_fk FOREIGN KEY(product_id) REFERENCES Products(product_id)
);

INSERT INTO Suppliers (
                supplier_id, 
                supplier_name, 
                email,
                contact_number, 
                product_lines, 
                active
            )
VALUES (1, 'Acme Electronics', 'info@acme-electronics.com', '555-555-1212', 'Electronics', 'y'),
       (2, 'Furnish Co.', 'contact@furnish-co.com', '555-555-1213', 'Furniture', 'y'),
       (3, 'Fashion Inc.', 'fashion@fashion-inc.com', '555-555-1214', 'Clothing', 'y'),
       (4, 'Outdoor Adventures', 'info@outdoor-adventures.com', '555-555-1215', 'Outdoor gear', 'y'),
       (5, 'Toy World', 'contact@toy-world.com', '555-555-1216', 'Toys', 'y'),
       (6, 'Sportswear Co.', 'sportswear@sportswear-co.com', '555-555-1217', 'Sports equipment', 'y'),
       (7, 'Beauty Depot', 'beauty@beauty-depot.com', '555-555-1218', 'Beauty products', 'y'),
       (8, 'AutoWorks', 'autoworks@autoworks.com', '555-555-1219', 'Automotive parts', 'y'),
       (9, 'Home Essentials', 'home@home-essentials.com', '555-555-1220', 'Home appliances', 'y'),
       (10, 'Office Supply Co.', 'office@office-supply-co.com', '555-555-1221', 'Office supplies', 'y');

INSERT INTO Products (
                product_id, 
                product_name, 
                product_description, 
                category, 
                active
            )
VALUES (1, 'Television', '50-inch 4K TV', 'Electronics', 'y'),
       (2, 'Sofa', 'Leather couch', 'Furniture', 'y'),
       (3, 'Jeans', 'Skinny fit', 'Clothing', 'y'),
       (4, 'Tent', '4-person camping tent', 'Outdoor gear', 'y'),
       (5, 'Action figure', 'Batman collectible', 'Toys', 'y'),
       (6, 'Basketball', 'Official size and weight', 'Sports equipment', 'y'),
       (7, 'Perfume', 'Luxury brand', 'Beauty products', 'y'),
       (8, 'Car battery', 'Lead-acid battery', 'Automotive parts', 'y'),
       (9, 'Refrigerator', 'Top-mount fridge', 'Home appliances', 'y'),
       (10, 'Printer', 'Inkjet printer', 'Office supplies', 'y');

INSERT INTO Transactions (
                transaction_id, 
                supplier_id, 
                product_id, 
                quantity, 
                cost, 
                date, 
                transaction_type, 
                status
            )
VALUES (1, 1, 1, 20, 500000.00, '2022-01-01', 'purchase', 'delivered'),
       (2, 2, 2, 10, 250000.00, '2022-01-02', 'purchase', 'delivered'),
       (3, 3, 3, 200, 500000.00, '2022-01-03', 'sale', 'delivered'),
       (4, 4, 4, 10, 500000.00, '2022-01-04', 'purchase', 'delivered'),
       (5, 5, 5, 100, 50000.00, '2022-01-05', 'sale', 'delivered'),
       (6, 6, 6, 100, 25000.00, '2022-01-06', 'purchase', 'delivered'),
       (7, 7, 7, 100, 250000.00, '2022-01-07', 'sale', 'delivered'),
       (8, 8, 8, 50, 125000.00, '2022-01-08', 'purchase', 'delivered'),
       (9, 9, 9, 10, 250000.00, '2022-01-09', 'sale', 'delivered'),
       (10, 10, 10, 10, 50000.00, '2022-01-10', 'sale', 'delivered');