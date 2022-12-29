USE leccion_13_sql;
CREATE TABLE leccion_13_sql.empleadas SELECT * FROM leccion_12_sql.empleadas;
CREATE TABLE leccion_13_sql.empleadas_en_proyectos SELECT * FROM leccion_12_sql.empleadas_en_proyectos;
CREATE TABLE leccion_13_sql.customers SELECT * FROM leccion_12_sql.customers;
CREATE TABLE leccion_13_sql.products SELECT * FROM leccion_12_sql.products;

-- Define una CTE que calcule el salario medio de las empleadas de cada país. Después usa dicha CTE para mostrar los datos de cada empleada junto con el salario medio de su pais.
SELECT pais, AVG(salario) as salario_medio_pais  
FROM empleadas  
GROUP BY pais;
-- CON WITH
WITH salario_avg
AS (
      SELECT pais,
            AVG(salario) AS salario_medio_pais
      FROM empleadas
      GROUP BY pais
      )
SELECT e.id_empleada,
        e.nombre,
        e.apellido,
        e.pais,
        e.salario,
        s.salario_medio_pais
FROM empleadas AS e
JOIN salario_avg AS s ON e.pais = s.pais;


-- Indica el numero de empleadas de cada país que cobran un sueldo por encima de la media de su pais.
WITH salario_avg
AS (
    SELECT pais,
            AVG(salario) AS salario_avg_pais
    FROM empleadas
    GROUP BY pais
    )
SELECT e.id_empleada,
        e.nombre,
        e.apellido,
        e.pais,
        e.salario AS salario,
        s.salario_avg_pais AS salario_medio
FROM empleadas AS e
JOIN salario_avg AS s ON s.pais = e.pais);

SELECT COUNT(id_empleada) AS NumeroEmpleadas, 
       pais  
FROM (
      WITH salario_avg AS (
                            SELECT pais, 
                                  AVG(salario) AS salario_avg_pais
                            FROM empleadas
                            GROUP BY pais
                            )  
      SELECT e.id_empleada,
              e.nombre,
              e.apellido,
              e.pais,
              e.salario AS salario,
              s.salario_avg_pais AS salario_medio  
      FROM empleadas AS e 
      JOIN salario_avg AS s  
      ON s.pais = e.pais
      ) AS empleadas_salarios  
WHERE empleadas_salarios.salario > empleadas_salarios.salario_medio  
GROUP BY pais;

-- Podemos crear una tabla que contenga el nombre de cada pais y el número de empleadas que cobran salarios por encima de la media de ese país. Es decir, el resultado del ejemplo anterior.
SELECT COUNT(id_empleada) AS NumeroEmpleadas,
        pais
FROM (
      WITH salario_avg AS (
          SELECT pais,
                  AVG(salario) AS salario_avg_pais
          FROM empleadas
          GROUP BY pais
      )
      SELECT e.id_empleada,
              e.nombre,
              e.apellido,
              e.pais,
              e.salario AS salario,
              s.salario_avg_pais AS salario_medio
      FROM empleadas AS e
      JOIN salario_avg AS s ON s.pais = e.pais
      ) AS empleadas_salarios
WHERE empleadas_salarios.salario > empleadas_salarios.salario_medio
GROUP BY pais;


CREATE TABLE EmpleadasSalarioAlto;

INSERT INTO EmpleadasSalarioAlto
SELECT COUNT(id_empleada) AS NumeroEmpleadas,
  pais
FROM (
  WITH salario_avg AS (
      SELECT pais,
        AVG(salario) AS salario_avg_pais
      FROM empleadas
      GROUP BY pais
      )
  SELECT e.id_empleada,
          e.nombre,
          e.apellido,
          e.pais,
          e.salario AS salario,
          s.salario_avg_pais AS salario_medio
  FROM empleadas AS e
  JOIN salario_avg AS s ON s.pais = e.pais
  ) AS empleadas_salarios
WHERE empleadas_salarios.salario > empleadas_salarios.salario_medio
GROUP BY pais;

-- CTE no recursiva
WITH ContarFilas(NumeroFilas) 
AS (
    SELECT ROW_NUMBER() OVER(
                            ORDER BY nombre ASC
                            ) AS NumeroFilas2
    FROM empleadas
    WHERE id_empleada <= 3
    )
SELECT NumeroFilas
FROM ContarFilas;

-- CTE RECURSIVA
WITH RECURSIVE cte (n) 
AS (
  SELECT 1

  UNION ALL
  
  SELECT n + 1 
  FROM cte 
  WHERE n < 5
  ) 
SELECT * 
FROM cte;