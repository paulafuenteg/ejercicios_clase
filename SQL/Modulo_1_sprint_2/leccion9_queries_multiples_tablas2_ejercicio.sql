CREATE TABLE leccion_9_sql.customers SELECT * FROM leccion_7_sql.customers; 
CREATE TABLE leccion_9_sql.employees SELECT * FROM tienda.employees; 

--  1 Selecciona el ID, nombre, apellidos de todas las empleadas y el ID de cada cliente asociado a ellas (si es que lo tienen).
SELECT employee_number AS ID, first_name AS nombre, last_name AS apellido, customer_number AS IDCliente
FROM employees
	LEFT JOIN customers
    ON employees.employee_number = customers.sales_rep_employee_number;

--  2 Selecciona el ID de todos los clientes, y el nombre, apellidos de las empleadas que llevan sus pedidos (si es que las hay).
SELECT employee_number AS ID, first_name AS nombre, last_name AS apellido, customer_number AS IDCliente
FROM employees
	RIGHT JOIN customers
    ON employees.employee_number = customers.sales_rep_employee_number;

--  3 Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando LEFT JOIN.
SELECT employee_number AS ID, first_name AS nombre, last_name AS apellido, COUNT(DISTINCT customer_number) AS Clientes
FROM employees
	LEFT JOIN customers
    ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employee_number
HAVING Clientes > 8;

--  4 Selecciona el ID, nombre, apellidos de las empleadas, para aquellas con más de 8 clientes, usando RIGHT JOIN.
SELECT employee_number AS ID, first_name AS nombre, last_name AS apellido, COUNT(DISTINCT customer_number) AS Clientes
FROM customers
	RIGHT JOIN employees
    ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employee_number
HAVING Clientes > 8;

--  5 Selecciona el nombre y apellidos de las empleadas que tienen clientes de más de un país, usando LEFT JOIN.
SELECT employee_number AS ID, first_name AS nombre, last_name AS apellido, COUNT(DISTINCT country) AS Paises
FROM employees
	LEFT JOIN customers
    ON employees.employee_number = customers.sales_rep_employee_number
GROUP BY employee_number
HAVING Paises > 1;

