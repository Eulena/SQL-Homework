SELECT
  emp_no,
  last_name,
  first_name,
  hire_date
FROM employees_data
WHERE TO_CHAR(hire_date, 'YYYY') = '1986';
  
