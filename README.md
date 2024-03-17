Chennai Covid Camp Analysis Project

## Overview

This project involves the analysis of COVID vaccination camp data in Chennai. The dataset contains information about vaccination centers, sessions, and various attributes related to the vaccination campaign. The analysis is conducted using SQL to derive meaningful insights from the data.

## Data Cleaning

1. **Change Date Columns Datatype:**
   - Converted the datatype of date columns to ensure consistency and proper handling of date values.

2. **Allow All Types to Boolean:**
   - Converted the `allow_all_age` column to a boolean datatype for better representation.

3. **Age Limit Replacement:**
   - Replaced NA values in the age limit column to enhance data completeness.

4. **Remove Null Values:**
   - Removed null values from all columns to ensure data quality and accuracy.

5. **Set Unique Session ID:**
   - Applied unique constraints to the session ID column to ensure data integrity.

6. **Change 'From' & 'To' Column Datatype to Time:**
   - Converted the 'from' and 'to' columns to the time datatype for consistency and proper time handling.

## Framed Questions

1. **How Many Centers Are Established to Conduct This Vaccine Campaign?**
2. **What Are the Areas Where Camps Are Conducted?**
3. **How Many Free and How Many Paid Sessions Were Conducted?**
4. **How Many Sessions Were Conducted in Total?**
5. **On Which Date Were the Most Sessions Conducted?**
6. **Which Vaccine Was Most Frequently Used?**
7. **What Is the Total Duration of the Vaccination Camp?**
8. **Top 5 Busiest Centers Based on Sessions Conducted?**
9. **Start Date and End Date of the Vaccination Camp?**
10. **Dates and Centers Where Available Capacity Was Zero?**
11. **Total and Highest Capacity for Dose 1?**
12. **Total and Highest Capacity for Dose 2?**
13. **Highest Fee Charged and Total Fee Collected?**
14. **Average Number of Hours Spent Per Day?**
15. **Area That Conducted the Highest Number of Sessions?**

## Usage

- Clone the repository.
- Import the cleaned dataset into your SQL database.
- Run the provided SQL queries to obtain insights and answers to the framed questions.

## Conclusion

This project aims to provide valuable insights into the COVID vaccination campaign in Chennai through data analysis using SQL. The derived insights can be useful for optimizing vaccination strategies and resource allocation.
