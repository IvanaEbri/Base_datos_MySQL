alter table items drop foreign key items_ibfk_1;

alter table facturas modify numero int;
alter table items modify numero int;

alter table items add CONSTRAINT items_ibfk_1 foreign key (numero) references facturas(numero);