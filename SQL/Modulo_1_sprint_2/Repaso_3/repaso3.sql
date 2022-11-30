USE tienda;

SELECT * 
FROM payments;

SELECT SUM(amount) AS 'Dinero Ganado'
FROM payments;

SELECT COUNT(DISTINCT customer_number)
FROM payments; 

SELECT SUM(amount) AS 'Dinero Ganado' ,  COUNT(DISTINCT customer_number) AS 'Clientes totales'
FROM payments;


SELECT SUM(amount) AS 'Dinero Ganado' ,  COUNT(DISTINCT customer_number) AS 'Clientes totales'
FROM payments;


SELECT customer_number ,  SUM(amount) AS 'Dinero Ganado' 
FROM payments
GROUP BY customer_number;



SELECT customer_number ,  amount AS 'Dinero Ganado' 
FROM payments;

SELECT  (SUM(amount) * (1-0.20)) AS 'Dinero despues del palo de hacienda',  customer_number ,  SUM(amount) AS 'Dinero Ganado'
FROM payments
GROUP BY customer_number;


SELECT  (SUM(amount) * (1-0.20)) AS 'Dinero despues del palo de hacienda',  customer_number ,  SUM(amount) AS 'Dinero Ganado'
FROM payments
GROUP BY customer_number
ORDER BY  'Dinero Ganado';


SELECT COUNT(*)
FROM orders
JOIN payments
ON orders.customer_number = payments.customer_number;


SELECT COUNT(*) 
FROM orders
LEFT JOIN payments
ON orders.customer_number = payments.customer_number;


SELECT  customer_number ,'Hola cliente que ha pagado' AS saludo
FROM payments
UNION
SELECT customer_number, 'Hola cliente' AS saludo
FROM orders
ORDER BY customer_number ;


/*
Enunciado : Obtener el nombre y el apellido de las empleadas de la tabla employees
que tiene job title Sales REP
*/



SELECT * 
FROM employees;

-- ORDEN DE ESCRITURA 

SELECT first_name, last_name
FROM employees
WHERE job_title = 'Sales Rep'
ORDER BY first_name DESC; 

-- La consulta anterior nos ha ha devuelto 2 columnas y 17 filas


-- ORDEN DE EJECUCION

-- 1. FROM - Nos devuelve 7 columnas y 23 filas

SELECT *
FROM tienda.employees;

-- 2. WHERE - Nos ha devuelto 7 columnas y 17 registros

SELECT * 
FROM tienda.employees
WHERE job_title = 'Sales Rep';

-- 3. SELECT - Nos devuelve 2 columnas y 17 registros, sin orden

SELECT last_name, first_name
FROM tienda.employees
WHERE job_title = 'Sales Rep';

-- 4. ORDER BY  Nos devuelve 2 columnas y 17 registros, ordenadas inversamente alfabrticamente


SELECT first_name, last_name
FROM employees
WHERE job_title = 'Sales Rep'
ORDER BY first_name DESC; 


/*
Enunciado : Obtener el número de trabajadoras por job_title y que tengan de office_code 1.
*/

SELECT * 
FROM employees;

-- ORDEN DE ESCRITURA

SELECT COUNT(job_title) AS numero_trabajadoras, job_title
FROM employees
WHERE office_code =1 
GROUP BY job_title
ORDER BY job_title ASC;

-- ORDEN DE EJECUCION

-- 1. FROM  - Nos devuelve 7 columnas y 23 filas
SELECT * 
FROM employees;

-- 2. WHERE - - Nos devuelve 7 columnas y 6 filas
SELECT * 
FROM employees
WHERE office_code =1;

-- 3. GROUP BY - - Nos devuelve 1 columnas y 6 filas,  si seleccionamos todos las dimensiones del group by el resto de columnas no cuadran y devueve un error
SELECT job_title
FROM employees
WHERE office_code =1
GROUP BY job_title;

-- 4. SELECT - - Nos devuelve 1 columnas y 6 filas

SELECT job_title, COUNT(job_title)
FROM employees
WHERE office_code =1
GROUP BY job_title;

-- 5. ORDER BY
SELECT job_title, COUNT(job_title)
FROM employees
WHERE office_code =1
GROUP BY job_title
ORDER BY job_title ASC;

/*
Enunciado : Seleccionar aquellos pedidos, cuya ganancia total sea superior a 20000 ,
 así como fechas maximas de entrega, tiempo de manipulacion y tiempo de envio de los pedidos realizados
*/

SELECT *
FROM orders;

SELECT *
FROM order_details;

-- ORDEN DE ESCRITURA - 5 columnas y 228 registros

SELECT order_details.order_number, SUM(order_details.quantity_ordered * order_details.price_each) AS ganancia_total,
(orders.required_date - orders.order_date) AS maximo_dias_envio,
DATEDIFF(orders.shipped_date,orders.order_date) AS dias_manipulacion,
DATEDIFF(orders.required_date, orders.shipped_date) AS dias_transporte
FROM order_details
INNER JOIN orders
ON order_details.order_number = orders.order_number
GROUP BY order_details.order_number
HAVING SUM(order_details.quantity_ordered * order_details.price_each) >20000
ORDER BY ganancia_total;

-- ORDEN DE EJECUCION

-- 1.FROM - Devuelve 5 columnas y 2996 filas de la tabla order_details


SELECT COUNT(*)
FROM order_details;

-- 2. JOIN - Devuelve 12 columnas  y 2996 filas

SELECT COUNT(*)
FROM order_details
INNER JOIN orders
ON order_details.order_number = orders.order_number;

-- 3.  GROUP BY - 1 columna  (por limitaciones del group by ) y 326 registros

SELECT order_details.order_number
FROM order_details
INNER JOIN orders
ON order_details.order_number = orders.order_number
GROUP BY order_details.order_number;


-- 4. HAVING - 1 columna  (por limitaciones del group by ) y 228 registros

SELECT order_details.order_number
FROM order_details
INNER JOIN orders
ON order_details.order_number = orders.order_number
GROUP BY order_details.order_number
HAVING SUM(order_details.quantity_ordered * order_details.price_each) >20000;

-- 5. SELECT -  5 columnas y 228 registros, sin orden

SELECT order_details.order_number, SUM(order_details.quantity_ordered * order_details.price_each) AS ganancia_total,
(orders.required_date - orders.order_date) AS maximo_dias_envio,
DATEDIFF(orders.shipped_date,orders.order_date) AS dias_manipulacion,
DATEDIFF(orders.required_date, orders.shipped_date) AS dias_transporte
FROM order_details
INNER JOIN orders
ON order_details.order_number = orders.order_number
GROUP BY order_details.order_number
HAVING SUM(order_details.quantity_ordered * order_details.price_each) >20000;

-- 6. ORDER BY - 5 columnas y 228 registros, ordenandos por ganancia total de forma ascendiente (menor a mayor)

SELECT order_details.order_number, SUM(order_details.quantity_ordered * order_details.price_each) AS ganancia_total,
(orders.required_date - orders.order_date) AS maximo_dias_envio,
DATEDIFF(orders.shipped_date,orders.order_date) AS dias_manipulacion,
DATEDIFF(orders.required_date, orders.shipped_date) AS dias_transporte
FROM order_details
INNER JOIN orders
ON order_details.order_number = orders.order_number
GROUP BY order_details.order_number
HAVING SUM(order_details.quantity_ordered * order_details.price_each) >20000
ORDER BY ganancia_total;