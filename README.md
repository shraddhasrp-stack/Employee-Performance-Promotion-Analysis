
# 📊 Employee Performance & Promotion Analysis | HR Analytics

## 📌 Project Overview

This project analyzes an HR dataset to evaluate employee performance, promotion patterns, and workplace behavior. The dataset was structured into relational tables and analyzed using SQL, with insights visualized through an interactive Tableau dashboard.
The objective is to identify key factors influencing promotions and assess whether workplace metrics such as training, attendance, and work hours impact employee performance.

---

## 🛠️ Tools & Technologies

* **SQL Server (SSMS)** – Data cleaning, transformation, and analysis
* **Tableau Public** – Data visualization and dashboard creation
* **Excel/CSV** – Data extraction and integration

---

## 📂 Dataset Description

The dataset contains ~5000 employee records with attributes such as:

* Department & Job Role
* Performance Score & KPI Score
* Attendance & Task Completion
* Work Hours & Training Hours
* Peer Rating & Manager Feedback
* Promotion Eligibility

For analysis, the dataset was structured into three tables:

* **Department** (Employee details)
* **Promotion_Eligibility** (performance & promotion data)
* **Work_Log** (attendance, training, and productivity metrics)

---

## 🔍 Key Analysis Performed (SQL)

* Department-wise promotion rate analysis
* Promotion probability based on performance levels
* Peer vs Manager evaluation comparison
* Training & work hours impact on performance
* Top job roles by KPI and performance scores
* Attendance vs Task Completion Comparison
* Department wise Productivity Comparison


---

## 📊 Dashboard Insights (Tableau)

### 1. Department-wise Promotion Rate

* Promotion rates are consistent across departments (~13–15%)
* No significant department-level bias observed

### 2. Promotion vs Performance

* High performers (~90+ score) have significantly higher promotion rates (~49%)
* Medium performers have low promotion probability (~9%)
* Low performers receive virtually no promotions

👉 **Performance is the strongest driver of promotion**

---

### 3. Peer vs Manager Evaluation Bias

* Only ~4% of ratings match exactly
* ~48% cases where manager rating is higher
* ~47% cases where peer rating is higher

👉 Indicates inconsistency in evaluation methods

---

### 4. Work & Training Impact

* Average work hours (~44 hrs) are consistent across all performance levels
* Training hours (~14–15 hrs) show minimal variation

👉 **No strong correlation between training/work hours and performance**

---

### 5. Top Job Roles

* KPI and performance scores are relatively uniform across roles
* Minor variations exist but no dominant role

---

## 📈 Key Takeaways

* Performance score is the primary factor influencing promotions
* Promotion distribution is fair across departments
* Training and work hours have limited impact on performance
* Employee evaluation shows inconsistencies between peers and managers
* Workforce has a low proportion of high-performing employees

---

## 📊 Dashboard

### 1. Department-wise Promotion Rate Analysis
### 2. Employee Distribution & Promotion Rate by Performance Level
### 3. Peer vs Manager Evaluation Bias
### 4. Avg Training Hours & Avg Work Hours by Performance Level
### 5. Top 5 Job Roles by Avg KPI Score & Avg Performance Score

<img width="1365" height="740" alt="image" src="https://github.com/user-attachments/assets/67615f58-bdfe-4197-9732-fa8fcc6f36b9" />

---

## 📎 Dashboard Link  
[View Dashboard](https://public.tableau.com/app/profile/shraddha.patil7431/viz/EmployeePerformancePromotionAnalysis/Dashboard1?publish=yes)

---

## 🚀 Project Highlights

* Applied SQL joins, aggregations, and case statements for analysis
* Built a structured dataset for visualization
* Designed an interactive Tableau dashboard with business insights
* Focused on both technical analysis and data storytelling

---
