-- Create List of Employee Eligible for retirement information
-- Deliverable 1
-- Create List of Employee Eligible for retirement information
SELECT  e.emp_no,
        e.first_name,
        e.last_name,
        t.title,
        t.from_date,
        t.to_date
INTO retirement_titles
FROM employees as e
RIGHT JOIN titles as t
    ON e.emp_no = t.emp_no
WHERE e.birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY emp_no;


-- Get Distinct Title on Employee Number
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO retirement_titles_distinct
FROM retirement_titles
ORDER BY emp_no, from_date DESC;

-- Get number of employees about to retirement by count of job title
SELECT count(emp_no) as count, title
INTO retiring_titles
FROM retirement_titles_distinct as rtd
GROUP BY title
ORDER BY count DESC;

-- Deliverable 2
-- Create mentorship eligibility table
SELECT DISTINCT ON (emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	t.from_date,
	t.to_date,
	t.title
INTO mentor_eligibility
FROM employees as e
JOIN titles as t
ON e.emp_no = t.emp_no
JOIN dep_emp as de
ON e.emp_no = de.emp_no
WHERE (t.to_date='9999-01-01')
	AND (e.birth_date BETWEEN '1965-01-01'
		AND '1965-12-31')
ORDER BY e.emp_no;


