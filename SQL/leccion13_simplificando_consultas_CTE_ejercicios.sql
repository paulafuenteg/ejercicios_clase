#CREAMOS LAS TABLAS PARA REALIZAR LAS CONSULTAS
CREATE TABLE empleadas_camino(
  id_empleada INT NOT NULL AUTO_INCREMENT,
  nombre VARCHAR(30) DEFAULT NULL,
  id_supervisora INT DEFAULT NULL,
  PRIMARY KEY (id_empleada)
  );

INSERT INTO empleadas_camino
VALUE (29,'Pedro',	198),
(72,'Paco',	29),
(123,'Alba',	692),
(198,'Laura',	333),
(333,'Yasmina',	NULL),
(692,'Tomas',	333),
(4610,'Sara',	29);


/*Las CTE pueden ser útiles para para recorrer datos que siguen cierta jerarquía, como podría ser la cadena de supervisión dentro de una empresa. 
Imaginemos que en esa empresa cada empleada tiene una supervisora. Esa supervisora a su vez tiene una supervisora y así sucesivamente hasta llegar a la "cabeza" 
de la jerarquía, que podría ser la CEO de la empresa. La tabla empleadas que contiene esta información en la base de datos tendría el siguiente formato:
Escribe una CTE recursiva que muestre cada empleada (su id_empleada), su nombre, y el camino desde la CEO hasta ese propio empleado, en forma de lista de ids 
separados por comas. Para la tabla ejemplo que hemos mostrado anteriormente, la salida que queremos que devuelva la CTE cuando la usemos sería algo como lo siguiente:

PISTA: empieza sacando el id_empleada de la CEO en la parte no recursiva de la CTE.*/

WITH RECURSIVE cte (id_empleada, nombre, camino)
AS (SELECT id_empleada
	WHERE id_supervisora = NULL
    
    UNION ALL
    
    SELECT id_supervisora+id_supervisora as camino
	FROM cte  )
SELECT * FROM empleadas_camino;

