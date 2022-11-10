CREATE TABLE leccion_6_sql.alumnas SELECT * FROM leccion_5_sql.alumnas; 
#Selecciona el número de ID más alto de la tabla alumnas y asígnale un alias que sea explicativo.
SELECT MAX(id_alumna) AS alumna
	from alumnas;

#Ejercicio: Selecciona el último nombre de alumna si ordenásemos la columna en orden alfabético.
SELECT MAX(nombre) AS alumna
from alumnas;

		#EJERCICIOS
CREATE TABLE leccion_6_sql.customers SELECT * FROM tienda.customers; 

# Realiza una consulta SELECT que obtenga el número identificativo de cliente más bajo de la base de datos.
SELECT MIN(customer_number)
	from customers;

# Selecciona el limite de crédito medio para los clientes de España.
SELECT AVG(credit_limit)
	from customers;

# Selecciona el numero de clientes en Francia.
SELECT COUNT(customer_number) AS clientes_Francia
	from customers
WHERE country = 'France';

#Selecciona el máximo de crédito que tiene cualquiera de los clientes del empleado con número 1323.
SELECT MAX(credit_limit) AS MAX_credit_1323
	from customers
WHERE sales_rep_employee_number = 1323;

#¿Cuál es el número máximo de empleado de la tabla customers?
SELECT MAX(sales_rep_employee_number) AS MAX_empleado
	from customers;