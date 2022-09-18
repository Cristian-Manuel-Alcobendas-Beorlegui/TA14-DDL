-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS ejercicio4;

-- Crear la base de datos
CREATE DATABASE ejercicio4 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE ejercicio4;

-- Crear la tabla "departamentos"
CREATE TABLE departamentos(
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    presupuesto DECIMAL(5,2) NOT NULL
);

-- Crear la tabla "empleados"
CREATE TABLE empleados(
	dni VARCHAR(8) NOT NULL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    departamento INT UNSIGNED NOT NULL,
    
    -- Crear la relación
    CONSTRAINT FK_empleados
		FOREIGN KEY(departamento) REFERENCES departamentos(codigo)
);