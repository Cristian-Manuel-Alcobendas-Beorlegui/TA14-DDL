-- Eliminar la base de datos si existe
DROP DATABASE IF EXISTS ejercicio2;

-- Crear la base de datos
CREATE DATABASE ejercicio2 CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE ejercicio2;

-- Crear la tabla "tema"
CREATE TABLE tema(
	claveTema INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(40)
);

-- Crear la tabla "autor"
CREATE TABLE autor(
	claveAutor INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60)
);

-- Crear la tabla "Editorial"
CREATE TABLE editorial(
	claveEditorial INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60),
    direccion VARCHAR(60),
    telefono VARCHAR(15)
);

-- Crear la tabla "socio"
CREATE TABLE socio(
	claveSocio INT UNSIGNED NOT NULL PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    direccion VARCHAR(60) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    categoria CHAR NOT NULL
);

-- Crear la tabla "Libro"
CREATE TABLE libro(
	claveLibro INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(60) NOT NULL,
    idioma VARCHAR(15) NOT NULL,
    formato VARCHAR(15) NOT NULL,
    claveEditorial INT UNSIGNED NOT NULL,
    
    -- Crear la relación
    CONSTRAINT FK_libro
		FOREIGN KEY(claveEditorial) REFERENCES editorial(claveEditorial)
);

-- Crear la tabla "ejemplar"
CREATE TABLE ejemplar(
	claveEjemplar INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    claveLibro INT UNSIGNED NOT NULL,
    numeroOrden INT UNSIGNED NOT NULL,
    edicion INT UNSIGNED NOT NULL,
    ubicacion VARCHAR(15) NOT NULL,
    categoria CHAR NOT NULL,
    
    -- Crear las relaciones
    CONSTRAINT FK_ejemplar 
		FOREIGN KEY(claveLibro) REFERENCES libro(claveLibro)
);

-- Crear la tabla "prestamo"
CREATE TABLE prestamo(
	claveSocio INT UNSIGNED NOT NULL,
    claveEjemplar INT UNSIGNED NOT NULL,
    numeroOrden INT UNSIGNED NOT NULL,
	fechaPrestamo DATE NOT NULL,
	fechaDevolucion DATE NOT NULL,
    notas BLOB,

	-- Crear la relación
    PRIMARY KEY(claveSocio, claveEjemplar, numeroOrden),
    CONSTRAINT FK_prestamo
		FOREIGN KEY(claveSocio) REFERENCES socio(claveSocio),
        FOREIGN KEY(claveEjemplar) REFERENCES ejemplar(claveEjemplar)
);

-- Crear la tabla "trata_sobre"
CREATE TABLE trata_sobre(
	claveLibro INT UNSIGNED NOT NULL,
    claveTema INT UNSIGNED NOT NULL,
    
    -- Crear la relación
    PRIMARY KEY(claveLibro, claveTema),
    CONSTRAINT FK_trataSobre
		FOREIGN KEY(claveLibro) REFERENCES libro(claveLibro),
        FOREIGN KEY(claveTema) REFERENCES tema(claveTema)
);

-- Crear la tabla "escrito_por"
CREATE TABLE escrito_por(
	claveLibro INT UNSIGNED NOT NULL,
    claveAutor INT UNSIGNED NOT NULL,
    
    -- Crear la relación
    PRIMARY KEY(claveLibro, claveAutor),
    CONSTRAINT FK_escritoPor
		FOREIGN KEY(claveLibro) REFERENCES libro(claveLibro),
        FOREIGN KEY(claveAutor) REFERENCES autor(claveAutor)
);