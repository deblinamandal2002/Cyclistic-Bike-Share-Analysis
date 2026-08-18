# 🚲 Cyclistic Bike-Share Analysis

## 📊 Google Data Analytics Capstone Project

A data analytics case study analyzing **Cyclistic**, a fictional bike-share company in Chicago, to understand how **casual riders and annual members use Cyclistic bikes differently**.

The goal of this project is to identify behavioral patterns and provide **data-driven marketing recommendations** that can help Cyclistic convert more casual riders into annual members.

---

## 🎯 Business Problem

Cyclistic has two major customer segments:

* **Annual members**
* **Casual riders**

Although annual memberships are an important part of Cyclistic's business model, casual riders represent a potential opportunity for membership growth.

The key business question is:

> **How do annual members and casual riders use Cyclistic bikes differently, and how can Cyclistic convert more casual riders into annual members?**

---

## 🧠 Business Objective

The analysis focuses on answering the following questions:

1. How does bike usage differ between casual riders and annual members?
2. Which days of the week have the highest usage?
3. How does ride duration differ between the two customer groups?
4. Which bike types are preferred by each group?
5. Which months or seasons generate the highest number of rides?
6. What behavioral patterns can help Cyclistic target casual riders?
7. What marketing strategies could increase annual memberships?

---

## 🗂️ Dataset

The analysis uses historical Cyclistic bike-share trip data.

Each trip contains information such as:

| Column               | Description                     |
| -------------------- | ------------------------------- |
| `ride_id`            | Unique identifier for each ride |
| `rideable_type`      | Type of bike used               |
| `started_at`         | Ride start timestamp            |
| `ended_at`           | Ride end timestamp              |
| `start_station_name` | Starting station                |
| `start_station_id`   | Starting station ID             |
| `end_station_name`   | Ending station                  |
| `end_station_id`     | Ending station ID               |
| `start_lat`          | Starting latitude               |
| `start_lng`          | Starting longitude              |
| `end_lat`            | Ending latitude                 |
| `end_lng`            | Ending longitude                |
| `member_casual`      | Customer type                   |

### Customer Types

* `member` → Annual Cyclistic member
* `casual` → Casual rider

---

## 🛠️ Tools & Technologies

### Data Analysis

* **SQL**
* Data Cleaning
* Data Transformation
* Exploratory Data Analysis
* Statistical/Descriptive Analysis

### Visualization

* **Tableau**

### Documentation & Version Control

* **Git**
* **GitHub**
* Markdown

---

## 🔄 Data Analytics Process

The project follows a structured analytics workflow:

```text
Business Understanding
        ↓
Data Collection
        ↓
Data Cleaning
        ↓
Data Transformation
        ↓
Exploratory Data Analysis
        ↓
SQL Analysis
        ↓
Data Visualization
        ↓
Insights
        ↓
Business Recommendations
```

---

# 🧹 Data Cleaning & Preparation

Before performing the analysis, the dataset was cleaned and transformed.

### Key Cleaning Steps

* Removed duplicate records.
* Checked for missing values.
* Validated ride start and end timestamps.
* Calculated ride duration.
* Identified invalid or negative ride durations.
* Extracted date-related features.
* Created day-of-week variables.
* Created month and season variables.
* Segmented rides by customer type.
* Checked categorical values for consistency.

### Derived Variables

The following variables were created for analysis:

```text
ride_length
day_of_week
month
year
season
```

### Ride Duration

Ride duration was calculated using:

```sql
TIMESTAMPDIFF(MINUTE, started_at, ended_at)
```

---

# 🔎 Exploratory Data Analysis

The analysis compares **casual riders vs annual members** across several dimensions.

### 1. Number of Rides

Compare the total number of rides taken by:

* Casual riders
* Annual members

### 2. Average Ride Duration

Analyze whether casual riders or members tend to have longer rides.

### 3. Weekly Usage

Compare riding behavior across:

* Monday
* Tuesday
* Wednesday
* Thursday
* Friday
* Saturday
* Sunday

### 4. Monthly Trends

Analyze ride volume across different months to identify:

* Peak riding periods
* Seasonal patterns
* Low-demand periods

### 5. Bike Type Preference

Compare usage of:

* Classic bikes
* Electric bikes
* Other available bike types

### 6. Station Analysis

Identify frequently used:

* Start stations
* End stations

This can help understand where casual riders are concentrated.

---

# 💻 SQL Analysis

Example analysis query:

```sql
SELECT
    member_casual,
    COUNT(*) AS total_rides,
    AVG(ride_length) AS avg_ride_duration
FROM cyclistic_trips
GROUP BY member_casual;
```

### Weekly Usage Analysis

```sql
SELECT
    member_casual,
    day_of_week,
    COUNT(*) AS total_rides
FROM cyclistic_trips
GROUP BY
    member_casual,
    day_of_week
ORDER BY
    member_casual,
    total_rides DESC;
```

### Monthly Usage Analysis

```sql
SELECT
    member_casual,
    month,
    COUNT(*) AS total_rides
FROM cyclistic_trips
GROUP BY
    member_casual,
    month
ORDER BY
    month;
```

> The complete SQL analysis is available in the `/sql` directory.

---

# 📊 Tableau Dashboard

The Tableau dashboard visualizes the major behavioral differences between casual riders and annual members.

### Dashboard Components

The dashboard includes:

* Total Rides
* Average Ride Duration
* Rides by Customer Type
* Rides by Day of Week
* Monthly Ride Trends
* Bike Type Usage
* Top Start Stations
* Top End Stations

### Suggested Dashboard Structure

```text
---------------------------------------------------
|             CYCLISTIC BIKE-SHARE               |
|              CUSTOMER ANALYSIS                  |
---------------------------------------------------
| Total Rides | Members | Casual | Avg Duration  |
---------------------------------------------------
|                                               |
| Monthly Ride Trend       | Rides by Day       |
|                                               |
---------------------------------------------------
| Bike Type Usage          | Customer Segment   |
|                                               |
---------------------------------------------------
|              Station Analysis                 |
---------------------------------------------------
```

---

# 📈 Key Insights

The analysis focuses on identifying meaningful behavioral differences between the two customer segments.

### Casual Riders

Casual riders generally demonstrate more **leisure-oriented riding behavior**, with usage patterns that can differ from members in terms of:

* Ride duration
* Weekend activity
* Seasonal usage
* Bike preferences
* Station usage

### Annual Members

Annual members tend to demonstrate more **consistent and routine usage**, which can indicate commuting or regular transportation behavior.

> **Important:** Replace these general observations with the exact findings calculated from your dataset before publishing the project.

---

# 💡 Business Recommendations

Based on the behavioral analysis, Cyclistic could consider the following strategies:

### 1. Weekend Membership Campaigns

Target casual riders during weekends when leisure riding activity is high.

### 2. Membership Conversion Offers

Introduce limited-time membership incentives for frequent casual riders.

### 3. Targeted Digital Marketing

Use ride frequency and behavioral patterns to identify high-potential casual riders.

### 4. Seasonal Campaigns

Increase marketing activity during periods with high casual-rider demand.

### 5. Station-Based Promotions

Target casual riders around high-volume stations with membership promotions.

### 6. Ride-to-Membership Messaging

Highlight the potential cost and convenience benefits of annual membership for frequent riders.

---

# 📁 Project Structure

```text
cyclistic-bike-share-analysis/
│
├── README.md
│
├── data/
│   ├── raw/
│   └── processed/
│
├── sql/
│   ├── data_cleaning.sql
│   ├── exploratory_analysis.sql
│   └── business_analysis.sql
│
├── tableau/
│   ├── cyclistic_dashboard.twb
│   └── dashboard_screenshot.png
│
├── reports/
│   ├── analysis.md
│   └── insights.md
│
└── images/
    ├── dashboard.png
    ├── monthly_trend.png
    └── customer_comparison.png
```

---

# 📊 Key Performance Indicators

The primary KPIs analyzed in this project include:

| KPI                   | Purpose                          |
| --------------------- | -------------------------------- |
| Total Rides           | Measures overall usage           |
| Member Rides          | Measures annual-member activity  |
| Casual Rides          | Measures casual-rider activity   |
| Average Ride Duration | Compares riding behavior         |
| Weekend Rides         | Measures leisure usage           |
| Weekday Rides         | Measures routine/commuting usage |
| Monthly Rides         | Identifies seasonal trends       |
| Bike Type Usage       | Identifies bike preferences      |

---

# 🎯 Final Business Question

The central objective of this project is not simply to determine **who rides more**.

The analysis aims to understand:

> **What behavioral differences exist between casual riders and annual members, and how can Cyclistic use these differences to design more effective membership-conversion strategies?**

---

# 🚀 Skills Demonstrated

This project demonstrates practical skills in:

* SQL
* Data Cleaning
* Data Transformation
* Exploratory Data Analysis
* Business Analysis
* Data Visualization
* Tableau
* KPI Development
* Customer Segmentation
* Data Storytelling
* Business Recommendations
* Git & GitHub

---

# 👩‍💻 Author

**Deblina Mandal**

Computer Science Graduate | Aspiring Data Analyst

### Skills

`SQL` `Excel` `Tableau` `Power BI` `Python` `Data Analytics`

---

# ⭐ Project Takeaway

This project demonstrates how raw bike-share transaction data can be transformed into **actionable business insights**.

By comparing casual riders and annual members, the analysis provides a data-driven foundation for Cyclistic's **customer segmentation and membership-conversion strategy**.

---

## 📌 Disclaimer

Cyclistic is a fictional company used in the **Google Data Analytics Professional Certificate Capstone Case Study**. The analysis is intended for educational and portfolio purposes.
