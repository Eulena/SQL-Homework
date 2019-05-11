SELECT
 dept_emp.emp_no employee_number,
 employees_data.last_name employee_last_name,
 employees_data.first_name employee_first_name,
 departments.dept_name department_name
FROM
 employees_data
 INNER JOIN dept_emp ON dept_emp.emp_no = employees_data.emp_no
 INNER JOIN departments ON dept_emp.dept_no = departments.dept_no;
