# Cyclistic Bike-Share Analysis

## Business Problem

Cyclistic is a bike-share company in Chicago offering different pricing plans, including single-ride/day passes for **casual riders** and annual memberships for **members**.

The marketing team wants to increase the number of annual memberships. To achieve this, they need to understand **how casual riders and annual members use Cyclistic bikes differently** and identify opportunities to convert casual riders into long-term members.

### Key Business Question

> **How do casual riders and annual members use Cyclistic bikes differently, and how can these differences be used to design strategies that increase annual memberships?**

---

## Introduction

This case study analyzes historical Cyclistic bike-trip data to identify differences in **riding frequency, duration, timing, bike preferences, and station usage** between casual riders and annual members.

The analysis follows the **Google Data Analytics framework**:

**Ask → Prepare → Process → Analyze → Share → Act**

The project combines **R, SQL, and Tableau** to transform raw trip data into business insights and actionable marketing recommendations.

---

# 1. Ask

### Business Objective

The primary objective is to understand the behavioral differences between **casual riders** and **annual members** and use those insights to recommend marketing strategies for converting casual riders into annual members.

### Stakeholders

- **Director of Marketing** — responsible for developing marketing campaigns and initiatives
- **Marketing Analytics Team** — responsible for collecting, analyzing, and reporting data
- **Cyclistic Executive Team** — responsible for evaluating and approving the recommended marketing strategy

---

# 2. Prepare

The analysis uses Cyclistic's publicly available historical trip data provided by **Motivate International Inc.**

The dataset contains information about individual bike trips, including:

- Ride ID
- Bike type
- Start and end timestamps
- Start and end stations
- Start and end latitude/longitude
- Rider type — casual or member

The raw data is provided as monthly CSV files and was consolidated for analysis.

### Data Source

[Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html)

The data is made available under the [Divvy Data License Agreement](https://ride.divvybikes.com/data-license-agreement).

---

# 3. Process

The data was cleaned and prepared using **R and SQL**.

### R Data Preparation

The R workflow was used to:

- Import and combine monthly CSV files
- Inspect the structure and data types
- Convert timestamp fields into appropriate date/time formats
- Calculate ride duration
- Create day-of-week and month variables
- Identify and remove invalid records
- Explore rider and bike-type distributions
- Prepare datasets for analysis and visualization

The analysis also used packages and functions from the **tidyverse, ggplot2, and lubridate** ecosystem.

### SQL Data Preparation

The SQL workflow independently consolidated the 12 monthly 2021 datasets using `UNION ALL`, producing **5,595,063 trip records** before cleaning.

Data-quality checks included:

- Ride ID uniqueness and length
- Bike-type values
- Ride duration
- Station-name consistency
- Missing station information
- Missing latitude/longitude
- Rider-type values

The SQL cleaning process also standardized bike types, cleaned station names, handled missing station information, created date/time attributes, calculated ride duration, and removed maintenance/testing records. 
---

# 4. Analyze

The analysis focuses on identifying behavioral differences between casual riders and annual members.

### Ridership Patterns

The project analyzes:

- Total rides by rider type
- Rides by month
- Rides by day of the week
- Rides by hour
- Weekday vs. weekend usage
- Average ride duration

The R analysis found that casual riders had substantially longer rides than members. The documented results show an average ride duration of approximately **45 minutes for casual riders compared with approximately 16 minutes for members**.

Casual riders also showed a stronger concentration of rides on weekends, while member ridership was more consistent across the week.

### Seasonal Behavior

The analysis identified **July–September** as an important period for casual riders. In the R analysis, approximately **57.5% of casual rides** occurred during these three months, compared with approximately **42.5% during the rest of the year**.

For members, the distribution was more balanced, with approximately **49.6% of rides occurring from July–September** and **50.4% during the rest of the year**.

### Bike Preferences

Rider behavior was also examined by bike type to understand differences in preferences between casual riders and members.

### Stations and Routes

The analysis identified popular starting stations and routes for both rider groups.

The SQL analysis additionally prepared station-level datasets for:

- Popular starting stations
- Popular ending stations
- Casual vs. member station usage
- Bike-lock ending locations



### SQL Analysis

SQL was used to aggregate the cleaned data into analytical datasets covering:

- Bike type preference
- Monthly ride volume
- Daily ride volume
- Hourly ride volume
- Average ride duration
- Starting stations
- Ending stations
- Bike-lock locations

The analysis also used a window function to calculate overall average ride duration by rider type.

---

# 5. Share

The findings were translated into visual insights using **Tableau**.

### Tableau Dashboard

The dashboard explores:

- Casual vs. member trip volume
- Bike-type preferences
- Trip frequency by time
- Starting-station frequency
- Ending-station frequency
- Ending electric-bike lock locations

The dashboard provides an interactive way to compare rider behavior and identify patterns that can support marketing decisions.

---

# 6. Act

The analysis suggests several opportunities for increasing annual memberships.

### Recommended Strategies

**1. Target casual riders during peak months**

July–September represents a particularly important period for casual usage. Marketing campaigns should be intensified during these months when casual riders are most active.

**2. Promote membership options around popular locations**

Marketing campaigns can focus on high-traffic stations and locations associated with casual riders, particularly during peak periods.

**3. Introduce flexible membership offers**

Weekly, monthly, or quarterly promotional offers could act as an entry point for casual riders who may not initially want to commit to an annual membership.

**4. Use targeted digital marketing**

Digital campaigns, search marketing, and location-focused promotions can target people already demonstrating an interest in Cyclistic's services.

**5. Promote the benefits of regular cycling**

Membership campaigns can emphasize potential health, environmental, and lifestyle benefits of regular cycling.

**6. Explore partnerships**

Cyclistic could collaborate with organizations, companies, and relevant local businesses to introduce membership offers to potential recurring users.

---

# Conclusion

The analysis shows that **casual riders and annual members have distinct usage patterns**.

Casual riders tend to take **longer rides**, show stronger **weekend usage**, and have a greater concentration of activity during the **July–September period**. Members, in contrast, demonstrate more consistent usage throughout the week and shorter average ride durations.

These behavioral differences provide Cyclistic with an opportunity to move beyond broad marketing campaigns and develop **targeted strategies based on actual customer behavior**.

By combining **R for data preparation and exploratory analysis, SQL for data cleaning and analytical querying, and Tableau for data visualization**, this project transforms raw bike-trip records into insights that can support Cyclistic's membership-growth strategy.

---

## Tools Used

- **R** — Data preparation, cleaning, exploratory analysis, and visualization
- **SQL** — Data validation, cleaning, transformation, and analysis
- **Tableau** — Interactive data visualization and dashboarding
- **Microsoft Excel** — Initial data inspection

---

## Project Structure

```text
Cyclistic-Bike-Share-Analysis/
│
├── R/
│   └── cyclist-google-data-analytics-capstone-project.ipynb
│
├── SQL/
│   ├── pre_cleaning_exploration.sql
│   └── data_cleaning_analysis.sql
│
├── Tableau/
│   └── Google Data Analytics Capstone Project_ Cyclistic Data.twbx
│
├── Data/
│   └── README.md
│
└── README.md
```

---

## Data Source

[Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html)

The dataset is provided by Motivate International Inc. under the [Divvy Data License Agreement](https://ride.divvybikes.com/data-license-agreement).