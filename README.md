# Pewlett-Hackard-Analysis
This report represents an analysis designed to provide a determination on the number of retiring employees per title, as well as identify employees who are eligible to participate in a mentorship program. It focuses on gather insights into the workforce to aid in succession planning mentoring initiatives. 

## Overview
Query Development – Retiring Employees 

Joining data: an inner join was performed between the Employees and Titles tables on the emp_no column to consolidate the dataset

Filtering: the dataset was filtered to include only employees who are currently employed and born between 1952 – 1955, excluding those who have already by date. 
Narrowing the dataset further, it was then filtered for those employees who are eligible for retirement based on their birth dates. 

The dataset was grouped by job title and the count of employees per title. The analysis uncovered a breakdown of the retiring employees per job title – data that’s pertinent in succession planning and understanding where additional training/hiring efforts might need to be applied. 

Query Development – Mentorship Eligibility 

Joining data: the employees and department employee tables were joined on the emp_no column. 

Filtering: the dataset was then filtered by those currently employed by birthdate between Jan 1 1965 – Dec 31, 1965. 

Order: the table was then ordered by employee number. 

# Results

Retiring Employees by Title – 

•	Understanding the distribution of retiring employees by titles gives the organization the opportunity to identify areas that may need additional support, i.e. recruitment/training

•	The number of retiring employees varies by job title, shedding some light on specific roles that may experience intellectual loss

Mentorship Program Eligibility –

•	Leveraging the expertise of senior employees is critical to developing younger talents

•	A pool of eligible employees is identified based on status 
Strategic talent management is critical to sustaining a strong workforce.

