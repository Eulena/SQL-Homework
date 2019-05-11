SELECT
employees_data.last_name last_name, COUNT (*)
FROM
employees_data GROUP BY last_name ORDER BY last_name DESC;
