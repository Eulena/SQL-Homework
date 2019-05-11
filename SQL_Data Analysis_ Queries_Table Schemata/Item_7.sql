SELECT
employees_data.emp_no employee_number,
employees_data.last_name last_name,
employees_data.first_name first_name,
departments.dept_name department_name
FROM
employees_data NATURAL JOIN departments
WHERE dept_no in ('d007', 'd005') ORDER BY department_name ASC;

