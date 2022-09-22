USE deposito_queso;

INSERT INTO productos (id_producto, nombre_producto, precio_producto, descrip_producto)
VALUES
		(1, 'Provoleta Horma Tradicional', 955, 'Provoleta Tradicional'),
	(2, 'Provoleta Horma Tradicional Ahumada', 1059, 'Provoleta Tradicional Ahumada'),
    (3, 'Provoleta Horma Mediana', 955, 'Provoleta Mediana'),
    (4, 'Provoleta Horma Mini', 979, 'Provoleta Mini'),
    (5, 'Provoleta Fraccionado', 650, 'Provoleta envasada'),
    (6, 'Sardo', 829, 'Sardo Fresco 30 dias'),
    (7, 'Sardo Semi Estacionado', 995, 'Sardo Semi Estacionado mas de 30 dias'),
    (8, 'Sardo Fraccionado', 1020, 'Sardo envasado'),
    (9, 'Reggianito', 829, 'Reggianito fresco'),
    (10, 'Reggianito Semi Estacionado', 995, 'Regiannito Semi Estacionado mas de 30 dias'),
    (11, 'Reggianito Fraccionado', 1020, 'Reggianito envasado'),
    (12, 'Queso cremoso', 565, 'Queso cremoso'),
    (13, 'Queso de campo hilado pimienta negra', 1059, 'Queso de campo hilado pimienta negra'),
    (14, 'Queso de campo hilado aji', 1059, 'Queso de campo hilado aji'),
    (15, 'Queso de campo hilado natural ahumado', 1059, 'Queso de campo hilado natural ahumado'),
    (16, 'Queso de campo hilado chimichurri', 1059, 'Queso de campo hilado chimichurri'),
    (17, 'Queso de campo hilado finas hierbas', 1059, 'Queso de campo hilado finas hierbas'),
    (18, 'Queso de campo hilado pimenton ahumado', 1059, 'Queso de campo hilado pimenton ahumado'),
    (19, 'Caja MIX (4 unid de c/sabor)', 1059, 'Caja MIX de diferentes tipos de queso de campo hilado')
    ;
    
iNSERT INTO proveedor (id_proveedor, nombre_proveedor, direct_proveedor, telef_proveedor)
VALUES
		(1, 'Nonna Pia', 'Tucuman 1223', 34-385-7364)
;

INSERT INTO stock (id_stock, nombre_producto, cantidad_producto, id_proveedor)
VALUES
		(31, 'Provoleta Horma Tradicional', 100, 1),
	(32, 'Provoleta Horma Tradicional Ahumada', 50, 1),
    (33, 'Provoleta Horma Mediana', 49, 1),
    (34, 'Provoleta Horma Mini', 34, 1),
    (35, 'Provoleta Fraccionado', 46, 1),
    (36, 'Sardo', 67, 1),
    (37, 'Sardo Semi Estacionado', 150, 1),
    (38, 'Sardo Fraccionado', 102, 1),
    (39, 'Reggianito', 29, 1),
    (40, 'Reggianito Semi Estacionado', 95, 1),
    (41, 'Reggianito Fraccionado', 27, 1),
    (42, 'Queso cremoso', 95, 1),
    (43, 'Queso de campo hilado pimienta negra', 59, 1),
    (44, 'Queso de campo hilado aji', 104, 1),
    (45, 'Queso de campo hilado natural ahumado', 159, 1),
    (46, 'Queso de campo hilado chimichurri', 89, 1),
    (47, 'Queso de campo hilado finas hierbas', 99, 1),
    (48, 'Queso de campo hilado pimenton ahumado', 88, 1),
    (49, 'Caja MIX (4 unid de c/sabor)', 200, 1)
    ;

INSERT INTO facturacion_mensual (id_facturacion, total_factura, fecha_factura)
VALUES
		(55, 8600, CURRENT_TIME())
;
INSERT INTO secretaria (id_secretaria, id_venta, id_envios, id_vendedor, id_producto, facturacion_venta, atencionalcliente, fecha_envio)
VALUES
		(65, 10, 43, 45, 15, 'total de 1059', 'llamar al 4769-8375', CURRENT_TIME()),
	(31, 9, 14, 2, 7, 'total de 995', 'llamar al 4769-8375', CURRENT_TIME()),
	(31, 31, 22, 3, 4, 'total de 995', 'llamar al 4769-8375', CURRENT_TIME()),
    (34, 76, 85, 12, 89, 'total de 995', 'llamar al 4769-8375', CURRENT_TIME()),
    (89, 11, 32, 53, 14, 'total de 979', 'llamar al 4769-8375', CURRENT_TIME())
;

INSERT INTO empleados (id_empleado, id_asistencia, id_envios, id_vendedor, nombre_empleado, documento, limpieza, horario_laboral, mantenimiento)
VALUES
		(88, 1, 43, 45, 'Carlos Herrera', 'Cedula de identidad', 'Limpieza semanal', CURRENT_TIME(), 'Mantenimiento mensual'),
        (12, 1, 14, 77, 'Santiago', 'Documento de identidad', 'Limpieza semanal', CURRENT_TIME(), 'Mantenimento mensual'),
        (23, 1, 22, 55, 'Luis', 'Documento de identidad', 'Limpieza semanal', CURRENT_TIME(), 'Mantenimiento mensual'),
        (45, 1, 1, 12, 'Hernan', 'Documento de identidad', 'Limpieza semanal', CURRENT_TIME(), 'Mantenimiento mensual'),
        (57, 0, 5, 45, 'Jose luis', 'Documento de identidad', 'Falto', CURRENT_TIME(), 'Mantenimeinto mensual')
;

INSERT INTO camion (id_camion, id_empleado, id_envios)
VALUES
		(98, 23, 90),
        (12, 24, 45),
        (21, 27, 11)
;

INSERT INTO deposito (id_deposito, id_producto, id_empleado, id_venta, id_secretaria, id_proveedor, id_stock,  id_facturacion, id_camion, direc_deposito, cp, provincia, telef_deposito)
VALUES
		(100, 13, 56, 88, 31, 1, 48, 66, 98, 'Av Medrano 7459', 10022, 'Provincia de Bs As', '4759-8777')
;

SET FOREIGN_KEY_CHECKS=1;