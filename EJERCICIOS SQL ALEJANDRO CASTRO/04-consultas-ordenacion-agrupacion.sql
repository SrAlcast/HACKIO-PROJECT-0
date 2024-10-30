
-- Ejercicio 1:  Selecciona el nombre de todos los álbumes y ordénalos alfabéticamente.

SELECT DISTINCT "Title" AS "Album_Name"
FROM "Album"
ORDER BY "Title";

-- Ejercicio 2:  Encuentra el álbum con el mayor número de canciones.

SELECT "Album"."Title" AS "Album_Name", COUNT(*) AS "Number_of_Songs"
FROM "Track"
JOIN "Album" ON "Track"."AlbumId" = "Album"."AlbumId"
GROUP BY "Album"."Title"
ORDER BY "Number_of_Songs" DESC
LIMIT 1;

-- Ejercicio 3:  Calcula la duración promedio, desviación estándar y varianza por compositor.

SELECT "Composer",
       AVG("Milliseconds") AS "Average_Duration_Milliseconds",
       STDDEV("Milliseconds") AS "StdDev_Duration_Milliseconds",
       VARIANCE("Milliseconds") AS "Variance_Duration_Milliseconds"
FROM "Track"
GROUP BY "Composer";

-- Ejercicio 4: Selecciona el título y el precio de las pistas, y limita los resultados a 10.

   SELECT "Name" AS "Track_Title", "UnitPrice" AS "Price"
FROM "Track"
LIMIT 10;

-- Ejercicio 5: Lista los nombres de los empleados y ordénalos por el ID del empleado en orden descendente.

SELECT "FirstName" || ' ' || "LastName" AS "Employee_Name"
FROM "Employee"
ORDER BY "EmployeeId" DESC;

-- Ejercicio 6:  Muestra el número de géneros distintos disponibles en la base de datos.

SELECT COUNT(DISTINCT "Name") AS "Distinct_Genres"
FROM "Genre";

-- Ejercicio 7: Selecciona el nombre del cliente y el país, limitando los resultados a 5, y ordena por el nombre del cliente.

SELECT "FirstName" || ' ' || "LastName" AS "Customer_Name", "Country"
FROM "Customer"
ORDER BY "Customer_Name"
LIMIT 5;
    
-- Ejercicio 8: Muestra la cantidad total de clientes agrupados por país.

SELECT "Country", COUNT(*) AS "Total_Customers"
FROM "Customer"
GROUP BY "Country";

-- Ejercicio 9: Obtén el total de importes de facturas para cada país y muestra solo aquellos con un total superior a 10,000.

SELECT "Customer"."Country",
       SUM("Invoice"."Total") AS "Total_Amount"
FROM "Invoice"
JOIN "Customer" ON "Invoice"."CustomerId" = "Customer"."CustomerId"
GROUP BY "Customer"."Country"
HAVING SUM("Invoice"."Total") > 10000;

-- Ejercicio 10: Encuentra los países donde el número total de clientes es mayor a 5. Muestra el país y el número de clientes.

SELECT "Country", COUNT(*) AS "Total_Customers"
FROM "Customer"
GROUP BY "Country"
HAVING COUNT(*) > 5;

-- Ejercicio 11: Obtén la cantidad de pistas en cada tipo de medio (MediaType) que tienen una duración mayor a 250,000 milisegundos.
   
SELECT "MediaTypeId", COUNT(*) AS "Total_Tracks"
FROM "Track"
WHERE "Milliseconds" > 250000
GROUP BY "MediaTypeId";

-- Ejercicio 12: Lista el país y el número total de clientes que han sido asistidos por un representante de ventas específico, cuyo ID sea menor a 5.
   
SELECT "Country", COUNT(*) AS "Total_Customers"
FROM "Customer"
WHERE "SupportRepId" < 5
GROUP BY "Country";

-- Ejercicio 13: Muestra los códigos postales (BillingPostalCode) de los clientes que han hecho más de 5 compras.
  
SELECT "BillingPostalCode"
FROM "Invoice"
JOIN "Customer" ON "Invoice"."CustomerId" = "Customer"."CustomerId"
GROUP BY "BillingPostalCode"
HAVING COUNT("Invoice"."InvoiceId") > 5;

-- Ejercicio 14: Encuentra la cantidad total de pistas en cada tipo de medio (MediaTypeId) donde el precio de la pista (UnitPrice) es mayor a 0.99 y la duración de la pista (Milliseconds) es mayor a 200,000. Muestra el tipo de medio y el número total de pistas.

SELECT "MediaTypeId", COUNT(*) AS "Total_Tracks"
FROM "Track"
WHERE "UnitPrice" > 0.99
  AND "Milliseconds" > 200000
GROUP BY "MediaTypeId";

-- Ejercicio 15: Lista el país y el estado de los clientes que tienen el soporte asignado a un representante con ID mayor a 3 y cuyo nombre de empresa (Company) no es nulo. Muestra el país, el estado y el número de clientes.

SELECT "Country", "State", COUNT(*) AS "Total_Customers"
FROM "Customer"
WHERE "SupportRepId" > 3
  AND "Company" IS NOT NULL
GROUP BY "Country", "State";
