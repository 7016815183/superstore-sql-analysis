# 🛒 Superstore Sales Analysis Using SQL (MySQL Workbench)

## 📌 Project Overview  
This project performs an **end-to-end SQL analysis** on the Superstore dataset using **MySQL Workbench**.  
It demonstrates skills in **data analysis, business intelligence, and SQL querying**.

### It covers:
- ✅ Sales Analysis  
- ✅ Customer Insights  
- ✅ Product Performance  
- ✅ Regional & State Analysis  
- ✅ Shipping Efficiency  
- ✅ Time Series Trends (Monthly & Yearly)  
- ✅ Window Functions for Ranking  

---

## 📂 Dataset Description  
The dataset contains **145 records (2015–2018)** with the following fields:
- Order & Ship Dates (DD-MM-YYYY)  
- Customer & Product Details  
- Category & Sub-Category  
- Shipping Mode  
- Geography (Country, State, City, Region)  
- Sales Amount  

---

## 🎯 Business Questions Answered  

### 🧾 Sales  
- Which categories & sub-categories perform best?  
- Which regions generate maximum revenue?  
- What are the monthly & yearly sales trends?

### 👥 Customers  
- Who are the top customers?  
- Which segment spends the most?

### 📦 Products  
- Which items generate the most revenue?  
- Which products underperform?

### 🚚 Shipping  
- How fast does each shipping mode deliver?

### ⏳ Time Series  
- How does revenue change over years & months?

---

## 🗄 SQL Analysis  

### 1️⃣ Basic Exploration
```sql
SELECT COUNT(*) FROM train;
SELECT COUNT(DISTINCT `Order ID`) FROM train;
SELECT COUNT(DISTINCT `Customer ID`) FROM train;
SELECT COUNT(DISTINCT `Product ID`) FROM train;
```
**Results:**  
- Total Rows: 145  
- Orders: 72  
- Customers: 69  
- Products: 137  

---

### 2️⃣ Sales KPIs
```sql
SELECT SUM(Sales) AS total_sales FROM train;
SELECT ROUND(AVG(Sales), 2) AS avg_sales FROM train;
```
**Results:**  
- Total Sales → ₹28,609.94  
- Average Sale per Order → ₹197.31  

---

### 3️⃣ Category & Sub-Category Performance  

**Sales by Category**
| Category | Sales |
|-----------|--------|
| Furniture | ₹13,811.01 |
| Technology | ₹7,497.69 |
| Office Supplies | ₹7,301.23 |

**Top Sub-Categories**
| Sub-Category | Sales |
|---------------|--------|
| Phones | ₹5,481.69 |
| Tables | ₹5,113.62 |
| Bookcases | ₹3,877.79 |
| Chairs | ₹3,453.76 |

---

### 4️⃣ Regional & State Performance  

**Sales by Region**
| Region | Sales |
|---------|--------|
| West | ₹10,189.28 |
| Central | ₹7,939.63 |
| East | ₹6,327.32 |
| South | ₹4,153.70 |

✅ *West* is the top-performing region.

**Top 5 States by Sales**
| State | Sales |
|--------|--------|
| California | ₹6,019.33 |
| Pennsylvania | ₹3,476.74 |
| Texas | ₹3,424.96 |
| New York | ₹1,843.40 |
| Illinois | ₹1,710.70 |

➡️ *California contributes over 20% of total revenue.*

---

### 5️⃣ Customer Insights  

**Top Customers**
| Customer | Sales |
|-----------|--------|
| Brosina Hoffman | ₹3,714.30 |
| Tracy Blumstein | ₹3,341.63 |
| Gene Hale | ₹1,288.46 |

**Segment-wise Performance**
| Segment | Sales |
|----------|--------|
| Consumer | ₹19,343.59 |
| Corporate | ₹5,715.72 |
| Home Office | ₹3,550.62 |

✅ *Consumer segment dominates overall revenue.*

---

### 6️⃣ Product Analysis  

**Top Products**
| Product | Sales |
|----------|--------|
| Riverside Bookcase | ₹3,083.43 |
| Bretford Table | ₹2,002.21 |
| Chromcraft Conference Table | ₹1,706.18 |

**Product Count by Sub-Category**
| Sub-Category | Count |
|---------------|--------|
| Binders | 22 |
| Furnishings | 16 |
| Paper | 16 |
| Phones | 14 |

---

### 7️⃣ Shipping Performance  
```sql
SELECT 
  `Ship Mode`,
  ROUND(AVG(DATEDIFF(
      STR_TO_DATE(`Ship Date`, '%d-%m-%Y'),
      STR_TO_DATE(`Order Date`, '%d-%m-%Y')
  )),2) AS avg_shipping_days
FROM train
GROUP BY `Ship Mode`;
```

| Ship Mode | Avg Shipping Days |
|------------|-------------------|
| First Class | 2.19 |
| Second Class | 3.48 |
| Standard Class | 5.09 |

✅ *First Class* = fastest shipping mode.

---

### 8️⃣ Time Series Analysis  

**Monthly Trend**
- 📅 Best Month → *September 2016* → ₹5,240.12  

**Yearly Sales Trend**
| Year | Sales |
|------|--------|
| 2016 | ₹10,936.89 |
| 2015 | ₹7,740.38 |
| 2017 | ₹7,257.64 |
| 2018 | ₹2,675.02 |

✅ *2016 was the best-performing year.*  
📉 *Sales declined significantly in 2018.*

---

## 📊 Key Insights Summary  

| Category | Insight |
|-----------|----------|
| 🗺 Region | West leads; South lags |
| 👥 Customers | Consumer segment dominates |
| 💰 Products | Phones & Tables perform best; Office Supplies underperform |
| 🚚 Shipping | First Class is fastest (2.19 days) |
| ⏳ Time Series | Best Year → 2016; Best Month → Sept 2016; Drop in 2018 |

---

## ✅ Conclusion  
This project delivers **comprehensive insights** into sales, customers, products, shipping, and time trends.  
It highlights strong **SQL query writing, analytical thinking, and business intelligence** capabilities.

---

## 🚀 How to Use This Project  
1. Import the CSV dataset into **MySQL Workbench**  
2. Run the provided SQL queries sequentially  
3. Analyze the outputs  
4. Use insights for BI dashboards or interview discussions  

---

## 👨🏻‍💻 Author  
**Bhavya Panchal**  
💡 SQL | Power BI | Excel | Data Analytics  

---

