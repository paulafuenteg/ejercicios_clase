USE leccion_11_sql;
CREATE TABLE leccion_11_sql.empleadas SELECT * from leccion_9_sql.empleadas;
CREATE TABLE leccion_11_sql.empleadas_en_proyectos SELECT * from leccion_9_sql.empleadas_en_proyectos;
-- La consulta a analizar es:

SELECT empleadas.id_empleada, empleadas.nombre, empleadas.apellido  
FROM empleadas INNER JOIN empleadas_en_proyectos  
ON empleadas.id_empleada = empleadas_en_proyectos.id_empleada  
GROUP BY (empleadas.id_empleada)  
HAVING COUNT(*)>1;
-- 1 fila y 3 columnas

-- SU ORDEN DE EJECUCIÓN SERÁ:
-- FROM empleadas UNIDO con empleadas_en_proyectos:
SELECT * 
FROM empleadas INNER JOIN empleadas_en_proyectos  
ON empleadas.id_empleada = empleadas_en_proyectos.id_empleada;   -- 8 columnas y 5 filas
-- GROUP BY el id de la tabla empleadas
SELECT * 
FROM empleadas INNER JOIN empleadas_en_proyectos  
ON empleadas.id_empleada = empleadas_en_proyectos.id_empleada
GROUP BY (empleadas.id_empleada); -- 8 columnas y 4 filas
-- HAVING COUNT que sea mayor que uno 
SELECT *
FROM empleadas INNER JOIN empleadas_en_proyectos  
ON empleadas.id_empleada = empleadas_en_proyectos.id_empleada  
GROUP BY (empleadas.id_empleada)  -- 8 columnas y 1 filas
HAVING COUNT(*)>1;
-- SELECT las columnas de id_empleada, nombre y apellido 
SELECT empleadas.id_empleada, empleadas.nombre, empleadas.apellido  
FROM empleadas INNER JOIN empleadas_en_proyectos  
ON empleadas.id_empleada = empleadas_en_proyectos.id_empleada  
GROUP BY (empleadas.id_empleada)  
HAVING COUNT(*)>1; -- 1 fila y 3 columnas
