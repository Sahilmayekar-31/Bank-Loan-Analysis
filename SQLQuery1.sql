select * from Bank_Loan_data;

-- Total Loan Applications
select count(id) as Total_Loan_Application from Bank_Loan_data;

-- MTD Loan Application
select count(id) as MTD_Total_Loan_Application from Bank_Loan_data
where MONTH(issue_date) = 12;

-- PMTD Loan Application
select count(id) as PMTD_Total_Loan_Application from Bank_Loan_data
where MONTH(issue_date) = 11;

-- Total Funded amount
select sum(loan_amount) as MTD_Total_Funded_Amount from Bank_Loan_data
where MONTH(issue_date) = 12 And Year(issue_date) = 2021

-- PMTD Funded amount
select sum(loan_amount) as PMTD_Total_Funded_Amount from Bank_Loan_data
where MONTH(issue_date) = 11 And Year(issue_date) = 2021

-- Total amount received 
select sum(total_payment) as Total_Amount_Received from Bank_Loan_data;

-- MTD Total amount received
select sum(total_payment) as MTD_Total_Amount_Received from Bank_Loan_data
WHERE MONTH(issue_date) = 12 and year(issue_date)= 2021

-- PMTD Total amount received
select sum(total_payment) as PMTD_Total_Amount_Received from Bank_Loan_data
WHERE MONTH(issue_date) = 11 and year(issue_date)= 2021

-- Avg interest rate
select round(avg(int_rate)*100,2) as Avg_Interest_rate from Bank_Loan_data;

-- MTD AVG interest rate
select round(avg(int_rate)*100,2) as Avg_Interest_rate from Bank_Loan_data
WHERE MONTH(issue_date) = 12 and year(issue_date) = 2021;

-- PMTD AVG interest rate
select round(avg(int_rate)*100,2) as Avg_Interest_rate from Bank_Loan_data
WHERE MONTH(issue_date) = 11 and year(issue_date) = 2021;


-- avg dti 
select round(avg(dti),4)* 100 as Avg_dti from Bank_Loan_data;

-- avg mtd dti  
select round(avg(dti),4)* 100 as Avg_MTD_dti from Bank_Loan_data
where MONTH(issue_date) = 12 and year(issue_date) =2021;

-- avg pmtd dti  
select round(avg(dti),4)* 100 as Avg_PMTD_dti from Bank_Loan_data
where MONTH(issue_date) = 11 and year(issue_date) =2021;

-- Percentage of good loan
SELECT (count(CASE When loan_status = 'Fully Paid' OR loan_status = 'Current' Then id end)*100)
/
count(id) as Good_loan_percentage
from Bank_Loan_data;

-- Good Loan applications
select count(id) as 'Good loan application' from Bank_Loan_data
where loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good loan funded amount
select sum(total_payment) as 'Total amount Received' from Bank_Loan_data
where loan_status = 'Fully Paid' OR loan_status = 'Current';

-- Good Loan Amount Received
SELECT SUM(total_payment) AS Good_Loan_amount_received FROM bank_loan_data
WHERE loan_status = 'Fully Paid' OR loan_status = 'Current'

-- Bad Loan Percentage
SELECT (count(CASE When loan_status = 'Charged Off' Then id end)*100)
/
count(id) as Bad_loan_percentage
from Bank_Loan_data;

-- Bad loan application
select count(id) as 'Bad loan application' from Bank_Loan_data
where loan_status = 'Charged Off';

-- Bad loan amount recevied
select sum(total_payment) as 'Bad Loan funded amount recevied' from Bank_Loan_data
where loan_status = 'Charged off';


-- Bad loan funded amount
select sum(loan_amount) as 'Bad Loan funded amount' from Bank_Loan_data
where loan_status = 'Charged off';

-- Loan status
	select 
	loan_status,
	count(id) as Total_application,
	sum(total_payment) as total_amount_recevied,
	sum(loan_amount) as Total_amount_funded,
	round(avg(int_rate *100),2) as Interest_rate,
	round(avg(dti *100),2) as DTI
	from bank_loan_data
	group by
	loan_status;

	-- MTD Loan Status
		select 
	loan_status,
	count(id) as Total_application,
	sum(total_payment) as MTD_total_amount_recevied,
	sum(loan_amount) as MTD_Total_amount_funded,
	round(avg(int_rate *100),2) as MTD_Interest_rate,
	round(avg(dti *100),2) as MTD_DTI
	from bank_loan_data
	where MONTH(issue_date) = 12 and year(issue_date) =2021
	group by loan_status;

	-- PMTD Loan Status
		select 
	loan_status,
	count(id) as Total_application,
	sum(total_payment) as PMTD_total_amount_recevied,
	sum(loan_amount) as PMTD_Total_amount_funded,
	round(avg(int_rate *100),2) as PMTD_Interest_rate,
	round(avg(dti *100),2) as PMTD_DTI
	from bank_loan_data
	where MONTH(issue_date) = 11 and year(issue_date) =2021
	group by loan_status;

	-- Monthly Trends by issue date
select datename(MONTH,issue_date) as Month,
count(id) as Total_loan_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received
from Bank_Loan_data
group by datename(MONTH,issue_date)
order by datename(MONTH,issue_date);

-- Regional Analysis by state
select address_state,
count(id) as Total_loan_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received
from Bank_Loan_data
group by address_state
order by count(id) desc;

-- loan Term analysis
select term,
count(id) as Total_loan_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received
from Bank_Loan_data
group by term
order by term;

-- employee length analysis
select emp_length,
count(id) as Total_loan_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received
from Bank_Loan_data
group by emp_length
order by count(id) desc;

-- what purpose
select purpose,
count(id) as Total_loan_application,
sum(loan_amount) as Total_funded_amount,
sum(total_payment) as Total_amount_received
from Bank_Loan_data
group by purpose
order by count(id) desc;

-- home ownership 
	select home_ownership,
	count(id) as Total_loan_application,
	sum(loan_amount) as Total_funded_amount,
	sum(total_payment) as Total_amount_received
	from Bank_Loan_data
	group by home_ownership
	order by count(id) desc;

