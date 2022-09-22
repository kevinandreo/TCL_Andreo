CREATE DATABASE IF NOT EXISTS deposito_queso;

USE deposito_queso;

SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE IF NOT EXISTS productos (
		id_producto INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	nombre_producto VARCHAR(100) NOT NULL,
    precio_producto DECIMAL(65) NOT NULL,
    descrip_producto VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS proveedor (
		id_proveedor INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	nombre_proveedor VARCHAR(30),
	direct_proveedor VARCHAR(50),
	telef_proveedor VARCHAR(30)
    );

CREATE TABLE IF NOT EXISTS stock (
		id_stock INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	nombre_producto VARCHAR(50) NOT NULL,
    cantidad_producto INT NOT NULL,
    id_proveedor INT NOT NULL
   );
   
CREATE TABLE IF NOT EXISTS facturacion_mensual (
		id_facturacion INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	total_factura DECIMAL(65) NOT NULL,
    fecha_factura TIMESTAMP NOT NULL
				  DEFAULT CURRENT_TIMESTAMP
                  ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS secretaria (
	id_secretaria INT NOT NULL AUTO_INCREMENT,
    id_venta INT NOT NULL,
    id_envios INT NOT NULL,
    id_vendedor INT NOT NULL,
    id_producto INT NOT NULL,
        PRIMARY KEY (id_secretaria,id_venta,id_envios,id_vendedor),
    facturacion_venta VARCHAR(50) NOT NULL,
    atencionalcliente VARCHAR(50)NOT NULL,
    fecha_envio TIMESTAMP NOT NULL
				DEFAULT CURRENT_TIMESTAMP
                ON UPDATE CURRENT_TIMESTAMP,
	FOREIGN KEY (id_producto)
				REFERENCES productos(id_producto)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS empleados (
	id_empleado INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
    id_asistencia TINYINT NOT NULL DEFAULT 1,
    id_envios INT NOT NULL,
    id_vendedor INT NOT NULL,
    nombre_empleado VARCHAR (15) NOT NULL,
    documento VARCHAR(50)NOT NULL,
    limpieza VARCHAR(50),
    horario_laboral TIMESTAMP NOT NULL
					DEFAULT CURRENT_TIMESTAMP
                    ON UPDATE CURRENT_TIMESTAMP,
	mantenimiento VARCHAR(50)
);

ALTER TABLE empleados
  ADD FOREIGN KEY (id_envios)
				REFERENCES secretaria(id_secretaria)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
  ADD FOREIGN KEY (id_vendedor)
				REFERENCES secretaria(id_secretaria)
		ON DELETE CASCADE
        ON UPDATE CASCADE;

CREATE TABLE IF NOT EXISTS camion (
		id_camion INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	id_empleado INT NOT NULL,
    id_envios INT NOT NULL
);

ALTER TABLE camion
	ADD FOREIGN KEY (id_empleado)
				REFERENCES empleados(id_empleado)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	ADD FOREIGN	KEY (id_envios)
				REFERENCES empleados(id_empleado)
		ON DELETE CASCADE
        ON UPDATE CASCADE;
      
CREATE TABLE IF NOT EXISTS deposito (
		id_deposito INT NOT NULL UNIQUE AUTO_INCREMENT PRIMARY KEY,
	id_producto INT NOT NULL,
    id_empleado INT NOT NULL,
    id_venta INT NOT NULL,
    id_secretaria INT NOT NULL,
    id_proveedor INT NOT NULL,
    id_stock INT NOT NULL,
    id_facturacion INT NOT NULL,
    id_camion INT NOT NULL,
	direc_deposito VARCHAR(30) NOT NULL,
	cp VARCHAR(10),
    provincia VARCHAR(50) NOT NULL,
    telef_deposito VARCHAR(50) NOT NULL,
	FOREIGN KEY (id_producto)
				REFERENCES productos(id_producto)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (id_empleado)
				REFERENCES empleados(id_empleado)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (id_venta)
				REFERENCES secretaria(id_secretaria)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (id_secretaria)
				REFERENCES secretaria(id_secretaria)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (id_proveedor)
				REFERENCES proveedor(id_proveedor)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (id_stock)
				REFERENCES stock(id_stock)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY (id_facturacion)
				REFERENCES facturacion_mensual(id_facturacion)
		ON DELETE CASCADE
        ON UPDATE CASCADE,
	FOREIGN KEY(id_camion)
				REFERENCES camion(id_camion)
		ON DELETE CASCADE
        ON UPDATE CASCADE
);	