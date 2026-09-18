import pandas as pd


raw_data = {
    "OrderID": [1001, 1002, 1002, 1003, 1004, 1005],  
    "Item": [
        "White Peach Oolong",
        "Jasmine Green Tea",
        "Jasmine Green Tea",
        None,
        "Da Hong Pao",
        "Cheese Grape",
    ],  
    "Category": [
        "Milk Tea",
        "Fruit Tea",
        "Fruit Tea",
        "Milk Tea",
        "Milk Tea",
        "Fruit Tea",
    ],
    "Price": [16.5, 14.0, 14.0, 15.0, None, 19.5],  
    "Quantity": [2, 1, 1, 3, 1, 2],
}


df = pd.DataFrame(raw_data)
print("=== 原始脏数据 ===")
print(df)
print("-" * 40)


df_clean = df.drop_duplicates()


df_clean["Item"] = df_clean["Item"].fillna("Unknown Item")
df_clean["Price"] = df_clean["Price"].fillna(0)


df_clean["TotalSales"] = df_clean["Price"] * df_clean["Quantity"]

print("=== 清洗后规整商业数据 ===")
print(df_clean)


category_summary = df_clean.groupby("Category").agg(
    TotalRevenue=("TotalSales", "sum"),      
    TotalCups=("Quantity", "sum"),           
    AvgPrice=("Price", "mean")               
).reset_index()


category_summary["RevenueShare"] = (
    category_summary["TotalRevenue"] / category_summary["TotalRevenue"].sum()
).round(3)

print("=== 📊 门店品类高管战略大盘汇总 ===")
print(category_summary)


category_summary.to_csv("06_executive_category_summary.csv", index=False)
print("\n[SUCCESS] 已全自动生成高管决策报表 06_executive_category_summary.csv！")