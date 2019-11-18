-- Import data from departments.csv
-- View the table to ensure all data has been imported correctly
SELECT * FROM employees ;
SELECT * FROM departments ;
SELECT * FROM dept_emp ;
SELECT * FROM dept_manager ;
SELECT * FROM salaries ;
SELECT * FROM titles ;


--Data Analysis
--1.Create table to list the following details of each employee: 
--  employee number,last name, first name, gender, and salary.

SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.emp_no, s.salary 
FROM employees As e
LEFT JOIN salaries As s ON e.emp_no = s.emp_no;
--ORDER BY 'salary' DESC;
--OR
--Other way of getting same list
SELECT employees.emp_no, employees.first_name, employees.last_name, employees.gender, salaries.salary
FROM employees, salaries
WHERE employees.emp_no = salaries.emp_no;

--2.List employees who were hired in 1986

SELECT * FROM employees
WHERE hire_date BETWEEN'1986-01-01' AND '1986-12-31'

--3.List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept.dept_no, dept.dept_name, d.emp_no, e.last_name, e.first_name, d.from_date, d.to_date 
FROM dept_manager As d
JOIN employees As e ON d.emp_no = e.emp_no
JOIN departments As dept ON dept.dept_no = d.dept_no;

--4.List the department of each employee with the following information: 
--  employee number, last name, first name, and department name.
SELECT d.emp_no, e.last_name, e.first_name, dept.dept_name 
FROM employees As e
LEFT JOIN dept_manager As d ON d.emp_no = e.emp_no
RIGHT JOIN departments As dept ON dept.dept_no = d.dept_no;

--5.List all employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name FROM employees 
WHERE first_name = 'Hercules' AND last_name LIKE 'B%'; 


--6.List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
SELECT d.emp_no, e.last_name, e.first_name, dept.dept_name 
FROM employees As e
LEFT JOIN dept_manager As d ON d.emp_no = e.emp_no
RIGHT JOIN departments As dept ON dept.dept_no = d.dept_no
WHERE dept_name = 'Sales';

--7.List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT d.emp_no, e.last_name, e.first_name, dept.dept_name 
FROM employees As e
LEFT JOIN dept_manager As d ON d.emp_no = e.emp_no
RIGHT JOIN departments As dept ON dept.dept_no = d.dept_no
WHERE dept.dept_name = 'Sales' OR dept.dept_name = 'Development';


--8.In descending order, list the frequency count of employee last names, 
---i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) As "lastname_count"
FROM employees
GROUP BY last_name
ORDER BY "lastname_count" DESC;

