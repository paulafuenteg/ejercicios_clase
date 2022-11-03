#Insertar una fila de valores
INSERT INTO empleadas (salario, nombre, apellido, pais, dni)
VALUES (2000, 'Inés', 'Romero', 'España', '71348767R');

#Insertar varias filas en un mismo comando
INSERT INTO empleadas (salario, nombre, apellido, pais, dni)
VALUES (1800, 'Julia', 'Aguilar', 'España', '6765434R'),
(2000, 'Irene', 'Montenegro', 'España', '44543468D'),
(3000, 'Laura', 'Navarro','Italia', '8787546D') ;

#Modificar datos de una tabla
UPDATE empleadas
SET salario = 3500, pais = 'España'
WHERE id_empleada = 4;

#Actualizar todos los salarios de empleadas que cumplan una condiciñon
UPDATE empleadas
SET salario = 2000
WHERE salario <2000;

#Eliminar un registro de una tabla
DELETE FROM empleadas
WHERE id_empleada = 2;

#Eliminar con condicionantes
DELETE FROM empleadas
WHERE salario > 2500
ORDER BY salario DESC
LIMIT 3;
