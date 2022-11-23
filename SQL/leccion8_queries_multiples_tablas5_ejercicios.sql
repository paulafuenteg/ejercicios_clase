CREATE TABLE leccion_12_sql.products SELECT * FROM tienda.products;
CREATE TABLE leccion_12_sql.customers SELECT * FROM tienda.customers;

/* 1: Consultas correlacionadas Selecciona de la tabla products el productCode, productName, quantityInStock, productLine, MSRP, buyPrice, 
para aquellos casos en los que la diferencia entre el MSRP y el precio de compra sea mayor o igual a la media de la diferencia de precios entre MSRP y
 precio de compra con alias 'AvgProfit', siempre que el 'AvgProfit' sea superior a 50 euros.*/
SELECT product_code, product_name, quantity_in_stock, product_line, p1.msrp, p1.buy_price
FROM products as p1
WHERE (p1.msrp - p1.buy_price) >= (
							SELECT AVG(p2.msrp - p2.buy_price) as AvgProfit
                            FROM products as p2) AND (p1.msrp - p1.buy_price) > 50;

-- 2: Encuentra los campos nombre del cliente y ciudad, de aquellas ciudades de la tabla de customers que terminen en 'on'.
SELECT customer_name, city
FROM customers
WHERE city LIKE '%on';

-- 3: Encuentra los campos nombre del cliente, ciudad de aquellas ciudades de la tabla de customers que terminen en 'on' y que unicamente sean de longitud 4.
SELECT customer_name, city
FROM customers
WHERE city LIKE '%on' AND city LIKE '____';

/* 4: Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal 
(o lo que es lo mismo, su primera dirección)*/
SELECT customer_name, address_line1, city
FROM customers
WHERE address_line1 LIKE '%3%';

-- 5: Encuentra el nombre del cliente, primera dirección y ciudad de aquellas ciudades que contengan el número 3 en su dirección postal y la ciudad no empiece por T.
SELECT customer_name, address_line1, city
FROM customers
WHERE address_line1 LIKE '%3%' AND city NOT LIKE 'T%';

/* 6: Selecciona, haciendo uso de expresiones regulares, los campos nombre del cliente, primera dirección y ciudad. Unicamente en el caso que la dirección postal, 
posea algún número en dicho campo.*/


-- 7:Investiga que ocurre al ejecutar la siguiente sentencia sobre la tabla de products.

-- SELECT * FROM products
-- WHERE productDescription LIKE '%'%';

-- La sentencia correcta debería utilizar el carácter de escape \, ya que las comillas simples las interpretaría como la apertura de algún texto.

SELECT * FROM products
WHERE product_description LIKE '%\'%';