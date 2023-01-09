CREATE TRIGGER update_supplier_product_lines
AFTER UPDATE OF category_name ON Product_Categories
REFERENCING OLD AS oldVal NEW AS newVal
FOR EACH ROW MODE DB2SQL
    UPDATE Suppliers
    SET product_lines = newVal.category_name
    WHERE product_lines = oldVal.category_name;

CREATE TRIGGER update_product__category
AFTER UPDATE OF category_name ON Product_Categories
REFERENCING OLD AS oldVal NEW AS newVal
FOR EACH ROW MODE DB2SQL
  UPDATE Products
  SET category = newVal.category_name
  WHERE category = oldVal.category_name;

CREATE TRIGGER update_transaction_supplier
AFTER UPDATE OF supplier_name ON Suppliers
REFERENCING OLD AS oldVal NEW AS newVal
FOR EACH ROW MODE DB2SQL
    UPDATE Transactions
    SET supplier_name = newVal.supplier_name
    WHERE supplier_name = oldVal.supplier_name;

CREATE TRIGGER update_transaction_product
AFTER UPDATE OF product_name ON Products
REFERENCING OLD AS oldVal NEW AS newVal
FOR EACH ROW MODE DB2SQL
    UPDATE Transactions
    SET product_name = newVal.product_name
    WHERE product_name = oldVal.product_name;