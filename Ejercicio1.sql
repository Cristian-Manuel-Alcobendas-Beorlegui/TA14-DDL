-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS ejercicio1;

-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS ejercicio1 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE ejercicio1;

-- Crear la tabla "Estacion"
CREATE TABLE estacion(
	identificador INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    latitud DECIMAL(5,2) NOT NULL,
    longitud DECIMAL(5,2) NOT NULL,
	altitud DECIMAL(5,2) NOT NULL
);

-- Crear la tabla "muestra"
CREATE TABLE muestra(
	identificadorEstacion INT UNSIGNED NOT NULL,
    fecha DATE NOT NULL,
    temperaturaMinima DECIMAL(4,2) NOT NULL,
    temperaturaMaxima DECIMAL(4,2) NOT NULL,
    precipitaciones DECIMAL(4,2) NOT NULL,
    humedadMinima DECIMAL(4,2) NOT NULL,
    humedadMaxima DECIMAL(4,2) NOT NULL,
    velVientoMinima DECIMAL(4,2) NOT NULL,
    velVientoMaxima DECIMAL(4,2) NOT NULL,
    
    -- Crear la relación con la tabla "muestra"
    PRIMARY KEY(identificadorEstacion, fecha),
    CONSTRAINT FK_muestra 
		FOREIGN KEY(identificadorEstacion) REFERENCES estacion(identificador)
);
