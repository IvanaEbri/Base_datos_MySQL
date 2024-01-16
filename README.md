# Base de Datos MySQL - Tienda de Jugos y Bebidas

Este proyecto consiste en una serie de prácticas relacionadas con la creación de una base de datos en MySQL para una tienda de venta de jugos y bebidas. Durante las mismas puse en práctica la creacion de la base de datos, inserción de registros, definición de funciones, almacenamiento de procedimientos y configuración de desencadenadores.

## Contenido

1. [Introducción](#introducción)
    - [Objetivo del Proyecto](#objetivo-del-proyecto)
    - [Temas Explorados](#temas-explorados)
2. [Estructura de la Base de Datos](#estructura-de-la-base-de-datos)
    - [Tablas Principales](#tablas-principales)
    - [Relaciones y Claves Extranjeras](#relaciones-y-claves-extranjeras)
3. [Archivos SQL](#archivos-sql)
   - [create_db.sql](#create_dbsql)
   - [insersion_datos.sql](#insersion_datossql)
   - [alter_table.sql](#alter_tablesql)
   - [functions.sql](#functionssql)
   - [procedures.sql](#proceduressql)
   - [triggers.sql](#triggerssql)
   - [pruebas.sql](#pruebasql)



## Introducción

¡Bienvenido a mi proyecto de prácticas de creación de base de datos con MySQL para una tienda de jugos y bebidas! En este proyecto, estoy trabajando en el diseño y desarrollo de una base de datos que simula la gestión de una tienda ficticia especializada en la venta de jugos y bebidas.

### Objetivo del Proyecto

El propósito principal de este proyecto es adquirir experiencia práctica en la creación y administración de bases de datos utilizando MySQL. A lo largo de estas prácticas, estoy explorando diversos aspectos, desde la creación de tablas iniciales hasta la implementación de funciones, stored procedures y triggers para optimizar la gestión de datos en la tienda.

### Temas Explorados

1. **Creación de la Base de Datos:** He diseñado la estructura inicial de la base de datos, estableciendo las relaciones entre las tablas necesarias para almacenar la información relevante para la tienda.

2. **Inserción de Registros:** Exploro diferentes métodos para insertar datos, ya sea mediante inserciones directas o la importación de datos desde otra base de datos.

3. **Funciones y Procedimientos:** Estoy creando funciones personalizadas para randomizar la inserción de registros y stored procedures para realizar operaciones específicas de manera eficiente.

4. **Triggers:** Implemento triggers para gestionar eventos específicos, centrándome en la actualización automática de una tabla que registra la facturación diaria en respuesta a cambios en la tabla de items vendidos.

## Estructura de la Base de Datos

En esta sección, proporcionaré una descripción detallada de la estructura de la base de datos, incluyendo las principales tablas y su propósito.

### Tablas Principales

#### `clientes`

Esta tabla almacena toda la información relevante sobre los clientes de la tienda de jugos y bebidas. Incluye campos como nombre, dirección, número de teléfono y cualquier otro dato identificativo necesario.

#### `vendedores`

La tabla de `vendedores` contiene información sobre los empleados que realizan las ventas en la tienda. Puede incluir campos como nombre, código de vendedor y detalles de contacto.

#### `facturas`

La tabla `facturas` es esencial para el registro de las transacciones. Contiene información sobre el número de factura, la fecha en que se emitió, los detalles del comprador y vendedor, así como el impuesto correspondiente a la transacción.

#### `items`

Esta tabla detalla los productos individuales vendidos en cada factura. Incluye el número de factura, el código de producto, la cantidad vendida y el precio unitario. Se implementan triggers asociados para mantener actualizada la tabla de facturación cuando se realizan cambios en la tabla de items.

#### `productos`

La tabla `productos` almacena información detallada sobre cada producto disponible en la tienda. Incluye campos como el código del producto, precio actual, sabor, tamaño y tipo de envase.

#### `facturacion`

La tabla `facturacion` es una tabla agregada que registra la facturación diaria total. Puede contener información como la fecha, el total de ventas y cualquier otro dato relevante para evaluar el rendimiento diario.

### Relaciones y Claves Extranjeras

#### `facturas`

La tabla `facturas` establece relaciones con otras tablas mediante el uso de claves foráneas. Sus claves foráneas son:

- **Cliente (DNI):** La clave foránea `dni_cliente` está vinculada al campo DNI (Documento Nacional de Identidad) en la tabla `clientes`. Esto permite asociar cada factura con un cliente específico.

- **Vendedor (Matrícula):** La clave foránea `matricula_vendedor` está vinculada al campo Matrícula en la tabla `vendedores`. Esto facilita la identificación del vendedor que realizó cada transacción.

Estas claves foráneas aseguran que cada factura esté asociada a un cliente específico y al vendedor correspondiente.

#### `items`

En la tabla `items`, las claves foráneas también actúan como claves primarias. Las claves foráneas son:

- **Número de Factura:** La clave foránea `numero_factura` está vinculada al campo correspondiente en la tabla `facturas`. Esto establece una relación directa entre los productos vendidos y la factura a la que están asociados.

- **Código de Producto:** La clave foránea `codigo_producto` está vinculada al campo correspondiente en la tabla `productos`. Esto asegura que cada item esté asociado a un producto específico en el inventario de la tienda.

Estas claves foráneas en la tabla `items` garantizan la integridad referencial, permitiendo rastrear cada producto vendido hasta la factura asociada y el producto específico en el inventario.

### Triggers

En la tabla `items`, se han implementado triggers para garantizar que la tabla de facturación se actualice automáticamente cuando se realicen modificaciones en la tabla de items. Estos triggers son cruciales para mantener la integridad y coherencia de los datos en la base de datos.

Con esta estructura, se busca una gestión eficiente de la información relacionada con clientes, vendedores, facturas, productos y facturación diaria en la tienda de jugos y bebidas.

## Archivos SQL

### create_db.sql

Contiene los comandos para la creación de las tablas iniciales.

### insersion_datos.sql

Incluye la inserción de registros en la tabla, con insersión directa y exportación desde otra base de datos.

### alter_table.sql

Contiene las alteraciones en el tipo de datos de dos tablas para mejorar el manejo de la información.

### functions.sql

Creación de funciones para randomizar la inserción de registros.

### procedures.sql

Creación de stored procedures para insertar registros de manera aleatoria, especialmente en facturas y ventas de items.

### triggers.sql

Incluye la creación de una tabla final que almacena la facturación diaria y sus triggers para actualizarse con los cambios que se ejecuten en la tabla item (que registra los items vendidos).

### pruebas.sql

Archivo utilizado para probar las funcionalidades y comandos que serían incluidos en funciones y/o procedimientos.