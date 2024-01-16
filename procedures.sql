delimiter $$
create procedure sp_venta (fecha date, maxitems int, maxcantidad int)
begin
declare vcliente varchar(11);
declare vproducto varchar (10);
declare vvendedor varchar(5);
declare vcantidad int;
declare vprecio float;
declare vitems int;
declare vnfactura int;
declare vcontador int default 1;
declare vnumitems int;

select max(numero)+1 into vnfactura from facturas;
set vcliente = f_cliente_aleatorio();
set vvendedor = f_vendedor_aleatorio();

insert into facturas(numero,fecha, DNI, matricula, impuesto) values 
(vnfactura, fecha, vcliente, vvendedor, 0.16);

set vitems = f_aleatorio(1, maxitems);
while vcontador <= vitems
do
set vproducto = f_producto_aleatorio();

select count(*) into vnumitems from items
where codigo = vproducto and numero= vnfactura;
if vnumitems = 0 then
	set vcantidad = f_aleatorio(1, maxcantidad);
	select precio into vprecio from productos where codigo=vproducto;
	insert into items (numero, codigo, cantidad, precio) values
	(vnfactura, vproducto, vcantidad, vprecio);
	set vcontador = vcontador +1;
end if;
end while;

end$$
delimiter ;


delimiter $$
create procedure sp_triggers()
begin
DELETE FROM facturacion;
INSERT INTO facturacion
SELECT A.fecha, SUM(B.cantidad * B.precio) AS venta_total
FROM facturas A
INNER JOIN items B ON A.numero = B.numero GROUP BY A.fecha;
end$$
delimiter ;