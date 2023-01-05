-- Revenue per month
-- SELECT MONTH(transaction_date) AS transaction_month, 
--        SUM(cost) AS revenue
-- FROM Transactions
-- WHERE status = 'delivered'
--       AND transaction_type = 'sale'
-- GROUP BY MONTH(transaction_date);

-- Drafts
-- SELECT product_name, SUM(quantity) as remaining_stocks
-- FROM transactions
-- WHERE status = 'delivered'
-- GROUP BY product_name
-- ORDER BY remaining_stocks DESC;

-- SELECT SUM(cost) as profit
-- FROM transactions
-- WHERE status = 'delivered';

-- SELECT product_name, SUM(cost) as profit
-- FROM transactions
-- WHERE status = 'delivered'
-- GROUP BY product_name
-- ORDER BY profit DESC;