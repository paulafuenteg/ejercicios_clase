CREATE TABLE leccion_7_sql.empleadas SELECT * FROM leccion_5_sql.empleadas; 
USE leccion_7_sql;

# Añadimos la columna ciudad 
ALTER TABLE empleadas
ADD COLUMN ciudad VARCHAR (45);

# Nos damos cuenta de que no hay id_empleadas, los añadimos y las ciudades
SET SQL_SAFE_UPDATES = 0;
UPDATE empleadas SET id_empleada = 1, ciudad = 'Madrid'
WHERE nombre = 'Ana';

UPDATE empleadas SET id_empleada = 2, ciudad = 'Barcelona'
WHERE nombre = 'Maria';

UPDATE empleadas SET id_empleada = 3, ciudad = 'Valencia'
WHERE nombre = 'Lucía';

UPDATE empleadas SET id_empleada = 4, ciudad = 'Bilbao'
WHERE nombre = 'Elena';

UPDATE empleadas SET id_empleada = 5, ciudad = 'Paris'
WHERE nombre = 'Rocío';
# volvemos a incluir el safe mode
SET SQL_SAFE_UPDATES = 1;

#Añadimos que id_empleadas sea la primary key y que sea auto_inrement
ALTER TABLE empleadas
ADD primary key (id_empleada);

ALTER TABLE empleadas
MODIFY COLUMN id_empleada INT auto_increment;

#Trabajando de nuevo sobre la tabla empleadas que hemos definido anteriormente, calcula el salario medio por ciudad de las empleadas españolas:
SELECT ciudad, AVG(salario) AS SalarioMedio    
FROM empleadas    
WHERE pais = "España"    
GROUP BY ciudad; 

#¿Cuantas empleadas hay en cada ciudad?
SELECT ciudad, COUNT(id_empleada) as EmpleadasporCiudad
FROM empleadas
GROUP BY ciudad;

# Selecciona los nombres de las ciudades con una o más empleadas.
SELECT ciudad, COUNT(id_empleada) as EmpleadasporCiudad
FROM empleadas
GROUP BY ciudad
HAVING COUNT(id_empleada) >= 1;

#1. Selecciona nombre y apellidos únicamente de aquellas empleadas que sean de España y asígnale una etiqueta que sea 'Española'.
SELECT 
CASE
WHEN pais = 'España' THEN 'Españolas'
END AS 'Nacionalidad', nombre, apellido
FROM empleadas
WHERE pais = 'España';

#2. Selecciona aquellas empleadas que sean de España y asígnale una etiqueta que sea 'Española'. Al resto de empleadas asígnale la etiqueta Extranjera.
SELECT 
CASE
WHEN pais = 'España' THEN 'Españolas'
ELSE 'Extrajera'
END AS 'Nacionalidad', nombre, apellido
FROM empleadas
WHERE pais = 'España';
