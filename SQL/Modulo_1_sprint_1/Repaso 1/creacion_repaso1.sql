# Crear la base de datos
CREATE SCHEMA spotify;

#Seleccionar la base de datos
USE spotify;

#Crear tablas de la base de  datos
CREATE TABLE IF NOT EXISTS info_canciones (
	id_cancion INT NOT NULL AUTO_INCREMENT,
    nombre_cancion  VARCHAR(255) DEFAULT NULL,
    artista VARCHAR(255) DEFAULT 'Artista desconocido',
	album VARCHAR(255) DEFAULT "Album desconocido",
    duracion INT NOT NULL,
    fecha_album DATE DEFAULT NULL,
    explicita ENUM( "False","True","No Especificado") DEFAULT "No Especificado",
    PRIMARY KEY (id_cancion));
    

CREATE TABLE IF NOT EXISTS caracteristicas_canciones (
	popularidad INT ,
	danceability FLOAT,
	energy DECIMAL(3),
	`key` INT,
	loudness DECIMAL(3),
	`mode` BOOL,
	speechiness  FLOAT,
	acousticness FLOAT,
	instrumentalness FLOAT,
	liveness FLOAT,
	valence FLOAT,
	tempo FLOAT,
	id_cancion INT NOT NULL,
    CONSTRAINT popularidad CHECK (popularidad BETWEEN 0 AND 100),
    CONSTRAINT `fk_caracteristicas_canciones_info_canciones`
    FOREIGN KEY (id_cancion)
    REFERENCES info_canciones (id_cancion));

    
    
    