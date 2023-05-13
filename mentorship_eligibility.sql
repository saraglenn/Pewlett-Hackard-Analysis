CREATE TABLE MentorshipEligibility (
    emp_no INT,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    birth_date DATE,
    title VARCHAR(255)
);

SELECT emp_no, first_name, last_name, birth_date
FROM Employees;

SELECT from_date, to_date
FROM dept_emp;

SELECT title
FROM titles;

SELECT DISTINCT ON (emp_no) 
	emp_no, 
	from_date, 
	to_date
FROM dept_emp
ORDER BY emp_no, from_date;

SELECT *
INTO mentorship_eligibility
FROM Employees
INNER JOIN dept_emp ON Employees.emp_no = dept_emp.emp_no;

SELECT e.emp_no, e.first_name, e.last_name, e.birth_date
INTO mentorship_eligibility
FROM Employees AS e
INNER JOIN dept_emp AS de ON e.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01'
  AND e.birth_date BETWEEN '1965-01-01' AND '1965-12-31'
  
-- Retrieve the data from mentorship_eligibility
SELECT *
FROM mentorship_eligibility
ORDER BY emp_no;
