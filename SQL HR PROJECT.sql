--SQL HR DATA ANALYSIS


     CREATE DATABASE hrproject;


--CREATE TABLE & DROPPING TABLE

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

-- Data Exploration

        
       SELECT * 
	   FROM hrdatatable

	   SELECT 
	   COUNT(*) as total_rows
	   FROM hrdatatable


--Data Cleaning
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
	

	
-- DELETE FROM TABLE WILL BE MASIVE BECAUSE WE HAVE MANY NULL ROWS

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

		--How many manager do we have
		
		SELECT COUNT(DISTINCT managername)
		FROM hrdatatable

		--How many recruitment source do we have

		SELECT COUNT(DISTINCT recruitmentsource)
		FROM hrdatatable

		--Business problem questions

		---1 Write SQL quary to retrieve all columns for employee last 
		--- performance was from '2017-04-06'

		SELECT *
		FROM hrdatatable
		WHERE lastperformancereview_date >= '2017-04-06'

		--2 Write SQL query retrieve all data with 'production technician I'
		-- and salary is more than 5000 from the month of '2015-04-06'

		SELECT position, salary, lastperformancereview_date
		FROM hrdatatable
		WHERE position = 'Production Technician I'
		AND salary >= 50000
		AND lastperformancereview_date >= '2015-04-06';

		--3 Write sql query to calculate the total salary by each position

		SELECT position, SUM(salary) AS total_salary
		FROM hrdatatable
		GROUP BY position


		--4 Write SQL query to find the average salary of employee  who earns 
		-- 'position' IT Support
		
		SELECT  AVG(salary) AS average_salary
		FROM hrdatatable
		WHERE position = 'IT Support'


		--5 Write a SQL query to find all salary 
		--where the salary is greater than 60000

        SELECT first_name, last_name, salary
		FROM hrdatatable
		WHERE salary >= 60000
	    LIMIT 10

		--6 Write a SQL query to find the total number employee in department 
		--by each gender in each position



		SELECT department, sex,
		COUNT(*) emp_total
		FROM hrdatatable
		GROUP BY  sex, department; 


		--7 Write SQL query to retrive the most populated 
		--zip code location with employee 

		SELECT  zip, 
		COUNT(empid) AS total_zip
		FROM hrdatatable
		GROUP BY 1
		ORDER BY total_zip DESC

		--8 Write SQL query to calculate the 
		--year and month with the highest termination

		SELECT EXTRACT(YEAR FROM dateofhire) AS YEAR,
		    EXTRACT(MONTH FROM dateofhire) AS MONTH,
			COUNT(dateoftermination) AS highest_termination
		FROM hrdatatable
		GROUP BY 1,2
		ORDER BY highest_termination DESC



		--9 Write SQL query to top 5 highest paid employee

		SELECT first_name, last_name, 
		SUM(salary) AS highest_paid
		FROM hrdatatable
		GROUP BY 1,2
		ORDER BY highest_paid DESC
		LIMIT 5

	   --10 Write SQL query find number of employee by department

	   SELECT 
	   department,
	   COUNT(empid) AS number_employee
	   FROM hrdatatable
	   GROUP BY department

	   --End of project
	   

	
	    
	 
	
		
		

		

   