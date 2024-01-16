CREATE TABLE facturacion(
fecha DATE NULL,
venta_total FLOAT
);

DELIMITER //
CREATE TRIGGER tg_facturacion_insert
AFTER INSERT ON items
FOR EACH ROW BEGIN
	call sp_triggers;
END //

DELIMITER //
CREATE TRIGGER tg_facturacion_delete
AFTER DELETE ON items
FOR EACH ROW BEGIN
	call sp_triggers;
END //

DELIMITER //
CREATE TRIGGER tg_facturacion_update
AFTER UPDATE ON items
FOR EACH ROW BEGIN
	call sp_triggers;
END //