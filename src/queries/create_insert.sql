CREATE TABLE Suppliers (
    supplier_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    contact_number VARCHAR(20) NOT NULL,
    product_lines VARCHAR(50) NOT NULL,
    active VARCHAR(1) NOT NULL DEFAULT 'y',
    CONSTRAINT supplier_name_pk PRIMARY KEY(supplier_name)
);

CREATE TABLE Products (
    product_name VARCHAR(50) NOT NULL,
    product_description VARCHAR(50) NOT NULL,
    category VARCHAR(50) NOT NULL,
    active VARCHAR(1) NOT NULL DEFAULT 'y',
    CONSTRAINT product_name_pk PRIMARY KEY(product_name)
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
VALUES ('Acme Electronics', '50-in TV', 20, 500000.00, '2022-08-01', 'purchase', 'delivered'),
       ('Furnish Co.', 'Sofa', 10, 250000.00, '2022-08-02', 'purchase', 'pending'),
       (NULL, 'Jeans', 200, 500000.00, '2022-08-03', 'sale', 'delivered'),
       ('Outdoor Adventures', 'Tent', 10, 500000.00, '2022-08-04', 'purchase', 'delivered'),
       (NULL, 'Action figure', 100, 50000.00, '2022-09-05', 'sale', 'delivered'),
       ('Sportswear Co.', 'Basketball', 100, 25000.00, '2022-09-06', 'purchase', 'delivered'),
       (NULL, 'Perfume', 100, 250000.00, '2022-09-07', 'sale', 'delivered'),
       ('AutoWorks', 'Car battery', 50, 125000.00, '2022-09-08', 'purchase', 'delivered'),
       (NULL, 'Refrigerator', 10, 250000.00, '2022-10-09', 'sale', 'pending'),
       (NULL, 'Printer', 10, 50000.00, '2022-10-10', 'sale', 'delivered'),
       ('Acme Electronics', '50-in TV', 25, 125000.00, '2022-10-11', 'purchase', 'delivered'),
       (NULL, 'Jeans', 100, 250000.00, '2022-10-12', 'sale', 'delivered'),
       ('Furnish Co.', 'Sofa', 15, 375000.00, '2022-11-13', 'purchase', 'pending'),
       (NULL, 'Action figure', 150, 75000.00, '2022-11-14', 'sale', 'delivered'),
       ('Sportswear Co.', 'Basketball', 150, 37500.00, '2022-11-15', 'purchase', 'delivered'),
       (NULL, 'Perfume', 150, 375000.00, '2022-11-16', 'sale', 'delivered'),
       ('AutoWorks', 'Car battery', 75, 187500.00, '2022-12-17', 'purchase', 'delivered'),
       (NULL, 'Refrigerator', 15, 375000.00, '2022-12-18', 'sale', 'pending'),
       (NULL, 'Printer', 15, 75000.00, '2022-12-19', 'sale', 'delivered'),
       ('Furnish Co.', 'Sofa', 10, 250000.00, '2022-12-20', 'purchase', 'pending');
