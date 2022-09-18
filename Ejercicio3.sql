-- Eliminar la base de datos si es que existe
DROP DATABASE IF EXISTS ejercicio3;

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS ejercicio3 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE ejercicio3;

-- Crear la tabla "Fabricantes"
CREATE TABLE fabricantes(
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)  NOT NULL
);

-- Crear la tabla "articulos"
CREATE TABLE articulos(
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    precio DECIMAL(5,2) NOT NULL CHECK(precio >= 0),
    fabricante INT UNSIGNED NOT NULL,
    
    -- Crear la relación
    CONSTRAINT FK_articulos
		FOREIGN KEY(fabricante) REFERENCES fabricantes(codigo)
);