#Seleccionamos atributos Nombre, Telefono y dirección de alumnas
SELECT nombre, telefono, direccion
FROM alumnas;

#Realiza una consulta que obtenga los atributos Teléfono y dirección de aquellas alumnas de la tabla alumnas que se llamen Elena.
SELECT telefono, direccion
FROM alumnas  
WHERE nombre = "Elena"; 

# Realiza una consulta que obtenga los atributos Email y Nombre de aquellas alumnas de la tabla alumnas que sean de España o de Francia.
SELECT email, nombre  
FROM alumnas  
WHERE pais = "España"  
OR pais = "Francia";  

#Realiza una consulta que obtenga los atributos Email y Nombre de aquellas alumnas de la tabla alumnas que no se apelliden Bueno.
SELECT email, nombre  
FROM alumnas  
WHERE NOT apellido = "Bueno";  

#Ejercicio: Selecciona todos los atributos de las alumnas cuyo IDAlumna sea mayor o igual que 3.
SELECT *
FROM alumnas
WHERE id_alumna >= 3;

#Ejercicio: Selecciona todos los atributos de las alumnas cuyo IDAlumna sea menor o igual que 4 y que sean de Madrid.
SELECT *
FROM alumnas
WHERE id_alumna >= 4
AND ciudad = 'Madrid';

#Selecciona Nombre y Apellido para aquellos registros de la tabla alumnas que no tengan valor guardado para el atributo Telefono.
SELECT nombre, apellido
FROM alumnas
WHERE telefono IS NULL;