# 🛒 Global Retail Customer Intelligence & Pricing Strategy Platform

**Author:** Elson Chong Junn Xenn  
**Role:** Data & Business Intelligence Specialist  
**Tech Stack:** SQL (PostgreSQL), Python (Pandas), Power BI (DAX), Git/GitHub  
**Project Repository:** [github.com/elson-tech06/retail-customer-intelligence-analytics](https://github.com/elson-tech06/retail-customer-intelligence-analytics)

---

## 📌 1. Executive Summary (项目核心商业摘要)

This end-to-end analytics platform integrates **transactional database engineering, automated ETL pipelines, and executive-level interactive BI dashboards** to solve key revenue concentration and pricing optimization challenges in modern retail operations.

By establishing an **RFM Monetary Customer Segmentation Model** and an **Automated Category Aggregation Pipeline**, the platform equips leadership with clear visibility into key-account churn risks and product pricing dynamics.

* **Total Revenue Analyzed:** $386,424.23 across 4 relational schemas
* **Active Customer Base:** 74 Unique Accounts (with 17 inactive churn prospects flagged)
* **Pareto Principle Confirmed:** Top **17.6% (13 Diamond VIPs)** generate **60.2% ($232.5K)** of total enterprise revenue, averaging **$17.89K ARPU**.
* **ETL Pipeline Performance:** Programmatically cleans, validates, and aggregates high-volume transactions in **< 0.1 seconds** via Python (Pandas).

---

## 📊 2. Strategic Management Dashboard & Metrics (高管经营看板与分层数据)

| Customer Tier (客户等级) | Spending Threshold (门槛) | Customer Count (客户数) | Total Revenue (总贡献营收) | Revenue Share (%) | Avg Revenue / Cust (客单价) |
|:---|:---|:---|:---|:---|:---|
| **1. Diamond VIP** | > $10,000 | **13** | **$232,522.05** | **60.2%** | **$17,886.31** |
| **2. Gold VIP** | $5,000 - $10,000 | **9** | **$58,241.02** | **15.1%** | **$6,471.22** |
| **3. Silver VIP** | $2,000 - $5,000 | **18** | **$64,543.05** | **16.7%** | **$3,585.73** |
| **4. Regular** | < $2,000 | **34** | **$31,118.11** | **8.0%** | **$915.24** |
| **Total / Overall** | - | **74** | **$386,424.23** | **100.0%** | **$5,221.95** |

---

## 🏗️ 3. Full-Stack Technical Architecture (三层技术架构体系)

### 🔹 Layer 1: Data Engineering & Cleansing Pipeline (Python / Pandas)
* **File:** `05_clean_retail_data.py`
* **Data Cleansing:** Automated removal of duplicate POS transaction logs (`drop_duplicates()`) and structured imputation of missing fields (`fillna()`), guarding downstream reporting against pipeline crashes.
* **Vectorized Processing:** Programmatically calculated gross order line revenues and executed multi-metric group aggregations (`groupby.agg()`).
* **Automated Deliverables:** Outputs clean, audit-ready operational feeds (`05_cleaned_orders_output.csv` and `06_executive_category_summary.csv`) within 0.1 seconds.

### 🔹 Layer 2: Advanced Relational Analytics (PostgreSQL)
* **Files:** `01_customer_segmentation.sql`, `02_top_products_ranking.sql`
* **Relational Multi-Table Joins:** Joined 4 normalized tables (`Orders`, `OrderDetails`, `Customers`, `Products`).
* **Advanced Window Functions:** Implemented `ROW_NUMBER() OVER (PARTITION BY CategoryID ORDER BY UnitPrice DESC)` to accurately extract top-tier revenue drivers per department.
* **CTE & Dynamic Classification:** Segmented client accounts using multi-conditional `CASE WHEN` logic inside modular Common Table Expressions.

### 🔹 Layer 3: Executive Business Intelligence & Modeling (Power BI & DAX)
* **File:** `Retail_Customer_Dashboard.pbix`
* **UI/UX Visual Hierarchy:** Modern enterprise dashboard design featuring KPI beacons, custom card styling, donut macro-distribution, and aligned bar charts.
* **Dynamic DAX Measures:** Authored safe-division measures with built-in error handling:
  ```dax
  Avg_Revenue_Per_Customer = 
  DIVIDE(
      SUM('03_customer_segmentation_summary'[TotalRevenue]), 
      SUM('03_customer_segmentation_summary'[TotalCustomers]), 
      0
  )
  ```
* **Interactive Slicing & Context Transition:** Integrated pill-style category slicers with dynamic cross-filtering, recalculating tier metrics in real time.

---

## 💡 4. Key Business Insights & Actionable Strategies (商业洞察与落地策略)

### 🚨 1. High-Net-Worth Account Retention (黑钻 VIP 大客户护城河)
* **Insight:** 仅 13 家黑钻客户决定了公司 60.2% 的生计，人均产值高达 $17.89K。任何单个核心客户流失都将造成严重的月度财务缺口。
* **Action:** 设立专门的大客户经理（Key Account Manager）提供 1v1 履约服务，并根据历史采购规模定制季度阶梯返利合同。

### 🚀 2. Mid-Tier Account Upselling (黄金/白银客户向上跃迁)
* **Insight:** Gold 与 Silver 两层共 27 家客户贡献了 31.8% 营收，复购意愿稳定且具备扩展空间。
* **Action:** 针对处于跃迁临界点（如 $4,500 与 $8,500）的客户，推出“满额升级享专属运费减免与供应链优先排期”，激励其跨入更高消费层级。

### 📉 3. Inactive Reactivation & Regular Efficiency (沉睡激活与散客精细化)
* **Insight:** 经 `LEFT JOIN ... WHERE OrderID IS NULL` 排查出 17 家零消费注册会员；同时 34 家散客仅贡献 8.0% 营收。
* **Action:** 停止面向大众散客的无差别价格补贴，将营销预算转向对 17 家沉睡用户推送限时“首单立减 20%”定向激活活动。

---

## 📂 5. Repository File Structure (代码与资产目录)

```plaintext
├── 01_customer_segmentation.sql          # PostgreSQL: 4表联查与客户层级划分
├── 02_top_products_ranking.sql           # PostgreSQL: 窗口函数提取品类头牌爆款
├── 03_customer_segmentation_summary.csv  # 客户分层聚合结果
├── 04_top_products_ranking.csv           # 各品类头牌产品清单
├── 05_clean_retail_data.py               # Python: 自动化去重、补缺与品类聚合管道
├── 05_cleaned_orders_output.csv          # Python 清洗后的规范交易数据源
├── 06_executive_category_summary.csv     # Python 秒级聚合的高管品类报表
├── Retail_Customer_Dashboard.pbix        # Power BI 原生高管交互大屏工程文件
└── README.md                             # 商业分析与系统架构全景公文
```
