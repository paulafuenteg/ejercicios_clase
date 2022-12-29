USE leccion_9_sql;
CREATE TABLE leccion_9_sql.empleadas SELECT * FROM leccion_8_sql.empleadas; 
CREATE TABLE leccion_9_sql.empleadas_en_proyectos SELECT * FROM leccion_8_sql.empleadas_en_proyectos; 

-- Si quisiéramos conocer los nombres y apellidos de todas las empleadas y sus proyectos asociados (si es que los tuviesen) 
-- podríamos realizar la siguiente consulta usando LEFT JOIN:
SELECT empleadas.nombre, empleadas.apellido, empleadas_en_proyectos.id_proyecto  
FROM empleadas LEFT JOIN empleadas_en_proyectos  
ON empleadas.id_empleada = empleadas_en_proyectos.id_empleada;  

-- usando RIGHT JOIN
SELECT empleadas.nombre, empleadas.apellido, empleadas_en_proyectos.id_proyecto   
FROM empleadas RIGHT JOIN empleadas_en_proyectos  
ON empleadas.id_empleada = empleadas_en_proyectos.id_empleada;  

-- Ejemplo: Seleccionamos los nombres y apellidos de todas las empleadas de la tabla empleadas, así como los id_proyecto de todos los proyectos de la tabla empleadas_en_proyectos. 
-- Si alguna de las empleadas está asignada a un proyecto, se indicará en el resultado:

SELECT empleadas.nombre, empleadas.apellido, empleadas_en_proyectos.id_proyecto  
FROM empleadas  
LEFT JOIN empleadas_en_proyectos  
ON empleadas.id_empleada = empleadas_en_proyectos.id_empleada  
UNION  
SELECT empleadas.nombre, empleadas.apellido, empleadas_en_proyectos.id_proyecto  
FROM empleadas  
RIGHT JOIN empleadas_en_proyectos  
ON empleadas.id_empleada = empleadas_en_proyectos.id_empleada;  

-- l objetivo de la consulta es seleccionar parejas de empleadas del mismo país y visualizar sus salarios, lo cual puede resultar útil para encontrar
-- diferencias significativas entre ellos e investigar la causa.
SELECT A.nombre AS Nombre1, A.apellido AS Apellido1, A.salario AS Salario1, B.nombre AS Nombre2, B.apellido AS Apellido2, B.salario AS Salario2, A.pais  
FROM empleadas AS A, empleadas AS B  
WHERE A.id_empleada <> B.id_empleada  
AND A.pais = B.pais;  