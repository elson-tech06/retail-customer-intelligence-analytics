-- ====================================================================
-- Project: Retail Customer Intelligence & Segmentation Analysis
-- Author: Elson Chong
-- Description: Multi-table joins (4 tables), Customer Tiering (RFM - M),
--              and Executive Summary CTE for Revenue Concentration
-- ====================================================================

-- Step 1: Customer-Level Aggregation & RFM Tiering
WITH CustomerSummary AS (
    SELECT 
        c.CustomerID,
        c.CustomerName,
        ROUND(SUM(od.Quantity * p.Price), 2) AS TotalSpent,
        CASE
            WHEN SUM(od.Quantity * p.Price) > 10000 THEN '1. Diamond VIP'
            WHEN SUM(od.Quantity * p.Price) >= 5000 THEN '2. Gold VIP'
            WHEN SUM(od.Quantity * p.Price) >= 2000 THEN '3. Silver VIP'
            ELSE '4. Regular'
        END AS CustomerTier
    FROM Orders o
    INNER JOIN Customers c ON o.CustomerID = c.CustomerID
    INNER JOIN OrderDetails od ON o.OrderID = od.OrderID
    INNER JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY c.CustomerID, c.CustomerName
)

-- Step 2: Executive Management Overview (Boardroom View)
SELECT 
    CustomerTier,
    COUNT(CustomerName) AS TotalCustomers,
    ROUND(SUM(TotalSpent), 2) AS TotalRevenue
FROM CustomerSummary
GROUP BY CustomerTier
ORDER BY CustomerTier ASC;