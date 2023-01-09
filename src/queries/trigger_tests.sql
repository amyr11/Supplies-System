UPDATE product_categories
SET category_name = 'Toys'
WHERE category_name = 'Toy';

SELECT *
FROM suppliers;

SELECT *
FROM products;


UPDATE suppliers
SET supplier_name = 'Acme Electronics'
WHERE supplier_name = 'Acmen Electronics';

SELECT *
FROM transactions;


UPDATE products
SET product_name = '50-in TV'
WHERE product_name = 'TV';

SELECT *
FROM transactions;



-- UPDATE product_categories
-- SET category_name = 'Toy'
-- WHERE category_name = 'Toys';
-- 
-- SELECT *
-- FROM suppliers;
-- 
-- SELECT *
-- FROM products;
-- 
-- 
-- UPDATE suppliers
-- SET supplier_name = 'Acmen Electronics'
-- WHERE supplier_name = 'Acme Electronics';
-- 
-- SELECT *
-- FROM transactions;
-- 
-- 
-- UPDATE products
-- SET product_name = 'TV'
-- WHERE product_name = '50-in TV';
-- 
-- SELECT *
-- FROM transactions;