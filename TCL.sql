USE deposito_queso;
-- Iniciamos una transaccion
START TRANSACTION;
-- Insertamos en la tabla productos un nuevo queso
INSERT INTO productos (id_producto, nombre_producto, precio_producto, descrip_producto)
VALUES
	(20, 'Queso Azul', 742, 'Es un queso de origen francés que se elabora con leche de oveja')
;
-- Hacemos un punto de guardado	
SAVEPOINT save_1;
-- Eliminamos  el producto
    DELETE FROM productos
	WHERE id_producto = 20;
-- Deshacemos al punto de guardado save_1    
ROLLBACK TO save_1;
-- Comprobamos en action output el savepoint y el rollback
SELECT * FROM productos;

-- Creamos una segunda transaccion
START TRANSACTION;
-- Insertarmos en la tabla productos mas quesos
INSERT INTO productos (id_producto, nombre_producto, precio_producto, descrip_producto)
VALUES
		(21, 'Mozarella en Barra', 590, 'Es un queso de consistencia semidura, de textura fibrosa, elástica y cerrada'),
	(22, 'Queso Cheddar', 250, 'Es un queso duro prensado, de forma cilíndrica o bloque'),
	(23, 'Queso Feta', 800, 'El queso Feta es un queso fresco elaborado en salmuera'),
	(24, 'Queso Provolone', 400, 'El provolone es queso semi-duro');
    -- Hacemos un punto de guardado desde el 21 a 24
    SAVEPOINT save_2;
INSERT INTO productos (id_producto, nombre_producto, precio_producto, descrip_producto)
VALUES
		(25, 'Queso Port Salut', 150, 'El Port Salut es un queso semiblando de leche de vaca pasteurizada'),
    (26, 'Queso Gruyere', 300, 'El gruyere es un queso suizo que recibe su nombre de Gruyere'),
    (27, 'Queso brie', 690, 'Queso de origen frances fabricado con leche de vaca fermentada'),
    (28, 'Queso Burrata', 710, 'La burrata es un queso fresco que se elabora con pasta hilada y nata');
    -- Hacemos un punto de guardado desde el 25 a 28
    SAVEPOINT save_3;
-- Comprobamos en action output si estan los savepoint
SELECT * FROM productos;

    
    
    
    