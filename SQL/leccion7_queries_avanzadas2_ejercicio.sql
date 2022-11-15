CREATE TABLE leccion_7_sql.customers SELECT * FROM leccion_6_sql.customers; 
# EJERCICIO 1:Realiza una consulta SELECT que seleccione el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno.
SELECT COUNT(customer_number) AS ClientesporEmpleado, sales_rep_employee_number AS empleado
FROM customers
GROUP BY sales_rep_employee_number; 

# EJERCICIO 2: Selecciona el número de cada empleado de ventas que tenga más de 7 clientes distintos.
SELECT COUNT(customer_number) AS ClientesporEmpleado, sales_rep_employee_number AS empleado
FROM customers
GROUP BY sales_rep_employee_number
HAVING COUNT(customer_number) > 7;

# EJERCICIO 3: Selecciona el número de cada empleado de ventas, así como el numero de clientes distintos que tiene cada uno. 
# Asigna una etiqueta de "AltoRendimiento" a aquellos empleados con mas de 7 clientes distintos.
SELECT
CASE
WHEN
COUNT(customer_number) > 7 then 'AltoRendimiento'
END AS 'Rendimiento', COUNT(customer_number) AS ClientesporEmpleado, sales_rep_employee_number AS empleado
FROM customers
GROUP BY sales_rep_employee_number;

# EJERCICIO 4: Selecciona el número de clientes en cada pais.
SELECT COUNT(customer_number) AS ClientesPais, country AS pais
FROM customers
GROUP BY country; 

# EJERCICIO 5: Selecciona aquellos países que tienen clientes de más de 3 ciudades diferentes.
SELECT count(city), country AS pais
FROM customers
GROUP BY country
HAVING COUNT(city) > 3;
