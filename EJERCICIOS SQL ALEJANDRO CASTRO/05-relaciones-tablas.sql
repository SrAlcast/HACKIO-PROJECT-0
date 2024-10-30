
-- Ejercicio  1: Encuentra el nombre de las pistas y los títulos de los álbumes a los que pertenecen.

SELECT "Track"."Name" AS "C", 
       "Album"."Title" AS "Album"
FROM "Track"
JOIN "Album" ON "Track"."AlbumId" = "Album"."AlbumId";

-- Ejercicio 2: Lista los nombres de los artistas y los títulos de sus álbumes. Ordena los resultados por artista.

SELECT "Artist"."Name" AS "Artista", 
       "Album"."Title" AS "Album"
FROM "Album"
JOIN "Artist" ON "Album"."ArtistId" = "Artist"."ArtistId"
ORDER BY "Artist"."Name";

-- Ejercicio 3: Encuentra los nombres de los clientes y los totales de sus facturas. Extrae solo los 5 clientes con mayor total. 

SELECT "Customer"."FirstName" || ' ' || "Customer"."LastName" AS "Cliente",
       SUM("Invoice"."Total") AS "Total_Facturas"
FROM "Customer"
JOIN "Invoice" ON "Customer"."CustomerId" = "Invoice"."CustomerId"
GROUP BY "Customer"."FirstName", "Customer"."LastName"
ORDER BY "Total_Facturas" DESC
LIMIT 5;


-- Ejercicio 4: Lista los nombres de los empleados y los nombres de los clientes que les han sido asignados.

SELECT "Employee"."FirstName" || ' ' || "Employee"."LastName" AS "Empleado",
       "Customer"."FirstName" || ' ' || "Customer"."LastName" AS "Cliente"
FROM "Customer"
JOIN "Employee" ON "Customer"."SupportRepId" = "Employee"."EmployeeId";

-- Ejercicio 5: Muestra los ID de las facturas y los nombres de las pistas incluidas en esas facturas.

SELECT "Invoice"."InvoiceId" as "Nº Factura",
       "Track"."Name" AS "Track"
FROM "Invoice"
JOIN "InvoiceLine" ON "Invoice"."InvoiceId" = "InvoiceLine"."InvoiceId"
JOIN "Track" ON "InvoiceLine"."TrackId" = "Track"."TrackId";

-- Ejercicio 6: Encuentra los nombres de los artistas y los géneros de sus pistas.

SELECT DISTINCT "Artist"."Name" AS "Artista",
                "Genre"."Name" AS "Género"
FROM "Track"
JOIN "Album" ON "Track"."AlbumId" = "Album"."AlbumId"
JOIN "Artist" ON "Album"."ArtistId" = "Artist"."ArtistId"
JOIN "Genre" ON "Track"."GenreId" = "Genre"."GenreId";

--  Ejercicio 7: Muestra los nombres de las pistas y el tipo de medio en el que están disponibles.

SELECT "Track"."Name" AS "Track",
       "MediaType"."Name" AS "Tipo_de_archivo"
FROM "Track"
JOIN "MediaType" ON "Track"."MediaTypeId" = "MediaType"."MediaTypeId";

-- Ejercicio 8: Encuentra todas las pistas y, si existen, muestra los nombres de los géneros a los que pertenecen. Incluye también las pistas que no tienen un género asignado.**

SELECT "Track"."Name" AS "Track",
       COALESCE("Genre"."Name", 'No Genre') AS "Género"
FROM "Track"
LEFT JOIN "Genre" ON "Track"."GenreId" = "Genre"."GenreId";

-- Ejercicio 9: Muestra todos los clientes y, si existen, muestra las facturas que han realizado. Incluye también los clientes que no tienen ninguna factura.

SELECT "Customer"."FirstName" || ' ' || "Customer"."LastName" AS "Cliente",
       "Invoice"."InvoiceId" as "Nº Factura" 
FROM "Customer"
LEFT JOIN "Invoice" ON "Customer"."CustomerId" = "Invoice"."CustomerId";


-- Ejercico 10: Encuentra todos los álbumes y, si existen, muestra los nombres de los artistas que los crearon. Incluye también los álbumes que no tienen un artista asignado (aunque en este caso en la base de datos de Chinook, todos los álbumes tienen un artista asignado).

SELECT "Album"."Title" AS "Album",
       COALESCE("Artist"."Name", 'No Artist') AS "Artista"
FROM "Album"
LEFT JOIN "Artist" ON "Album"."ArtistId" = "Artist"."ArtistId";

-- Ejercicio 11: Cuenta cuántas pistas hay en cada género. Ordena los generos en función del número de canciones de mayor a menor. 

SELECT "Genre"."Name" AS "Género",
       COUNT(*) AS "Numero_de_canciones"
FROM "Track"
JOIN "Genre" ON "Track"."GenreId" = "Genre"."GenreId"
GROUP BY "Genre"."Name"
ORDER BY "Numero_de_canciones" DESC;

--  Ejercicio 12: Muestra los títulos de los álbumes y la duración total de todas las pistas en cada álbum.

SELECT "Album"."Title" AS "Album",
       SUM("Track"."Milliseconds") AS "Duración"
FROM "Track"
JOIN "Album" ON "Track"."AlbumId" = "Album"."AlbumId"
GROUP BY "Album"."Title";

-- Ejercicio 14: Encuentra los nombres de los clientes y el total gastado por cada uno.

SELECT "Customer"."FirstName" || ' ' || "Customer"."LastName" AS "Cliente",
       SUM("Invoice"."Total") AS "Total_Gastado"
FROM "Invoice"
JOIN "Customer" ON "Invoice"."CustomerId" = "Customer"."CustomerId"
GROUP BY "Customer"."FirstName", "Customer"."LastName";

-- Ejercicio 15: Encuentra todos los empleados y, si existen, muestra los nombres de los clientes que tienen asignados. Incluye también los empleados que no tienen clientes asignados.

SELECT "Employee"."FirstName" || ' ' || "Employee"."LastName" AS "Empleado",
       COALESCE("Customer"."FirstName" || ' ' || "Customer"."LastName", 'No Customer') AS "Cliente"
FROM "Employee"
LEFT JOIN "Customer" ON "Employee"."EmployeeId" = "Customer"."SupportRepId";


