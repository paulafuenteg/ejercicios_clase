CREATE TABLE productos (
    id_producto INT,
    nombre VARCHAR(100),
    color ENUM('rojo','amarillo','azul'),
    precio INT,
    stock float 
    );
    
    CREATE TABLE productos2 (
    id_producto INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) DEFAULT NULL,
    color ENUM('rojo','amarillo','azul') DEFAULT NULL,
    precio INT DEFAULT NULL,
    stock FLOAT DEFAULT NULL,
PRIMARY KEY (id_producto)
);
    
    CREATE TABLE personas (
    id_personas INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT,
    ciudad varchar(255) DEFAULT 'Madrid',
    PRIMARY KEY (id_personas)
    );
    
    CREATE TABLE productos3 (
    id_producto INT NOT NULL AUTO_INCREMENT,   
    nombre VARCHAR(100) DEFAULT NULL,   
    color ENUM('rojo','amarillo','azul') DEFAULT NULL,   
    precio INT DEFAULT NULL,   
    stock FLOAT DEFAULT NULL,   
    PRIMARY KEY (id_producto),   
    CONSTRAINT precio_positivo CHECK ((precio > 0))   
    );
     
     CREATE TABLE personas2 (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT CHECK (edad >= 16),
    ciudad varchar(255) DEFAULT 'Madrid'
	   );
       
	CREATE TABLE pedidos (
    id_pedido INT NOT NULL AUTO_INCREMENT,
    id_personas INT NOT NULL,
	PRIMARY KEY (id_pedido),
    CONSTRAINT fk_pedidos_personas
		FOREIGN KEY (id_personas)
	REFERENCES personas (id_personas) 
    );
    