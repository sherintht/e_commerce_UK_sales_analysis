-- 1. Preview the data
SELECT * FROM ecommerce_data LIMIT 10;
-- 2. Total number of orders
SELECT COUNT(DISTINCT Invoice) AS total_orders FROM ecommerce_data;
-- 3. Total sales amount
SELECT SUM(Quantity * Price) AS total_sales FROM ecommerce_data;
-- 4. Total sales by country
SELECT Country, SUM(Quantity * Price) AS total_sales
FROM ecommerce_data
GROUP BY Country
ORDER BY total_sales DESC;

-- 5. Top 10 selling products
SELECT Description, SUM(Quantity) AS total_quantity
FROM ecommerce_data
GROUP BY Description
ORDER BY total_quantity DESC
LIMIT 10;

-- 6. Daily sales trends
SELECT DATE(InvoiceDate) AS SaleDate, SUM(Quantity * Price) AS DailySales
FROM ecommerce_data
GROUP BY DATE(InvoiceDate)
ORDER BY SaleDate;

-- 7. Monthly sales trends
SELECT TO_CHAR(InvoiceDate, 'YYYY-MM') AS Month, SUM(Quantity * Price) AS MonthlySales
FROM ecommerce_data
GROUP BY TO_CHAR(InvoiceDate, 'YYYY-MM')
ORDER BY Month;

-- 8. Most valuable customers (by spend)
SELECT CustomerID, SUM(Quantity * Price) AS CustomerSpend
FROM ecommerce_data
GROUP BY CustomerID
ORDER BY CustomerSpend DESC
LIMIT 10;

-- 9. Average order value
SELECT AVG(total) AS avg_order_value
FROM (
    SELECT Invoice, SUM(Quantity * Price) AS total
    FROM ecommerce_data
    GROUP BY Invoice
) AS order_totals;

-- 10. Most active customers (by number of orders)
SELECT CustomerID, COUNT(DISTINCT Invoice) AS Orders
FROM ecommerce_data
GROUP BY CustomerID
ORDER BY Orders DESC
LIMIT 10;








