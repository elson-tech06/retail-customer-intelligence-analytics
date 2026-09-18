-- ====================================================================
-- Project: Retail Customer Intelligence & Segmentation Analysis
-- Script: 02_top_products_ranking.sql
-- Description: Window Functions (ROW_NUMBER) to identify Top 2 
--              highest-priced / top-selling products per category
-- ====================================================================

WITH RankedProducts AS (
    SELECT 
        CategoryID,
        ProductName,
        Price,
        ROW_NUMBER() OVER(
            PARTITION BY CategoryID 
            ORDER BY Price DESC
        ) AS PriceRank
    FROM Products
)
SELECT 
    CategoryID,
    ProductName,
    Price,
    PriceRank
FROM RankedProducts
WHERE PriceRank <= 2;