CREATE DATABASE proyectoABD;

DROP DATABASE proyectoABD;

USE proyectoABD;

--creando tabla proveedor
CREATE TABLE proveedor(
	id_proveedor SMALLINT PRIMARY KEY IDENTITY,
	nombre VARCHAR(45) NOT NULL,
);

-- creando tabla empleado
CREATE TABLE empleado(
	id_empleado INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(45) NOT NULL,
	fecha_entrada DATE NOT NULL,
	id_supervisor INT NULL
);

AlTER TABLE empleado ADD CONSTRAINT fk_supervidor FOREIGN KEY (id_supervisor) REFERENCES empleado(id_empleado);

-- creando tabla catalogo categoria
CREATE TABLE categoria(
	id_categoria INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(45) NOT NULL
);

-- creando tabla marca
CREATE TABLE marca(
	id_marca INT PRIMARY KEY IDENTITY,
	nombreMarca VARCHAR(45) NOT NULL
);

-- creando tabla producto
CREATE TABLE producto(
	id_producto INT PRIMARY KEY IDENTITY,
	nombre VARCHAR(45),
	fk_id_marca INT NOT NULL,
	fk_id_categoria INT NOT NULL,
	precio SMALLINT NOT NULL,
	stock SMALLINT NOT NULL
);

--Agregando llaves foraneas a tabla producto
ALTER TABLE producto ADD CONSTRAINT fk_from_categoria FOREIGN KEY (fk_id_categoria) REFERENCES categoria(id_categoria);
ALTER TABLE producto ADD CONSTRAINT fk_from_marca FOREIGN KEY (fk_id_marca) REFERENCES marca(id_marca);

-- creando tabla venta
CREATE TABLE venta(
	id_venta INT PRIMARY KEY IDENTITY,
	fk_id_empleado INT NOT NULL
);

--Agregando llave foranea a tabla venta
ALTER TABLE venta ADD CONSTRAINT fk_from_empleado FOREIGN KEY (fk_id_empleado) REFERENCES empleado(id_empleado);

--Creando tabla de la relacion producto venta
CREATE TABLE prodxventa(
	pkfk_id_producto INT NOT NULL,
	pkfk_id_venta INT NOT NULL,
	cant INT
);

-- Aregando llaves foraneas a la tabla relacion producto venta
ALTER TABLE prodxventa ADD CONSTRAINT fk_from_producto FOREIGN KEY (pkfk_id_producto) REFERENCES producto(id_producto);
ALTER TABLE prodxventa ADD CONSTRAINT fk_from_venta FOREIGN KEY (pkfk_id_venta) REFERENCES venta(id_venta);

-- Agregando llave primaria a la tabla relacion producto venta
ALTER TABLE prodxventa ADD PRIMARY KEY (pkfk_id_producto,pkfk_id_venta);

--Creando tabla que relaciona proveedor y producto
CREATE TABLE prodxproveedor(
	pkfk_id_producto INT NOT NULL,
	pkfk_id_proveedor SMALLINT NOT NULL
);

--Agregando llave primaria a la tabla que relaciona producto y venta
ALTER TABLE prodxproveedor ADD PRIMARY KEY(pkfk_id_producto,pkfk_id_proveedor);

-- Agregando llaves foraneas a la tabla que relaciona producto y venta
ALTER TABLE prodxproveedor ADD CONSTRAINT fk_from_producto2 FOREIGN KEY (pkfk_id_producto) REFERENCES producto(id_producto);
ALTER TABLE prodxproveedor ADD CONSTRAINT fk_from_proveedor FOREIGN KEY (pkfk_id_proveedor) REFERENCES proveedor(id_proveedor);

INSERT INTO categoria(nombre) VALUES('Juguetes');
INSERT INTO categoria(nombre) VALUES('Jardin');
INSERT INTO categoria(nombre) VALUES('Ocio');
INSERT INTO categoria(nombre) VALUES('Articulos Personales');
INSERT INTO categoria(nombre) VALUES('Productos Congelados');
INSERT INTO categoria(nombre) VALUES('Utiles escolares');
INSERT INTO categoria(nombre) VALUES('Productos de cocina');
INSERT INTO categoria(nombre) VALUES('Productos Decorativos');

INSERT INTO marca(nombreMarca) VALUES ('Hershey');
INSERT INTO marca(nombreMarca) VALUES ('Lays');
INSERT INTO marca(nombreMarca) VALUES ('JS Gardens');
INSERT INTO marca(nombreMArca) VALUES ('GardenHills');
INSERT INTO marca(nombreMarca) VALUES('Brain Agility');
INSERT INTO marca(nombreMarca) VALUES ('GrandmasKitchen');
INSERT INTO marca(nombreMarca) VALUES ('Colgate');
INSERT INTO marca(nombreMarca) VALUES ('Oral-B');
INSERT INTO marca(nombreMarca) VALUES ('Moyu');
INSERT INTO marca(nombreMarca) VALUES ('Sheng-shou');
INSERT INTO marca(nombreMarca) VALUES ('Martin Congelados');
INSERT INTO marca(nombreMarca) VALUES ('Scribe');
INSERT INTO marca(nombreMarca) VALUES ('Stanley');
INSERT INTO marca(nombreMarca) VALUES ('Head&Shouders');

INSERT INTO empleado(nombre,fecha_entrada,id_supervisor) VALUES ('Juan Martinez','2018-08-21',null);
INSERT INTO empleado(nombre,fecha_entrada,id_supervisor) VALUES ('Raul Granados', '2017-12-20',1);
INSERT INTO empleado(nombre,fecha_entrada,id_supervisor) VALUES ('Daniel Dominguez','2018-02-24',1);
INSERT INTO empleado(nombre,fecha_entrada,id_supervisor) VALUES ('Astrid Guzman','2017-02-10',1);
INSERT INTO empleado(nombre,fecha_entrada,id_supervisor) VALUES ('Jorge Miranda','2018-05-04',1);
INSERT INTO empleado(nombre,fecha_entrada,id_supervisor) VALUES('Josue Gonzales','2018-05-20',1);

INSERT INTO venta(fk_id_empleado) VALUES (2);
INSERT INTO venta(fk_id_empleado) VALUES (3);
INSERT INTO venta(fk_id_empleado) VALUES (1);
INSERT INTO venta(fk_id_empleado) VALUES (6);
INSERT INTO venta(fk_id_empleado) VALUES (5);
INSERT INTO venta(fk_id_empleado) VALUES (2);
INSERT INTO venta(fk_id_empleado) VALUES (3);
INSERT INTO venta(fk_id_empleado) VALUES (4);
INSERT INTO venta(fk_id_empleado) VALUES (2);



INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Pistola de agua',8,1,2,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Cubo rubik 3x3',8,1,1,10);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Cubo Rubik4x4',8,1,1.75,5);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Cubo Rubik5x5',8,1,2.25,2);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Rompecabezas Sirenita',7,1,2,10);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Rompezabezas toy story',7,1,2,10);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Barbie',7,1,1.5,10);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Max-steel',7,1,2,10);

INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Rastrillo Grande',3,2,5,5);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Rastrillo pequeno',3,2,1.25,10);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Pala pequena',3,2,1.25,10);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Pala Grande',3,2,5,10);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Abono',4,2,4,10);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Abono',3,2,4,10);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Manguera 6 metros',4,2,7,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Maceta pequena',4,2,2.5,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Maceta mediana',3,2,5,7);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Maceta grande',4,2,7,5);

INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Sudoku',5,3,1,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Sopas de letras',5,3,1,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Libro colorear princesa',5,3,1,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Libro colorear carros',5,3,1,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Libro de crucigramas',5,3,1,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Libro de Harry Potter 1',5,3,1,30);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Libro de Harry Potter 2',5,3,1,30);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Libro de Harry Potter 3',5,3,1,30);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Libro de Harry Potter 4',5,3,1,30);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Libro de Harry Potter 5',5,3,1,30);

INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Cepillo de dientes',8,4,1,25);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Paquete 2 cepillos de dientes',8,4,1.75,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Pasta dental pequenia',7,4,0.80,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Pasta dental pequenia',8,4,0.75,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('PAsta dental mediana',7,4,1.50,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Pasta dental grande',7,4,2.50,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Pasta dental pequenia',8,4,2.50,15);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Peine',8,4,1.75,10);


INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Carne congelada',10,5,10.23,20);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Chorizo congelado',11,5,5.35,20);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Salsa de frijoles congelada',11,5,10.45,20);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Helado de vainilla',10,5,1.75,20);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Jamon de pavo',11,5,2.5,20);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Jamon de pollo',11,5,4.50,20);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Jamon de pavo',9,5,11.50,20);

INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Paleta de Fresa',11,6,1,20);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Paleta de chocolate',11,6,1,20);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Paleta napolitana',11,6,1,20);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Paleta de vainilla',11,6,1,20);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Sorbete de vainilla',11,6,1.5,20);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Sorbete de Fresa',11,6,1.50,20);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Paleta de chocolate',11,6,1.50,20);

INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Batidora descheable',6,7,3.25,30);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Juego de vajilla',11,7,5.85,30);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Centro de mesa',9,7,13.65,30);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Salero y pimentero',6,7,9.85,30);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Juego para el te',6,7,12.5,30);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Manteles',9,7,15.20,30);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('Aderezos varios',11,7,10.50,30);

INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('duende de jardin',13,8,3.25,40);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('alfombra de bienvenida',4,8,5.85,40);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('guente decorativa de jardin',4,7,3.65,40);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('luces de navidad',4,8,9.85,40);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('marco para fotografia',13,8,2.5,40);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('cortinas',13,8,5.20,40);
INSERT INTO producto(nombre,fk_id_marca,fk_id_categoria,precio,stock) VALUES ('tobogan para jardin',4,8,1.50,40);

insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (13, 6, 10);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (30, 4, 13);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (37, 7, 3);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (34, 3, 4);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (2, 1, 15);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (38, 1, 13);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (30, 9, 8);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (12, 9, 9);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (11, 1, 11);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (11, 4, 12);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (35, 4, 8);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (7, 6, 9);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (3, 3, 13);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (11, 9, 6);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (22, 2, 3);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (23, 5, 9);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (6, 3, 11);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (6, 8, 12);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (31, 6, 1);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (25, 2, 8);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (21, 4, 4);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (4, 1, 5);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (5, 8, 9);
insert into prodxventa (pkfk_id_producto, pkfk_id_venta, cant) values (17, 1, 3);


SELECT * from categoria;

--Creando procesos almacenados 

CREATE PROCEDURE spEmpleados
AS
SELECT * FROM empleado
GO

EXECUTE spEmpleados;

CREATE PROCEDURE spTopVentas
AS 
SELECT TOP 3 
e.nombre, e.fecha_entrada, count(v.id_venta) as 'numeroDeVentas' FROM
empleado e JOIN venta v
ON e.id_empleado = v.fk_id_empleado
GROUP BY e.nombre, e.fecha_entrada
ORDER BY numeroDeVentas DESC
GO

EXECUTE spTopVentas;

--Creando vistas
CREATE VIEW vwVentaEmpleados AS
SELECT e.id_empleado ,e.nombre, v.id_venta FROM 
empleado e JOIN venta v
ON e.id_empleado = v.fk_id_empleado;

SELECT * FROM vwVentaEmpleados;

CREATE VIEW vwProductosVendidos AS
SELECT p.nombre, p.precio, sum(pv.cant) as 'cantidadVendida' FROM 
prodxventa pv JOIN producto p
ON pv.pkfk_id_producto = p.id_producto
GROUP BY p.nombre, p.precio;

SELECT * FROM vwProductosVendidos

--tablas de auditoria 
CREATE TABLE ventaAudit(
	id_venta INT,
	id_empleado INT,
);

--Creando triggers

CREATE TRIGGER tgVenta
ON venta
for insert  
AS 
begin 
INSERT INTO ventaAudit (id_venta, id_empleado)
SELECT * FROM INSERTED 
END


CREATE TRIGGER tgVentaDelete
ON venta 
for delete 
AS 
begin 
print 'no se puede borrar'
rollback transaction 
END 

CREATE TRIGGER tgProducDelete
ON producto 
for delete 
AS 
begin 
print 'no se puede borrar'
rollback transaction 
END
