CREATE DATABASE tienda;
USE tienda;
CREATE TABLE fabricante (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100)
);
CREATE TABLE producto (
 id INT AUTO_INCREMENT PRIMARY KEY,
 nombre VARCHAR(100),
 precio DECIMAL(10,2),
 id_fabricante INT,
 FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);
INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);

-- 1. Lista el nombre de todos los productos que hay en la tabla producto. 
Select nombre from producto;

-- 2. Lista los nombres y los precios de todos los productos de la tabla producto. 
Select nombre , precio from producto;

-- 3. Lista todas las columnas de la tabla producto.
Select * from producto;

-- 4. Lista el nombre de los productos y el precio con IVA incluido. 
Select nombre, precio + (precio* 0.21) as "precio + iva"
from producto;

/* 5. Lista el nombre de los productos, el precio en euros. Utiliza los siguientes alias
para las columnas: nombre de producto, euros.*/
Select nombre as "nombre de producto", precio as "euro"
from producto;

-- 6. Lista los nombres y los precios de todos los productos de la tabla producto,convirtiendo los nombres a mayúscula. 
Select UPPER(nombre) , precio
from producto;

/*7. Lista los nombres y los precios de todos los productos de la tabla producto,
convirtiendo los nombres a minúscula. */
Select LOWER(nombre) , precio
from producto;

/* 8. Lista el nombre de todos los fabricantes en una columna, y en otra columna
obtenga los dos primeros caracteres del nombre del fabricante. */
select nombre , substring(nombre,1,2) as "primeros caracteres"
from fabricante;

/*9. Lista los nombres y los precios de todos los productos de la tabla producto,
redondeando el valor del precio. */
select nombre, round(precio) as "precio aprox"
from producto;

/*10. Lista los nombres y los precios de todos los productos de la tabla producto,
truncando el valor del precio para mostrarlo sin ninguna cifra decimal. */
Select nombre , truncate(precio,0) as "precio truncado"
from producto; 

-- 11. Lista el identificador de los fabricantes que tienen productos en la tabla producto. 
SELECT id_fabricante
FROM producto; 

-- 12. Lista el identificador de los fabricantes que tienen productos en la tabla producto,
-- eliminando los identificadores que aparecen repetidos.
SELECT DISTINCT id_fabricante
FROM producto; 

-- 13. Lista los nombres de los fabricantes ordenados de forma ascendente.
SELECT nombre
FROM fabricante
ORDER BY nombre ASC;

-- 14. Lista los nombres de los fabricantes ordenados de forma descendente.
SELECT nombre
FROM fabricante
ORDER BY nombre DESC;

-- 15. Lista los nombres de los productos ordenados en primer lugar por el nombre de
-- forma ascendente y en segundo lugar por el precio de forma descendente. 
select nombre
from producto
order by nombre asc, precio desc;

-- 16. Devuelve una lista con las 5 primeras filas de la tabla fabricante. 
select *
from fabricante
limit 5;

-- 17. Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La
-- cuarta fila también se debe incluir en la respuesta.
SELECT *
FROM fabricante
LIMIT 3, 2;

-- 18. Lista el nombre y el precio del producto más barato. (Utilice solamente las
-- cláusulas ORDER BY y LIMIT)
SELECT nombre, precio
FROM producto
ORDER BY precio ASC
LIMIT 1; 
 
-- 19. Lista el nombre y el precio del producto más caro. (Utilice solamente las
-- cláusulas ORDER BY y LIMIT)
SELECT nombre, precio
FROM producto
ORDER BY precio DESC
LIMIT 1; 

-- 20. Lista el nombre de todos los productos del fabricante cuyo identificador de
-- fabricante es igual a 2.
select nombre
from producto as p
where p.id_fabricante = 2;

-- 21. Lista el nombre de los productos que tienen un precio menor o igual a 120.
select nombre , precio
from producto
where precio <= 120;

-- 22. Lista el nombre de los productos que tienen un precio mayor o igual a 400.
SELECT nombre
FROM producto
WHERE precio >= 400; 

-- 23. Lista el nombre de los productos que no tienen un precio mayor o igual a 400.
SELECT nombre
FROM producto
WHERE precio < 400;
-- 24. Lista todos los productos que tengan un precio entre 80 y 300. Sin utilizar el
-- operador BETWEEN.
SELECT nombre
FROM producto
WHERE precio >= 80 AND precio <= 300; 

-- 25. Lista todos los productos que tengan un precio entre 60 y 200. Utilizando el
-- operador BETWEEN.
SELECT nombre
FROM producto
WHERE precio BETWEEN 60 AND 200;

-- 26. Lista todos los productos que tengan un precio mayor que 200 y que el
-- identificador de fabricante sea igual a 6. 
select nombre, precio
from producto
where producto.precio > 200 and producto.id_fabricante = 6;

-- 27. Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin
-- utilizar el operador IN.
SELECT *
FROM producto
WHERE id_fabricante = 1 OR id_fabricante = 3 OR id_fabricante = 5; 

















