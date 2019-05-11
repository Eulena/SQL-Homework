# SQL-Homework

Submitted By:	Monica Linsangan
Homework:	SQL
Date:	05/10/2019

## DATA MODELING:
ERD of the tables (see folder for screenshots) 

## DATA ENGINEERING: 6 Tables created
Import each CSV file into the corresponding SQL table (see folder for screenshots)

```
CREATE TABLE departments (
	dept_no VARCHAR(50),
	dept_name VARCHAR(100))
```
```
CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR(50),
	from_date DATE NOT NULL,
	to_date DATE NOT NULL)
```
```
CREATE TABLE dept_manager (
	dept_no VARCHAR(50),
        emp_no INT,	
	from_date DATE NOT NULL,
	to_date DATE NOT NULL)
```
```
CREATE TABLE employees_data (
	emp_no INT,
	birth_date DATE NOT NULL,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	gender VARCHAR(50),
	hire_date DATE NOT NULL)
```  
```
CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL)
```  
```
CREATE TABLE titles (
	emp_no INT,
	title VARCHAR (100),
	from_date DATE NOT NULL,
	to_date DATE NOT NULL) 
```

  
## DATA ANALYSIS:
1.	List the following details of each employee: employee number, last name, first name, gender, and salary.
```
SELECT
  e.emp_no,
  e.last_name,
  e.first_name,
  e.gender,
  s.salary
FROM employees_data e
  INNER JOIN salaries s ON e.emp_no = s.emp_no
```
2.	List employees who were hired in 1986.
```
SELECT
  emp_no,
  last_name,
  first_name,
  hire_date
FROM employees_data
WHERE TO_CHAR(hire_date, 'YYYY') = '1986';
```
3.	List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
```
SELECT
 departments.dept_no department_number,
 departments.dept_name department_name,
 employees_data.emp_no manager_employee_number,
 employees_data.first_name manager_first_name,
 employees_data.last_name manager_last_name,
 dept_manager.from_date start_date,
 dept_manager.to_date end_date
FROM
 employees_data
INNER JOIN dept_manager ON dept_manager.emp_no = employees_data.emp_no
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no;
```
4. List the department of each employee with the following information: employee number, last name, first name, and department name.
```
SELECT
 dept_emp.emp_no employee_number,
 employees_data.last_name employee_last_name,
 employees_data.first_name employee_first_name,
 departments.dept_name department_name
FROM
 employees_data
 INNER JOIN dept_emp ON dept_emp.emp_no = employees_data.emp_no
 INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;
```
5. List all employees whose first name is "Hercules" and last names begin with "B."
```
SELECT
first_name, last_name
FROM
Employees_data
WHERE
FIRST_NAME LIKE 'Hercules' and LAST_NAME LIKE 'B%';
```
6.	List all employees in the Sales department, including their employee number, last name, first name, and department name.
```
SELECT
employees_data.emp_no employee_number,
employees_data.last_name last_name,
employees_data.first_name first_name,
departments.dept_name department_name
FROM
employees_data NATURAL JOIN departments
WHERE dept_no = 'd007';
```
7.	List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
```
SELECT
employees_data.emp_no employee_number,
employees_data.last_name last_name,
employees_data.first_name first_name,
departments.dept_name department_name
FROM
employees_data NATURAL JOIN departments
WHERE dept_no in ('d007', 'd005') ORDER BY department_name ASC;
```
8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
```
SELECT
employees_data.last_name last_name, COUNT (*)
FROM
employees_data GROUP BY last_name ORDER BY last_name DESC;
```


