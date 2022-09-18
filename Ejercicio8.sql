-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS ejercicio8;

-- Crear la base de datos
CREATE DATABASE ejercicio8 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE ejercicio8;

-- Crear la tabla "piezas"
CREATE TABLE piezas(
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear la tabla "proveedores"
CREATE TABLE proveedores(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear la tabla "suministra"
CREATE TABLE suministra(
	codigoPieza INT UNSIGNED NOT NULL,
    idProveedor INT UNSIGNED NOT NULL,
    precio DECIMAL(5,2) NOT NULL,
    
    -- Crear la relación
    PRIMARY KEY(codigoPieza, idProveedor),
	CONSTRAINT FK_suministra
		FOREIGN KEY(codigoPieza) REFERENCES piezas(codigo),
        FOREIGN KEY(idProveedor) REFERENCES proveedores(id)
);