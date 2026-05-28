create table hospitals(

Hospital_Name varchar(100),
Location varchar(100),
Department varchar(100),
Doctors_Count int,
Patients_Count int,
Admission_Date date,
Discharge_Date date,
Medical_Expenses numeric(10,2)
);

select * from hospitals;

--1.Total Number of Patients
--  Write an SQL query to find the total number of patients across all hospitals
select sum(patients_count) as total_no_of_patients
from hospitals;

--2.Average Number of Doctors per Hospital
--  Retrieve the average count of doctors available in each hospital.

select Hospital_Name, Avg(Doctors_Count) as avg_no_of_dr_in_hosp 
from hospitals group by Hospital_Name;

--3.Top 3 Departments with the Highest Number of Patients
--  Find the top 3 hospital departments that have the highest number of patients.

select department,sum(patients_count) as no_of_patients
from hospitals
group by department
order by department desc 
limit 3;


--4.Hospital with the Maximum Medical Expenses 
--  Identify the hospital that recorded the highest medical expenses.

select hospital_name,max(Medical_Expenses) as max_exp
from hospitals
group by hospital_name
order by max_exp desc
limit 1;

--5.Daily Average Medical Expenses 
 -- Calculate the average medical expenses per day for each hospital.

select extract(Day from Admission_Date ) as day,avg(medical_expenses)
from hospitals
group by day 
order by day asc;

select extract(Day from Admission_Date ) as day
from hospitals order by day;

--6.Longest Hospital Stay 
--  Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.

select (Discharge_Date-Admission_Date) as longest_hospital_stay ,sum(Patients_Count) as patients
from hospitals
group by longest_hospital_stay 
order by longest_hospital_stay desc
limit 1;

--7.Total Patients Treated Per City 
--  Count the total number of patients treated in each city.

select location, sum(Patients_Count) as patients_per_city
from hospitals
group by location;


--8.Average Length of Stay Per Department 
--Calculate the average number of days patients spend in each department.

select department,avg(discharge_date-admission_date) as length_of_stay
from hospitals
group by department;

--9.Identify the Department with the Lowest Number of Patients
--  Find the department with the least number of patients.

select department,sum(Patients_Count) as no_of_patients
from hospitals
group by department
order by no_of_patients asc
limit 1;

--10.Monthly Medical Expenses Report 
--   Group the data by month and calculate the total medical expenses for each month.

select Extract(month from admission_date) as month, sum(Medical_Expenses) as monthly_expenses
from hospitals
group by month 
order by month asc;