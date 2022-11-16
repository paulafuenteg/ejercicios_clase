USE TIENDA;
# La tabla customers tiene datos de los clientes de la tienda y la tabla employees de los empleados de esta

#1 Creamos una copia de la tabla customers
CREATE TABLE IF NOT EXISTS customers_mod 
SELECT * 
FROM customers;

#2 Insercion de datos en la tabla customers						
INSERT INTO customers (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
	VALUES (343, 'Adalab', 'Rodriguez', 'Julia', '672986373', 'Calle Falsa 123', 'Puerta 42', 'Madrid', 'España', '28000', 'España', 1501, 20000000);
    
#3 Inserción de datos sin toda la información
INSERT INTO customers (customer_number, customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
	VALUES (340, 'La pegatina After', 'Santiago', 'Maricarmen', '00000000', 'Travesía del rave', NULL, ' Palma de Mallorca', NULL, '07005', 'España', 1216, 45673453);


#4 Inserción de 5 nuevas filas, tres de ellas con contact first name vacio
INSERT INTO customers (customer_name, contact_last_name, contact_first_name, phone, address_line1, address_line2, city, state, postal_code, country, sales_rep_employee_number, credit_limit)
	VALUES ('Hola', 'Caracola' , NULL, '99876566', 'Arenal', '209', 'Gijon', NULL, '5644', 'España', 1611, 8765664),
	 ('Adios', 'Carcol', NULL, '89754567', 'Carlos', 'Hernandez', 'Madrid', 'España', '56789', 'España', 1337, 3456789),
     ('Ladilla', 'Rusa', NULL, '34567866', 'sospso', 'sakila', 'Cordoba', 'España', '97533', 'España', 1216, 9876345),
     ('Prueba', 'Francisco', 'José', '3456323', 'Llave', '24', 'Burgos', 'España', '27654', 'España', 1611, 66543579),
	('Blabla', 'Blablo', 'Blubli', '3453564674', 'Bleble', NULL, 'Granada', 'España', '32423', 'España', 1337, 765432);

#5 Actualizar los datos de La pagatina After
UPDATE customers
	SET address_line1 = 'Polígono Industrial de Son Castelló', address_line2 = 'Nave92', city = 'Palma de Mallorca', state = 'España', postal_code ='28123', country = 'España', sales_rep_employee_number = 1188, credit_limit = 5000000
WHERE customer_number = 340;

#6 Creamos una copia de la tabla y a realizar cambios sin la condicion WHERE
CREATE TABLE IF NOT EXISTS customers_destroy
SELECT * 
FROM customers;

UPDATE customers 
	SET address_line1 = 'Vamos', address_line2 = 'a', postal_code ='fastidiar', country = 'la tabla :)';

ALTER TABLE customers_destroy
 RENAME customers;

#7 Actualizar los datos de customers_mod para que las 10 primeras empresas se gestionen por representante de ventas 2
UPDATE customers_mod
SET sales_rep_employee_number = 2
WHERE customer_number = customer_number
ORDER BY customer_number ASC
LIMIT 10;

#8 eliminar de los datos de la tabla aquellos registros que contengan un 'null' en el campo 'ContactFirstName'.
DELETE FROM customers
WHERE contact_first_name = NULL;

#9 Eliminar ahora de los datos los últimos 5 registros de la tabla ordenando por la columna creditLimit en order de mayor a menor, queremos eliminar las 5 empresas con menor liquidez
DELETE FROM customers_mod
WHERE credit_limit = credit_limit
ORDER BY credit_limit DESC
LIMIT 5;

#10 DELETE para la tabla customers_mod olvidando el WHERE 
DELETE FROM customers_mod;



