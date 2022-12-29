# En la tabla alumnas selecciona los valores que toma el atributo Ciudad para aquellas alumnas que son España y ordénalos por orden alfabético (según la Ciudad).
SELECT ciudad FROM alumnas
WHERE pais = 'España'
ORDER BY ciudad DESC;

# En la tabla alumnas selecciona los distintos valores que toma el atributo Ciudad para aquellas alumnas que son de España.
SELECT DISTINCT ciudad FROM alumnas
WHERE pais = 'España';

CREATE TABLE leccion_5_sql.empleadas SELECT * FROM `leccion-1-sql`.empleadas;
INSERT INTO empleadas (salario, nombre, apellido, pais)
	VALUES (2500, "Ana", "González", "España"),
			(4000, "Maria", "López", "España"),
            (3000, "Lucía", "Ramos", "España"),
            (5000, "Elena", "Bueno", "España"),
            (1500, "Rocío", "García", "Francia");
            
#En la tabla Empleadas anterior selecciona todos los datos de las 3 empleadas que menos cobren y cuyo país sea España.
SELECT * FROM empleadas 
WHERE pais ='España'
ORDER BY salario ASC
LIMIT 3; 

#En la tabla Empleadas selecciona los 2 primeros valores que toma el atributo país para aquellas empleadas que son de España cuando se los ordena por orden alfabético (según el nombre de las empleadas).
SELECT pais FROM empleadas 
ORDER BY nombre ASC
LIMIT 2; 

#En la tabla Empleadas selecciona el Nombre y Apellido de la 2ª empleada que más cobre en España.
SELECT * FROM empleadas 
WHERE pais ='España'
ORDER BY salario DESC
LIMIT 2
OFFSET 3;

#Utilizando el ejemplo de la tabla Empleadas, selecciona los atributos Nombre y Apellido para aquellas empleadas de España que tengan un Salario entre 1000 y 3000 €.
SELECT nombre, apellido FROM empleadas 
WHERE pais ='España'
AND salario BETWEEN 1000 AND 3000;

#Utilizando el ejemplo de la tabla Empleadas, selecciona Apellido y Salario de aquellas empleadas que vivan en España o Alemania.
SELECT apellido, salario FROM empleadas 
WHERE pais IN ('España', 'Alemania');

#selecciona Apellido y Salario de aquellas empleadas que vivan en España y renombra las columnas resultado a Alumna y Sueldo respectivamente.
SELECT apellido AS Alumna, salario AS Sueldo FROM empleadas 
WHERE pais ='España';