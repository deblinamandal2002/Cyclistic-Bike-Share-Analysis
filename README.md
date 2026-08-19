# Cyclistic Bike-Share Case Study

## Business Scenario

Cyclistic is a bike-share company in Chicago that offers both **casual rides** and **annual memberships**. While casual riders generate significant usage, annual members provide a more consistent customer base and are strategically important for long-term growth.

The marketing team wants to understand **how casual riders and annual members use Cyclistic bikes differently** and identify opportunities to convert more casual riders into annual members.

## Introduction

This case study analyzes Cyclistic's **2021 historical trip data** to identify differences in riding behavior between casual riders and annual members.

The analysis follows the **Google Data Analytics framework — Prepare, Process, Analyze, Share, and Act** — using **SQL, R, and Tableau** to clean, analyze, visualize, and communicate the findings.

**Primary business question:**

> How do annual members and casual riders use Cyclistic bikes differently, and how can these differences be used to increase annual memberships?

---

## 1. Prepare

The analysis uses Cyclistic's publicly available **Divvy Trip Data**, consisting of monthly trip records from 2021.

The dataset contains information such as:

- Ride ID and bike type
- Start and end timestamps
- Start and end stations
- Geographic coordinates
- Rider type — casual or member

The 12 monthly datasets were combined to create a single dataset for analysis.

**Data Source:** [Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html)

---

## 2. Process

The raw data was examined and prepared for analysis by:

- Combining the monthly datasets
- Checking for duplicate ride IDs
- Identifying missing and inconsistent values
- Validating ride durations
- Cleaning station names and categorical fields
- Handling missing station information
- Standardizing bike-type values
- Creating derived variables such as:
  - Ride duration
  - Month
  - Day of week
  - Hour of day

SQL was primarily used for **data cleaning, transformation, validation, and preparation for analysis**.

---

## 3. Analyze

The cleaned dataset was analyzed to compare **casual riders vs. annual members** across several dimensions:

- Total number of rides
- Monthly riding patterns
- Day-of-week usage
- Hourly riding patterns
- Average ride duration
- Bike-type preference
- Most frequently used starting stations
- Most frequently used ending stations
- Ending bike-lock locations

The analysis focused on identifying behavioral patterns that could help Cyclistic understand **when, where, and how differently the two customer groups use the service**.

---

## 4. Share

The findings were presented through an interactive **Tableau dashboard**, allowing the differences between casual riders and annual members to be explored visually.

### Dashboard

The dashboard highlights:

- Casual vs. member trip volume
- Bike-type preferences
- Trip frequency by time
- Popular starting and ending stations
- Ending electric-bike lock locations
- Differences in riding behavior throughout the year

The visualizations are designed to translate the SQL/R analysis into **business-friendly insights** that can support marketing decisions.

---

## 5. Act

Based on the observed differences in riding behavior, Cyclistic can develop targeted strategies to encourage casual riders to become annual members.

Potential strategies include:

- **Targeted membership campaigns** during periods when casual usage is highest
- Promoting membership benefits to frequent casual riders
- Using popular stations as locations for membership-focused marketing
- Designing campaigns around the riding patterns and preferences of casual customers
- Using behavioral data to personalize membership offers rather than applying the same campaign to all riders

The key idea is to **convert high-value casual riding behavior into long-term membership relationships**.

---

## Solution

The analysis provides Cyclistic with a data-driven understanding of the differences between casual riders and annual members.

By combining **SQL for data preparation and analysis, R for analytical support, and Tableau for visualization**, the project transforms raw trip records into actionable customer insights.

The results can help the marketing team design more targeted campaigns focused on **converting casual riders into annual members**.

---

## Conclusion

The Cyclistic case study demonstrates an end-to-end data analytics workflow:

**Prepare → Process → Analyze → Share → Act**

Rather than simply reporting the number of rides, the analysis focuses on **customer behavior and its business implications**. The resulting insights provide a foundation for Cyclistic to make more informed membership-growth and marketing decisions.

### Tools Used

- **SQL** — Data cleaning, transformation, validation, and analysis
- **R** — Data analysis and exploration
- **Tableau** — Data visualization and dashboarding
- **CSV** — Raw and processed datasets

### Data Source

[Divvy Trip Data](https://divvy-tripdata.s3.amazonaws.com/index.html)
