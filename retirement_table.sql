SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;

DROP TABLE retirement_info;

-- Create new table for retiring employees
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');
-- Check the table
SELECT * FROM retirement_info;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

-- Joining retirement_info and dept_emp tables
SELECT ri.emp_no,
    ri.first_name,
ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

-- Joining departments and dept_manager tables
SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

-- current employees elibible for retirement
SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM salaries;

SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT e.emp_no,
    e.first_name,
e.last_name,
   	e.gender,
	s.salary,
	de.to_date
-- INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_Date = '9999-01-01');

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
-- INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);
		
SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

SELECT e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no  = de.emp_no)
INNER JOIN departments as d
	ON (de.dept_no = d.dept_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_Date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_Date = '9999-01-01')
	AND (d.dept_name = 'Sales');

SELECT e.emp_no,
    e.first_name,
    e.last_name,
    d.dept_name
FROM employees as e
INNER JOIN dept_emp as de
	ON (e.emp_no  = de.emp_no)
INNER JOIN departments as d
	ON (de.dept_no = d.dept_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_Date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_Date = '9999-01-01')
	AND d.dept_name IN ('Sales', 'Development');

-- begin challenge work
-- Retrieve emp_no, first_name, last_name
SELECT emp_no, first_name, last_name
FROM employees;

-- retrieve title
SELECT title, from_date, to_date
FROM titles;

-- create new table
SELECT emp_no, first_name, last_name
INTO new_table
FROM employees;

-- print new_table
SELECT *
FROM new_table

-- filter on birth_date
SELECT emp_no,
	first_name, 
	last_name,
	birth_date
FROM employees 
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
-- ORDER BY emp_no;




SELECT title, COUNT(*) AS num_retirement_employees
INTO retirement_titles
FROM recent_titles
JOIN employees ON recent_titles.emp_no = employees.emp_no
WHERE (employees.birth_date <= '1955-12-31')
GROUP BY title;

-- print table
SELECT *
FROM recent_titles
WHERE emp_no IN (
	SELECT emp_no
	FROM employees
	WHERE birth_Date BETWEEN '1952-01-01' AND '1955-12-31'
);

-- tryy
SELECT rt.emp_no, 
	e.first_name, 
	e.last_name, 
	rt.title,
-- 	rt.from_date,
	rt.to_date
FROM recent_titles as rt
JOIN employees as e on rt.emp_no = e.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- troubleshoot
SELECT column_name 
FROM information_schema.columns
WHERE table_name = 'recent_titles' AND column_name = 'from_date';

SELECT column_name
FROM information_schema.columns
WHERE table_name = 'recent_titles' AND column_name = 'from_date';

-- check to see if recent_titles table exists
SELECT EXISTS (SELECT 1 FROM information_schema.tables WHERE table_name = 'recent_titles');

-- correction to create table
CREATE TABLE recent_titles AS
SELECT DISTINCT ON (emp_no)
	emp_no,
	title,
	to_date
FROM titles
ORDER BY emp_no, to_date DESC;



-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no)
	emp_no,
	title,
	to_date
FROM titles
ORDER BY emp_no, to_date DESC;

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;



















-- ADB step 1-4
SELECT e.emp_no, e.first_name, e.last_name, e.birth_date, t.title, t.from_date, t.to_date
INTO adb
FROM employees as e 
INNER JOIN titles as t
	ON e.emp_no = t.emp_no;
	
-- ADB step 5
-- filter on birth_date
SELECT emp_no,
	first_name, 
	last_name,
	birth_date
FROM adb 
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no

-- ADB step 6
SELECT DISTINCT ON (emp_no) emp_no, title, to_date
INTO adb_last_title
FROM titles
ORDER BY emp_no, to_date DESC









-- All steps in one query
SELECT DISTINCT ON (emp_no)
e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
t.title,
t.from_date,
t.to_date
FROM employees as e
INNER JOIN titles as t
	ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY e.emp_no, t.to_date DESC;
	