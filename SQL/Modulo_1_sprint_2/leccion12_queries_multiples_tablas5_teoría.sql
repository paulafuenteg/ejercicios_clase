SELECT id_empleada, 
        nombre, 
        apellido, 
        e1.salario, 
        e1.pais  
FROM empleadas AS e1  
WHERE e1.salario >= (
    SELECT AVG(e2.salario)  
    FROM empleadas AS e2  
    WHERE e1.pais = e2.pais)  
ORDER BY salario;  

SELECT *  
FROM empleadas  
WHERE nombre LIKE 'A%';  

SELECT *
FROM empleadas  
WHERE nombre LIKE '%l%';  

SELECT *  
FROM empleadas  
WHERE nombre LIKE 'e_%';  

SELECT *  
FROM empleadas  
WHERE nombre NOT LIKE '%l%';  

SELECT *
FROM empleadas
WHERE nombre REGEXP '^A';