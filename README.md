# 🛒 Global Retail Customer Intelligence & Segmentation Analysis
**Author:** Elson Chong  
**Role:** Data Analyst  
**Tech Stack:** SQL (Joins, CTEs, Aggregations, Window Functions), Business Analytics  

---

## 📌 1. Executive Summary (项目核心商业摘要)
This project analyzes transactional data across **4 relational tables** (Orders, Customers, OrderDetails, Products) to unlock high-value business insights for enterprise retail management. 

By implementing an **RFM Monetary Customer Segmentation Model**, the analysis revealed significant revenue concentration, providing actionable strategies for retention and revenue protection.

* **Total Revenue Analyzed:** $386,424.23
* **Total Active Customer Base:** 74 Unique Customers
* **Key Finding (Pareto Principle):** Top **17.6% (13 Diamond VIP customers)** contribute **60.2% ($232.5K)** of total company revenue.

---

## 📊 2. Strategic Management Dashboard (高管经营看板)

| Customer Tier (客户等级) | Spending Threshold (门槛) | Customer Count (客户数) | Total Revenue (总贡献营收) | Revenue Share (%) |
|:---|:---|:---|:---|:---|
| **1. Diamond VIP** | > $10,000 | **13** | **$232,522.05** | **60.2%** |
| **2. Gold VIP** | $5,000 - $10,000 | **9** | **$58,241.02** | **15.1%** |
| **3. Silver VIP** | $2,000 - $5,000 | **18** | **$64,543.05** | **16.7%** |
| **4. Regular** | < $2,000 | **34** | **$31,118.11** | **8.0%** |
| **Total** | - | **74** | **$386,424.23** | **100.0%** |

---

## 💡 3. Key Business Insights & Actionable Strategies (商业洞察与落地策略)

### 🚨 1. High-Net-Worth Account Protection (黑钻VIP大客户护城河)
* **Insight:** 仅 13 家黑钻客户决定了公司 60% 以上的生计。任何一家流失，都会造成数万美金的单月断崖式下滑。
* **Action:** 设立专门的大客户经理（Key Account Manager）提供专属一对一服务，并提供高定制化季末返利合同。

### 🚀 2. Mid-Tier Upselling Potential (黄金/白银客户向上跃迁)
* **Insight:** Gold & Silver 共有 27 家客户（贡献约 31.8% 营收），具备强劲的购买频次与忠诚度。
* **Action:** 针对客单价在 $4,000 和 $8,000 临界点的客户，推出“满额升级送运费/积分加倍”机制，刺激他们跨入下一档 VIP。

### 📉 3. Inactive & Low-Tier Churn Prevention (沉睡与散客激活)
* **Insight:** 经 `LEFT JOIN ... WHERE OrderID IS NULL` 排查，有 17 家注册会员从未下过一单；同时 34 家 Regular 客户贡献不到 8% 营收。
* **Action:** 停止对低净值散客的无差别补贴，针对 17 家零消费会员定向发放“首单 5 折限时激活券”。

---

## 💻 4. SQL Implementation Structure
The complete query logic is encapsulated in `01_customer_segmentation.sql`:
1. **Multi-Table Normalization:** Relational joins linking transactional headers, line items, and product price master tables.
2. **Dynamic Tiering:** `CASE WHEN` conditional segmentation logic.
3. **Executive Aggregation:** Common Table Expressions (CTE) to summarize tier distributions in a single high-performance scan.