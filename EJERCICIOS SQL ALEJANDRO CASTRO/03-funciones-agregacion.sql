
/* MIN y MAX */

-- Ejercicio 1: Encontrar la duración mínima de las pistas en milisegundos.

SELECT "Name" AS "Track", "Milliseconds" AS "Duration"
FROM "Track"
WHERE "Milliseconds" = (
    SELECT MIN("Milliseconds") 
    FROM "Track"
);

-- Ejercicio 2: Encontrar la duración máxima de las pistas en milisegundos.

SELECT "Name" AS "Track", "Milliseconds" AS "Duration"
FROM "Track"
WHERE "Milliseconds" = (
    SELECT MAX("Milliseconds") 
    FROM "Track"
);

-- Ejercicio 3: Encontrar el precio mínimo de las pistas.
   
SELECT MIN("UnitPrice") AS "Min_Price"
FROM "Track";

-- Ejercicio 4: Encontrar el precio máximo de las pistas.
   
SELECT MAX("UnitPrice") AS "Max_Price"
FROM "Track";

-- Ejercicio 5: Encontrar la fecha mínima de la factura.

SELECT MIN("InvoiceDate") AS "Min_Invoice_Date"
FROM "Invoice";
  
-- Ejercicio 6: Encontrar la fecha máxima de la factura.
   
SELECT MAX("InvoiceDate") AS "Max_Invoice_Date"
FROM "Invoice";

/* COUNT y SUM */

-- Ejercicio 7: Contar el número total de pistas.
   
SELECT COUNT(*) AS "Total_Tracks"
FROM "Track";

-- Ejercicio 8: Contar el número de clientes en Brasil.
   
SELECT COUNT(*) AS "Total_Customers_Brazil"
FROM "Customer"
WHERE "Country" = 'Brazil';

-- Ejercicio 9: Sumar la duración total de todas las pistas en milisegundos.
   
SELECT SUM("Milliseconds") AS "Total_Duration_Milliseconds"
FROM "Track";

-- Ejercicio 10: Contar el número de empleados con el título 'Sales Support Agent'.
    
SELECT COUNT(*) AS "Total_Sales_Support_Agents"
FROM "Employee"
WHERE "Title" = 'Sales Support Agent';

-- Ejercicio 11: Sumar el total de las cantidades en las facturas.
    
SELECT SUM("Total") AS "Total_Invoice_Amount"
FROM "Invoice";

/* AVG, STDDEV, VARIANCE */

-- Ejercicio 12: Calcular la duración media de las pistas en milisegundos.
    
SELECT AVG("Milliseconds") AS "Average_Duration_Milliseconds"
FROM "Track";

-- Ejercicio 13: Calcular el precio medio de las pistas.
    
SELECT AVG("UnitPrice") AS "Average_Price"
FROM "Track";

-- Ejercicio 14: Calcular la desviación estándar de la duración de las pistas.
    
SELECT STDDEV("Milliseconds") AS "StdDev_Duration_Milliseconds"
FROM "Track";

-- Ejercicio 15: Calcular la varianza de la duración de las pistas.

SELECT VARIANCE("Milliseconds") AS "Variance_Duration_Milliseconds"
FROM "Track";

-- Ejercicio 16: Calcular la desviación estándar del precio de las pistas.

SELECT STDDEV("UnitPrice") AS "StdDev_Price"
FROM "Track";

/* CONCAT */

-- Ejercicio 17: Concatenar el nombre y el apellido de los clientes.

SELECT "FirstName" || ' ' || "LastName" AS "Full_Name"
FROM "Customer";


