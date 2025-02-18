# HR DATA Analysis SQL Project

## Project Overview

**Project Title**: HR Data Analysis  
**Database**: `hrproject`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze HR dataset. The project involves setting up a HR database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries. 

## Objectives

1. **Set up a retail sales database**: Create and populate a HR database with the provided HR data.
2. **Data Cleaning**: Identify and remove any records with missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the sales data.

## Project Structure

### 1. Database Setup

- **Database Creation**: The project starts by creating a database named `hrproject`.
- **Table Creation**: A table named `hrdatatable` is created to store the HR data. The table structure includes columns for First_Name , Last_Name,	EmpID,	MarriedID,	MaritalStatusID,	GenderID,	EmpStatusID,	DeptID,	PerfScoreID,	FromDiversityJobFairID,	Salary,	Termd,	PositionID, Position, State,	Zip,	DOB,	Sex, MaritalDesc, CitizenDesc,	HispanicLatino,	RaceDesc,	DateofHire,	DateofTermination,	TermReason,	EmploymentStatus, Department, ManagerName,	ManagerID,	RecruitmentSource, PerformanceScore,	EmpSatisfaction,	SpecialProjectsCount, LastPerformanceReview_Date, DaysLateLast30, Absences	



```sql
CREATE TABLE & DROPPING TABLE

       DROP TABLE IF EXISTS hrdatatable

	   CREATE TABLE hrdatatable (


	   First_Name	varchar (20),
	   Last_Name	varchar (20),
	   EmpID	  int,
	   MarriedID	int ,
	   MaritalStatusID	int,
	   GenderID	     int,
	   EmpStatusID	int,
	   DeptID	 int,
	   PerfScoreID	int,
	   FromDiversityJobFairID	int,
	   Salary	float,
	   Termd	float,
	   PositionID	int,
	   Position	 varchar (30),
	   State	varchar (20),
	   Zip	int,
	   DOB	date,
	   Sex	varchar (15),
	   MaritalDesc	varchar (15),
	   CitizenDesc	varchar(25),
	   HispanicLatino	varchar (20),
	   RaceDesc	 varchar (40),
	   DateofHire	date, 
	   DateofTermination date, 
	   TermReason	varchar(40),
	   EmploymentStatus	varchar (25),
	   Department	varchar (25),
	   ManagerName	varchar (25),
	   ManagerID	int,
	   RecruitmentSource	varchar (30),
	   PerformanceScore	varchar (20),
	   EmpSatisfaction	int,
	   SpecialProjectsCount	int,
	   LastPerformanceReview_Date	date,
	   DaysLateLast30	int,
	   Absences int
       );
```

### 2. Data Exploration & Cleaning

- **Record Count**: Determine the total number of records in the dataset.
- **Customer Count**: Find out how many unique employee are in the dataset.
- **Category Count**: Identify all unique product categories in the dataset.
- **Null Value Check**: Check for any null values in the dataset and delete records with missing data.

```sql
SELECT *
		FROM hrdatatable
		WHERE First_Name IS NULL
		OR 	Last_Name	IS NULL
		OR EmpID IS NULL
		OR
		MarriedID IS NULL
		OR	MaritalStatusID	IS NULL
		OR GenderID	IS NULL
		OR
		EmpStatusID	IS NULL
		OR DeptID	IS NULL
		OR PerfScoreID	IS NULL
		OR FromDiversityJobFairID	IS NULL
		OR Salary	IS NULL
		OR Termd	IS NULL
		OR PositionID	IS NULL
		OR Position	IS NULL
		OR State	IS NULL
		OR Zip IS NULL
		OR	DOB IS NULL
		OR	Sex	IS NULL
		OR MaritalDesc IS NULL
		OR	CitizenDesc	 IS NULL
		OR HispanicLatino	IS NULL
		OR RaceDesc	IS NULL
		OR DateofHire IS NULL
		OR	DateofTermination	IS NULL
		OR TermReason IS NULL
		OR EmploymentStatus	IS NULL
		OR Department	IS NULL
		OR ManagerName	IS NULL
		OR ManagerID IS NULL
		OR 	RecruitmentSource IS NULL
		OR	PerformanceScore IS NULL
		OR 	EmpSatisfaction	IS NULL
		OR SpecialProjectsCount	 IS NULL
		OR LastPerformanceReview_Date IS NULL
		OR 	DaysLateLast30 IS NULL
		OR	Absences	IS NULL;
	

'''
-- DELETE FROM TABLE WILL BE MASIVE BECAUSE WE HAVE MANY NULL ROWS
--INSTEAND WE REPLACE NULL VALUE
'''sql

                SELECT *
		FROM hrdatatable

		Update hrdatatable
		set dateoftermination = '2012/09/09'
		where dateoftermination is null;

		update hrdatatable
		set managerid = 2
		where managerid is null;

		update hrdatatable 
		set salary = 10000
		where salary is null
		
		--Data exploration

		--How many Hr Data Collected

		SELECT COUNT(*) AS Total_hrdata
		FROM hrdatatable

		-- how unique many hr saff we have

		SELECT COUNT(DISTINCT empid) AS Total_hrdata
		FROM hrdatatable

		---how many unique position we have

		SELECT COUNT(DISTINCT position)
		FROM hrdatatable

		---How many Unique states do we have

		SELECT COUNT(DISTINCT state)
		FROM hrdatatable

		--How many departments do we have

		SELECT COUNT(DISTINCT department)
		FROM hrdatatable
		--How many recruitment source do we have

		SELECT COUNT(DISTINCT recruitmentsource)
		FROM hrdatatable;
```

### 3. Data Analysis & Findings

---1 Write SQL quary to retrieve all columns for employee last 
		--- performance was from '2017-04-06'

'''sql	        SELECT *
		FROM hrdatatable
		WHERE lastperformancereview_date >= '2017-04-06'
'''
		--2 Write SQL query retrieve all data with 'production technician I'
		-- and salary is more than 5000 from the month of '2015-04-06'
'''sql
		SELECT position, salary, lastperformancereview_date
		FROM hrdatatable
		WHERE position = 'Production Technician I'
		AND salary >= 50000
		AND lastperformancereview_date >= '2015-04-06'
		ORDER BY salary DESC;
'''
		--3 Write sql query to calculate the total salary by each position

''' sql         SELECT position, SUM(salary) AS total_salary
		FROM hrdatatable
		GROUP BY position
'''

		--4 Write SQL query to find the average salary of employee  who earns 
		-- 'position' IT Support
		
'''sql		SELECT  AVG(salary) AS average_salary
		FROM hrdatatable
		WHERE position = 'IT Support'
'''

		--5 Write a SQL query to find all salary 
		--where the salary is greater than 60000

 ''' sql        SELECT first_name, last_name, salary
		FROM hrdatatable
		WHERE salary >= 60000
	    LIMIT 10
'''sql
		--6 Write a SQL query to find the total number employee in department 
		--by each gender in each position



'''sql	        SELECT department, sex,
		COUNT(*) emp_total
		FROM hrdatatable
		GROUP BY  sex, department; 

'''
		--7 Write SQL query to retrive the most populated 
		--zip code location with employee 
       '''sql

		SELECT  zip, 
		COUNT(empid) AS total_zip
		FROM hrdatatable
		GROUP BY 1
		ORDER BY total_zip DESC

      '''

		--8 Write SQL query to calculate the 
		--year and month with the highest termination

    '''	sql    SELECT EXTRACT(YEAR FROM dateofhire) AS YEAR,
		    EXTRACT(MONTH FROM dateofhire) AS MONTH,
			COUNT(dateoftermination) AS highest_termination
		FROM hrdatatable
		GROUP BY 1,2
		ORDER BY highest_termination DESC

'''

		--9 Write SQL query to top 5 highest paid employee

 '''sql	       SELECT first_name, last_name, 
		SUM(salary) AS highest_paid
		FROM hrdatatable
		GROUP BY 1,2
		ORDER BY highest_paid DESC
	'''	LIMIT 5

	   --**10Write SQL query find number of employee by department**

'''sql	   SELECT 
	   department,
	   COUNT(empid) AS number_employee
	   FROM hrdatatable
	   GROUP BY department
'''
	   --End of project
	   

## Findings

- **Employee Demographics**: The dataset includes employees from various States in Amarica, with position distributed across different department such as IT/IS and Production.
- **Salary level across Departments**: Several department had a total salary amount greater than 60000, indicating high paying Salary.
- **Employee Insights**: The analysis identifies the top-earnings and the most popular Department.

## Reports

- **Employee Summary**: A detailed report summarizing employee demographics and department.
- **Trend Analysis**: Insights into gender trends across different department shows more female are in production.
- **Employee Insights**: Reports on top employee and unique salary sum per departments.

## Conclusion

This project serves as a comprehensive introduction to SQL for data analysts, covering database setup, data cleaning, exploratory data analysis, and business-driven SQL queries. The findings from this project can help drive business decisions by understanding employee patterns, employee behavior, and performance.

## How to Use

1. **Clone the Repository**: Clone this project repository from GitHub.
2. **Set Up the Database**: Run the SQL scripts provided in the `database_setup.sql` file to create and populate the database.
3. **Run the Queries**: Use the SQL queries provided in the `analysis_queries.sql` file to perform your analysis.
4. **Explore and Modify**: Feel free to modify the queries to explore different aspects of the dataset or answer additional business questions.

## Author - Emmanuel Otaesiri

This project is part of my portfolio, showcasing the SQL skills essential for data analyst roles. If you have any questions, feedback, or would like to collaborate, feel free to get in touch!



For more content on SQL, data analysis, and other data-related topics, make sure to follow me on social media and join our community:

- **LinkedIn**: [Connect with me professionally](https://www.linkedin.com/in/emmanuel-otaesiri/)


Thank you for your support, and I look forward to connecting with you!
