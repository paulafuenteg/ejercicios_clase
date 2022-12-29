CREATE TABLE leccion_11_sql.customers SELECT * from leccion_9_sql.customers;
CREATE TABLE leccion_11_sql.employees SELECT * from leccion_9_sql.employees;

-- 1 Calcula el numero de clientes por cada ciudad.
SELECT COUNT(customer_number) AS número_cientes, city AS Ciudad
FROM customers
GROUP by city ;

(SELECT COUNT(customer_number) AS numero_cientes, city AS Ciudad
FROM customers
GROUP by city 
ORDER BY numero_cientes DESC
LIMIT 1);

--  2 Usando la consulta anterior como subconsulta, selecciona la ciudad con el mayor numero de clientes.
SELECT city, COUNT(customer_number) AS numero_cientes
FROM customers
GROUP BY city
HAVING COUNT(customer_number) >= ALL
							(SELECT COUNT(customer_number) AS numero_cientes
							FROM customers
							GROUP by city);

-- 3 Por último, usa todas las consultas anteriores para seleccionar el customerNumber, nombre y apellido de las clientas asignadas a la ciudad con mayor numero de clientas.
SELECT customer_number, contact_first_name, contact_last_name 
FROM customers 
WHERE city IN (
				SELECT city
				FROM customers
				GROUP BY city
				HAVING COUNT(customer_number) >= ALL
													(SELECT COUNT(customer_number) AS numero_cientes
													FROM customers
													GROUP by city));

