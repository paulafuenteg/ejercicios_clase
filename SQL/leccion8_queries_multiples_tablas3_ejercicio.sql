USE leccion_10_sql;
CREATE TABLE leccion_10_sql.customers SELECT * FROM leccion_9_sql.customers;
CREATE TABLE leccion_10_sql.employees SELECT * FROM leccion_9_sql.employees;
CREATE TABLE leccion_10_sql.offices SELECT * FROM tienda.offices;

--  1 Selecciona los apellidos que se encuentren en ambas tablas para employees y customers, con alias 'Apellidos'.
SELECT contact_last_name AS Apellidos FROM customers UNION SELECT last_name FROM employees;

-- 2 Selecciona los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados de las tablas
-- employees y customers (sin repetirse)
SELECT contact_first_name AS nombre, contact_last_name AS Apellidos FROM customers UNION SELECT first_name, last_name FROM employees;

-- 3 Selecciona todos los nombres con alias 'nombre' y apellidos, con alias 'Apellidos' tanto de los clientes como de los empleados 
-- de las tablas employees y customers.
SELECT contact_first_name AS nombre, contact_last_name AS Apellidos FROM customers UNION ALL SELECT first_name, last_name FROM employees;

-- 4 Queremos ver ahora que empleados tienen algún contrato asignado con alguno de los clientes existentes. 
-- Para ello selecciona employeeNumber como 'Número empleado', firstName como 'nombre Empleado' y lastName como 'Apellido Empleado'
 SELECT employee_number AS 'Número empleado', first_name AS 'nombre Empleado', last_name AS 'Apellido Empleado' FROM employees 
 WHERE employee_number IN (SELECT sales_rep_employee_number FROM customers);

-- 5 Queremos ver ahora en cuantas ciudades en las cuales tenemos clientes, no también una oficina de nuestra empresa para ello: 
-- Selecciona aquellas ciudades como 'ciudad' y los nombres de las empresas como 'nombre de la empresa ' de la tabla customers, 
-- sin repeticiones, que no tengan una oficina en dicha ciudad de la tabla offices.
 SELECT city AS 'ciudad', customer_name AS 'nombre de la empresa ' FROM customers 
 WHERE city NOT IN (SELECT city FROM offices)
 GROUP BY customer_name;
