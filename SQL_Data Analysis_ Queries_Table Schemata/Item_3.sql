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
