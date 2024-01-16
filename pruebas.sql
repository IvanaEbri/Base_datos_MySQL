select * from jugos_ventas.facturas;

select * from empresa_pf.facturas;
SELECT COUNT(*) FROM empresa_pf.facturas;

select * from empresa_pf.items;
select count(*) from empresa_pf.items;

SET foreign_key_checks = 0;

TRUNCATE TABLE empresa_pf.facturas;

SET foreign_key_checks = 1;


SET GLOBAL log_bin_trust_function_creators = 1;

select f_aleatorio(10,50);

select f_cliente_aleatorio();

select f_cliente_aleatorio() as cliente, f_producto_aleatorio() as producto,
f_vendedor_aleatorio() as vendedor;

select max(numero) from facturas;

select count(*) from facturas;

select numero from facturas order by numero desc limit 88000;

call sp_venta(20220619,15,100);

select * from facturas where fecha= 20220619;
select * from items where  numero in (87977, 87978, 87979, 87980, 87981, 87982, 87983);

select A.fecha, sum(B.cantidad * B.precio) as facturacion from facturas A
inner join items B on A.numero = B.numero where fecha = 20220619 group by A.fecha;

/*en esta momento si coincide numero y codigo en items se genera una duplicidad, esto se puede dar dentro del sp_venta*/

call sp_venta(20220619,30,100);

delete from items where numero in (87977, 87978, 87979, 87980, 87981, 87982, 87983);
delete from facturas where numero in (87977, 87978, 87979, 87980, 87981, 87982, 87983);

