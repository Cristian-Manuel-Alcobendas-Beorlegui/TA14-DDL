-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS ejercicio11;

-- Crear la base de datos
CREATE DATABASE ejercicio11 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE ejercicio11;

-- Crear la tabla "Facultad"
CREATE TABLE facultad(
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Crear la tabla "Investigadores"
CREATE TABLE investigadores(
	dni VARCHAR(8) NOT NULL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    facultad INT UNSIGNED NOT NULL,
    
    -- Crear la relación
    CONSTRAINT FK_investigadores
		FOREIGN KEY(facultad) REFERENCES facultad(codigo)
);

-- Crear la tabla "equipos"
CREATE TABLE equipos(
	numSerie CHAR(4) NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    facultad INT UNSIGNED NOT NULL,
    
    -- Crear la relación
    CONSTRAINT FK_equipos
		FOREIGN KEY(facultad) REFERENCES facultad(codigo)
);

-- Crear la tabla "reserva"
CREATE TABLE reserva(
	dni CHAR(8) NOT NULL,
    numSerie CHAR(8) NOT NULL,
    comienzo DATETIME NOT NULL,
	final DATETIME NOT NULL,
	
    -- Crear la relación
    PRIMARY KEY(dni, numSerie),
    CONSTRAINT FK_reserva
		FOREIGN KEY(dni) REFERENCES investigadores(dni),
        FOREIGN KEY(numSerie) REFERENCES equipos(numSerie)
);