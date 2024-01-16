DELIMITER &&
CREATE FUNCTION f_aleatorio (min INT, max INT)
RETURNS INTEGER
BEGIN
DECLARE vresultado INT;
SELECT FLOOR(RAND()*(max-min+1)+min) INTO vresultado;
RETURN vresultado;
END &&
DELIMITER ;

delimiter $$
create function f_cliente_aleatorio ()
returns varchar(11)
begin
declare vresultado varchar(11);
declare vmax int;
declare valeatorio int;
select count(*) into vmax from clientes;
set valeatorio = f_aleatorio(1,vmax);
set valeatorio = valeatorio-1;
select DNI into vresultado from clientes limit valeatorio,1;
return vresultado;
end$$
delimiter ;

delimiter $$
create function f_producto_aleatorio ()
returns varchar(10)
begin
declare vresultado varchar(10);
declare vmax int;
declare valeatorio int;
select count(*) into vmax from productos;
set valeatorio = f_aleatorio(1,vmax);
set valeatorio = valeatorio-1;
select codigo into vresultado from productos limit valeatorio,1;
return vresultado;
end$$
delimiter ;

delimiter $$
create function f_vendedor_aleatorio ()
returns varchar(5)
begin
declare vresultado varchar(5);
declare vmax int;
declare valeatorio int;
select count(*) into vmax from vendedores;
set valeatorio = f_aleatorio(1,vmax);
set valeatorio = valeatorio-1;
select matricula into vresultado from vendedores limit valeatorio,1;
return vresultado;
end$$
delimiter ;