USE empresa_pf

CREATE TABLE IF NOT EXISTS clientes (
DNI VARCHAR(11) NOT NULL,
nombre VARCHAR(100) NOT NULL,
direccion VARCHAR(250),
barrio VARCHAR(50),
ciudad VARCHAR(50),
estado VARCHAR(10),
CP VARCHAR(10),
fecha_nacimiento DATE,
edad SMALLINT,
sexo VARCHAR(1),
limite_credito FLOAT,
volumen_compra FLOAT,
primera_compta BIT(1),
PRIMARY KEY (DNI)
);
ALTER TABLE clientes RENAME COLUMN primera_compta TO primera_compra;

CREATE TABLE IF NOT EXISTS vendedores(
matricula VARCHAR(5) NOT NULL,
nombre VARCHAR(100) NOT NULL,
barrio VARCHAR(50),
comision FLOAT,
fecha_admision DATE,
vacaciones BIT(1),
PRIMARY KEY (matricula)
);

CREATE TABLE IF NOT EXISTS productos(
codigo VARCHAR(10) NOT NULL,
descripcion VARCHAR(100),
sabor VARCHAR(50),
tamaño VARCHAR(50),
envase VARCHAR(50),
precio FLOAT,
PRIMARY KEY (codigo)
);

CREATE TABLE IF NOT EXISTS facturas(
numero VARCHAR(5) NOT NULL,
fecha DATE,
DNI VARCHAR(11) NOT NULL,
matricula VARCHAR(10) NOT NULL,
impuesto FLOAT,
PRIMARY KEY (numero),
FOREIGN KEY(DNI) REFERENCES clientes(DNI),
FOREIGN KEY(matricula) REFERENCES vendedores(matricula)
);

CREATE TABLE IF NOT EXISTS items(
numero VARCHAR(5) NOT NULL,
codigo VARCHAR(10) NOT NULL,
cantidad INT,
precio FLOAT,
PRIMARY KEY(numero, codigo),
FOREIGN KEY(numero) REFERENCES facturas(numero),
FOREIGN KEY(codigo) REFERENCES productos(codigo)
);

SELECT * FROM clientes;
SELECT * FROM vendedores;
SELECT * FROM productos;
SELECT * FROM facturas;
SELECT * FROM items;