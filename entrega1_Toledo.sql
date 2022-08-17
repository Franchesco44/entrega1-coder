USE almacen;

CREATE TABLE IF NOT EXISTS productos(
	producto_id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR (40) NOT NULL,
    precio VARCHAR(20) NOT NULL,
    #preguntar a profe lo de abajo
    stock INT NOT NULL,
    codigo_balanza INT (10)
);

CREATE TABLE IF NOT EXISTS proveedores (
	proveedor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    direccion VARCHAR(50) NOT NULL,
    numero_telefono VARCHAR(30),
    ciudad VARCHAR(30),
    calle VARCHAR(30),
    provincia VARCHAR(30),
    nombre_proveedor VARCHAR(40),
    FOREIGN KEY (producto_id)
		REFERENCES productos(producto_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS clientes (
	id_cliente INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    direccion VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS venta (
	id_venta INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_factura INT NOT NULL,
    cantidad INT NOT NULL,
    precio_total INT
);

CREATE TABLE IF NOT EXISTS categorias (
	id_categorias INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    producto_id INT NOT NULL,
    nombre_categorias VARCHAR(30) NOT NULL,
     FOREIGN KEY (producto_id)
		REFERENCES productos(producto_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
    
);

CREATE TABLE IF NOT EXISTS factura (
	id_factura INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT NOT NULL,
    total_factura INT NOT NULL,
	FOREIGN KEY (id_cliente)
		REFERENCES clientes(id_cliente)
        ON DELETE CASCADE
        ON UPDATE CASCADE  
);

