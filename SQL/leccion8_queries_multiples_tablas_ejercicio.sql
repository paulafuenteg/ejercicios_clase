CREATE TABLE leccion_8_sql.customers SELECT * FROM leccion_7_sql.customers; 
CREATE TABLE leccion_8_sql.employees SELECT * FROM tienda.employees; 

#1 Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando CROSS JOIN.
SELECT employees.employee_number, employees.last_name AS apellido, employees.first_name AS nombre, customers.customer_number AS cliente
FROM employees CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number;

#2 Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando CROSS JOIN.
SELECT employees.employee_number, employees.last_name AS apellido, employees.first_name AS nombre, customers.customer_number AS cliente 
FROM employees CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(distinct customers.customer_number) > 8;

#3 Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando CROSS JOIN.
SELECT employees.last_name AS apellido, employees.first_name AS nombre, customers.country AS pais 
FROM employees CROSS JOIN customers
WHERE employees.employee_number = customers.sales_rep_employee_number
GROUP BY employees.employee_number
HAVING COUNT(distinct customers.country) > 1;

#4 Selecciona el ID, nombre, apellidos de las empleadas y el ID de cada cliente asociado a ellas, usando INNER JOIN.
SELECT employee_number, last_name AS apellido, first_name AS nombre, customer_number AS cliente
FROM employees INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number;

#5 Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando INNER JOIN.
SELECT employee_number, last_name AS apellido, first_name AS nombre, customer_number AS cliente 
FROM employees INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employee_number
HAVING COUNT(distinct customer_number) > 8;

#6 Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando INNER JOIN.
SELECT last_name AS apellido, first_name AS nombre, country AS pais 
FROM employees INNER JOIN customers
ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employee_number
HAVING COUNT(distinct country) > 1;