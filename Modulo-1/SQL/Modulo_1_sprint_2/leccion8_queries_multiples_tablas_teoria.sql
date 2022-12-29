CREATE TABLE leccion_8_sql.empleadas SELECT * FROM leccion_7_sql.empleadas; 
CREATE TABLE empleadas_en_proyectos (
id_empleada INT,
id_proyecto INT);
INSERT INTO empleadas_en_proyectos
VALUES (1,1),
(2, 1),
(3, 2),
(4, 2),
(3, 3);

SELECT empleadas.nombre, empleadas.apellido, empleadas_en_proyectos.id_proyecto AS proyecto, empleadas_en_proyectos.id_empleada AS empleada
FROM empleadas
CROSS JOIN empleadas_en_proyectos    
WHERE empleadas.id_empleada = empleadas_en_proyectos.id_empleada;    

#Selecciona los salarios medios de las empleadas asignadas al proyecto número 2 utilizando el producto cartesiano de las tablas Empleada y empleadas_en_proyectos.
SELECT ROUND(AVG(empleadas.salario)), empleadas_en_proyectos.id_proyecto AS proyecto
FROM empleadas
CROSS JOIN empleadas_en_proyectos    
WHERE empleadas.id_empleada = empleadas_en_proyectos.id_empleada AND id_proyecto = 2;

#USANDO NATURAL JOIN
SELECT ROUND(AVG(salario)), id_proyecto AS proyecto
FROM empleadas
NATURAL JOIN empleadas_en_proyectos    
WHERE id_proyecto = 2;

#USANDO INNER JOIN
SELECT ROUND(AVG(salario)), empleadas_en_proyectos.id_proyecto AS proyecto
FROM empleadas
INNER JOIN empleadas_en_proyectos 
ON empleadas.id_empleada = empleadas_en_proyectos.id_empleada
WHERE id_proyecto = 2;

#USANDO INNER JOIN USING
SELECT ROUND(AVG(salario)), empleadas_en_proyectos.id_proyecto AS proyecto
FROM empleadas
INNER JOIN empleadas_en_proyectos 
USING (id_empleada)
WHERE id_proyecto = 2;