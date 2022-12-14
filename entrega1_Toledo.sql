

use Almacen;
CREATE TABLE IF NOT EXISTS productos(
	producto_id INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    nombre_producto VARCHAR (40) NOT NULL,
    precio VARCHAR(20) NOT NULL,
    stock INT NOT NULL,
    codigo_balanza INT (10)
);

CREATE TABLE IF NOT EXISTS proveedores (
	proveedor_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    direccion VARCHAR(50) NOT NULL,
    numero_telefono VARCHAR(30),
    ciudad VARCHAR(30),
    calle VARCHAR(30),
    provincia VARCHAR(30),
    nombre_proveedor VARCHAR(40),
    producto_id INT NOT NULL,
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
    nombre_categorias VARCHAR(30) NOT NULL,
    producto_id INT NOT NULL,
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

/*AGREGANDO COLUMNAS*/

ALTER TABLE productos ADD n_proveedor VARCHAR(40);

/*AGREGANDO COLUMNAS*/

/* INSERTANDO DATOS */
/*Hay datos comentados porque al querer insertar nuevos me tira duplicate entry*/
USE almacen;
insert into productos (producto_id,nombre_producto,precio,stock,codigo_balanza,n_proveedor) values 
('100','GRAN CORTE BLEND LOS HAROLDOS X 750 CC  ','2450','3','0','ROUZIES'),
('101','LOS HAROLDOS ESTATE X 750 CC','1050','15','0','ROUZIES'),
('102','LOS HAROLDOS RESERVA X 750 CC ','980','8','0','ROUZIES'),
('103','NAMPE MALBEC x 750 CC','2450','3','0','ROUZIES'),
('104','CHACABUCO CHENIN BLANCO DULCE 750CC','2450','3','0','ROUZIES');

/*('1','MATAMBRE DE CARNE','2650','10','310','FIAMBRES VAES'),
('2','ARROLLADO DE POLLO','2050','6','311','FIAMBRES VAES'),
('3','DONDIOLA','2516','22','331','FIAMBRES VAES'),
('4','CANTINPALO','1616','15','324','FIAMBRES VAES'),
('5','CHORIZO CANDELARIO','1717','10','322','FIAMBRES VAES'),
('6','JAMON CRUDO RECTANGULAR','3367','3','335','FIAMBRES VAES'),
('7','JAMON COCIDO CLASICO RECTANGULAR','1400','12','300','FIAMBRES VAES'),
('8','JAMON COCIDO CON CUERO BOLON','1400','8','330','FIAMBRES VAES'),
('9','JAMON COCIDO NATURAL','1890','5','301','FIAMBRES VAES'),
('10','JAMON CRUDO ESPECIAL','2942','7','302','FIAMBRES VAES'),
('11','JAMON CRUDO OFERTA','2500','1','304','FIAMBRES VAES'),
('12','JAMON CRUDO SERRANO','2942','6','303','FIAMBRES VAES'),
('13','LOMO A LAS HIERBAS','1705','3','327','FIAMBRES VAES'),
('14','LONGANIZA CALABREZA CORTA','1717','1','333','FIAMBRES VAES'),
('15','LONGANIZA','1717','2','334','FIAMBRES VAES'),
('16','LONGANIZA CALABREZA BASTON','1717','2','309','FIAMBRES VAES'),
('17','PEPERONI','1717','5','342','FIAMBRES VAES'),
('18','MORTADELA','1198','2','312','FIAMBRES VAES'),
('19','MORTADELA CON PISTACHO','1342','2','329','FIAMBRES VAES'),
('20','PALETA CASAPUEBLO','1031','7','343','FIAMBRES VAES'),
('21','PALETA ESPECIAL','980','4','314','FIAMBRES VAES'),
('22','PANCETA AHUMADA','1515','8','315','FIAMBRES VAES'),
('23','PANCETA SALADA','2150','1','317','FIAMBRES VAES'),
('24','SALAME MILAN','1487','2','323','FIAMBRES VAES'),
('25','SALAMINES','1717','4','321','FIAMBRES VAES'),
('26','BRIE','2076','2','222','FERMIER'),
('27','CAMEMBERT','641','4','280','FERMIER'),
('28','CRIOLLO','1315','2','229','FERMIER'),
('29','CRIOLLO AHUMADO','1496','1','231','FERMIER'),
('30','CRIOLLO CON HIERBAS','1397','3','230','FERMIER'),
('31','DAMBO','1460','1','232','FERMIER');*/


insert into proveedores (proveedor_id,direccion,numero_telefono,ciudad,calle,provincia,nombre_proveedor,producto_id) values 
/*('11','TAPALQUE 5926','+541146351262','PARQUE AVELLANEDA','TAPALQUE','BUENOS AIRES','FIAMBRES VAES','1'),*/
('2','KM 5 118','+541146351262','PROVINCIA DE BUENOS AIRES','RUTA NACIONAL','BUENOS AIRES','FERMIER','2'),
('3','181','+540294311879','BARILOCHE','OTTO MAILING','RIO NEGRO','FAMILIA ROUZIES DISTRUBUIDORA','3');

insert into categorias_rubros (id_categorias,nombre_categorias,producto_id) values 
/*('125','FIAMBRES','1'),
('124','FIAMBRES','2'),
('123','FIAMBRES','3'),
('122','FIAMBRES','4'),
('121','FIAMBRES','5'),
('120','FIAMBRES','6'),
('119','FIAMBRES','7'),
('118','FIAMBRES','8'),
('117','FIAMBRES','9'),
('116','FIAMBRES','10'),
('115','FIAMBRES','11'),
('114','FIAMBRES','12'),
('113','FIAMBRES','13'),
('112','FIAMBRES','14'),
('111','FIAMBRES','15'),
('110','FIAMBRES','16'),
('109','FIAMBRES','17'),
('108','FIAMBRES','18'),
('107','FIAMBRES','19'),
('106','FIAMBRES','20'),
('105','FIAMBRES','21'),
('104','FIAMBRES','22'),
('103','FIAMBRES','23'),
('102','FIAMBRES','24'),
('101','FIAMBRES','25'),*/
('126','QUESOS','26'),
('127','QUESOS','27'),
('128','QUESOS','28'),
('129','QUESOS','29'),
('130','QUESOS','30'),
('131','QUESOS','31'),
('132','BEBIDAS','100'),
('133','BEBIDAS','101'),
('134','BEBIDAS','102'),
('135','BEBIDAS','103'),
('136','BEBIDAS','104');


/* FIN DE INSERTS */



/*SECTOR PARA SELECT TESTS*/
use almacen;
SELECT * FROM productos;
SELECT * FROM proveedores;
select * from categorias_rubros;
/*SECTOR PARA SELECT TESTS*/

-- CREANDO VIEWS --

CREATE OR REPLACE VIEW v_productos_precios AS 
(SELECT nombre_producto, precio
FROM productos
ORDER BY nombre_producto DESC);

select * from v_productos_precios;

CREATE OR REPLACE VIEW v_ubicacion_de_proveedores AS 
(SELECT direccion, ciudad, calle, provincia, nombre_proveedor
FROM proveedores
);

select * from v_ubicacion_de_proveedores;

CREATE OR REPLACE VIEW v_rubros_fiambres AS
(SELECT nombre_categorias, producto_id
from categorias_rubros);

select * from v_rubros_fiambres;










