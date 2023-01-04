-- Revenue per month
SELECT MONTH(transaction_date) AS transaction_month, 
       SUM(cost) AS revenue
FROM Transactions
WHERE status = 'delivered'
      AND transaction_type = 'sale'
GROUP BY MONTH(transaction_date);