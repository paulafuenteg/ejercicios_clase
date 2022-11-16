-- CREACIÓN DE LA BASE DE DATOS --

CREATE SCHEMA spotify;

-- SELECIÓN DE LA BASE DE DATOS

 USE spotify;
 
-- CREACIÓN DE LAS TABLAS --

CREATE TABLE IF NOT EXISTS info_canciones (
	id_cancion INT NOT NULL AUTO_INCREMENT,
    nombre_cancion  VARCHAR(255) DEFAULT NULL,
    artista VARCHAR(255) DEFAULT 'Artista desconocido',
	album VARCHAR(255) DEFAULT "Album desconocido",
    duracion INT NOT NULL,
    fecha_album DATE DEFAULT NULL,
    explicita ENUM( "False","True","No Especificado" ) DEFAULT "No Especificado",
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
    
    
INSERT INTO info_canciones (  nombre_cancion, artista, album, duracion, fecha_album, explicita) 
		VALUES ( "La vereda de la puerta de atrás", "Extremoduro","Yo, Minoría Absoluta","243320", "2002-03-01", "False");
                
INSERT INTO info_canciones (  nombre_cancion, artista, album, duracion, fecha_album, explicita) 
VALUES ('La molinera',	'La Maravillosa Orquesta del Alcohol',	'Nuevo Cancionero Burgalés',	166359,	'2021/12/17'	,'False');


INSERT INTO info_canciones (  nombre_cancion, artista, album, duracion, fecha_album, explicita) 
VALUES ("Comer, Comer"	,"Quim Barreiros",	"O Melhor De Quim Barreiros",	230202,	"2003-01-01",	"False");


INSERT INTO caracteristicas_canciones (popularidad  ,danceability ,energy ,`key` ,loudness,`mode` ,speechiness  ,acousticness ,instrumentalness ,liveness ,valence ,tempo ,id_cancion )
VALUES (62 ,0.403,	0.893,	9,	-2.735,	0,	0.0474,	0.437,	0.000173,	0.11,	0.527,	141.194,1);

    