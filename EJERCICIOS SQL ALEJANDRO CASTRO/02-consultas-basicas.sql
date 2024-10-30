
-- Ejercicio 1: Seleccionar todos los campos de la tabla `customers` y renombrar la columna `CustomerId` a `ID`.

SELECT "CustomerId" AS ID, * 
from "Customer"

-- Ejercicio 2: Seleccionar los nombres de los clientes (`FirstName`, `LastName`) y renombrar las columnas a `First_Name` y `Last_Name`.

SELECT "FirstName" AS "First_Name", "LastName" AS "Last_Name"
FROM "Customer";

-- Ejercicio 3: Seleccionar los títulos de las pistas (`Name`) que duran más de 300,000 milisegundos y renombrar la columna a `Track_Title`.

SELECT "Name" AS "Track_Title"
FROM "Track" 
WHERE "Milliseconds" > 300000;

-- Ejercicio 4: Seleccionar el nombre y el correo electrónico de los clientes que viven en Brasil y renombrar las columnas a `Name` y `Email_Address`.

SELECT "FirstName" || ' ' || "LastName" AS "Name",
       "Email" AS "Email_Address"
FROM "Customer"
WHERE "Country" = 'Brazil';

-- Ejercicio 5: Seleccionar los nombres de las playlists (`Name`) que contienen la palabra 'Music' y renombrar la columna a `Playlist_Name`.

SELECT "Name" AS "Playlist_Name"
FROM "Playlist" 
WHERE "Name" ILIKE '%Music%';

-- Ejercicio 6: Seleccionar los nombres de los empleados (`FirstName`, `LastName`) que trabajan como 'Sales Support Agent' y renombrar las columnas a `First_Name` y `Last_Name`.

SELECT "FirstName" AS "First_Name", "LastName" AS "Last_Name"
FROM "Employee"
WHERE "Title" = 'Sales Support Agent';

-- Ejercicio 7: Seleccionar los nombres de los géneros (`Name`) y renombrar la columna a `Genre_Name`.

SELECT "Name" AS "Genre_Name"
FROM "Genre";

-- Ejercicio 8: Seleccionar los nombres de los empleados (`FirstName`, `LastName`) que reportan al empleado con `EmployeeId` = 1 y renombrar las columnas a `First_Name` y `Last_Name`.

SELECT "FirstName" AS "First_Name", "LastName" AS "Last_Name"
FROM "Employee"
WHERE "ReportsTo" = 1;

-- Ejercicio 9: Seleccionar los nombres de las pistas (`Name`) y su duración en minutos (convertido de milisegundos) que duran más de 5 minutos y renombrar las columnas a `Track_Name` y `Duration_Minutes`.

SELECT "Name" AS "Track_Name",
       ROUND("Milliseconds" / 60000.0, 2) AS "Duration_Minutes"
FROM "Track"
WHERE "Milliseconds" > 300000;

-- Ejercicio 10: Encuentra las pistas que tienen un precio mayor a 1.00 y una duración menor a 300,000 milisegundos. Muestra el nombre de la pista y su duración.

SELECT "Name" AS "Track_Name",
       "Milliseconds" AS "Duration"
FROM "Track"
WHERE "UnitPrice" > 1.00
  AND "Milliseconds" < 300000;

-- Ejercicio 11: Lista los empleados que trabajan en la ciudad 'Seattle' y cuyo estado es 'WA'. Muestra el nombre y el apellido del empleado.

 SELECT "FirstName" AS "First_Name", "LastName" AS "Last_Name"
FROM "Employee"
WHERE "City" = 'Seattle'
  AND "State" = 'WA';

-- Ejercicio 12: Encuentra los clientes que están en el país 'USA' y tienen asignado un representante de soporte con un ID mayor o igual a 5. Muestra el nombre del cliente y su ID de soporte.

SELECT "FirstName" || ' ' || "LastName" AS "Customer_Name", "Country", 
       "SupportRepId" AS "Support_Rep_ID"
FROM "Customer"
WHERE "Country" = 'USA'
  AND "SupportRepId" >= 5;

-- Ejercicio 13: Selecciona las facturas que tienen un total mayor a 10.00 y pertenecen a clientes con ID menor a 50. Muestra el ID de la factura y el total.

SELECT "CustomerId", "InvoiceId" AS "Invoice_ID", "Total" 
FROM "Invoice"
WHERE "Total" > 10.00
  AND "CustomerId" < 50;

-- Ejercicio 14: Lista las pistas que tienen una duración mayor a 250,000 milisegundos y pertenecen a un tipo de medio con ID 1 o 2. Muestra el nombre de la pista y el tipo de medio.

SELECT "Name" AS "Track_Name",
       "MediaTypeId" AS "Media_Type_ID"
FROM "Track"
WHERE "Milliseconds" > 250000
  AND "MediaTypeId" IN (1, 2);


