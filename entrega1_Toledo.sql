
create database if not exists Almacen;

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

CREATE TABLE IF NOT EXISTS categorias_rubros (
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

/* INSERTANDO DATOS */
USE almacen;
insert into productos (producto_id,nombre_producto,precio,stock,codigo_balanza) values 
('2','ARROLLADO DE POLLO','2600','12','311'),
('3','DONDIOLA','3221','6','331'),
('4','CANTINPALO','2080','2','324');
insert into proveedores (proveedor_id,producto_id,direccion,numero_telefono,ciudad,calle,provincia,nombre_proveedor) values 
('11','1','TAPALQUE 5926','+541146351262','PARQUE AVELLANEDA','TAPALQUE','BUENOS AIRES','FIAMBRES VAES');

select * from proveedores;

/*('2','AV BUSTILLO 12536','PENDIENTE','San Carlos de Bariloche','Rio Negro','BEBIDAS DEL LAGO SA',),
('3','RUTA.NAC.40','PENDIENTE','San Carlos de Bariloche','Rio Negro','AUTOSERVICIO MAYORISTA DIARCO',),
('4','MARIANO MORENO 5700','PENDIENTE','San Carlos de Bariloche','Rio Negro','IFG SRL',),
('5','MARTIN IRIGOYEN 1217','PENDIENTE','San Carlos de Bariloche','Rio Negro','TRES REYES',);*/










